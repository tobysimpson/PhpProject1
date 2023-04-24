<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "dem":
        prd_dem();
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
    case "insert":
        prd_insert();
        break;
    default:
        prd_dem();
}

/*
 * =========================
 *  admin
 * =========================
 */

function prd_dem() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_dem;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_dem_list.xsl");
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
    $qry = $db->conn->prepare("SELECT * FROM prd_dem WHERE prd_id = ? AND prc_id = ?;");
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
    $qry = $db->conn->prepare("UPDATE prd_dem SET v1 = ?, v2 = ? WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ddii", $v1, $v2, $prd_id, $prc_id);
    $qry->execute();
    header("Location: prd.php?mth=prd_dem");
}


function prd_sup_edit() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prd_sup WHERE prd_id = ? AND prc_id = ?;");
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
    $qry = $db->conn->prepare("UPDATE prd_sup SET v1 = ?, v2 = ? WHERE prd_id = ? AND prc_id = ?;");
    $qry->bind_param("ddii", $v1, $v2, $prd_id, $prc_id);
    $qry->execute();
    header("Location: prd.php?mth=sup");
}
