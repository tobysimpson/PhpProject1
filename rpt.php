<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "sum1":
        rpt_sum1();
        break;
    case "sum2":
        rpt_sum2();
        break;
    case "cat1":
        rpt_cat1();
        break;
    case "rnk1":
        rpt_rnk1();
        break;
    default:
        rpt_sum1();
}

function rpt_sum1() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt_sum1({$res_id});");
    $xml = cls_xml::mul2dom($db->conn);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("rpt/rpt_sum1.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}

function rpt_cat1() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $cat_id = filter_input(INPUT_GET, "cat_id", FILTER_VALIDATE_INT);
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt_cat1({$res_id},{$cat_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    if ($xsl==1) {
        $xsl = cls_xml::file2dom("rpt/rpt_cat1.xsl");
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        echo $xml->saveXML();
    }
}

function rpt_sum2() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt_sum2({$res_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    if ($xsl==1) {
        $xsl = cls_xml::file2dom("rpt/rpt_sum2.xsl");
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        echo $xml->saveXML();
    }
}

function rpt_rnk1() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt_rnk1({$res_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    if ($xsl==1) {
        $xsl = cls_xml::file2dom("rpt/rpt_rnk1.xsl");
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        echo $xml->saveXML();
    }
}

