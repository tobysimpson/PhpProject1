<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//print_r(explode("_",$mth)[1]);

//echo "itm_".$mth;

$func = "itm_".$mth;
$func();

//call
//call_user_func("itm_" . $mth ."()");


//switch ($mth) {
//    case "lst":
//        itm_lst();
//        break;
//    case "edt":
//        itm_edt();
//        break;
//    case "upd":
//        itm_upd();
//        break;
//    case "ins":
//        itm_ins();
//        break;
//    case "upl":
//        itm_upl();
//        break;
//    default:
//        itm_lst();
//}

function itm_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_itm_lst()");
    $dom = cls_xml::mul2dom($db->conn, "itm/itm_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function itm_edt() {
    $db = new cls_db();
    $itm_id = filter_input(INPUT_GET, "itm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_itm_edt({$itm_id})");
    $dom = cls_xml::mul2dom($db->conn, "itm/itm_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function itm_upd() {
    $db = new cls_db();
    $itm_id = filter_input(INPUT_POST, "itm_id", FILTER_VALIDATE_INT);
    $itm_name = filter_input(INPUT_POST, "itm_name", FILTER_SANITIZE_STRING);
    $itm_val1 = filter_input(INPUT_POST, "itm_val1", FILTER_VALIDATE_INT);
    $itm_val2 = filter_input(INPUT_POST, "itm_val2", FILTER_VALIDATE_FLOAT);
    $itm_act = filter_input(INPUT_POST, "itm_act", FILTER_VALIDATE_INT);
//    echo $itm_id,$itm_name,$itm_val1,$itm_val2,$itm_act;'
    $db->conn->multi_query("CALL sp_itm_upd({$itm_id},{$itm_act},'{$itm_name}',{$itm_val1},{$itm_val2})");
    header("Location: itm.php?mth=lst");
}

function itm_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO itm_info VALUES ();");
    $qry->execute();
    header("Location: itm.php?mth=lst");
}

function itm_upl() {
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
