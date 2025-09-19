<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        item_lst();
        break;
    case "edt":
        item_edt();
        break;
    case "upd":
        item_upd();
        break;
    case "ins":
        item_ins();
        break;
    case "upl":
        item_upl();
        break;
    default:
        item_lst();
}

function item_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_lst()");
    $dom = cls_xml::mul2dom($db->conn, "item/item_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function item_edt() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_edt({$item_id})");
    $dom = cls_xml::mul2dom($db->conn, "item/item_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function item_upd() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_POST, "item_id", FILTER_VALIDATE_INT);
    $item_name = filter_input(INPUT_POST, "item_name", FILTER_SANITIZE_STRING);
    $item_val1 = filter_input(INPUT_POST, "item_val1", FILTER_VALIDATE_INT);
    $item_val2 = filter_input(INPUT_POST, "item_val2", FILTER_VALIDATE_FLOAT);
    $item_act = filter_input(INPUT_POST, "item_act", FILTER_VALIDATE_INT);
//    echo $item_id,$item_name,$item_val1,$item_val2,$item_act;'
    $db->conn->multi_query("CALL sp_item_upd({$item_id},{$item_act},'{$item_name}',{$item_val1},{$item_val2})");
    header("Location: item.php");
}

function item_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO item_info VALUES ();");
    $qry->execute();
    header("Location: item.php");
}

function item_upl() {
    $db = new cls_db();
//    
//    
//    $target_dir = "uploads/";
//    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
//    $uploadOk = 1;
//    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
//    // Check if image file is a actual image or fake image
//    if (isset($_POST["submit"])) {
//        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
//        if ($check !== false) {
//            echo "File is an image - " . $check["mime"] . ".";
//            $uploadOk = 1;
//        } else {
//            echo "File is not an image.";
//            $uploadOk = 0;
//        }"
//    }

    print_r($_FILES);

    echo '<br/>';

//    print_r($_FILES["fileToUpload"]["tmp_name"]);
//    echo '<br/>';
//    print_r($_FILES["fileToUpload"]["name"]);


    $dir = "/var/lib/mysql-files/";
    $tmp_name = $_FILES["fileToUpload"]["tmp_name"];
    $name = basename($tmp_name);
//    $name = $_FILES["fileToUpload"]["name"];

    echo $tmp_name;
    echo '<br/>';
    echo $dir . $name;
    echo '<br/>';

    try {
        move_uploaded_file($tmp_name, $dir . $name);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

//    echo $db->conn->allow_local_infile = true;
//    echo '<br/>';
//    echo $db->conn->local_infile_directory = "/tmp";
//    echo '<br/>';


    $files1 = scandir("/tmp");
    print_r($files1);

        
    echo '<br/>';
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.tbl_0001 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';";
    
    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.tbl_0001 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (col_0001, col_0002, col_0003);";

    
    echo $sql1;
    echo '<br/>';
    
    try {
        $res1 = $db->conn->query($sql1);
        print_r($res1);
    } catch (Exception $e) {
        echo $e->getMessage();
    }
    
    
    unlink($dir.$name);
    
    
    echo '<br/>';
    $files2 = scandir($dir);
    print_r($files2);
    
    
//
//    echo '<br/>';
//
//    
//
//    $sql2 = "SELECT * FROM db2.tbl_0001;";
//
//    print_r($sql2);
//
//    echo '<br/>';
//
//    
//    try {
//        $res2 = $db->conn->query($sql2);
//        print_r($res2);
//    } catch (Exception $e) {
//        echo $e->getMessage();
//    }
}
