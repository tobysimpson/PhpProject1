<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "grd_".$mth;
$func();


function grd_plt1() {
//    echo 'hello';
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM grd_dat1;");
    $dom = cls_xml::mul2dom($db->conn, "grd/grd_plt1.xsl");
//    $dom = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


