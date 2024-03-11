<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "dsc":
        hst_dsc();
        break;
    case "dsp":
        hst_dsp();
        break;
    case "plt":
        hst_plt();
        break;
    default:
        hst_dsp();
}

/*
 * =========================
 *  admin
 * =========================
 */

function hst_dsc() {
    $db = new cls_db();
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM hst_dsc;");
    $xml = cls_xml::mul2dom($db->conn);

    if ($xsl == 1) {
        $xsl = cls_xml::file2dom("hst/hst_dsc.xsl");
        header('Content-Type: text/html');
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        header('Content-Type: text/xml');
        echo $xml->saveXML();
    }
}


function hst_dsp() {
    $db = new cls_db();
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_hst_dsp();");
    $xml = cls_xml::mul2dom($db->conn);

    if ($xsl == 1) {
        $xsl = cls_xml::file2dom("hst/hst_dsp.xsl");
        header('Content-Type: text/html');
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        header('Content-Type: text/xml');
        echo $xml->saveXML();
    }
}

function hst_plt() {
    $db = new cls_db();
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_hst_plt({$prc_id},{$prd_id});");
    $xml = cls_xml::mul2dom($db->conn);

    if ($xsl == 0) {
        header('Content-Type: text/xml');
        echo $xml->saveXML();
    } else {
        $xsl = cls_xml::file2dom("hst/hst_plt{$xsl}.xsl");
        header('Content-Type: image/svg+xml');
        echo cls_xml::xsltrans($xml, $xsl);
    }
}
