<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "mc_" . $mth;
$func();


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

function mc_dat() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_dat({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_dat.xsl");
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

function mc_cal1() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_cal1({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_cal1.xsl");
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


function mc_htm1() {
    $db = new cls_db();
    $mc_id      = filter_input(INPUT_GET, "mc_id",      FILTER_VALIDATE_INT);
    $shk_id     = filter_input(INPUT_GET, "shk_id",     FILTER_VALIDATE_INT);
    $shk_lvl    = filter_input(INPUT_GET, "shk_lvl",    FILTER_VALIDATE_INT);
    $yr         = filter_input(INPUT_GET, "yr",         FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_mc_rpt1({$mc_id},{$shk_id},{$shk_lvl},{$yr});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_htm1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function mc_csv1() {
    $db = new cls_db();
    $mc_id      = filter_input(INPUT_GET, "mc_id",      FILTER_VALIDATE_INT);
    $shk_id     = filter_input(INPUT_GET, "shk_id",     FILTER_VALIDATE_INT);
    $shk_lvl    = filter_input(INPUT_GET, "shk_lvl",    FILTER_VALIDATE_INT);
    $yr         = filter_input(INPUT_GET, "yr",         FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_mc_rpt1({$mc_id},{$shk_id},{$shk_lvl},{$yr});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("shk%d_lvl%d_%4d", $shk_id, $shk_lvl, $yr);
//    header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("mc/mc_csv1.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function mc_rpt2() {
    $db = new cls_db();
    $mc_id      = filter_input(INPUT_GET, "mc_id",      FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_mc_rpt2({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_rpt2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}