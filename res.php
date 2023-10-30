<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        res_list();
        break;
    case "disp":
        res_disp();
        break;
    case "edit":
        res_edit();
        break;
    case "update":
        res_update();
        break;
    case "insert":
        res_insert();
        break;
    case "all":
        res_all();
        break;
    case "evt":
        res_evt();
        break;
    case "grp":
        res_grp();
        break;
    case "prm_list":
        prm_list();
        break;
    case "prm":
        res_prm();
        break;
    default:
        res_list();
}


function res_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM res_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "res/res_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function res_disp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_info WHERE res_id = {$res_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "res/res_disp.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function res_edit() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_info WHERE res_id = {$res_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("res/res_edit.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}


function res_update() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $res_name = filter_input(INPUT_POST, "res_name", FILTER_SANITIZE_STRING);
    $dt = filter_input(INPUT_POST, "dt", FILTER_VALIDATE_FLOAT);
    $nt = filter_input(INPUT_POST, "nt", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE res_info SET res_name = '{$res_name}', dt={$dt}, nt={$nt} WHERE res_id = {$res_id};");
    $qry->execute();
    header("Location: res.php?mth=disp&res_id=".$res_id);
}


function res_insert() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO res_info (res_name) VALUES ('new');");
    $qry->execute();
    $res_id = $qry->insert_id;
    header("Location: res.php?mth=disp&res_id=".$res_id);
}



function res_all() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM col_calc5 WHERE res_id = {$res_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "test1.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function res_evt() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM evt_info WHERE res_id = {$res_id} ORDER BY n, col_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "evt/evt_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function res_grp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM grp_info ORDER BY grp_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "grp/grp_list.xsl");
    $xml->documentElement->setAttribute("res_id", $res_id);     //instead of cookie
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}



function prm_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT {$res_id} AS res_id, prm_info.* FROM prm_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "res/res_prm_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function res_prm() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_prm WHERE res_id = {$res_id} AND prm_id = {$prm_id} ORDER BY res_id, prm_id, p;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "res/res_prm.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}