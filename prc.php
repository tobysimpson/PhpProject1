<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prc_list();
        break;
    case "dem":
        prc_dem();
        break;
    case "sup":
        prc_sup();
        break;
   
    case "edit":
        prc_edit();
        break;
    case "update":
        prc_update();
        break;
    case "insert":
        prc_insert();
        break;
    default:
        prc_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function prc_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prc_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prc/prc_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function prc_dem() {
    $db = new cls_db();
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_dem WHERE prc_id = ?;");
    $qry->bind_param("i", $prc_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_dem_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function prc_sup() {
    $db = new cls_db();
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_sup  WHERE prc_id = ?;");
    $qry->bind_param("i", $prc_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_sup_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function prc_edit() {
    $db = new cls_db();
    $prc_id = filter_input(INPUT_GET, "prc_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prc_info WHERE prc_id = ?;");
    $qry->bind_param("i", $prc_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prc/prc_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prc_update() {
    $db = new cls_db();
    $prc_id = filter_input(INPUT_POST, "prc_id", FILTER_VALIDATE_INT);
    $prc_name = filter_input(INPUT_POST, "prc_name", FILTER_SANITIZE_STRING);
    $prc_n1 = filter_input(INPUT_POST, "prc_n1", FILTER_VALIDATE_FLOAT);
//echo $prc_name,$prc_id,$prc_val1,$prc_val2;
    $qry = $db->conn->prepare("UPDATE prc_info SET prc_name = ?, prc_n1 = ? WHERE prc_id = ?;");
    $qry->bind_param("sii", substr($prc_name, 0, 20), $prc_n1, $prc_id);
    $qry->execute();
    header("Location: res.php");
}

function prc_insert() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO prc_info DEFAULT VALUES;");
    $qry->execute();
    header("Location: res.php?mth=list");
}