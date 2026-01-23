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
    $db->conn->multi_query("CALL sp_mc_scn({$mc_id})");
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

function mc_cal4() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_cal4({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_cal4.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_cal5() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_cal5({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_cal5.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_prf1() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_mc_prf1({$prm_id},{$scn_id},{$yr});");
    $xml = cls_xml::mul2dom($db->conn, "mc/mc_prf1.xsl");
    
    header('Content-Type: image/svg+xml');
    $xsl = cls_xml::file2dom("mc/mc_prf1.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
//    header('Content-Type: text/xml');
//    echo $xml->saveXML();
}
