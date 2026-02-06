<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "tpl_" . $mth;
$func();

function tpl_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM rpt ORDER BY rpt_name;");
    $dom = cls_xml::mul2dom($db->conn, "tpl/tpl_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function tpl_sps() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id}; SELECT * FROM sps ORDER BY sps_id;");
    $dom = cls_xml::mul2dom($db->conn, "tpl/tpl_sps.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function tpl_shk() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $sps_id = filter_input(INPUT_GET, "sps_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id}; SELECT scn_id,sps_id,sps_code,shk_id,shk_code,shk_lvl,scn_code FROM scn WHERE sps_id = {$sps_id} ORDER BY shk_id, shk_lvl;");
    $dom = cls_xml::mul2dom($db->conn, "tpl/tpl_shk.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function tpl_htm() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT scn_id,sps_id,sps_code,shk_id,shk_code,shk_lvl,scn_code FROM scn WHERE scn_id = {$scn_id};SELECT prm.prm_id, prm.name, prm.unit FROM prm JOIN rpt_prm ON rpt_prm.prm_id = prm.prm_id WHERE rpt_prm.rpt_id = {$rpt_id} ORDER BY rpt_prm.pos;");
    $dom = cls_xml::mul2dom($db->conn, "tpl/tpl_htm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function tpl_csv() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $fname = substr(filter_input(INPUT_GET, "fname", FILTER_SANITIZE_STRING), 0, 14);
    $dwn = filter_input(INPUT_GET, "dwn", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT scn_id,sps_id,sps_code,shk_id,shk_code,shk_lvl,scn_code FROM scn WHERE scn_id = {$scn_id};SELECT prm.prm_id, prm.name, prm.unit FROM prm JOIN rpt_prm ON rpt_prm.prm_id = prm.prm_id WHERE rpt_prm.rpt_id = {$rpt_id} ORDER BY rpt_prm.pos;");
    $xml = cls_xml::mul2dom($db->conn);

    if ($dwn) {
        header("Content-type: text/csv");
        header("Content-Disposition: attachment; filename={$fname}.csv");
        header("Pragma: no-cache");
        header("Expires: 0");
    } else {
        header('Content-Type: text/plain'); //display in browser
    }
    $xsl = cls_xml::file2dom("tpl/tpl_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function tpl_xls() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $fname = substr(filter_input(INPUT_GET, "fname", FILTER_SANITIZE_STRING), 0, 14);
    $dwn = filter_input(INPUT_GET, "dwn", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT scn_id,sps_id,sps_code,shk_id,shk_code,shk_lvl,scn_code FROM scn WHERE scn_id = {$scn_id};SELECT prm.prm_id, prm.name, prm.unit FROM prm JOIN rpt_prm ON rpt_prm.prm_id = prm.prm_id WHERE rpt_prm.rpt_id = {$rpt_id} ORDER BY rpt_prm.pos;");
    $xml = cls_xml::mul2dom($db->conn);

    if ($dwn) {
        header("Content-type: text/csv");
        header("Content-Disposition: attachment; filename={$fname}.xls");
        header("Pragma: no-cache");
        header("Expires: 0");
    } else {
        header('Content-Type: text/xml');
//        header('Content-Type: text/plain');
    }
//    $xml = cls_xml::mul2dom($db->conn, "tpl/tpl_xls.xsl");
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("tpl/tpl_xls.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}


function tpl_xml() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT scn_id,sps_id,sps_code,shk_id,shk_code,shk_lvl,scn_code FROM scn WHERE scn_id = {$scn_id};SELECT prm.prm_id, prm.name, prm.unit FROM prm JOIN rpt_prm ON rpt_prm.prm_id = prm.prm_id WHERE rpt_prm.rpt_id = {$rpt_id} ORDER BY rpt_prm.pos;");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}