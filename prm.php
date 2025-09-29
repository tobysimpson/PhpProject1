<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "prm_".$mth;
$func();

function prm_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM vw_prm ORDER BY path");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function prm_all() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_all();");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_all.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function prm_brw() {
    $db = new cls_db();
    $id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_brw({$id});");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_brw.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}



function prm_edt() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_edt({$prm_id})");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function prm_upd() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_POST, "prm_id", FILTER_VALIDATE_INT);
    $prm_name = filter_input(INPUT_POST, "prm_name", FILTER_SANITIZE_STRING);
    $prm_val1 = filter_input(INPUT_POST, "prm_val1", FILTER_VALIDATE_INT);
    $prm_val2 = filter_input(INPUT_POST, "prm_val2", FILTER_VALIDATE_FLOAT);
    $prm_act = filter_input(INPUT_POST, "prm_act", FILTER_VALIDATE_INT);
//    echo $prm_id,$prm_name,$prm_val1,$prm_val2,$prm_act;'
    $db->conn->multi_query("CALL sp_prm_upd({$prm_id},{$prm_act},'{$prm_name}',{$prm_val1},{$prm_val2})");
    header("Location: prm.php?mth=lst");
}

function prm_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO prm_info VALUES ();");
    $qry->execute();
    header("Location: prm.php?mth=lst");
}

function prm_upl() {
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
