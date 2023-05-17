<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        dem_list();
        break;
    case "plot":
        dem_plot();
        break;
    case "agg":
        dem_agg();
        break;
    default:
        dem_list();
}

/*
 * =========================
 *  admin
 * =========================
 */


function dem_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_dem WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("dem/dem_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function dem_plot() {
    $db = new cls_db();
    $dem_id = filter_input(INPUT_GET, "dem_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_dem_ts WHERE dem_id = ?;");
    $qry->bind_param("i", $dem_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("dem/dem_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function dem_agg() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_dem_ts_agg WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("dem/dem_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}