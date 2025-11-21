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
    $db->conn->multi_query("SELECT yr FROM ind_yr ORDER BY yr;");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_nav.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_htm() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt({$yr});");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind1_htm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function ind_csv() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt({$yr});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("ind_%02d", $yr);
//    header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("ind/ind1_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function ind_xls() {
    $db = new cls_db();
    $yr = filter_input(INPUT_GET, "yr", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_ind_rpt({$yr});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("ind_%02d", $yr);
    header('Content-Type: application/vnd.ms-excel');
    header("Content-Disposition: attachment; filename={$fname}.xls");
    $xsl = cls_xml::file2dom("ind/ind1_xls.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}
