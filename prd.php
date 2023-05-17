<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "all":
        prd_all();
        break;
    case "list":
        prd_list();
        break;
    case "dem":
        prd_dem();
        break;
    case "dem_plot":
        prd_dem_plot();
        break;
    case "sup":
        prd_sup();
        break;
    case "prd_dem_edit":
        prd_dem_edit();
        break;
    case "prd_sup_edit":
        prd_sup_edit();
        break;
    case "prd_dem_update":
        prd_dem_update();
        break;
    case "prd_sup_update":
        prd_sup_update();
        break;
    case "hist":
        prd_hist();
        break;
    default:
        prd_list_all();
}

/*
 * =========================
 *  admin
 * =========================
 */

function prd_all() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prd_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prd_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_dem() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_prd_dem WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_dem.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_dem_plot() {
    $db = new cls_db();
    $dem_id = filter_input(INPUT_GET, "dem_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_ts_dem WHERE dem_id = ?;");
    $qry->bind_param("i", $dem_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/dem_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function prd_sup() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_sup;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_sup_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function prd_dem_edit() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prc_dem WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ii", $prd_id, $prc_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_dem_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_dem_update() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_POST, "prd_id", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_POST, "prc_id", FILTER_VALIDATE_INT);
    $v1 = filter_input(INPUT_POST, "v1", FILTER_VALIDATE_FLOAT);
    $v2 = filter_input(INPUT_POST, "v2", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE prc_dem SET v1 = ?, v2 = ? WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ddii", $v1, $v2, $prd_id, $prc_id);
    $qry->execute();
    header("Location: prd.php?mth=prd_dem");
}


function prd_sup_edit() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prc_sup WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ii", $prd_id, $prc_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_sup_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_sup_update() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_POST, "prd_id", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_POST, "prc_id", FILTER_VALIDATE_INT);
    $v1 = filter_input(INPUT_POST, "v1", FILTER_VALIDATE_FLOAT);
    $v2 = filter_input(INPUT_POST, "v2", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE prc_sup SET v1 = ?, v2 = ? WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ddii", $v1, $v2, $prd_id, $prc_id);
    $qry->execute();
    header("Location: prd.php?mth=sup");
}


/*
 * =========================
 *  disp
 * =========================
 */

function prd_hist() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prd_hist WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_hist.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    header("Content-Type: image/svg+xml");
    $res->close();
}