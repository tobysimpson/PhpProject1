<?php

//for upload?
//header('Content-Type: text/html; charset=utf-8');

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "upl_".$mth;
$func();

function upl_lst() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_upl_lst();");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function upl_frm() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT 1 as txt;");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_frm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function upl_dsp() {
    $db = new cls_db();
    $ts = filter_input(INPUT_GET, "ts", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("SELECT * FROM cub1 where ts = '{$ts}' ORDER BY prm_id,scn_id,yr;");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_dsp.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function upl_prm() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $ts = filter_input(INPUT_GET, "ts", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("SELECT * FROM cub1 where prm_id = {$prm_id} AND ts = '{$ts}' ORDER BY prm_id,scn_id,yr;");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_prm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function upl_ins() {
    $db = new cls_db();
    print_r($_FILES);

    $dir = "/var/lib/mysql-files/";
    $name1 = $_FILES["upload_file"]["tmp_name"];
    $name2 = basename($name1);


    echo $name1;
    echo '<br/>';
    echo $dir . $name2;
    echo '<br/>';

    try {
        move_uploaded_file($name1, $dir . $name2);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    $files1 = scandir("/tmp");
    print_r($files1);

        
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.tbl_0001 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';";
    $sql1 = "LOAD DATA INFILE '" . $dir.$name2 . "' INTO TABLE db2.cub1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.cub1 CHARACTER SET UTF8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";

    
    echo $sql1 . PHP_EOL;

    try {
        $res1 = $db->conn->query($sql1);
        print_r($res1);
    } catch (Exception $e) {
        echo $e->getMessage();
    }
    
    unlink($dir.$name2);
    
    echo '<br/>';
    $files2 = scandir($dir);
    print_r($files2);
    
    header("Location: upl.php?mth=lst");
}
