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

function mc_mc1() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_mc1 WHERE mc_id = {$mc_id} ORDER BY yr,prm_id,scn_id;");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_mc1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function mc_mc2() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_mc2 WHERE mc_id = {$mc_id} ;");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_mc2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_mc3() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_mc3 WHERE mc_id = {$mc_id} ;");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_mc3.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_mc4() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM vw_mc4 WHERE mc_id = {$mc_id} ;");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_mc4.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


