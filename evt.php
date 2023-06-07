<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        evt_list();
        break;
    case "edit":
        evt_edit();
        break;
    case "update":
        evt_update();
        break;
    case "insert":
        evt_insert();
        break;
    case "reset":
        evt_reset();
        break;
    default:
        evt_list_all();
}


function evt_list_all() {
    $db = new cls_db();
    $qry1 = $db->conn->prepare("DELETE FROM res_evt WHERE v1 = 0;");
    $qry1->execute();
    $qry = $db->conn->prepare("SELECT * FROM res_evt ORDER BY col_id, t;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("evt/evt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function evt_list() {
    $db = new cls_db();
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_evt WHERE col_id = ? ORDER BY t;");
    $qry->bind_param("i", $col_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xml->documentElement->setAttribute("col_id", $col_id);
    $xsl = cls_xml::file2dom("evt/evt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function evt_edit() {
    $db = new cls_db();
    $evt_id = filter_input(INPUT_GET, "evt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_evt WHERE evt_id = ?;");
    $qry->bind_param("i", $evt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("evt/evt_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function evt_update() {
    $db = new cls_db();
    $evt_id = filter_input(INPUT_POST, "evt_id", FILTER_VALIDATE_INT);
    $t = filter_input(INPUT_POST, "t", FILTER_SANITIZE_STRING);
    $v1 = filter_input(INPUT_POST, "v1", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE res_evt SET t=?, v1=? WHERE evt_id = ?;");
    $qry->bind_param("ddi", $t, $v1, $evt_id);
    $qry->execute();
//    header("Location: index.php");
    evt_list_all();
}


function evt_insert() {
    $db = new cls_db();
    $t = 0;
    $v1 = 0;
    $col_id = filter_input(INPUT_POST, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO res_evt (col_id, t, v1) VALUES (?,?,?);");
    $qry->bind_param("idd", $col_id, $t, $v1);
    $qry->execute();
    header("Location: evt.php?mth=list&col_id=".$col_id);
}

function evt_reset() {
    $db = new cls_db();
    $qry = $db->conn->prepare("DELETE FROM evt_info;");
    $qry->execute();
    header("Location: item.php?mth=list");
}

