<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "afr_" . $mth;
$func();

function afr_prm() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_afr_prm;");
    $dom = cls_xml::mul2dom($db->conn, "afr/afr_prm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function afr_cal1() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_afr_cal1;");
    $dom = cls_xml::mul2dom($db->conn, "afr/afr_cal1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function afr_cal2() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_afr_cal2;");
    $dom = cls_xml::mul2dom($db->conn, "afr/afr_cal2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
