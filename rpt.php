<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "rpt_" . $mth;
$func();

function rpt_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM rpt ORDER BY rpt_name;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_sps() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id}; SELECT * FROM sps ORDER BY sps_id;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_sps.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_shk() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $sps_id = filter_input(INPUT_GET, "sps_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id}; SELECT * FROM sps WHERE sps_id = {$sps_id}; SELECT * FROM scn WHERE sps_id = {$sps_id} ORDER BY shk_id, shk_lvl;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_shk.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_htm() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
//    $rpt_typ = rpt_typ($rpt_id); //hack
    $db->conn->multi_query("CALL sp_dsp_rpt1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/html');
    $xsl = cls_xml::file2dom("rpt/rpt1_htm.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function rpt_csv() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_dsp_rpt1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("rpt%02d_scn%02d", $rpt_id, $scn_id);
    //header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("rpt/rpt1_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function rpt_xml() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_dsp_rpt1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header("Content-type: text/xml");
    echo $xml->saveXML();
}


function rpt_xls() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_dsp_rpt1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("rpt%02d_scn%02d", $rpt_id, $scn_id);
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment; filename={$fname}.xls");
    $xsl = cls_xml::file2dom("rpt/rpt1_xls.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}


function rpt_typ($rpt_id) {
    $db = new cls_db();
    $res = $db->conn->query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id};");
    $row = $res->fetch_assoc();
    return $row['rpt_typ'];
}

