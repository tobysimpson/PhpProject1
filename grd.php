<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "grd_".$mth;
$func();


function grd_plt1() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_grd_plt1();");
    $dom = cls_xml::mul2dom($db->conn, "grd/grd_plt1.xsl");
    header('Content-Type: text/xml'); //image/svg+xml
    echo $dom->saveXML();
//    header('Content-Type: image/svg+xml');
//    $xml = cls_xml::mul2dom($db->conn);
//    $xsl = cls_xml::file2dom("grd/grd_plt1.xsl");
//    echo cls_xml::xsltrans($xml, $xsl);
}


