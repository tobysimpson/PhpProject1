<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "scn_" . $mth;
$func();


function scn_sps() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM db2.sps;");
    $dom = cls_xml::mul2dom($db->conn, "scn/scn_sps.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function scn_lst() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_scn_lst();");
    $dom = cls_xml::mul2dom($db->conn, "scn/scn_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function scn_htm() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_scn_lst();");
    $dom = cls_xml::mul2dom($db->conn, "scn/scn_htm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function scn_csv() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_scn_lst();");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("scn_csv");
    //header ('Content-Type: text/plain'); //display in browser
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("scn/scn_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}




