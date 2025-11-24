<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "ind_" . $mth;
$func();

function ind_lst() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_ind_lst();");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_scn() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_ind_scn();");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_scn.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_nav() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT yr FROM ind_yr ORDER BY yr;select distinct shk_id, shk_code, shk_lvl from scn order by shk_id, shk_lvl;");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_nav.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_htm1() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt1({$yr});");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_htm1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_csv1() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt1({$yr});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("ind_%02d", $yr);
//    header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("ind/ind_csv1.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function ind_xls1() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt1({$yr});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("ind_%02d", $yr);
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment; filename={$fname}.xls");
    $xsl = cls_xml::file2dom("ind/ind1_xls.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function ind_htm2() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $shk_id = filter_input(INPUT_GET, "shk_id", FILTER_VALIDATE_INT);
    $shk_lvl = filter_input(INPUT_GET, "shk_lvl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt2({$yr},{$shk_id},{$shk_lvl});");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_htm2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_csv2() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $shk_id = filter_input(INPUT_GET, "shk_id", FILTER_VALIDATE_INT);
    $shk_lvl = filter_input(INPUT_GET, "shk_lvl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt2({$yr},{$shk_id},{$shk_lvl});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("shk%d_lvl%d_%4d", $shk_id, $shk_lvl, $yr);
//    header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("ind/ind_csv2.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}