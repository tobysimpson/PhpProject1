<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "mc_" . $mth;
$func();


function mc_test1() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_test1({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_test1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_test2() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_test2();");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_test2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM mc");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function mc_prm() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_prm({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_prm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function mc_scn() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM mc_scn WHERE mc_id = {$mc_id}");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_scn.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_cal2() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_cal2({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_cal2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_cal3() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_cal3({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_cal3.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
