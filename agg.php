<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        agg_list();
        break;
    case "plot":
        agg_plot();
        break;
    case "agg":
        agg_agg();
        break;
    case "piv":
        agg_piv();
        break;
    default:
        agg_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function agg_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_dem ORDER BY agg_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("agg/agg_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function agg_plot() {
    $db = new cls_db();
    $agg_id = filter_input(INPUT_GET, "agg_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_agg_ts WHERE agg_id = ?;");
    $qry->bind_param("i", $agg_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("agg/agg_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function agg_agg() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_agg_ts_agg WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("agg/agg_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function agg_piv() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_agg_piv WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("agg/agg_piv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}