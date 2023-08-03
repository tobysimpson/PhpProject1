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
    case "del":
        res_del();
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

function res_edit() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_info WHERE res_id = {$res_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "res/res_edit.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function res_update() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $res_name = filter_input(INPUT_POST, "res_name", FILTER_SANITIZE_STRING);
    $res_v1 = filter_input(INPUT_POST, "res_v1", FILTER_VALIDATE_FLOAT);
    $res_v2 = filter_input(INPUT_POST, "res_v2", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE res_info SET res_name = '{$res_name}', res_v1={$res_v1}, res_v2={$res_v2} WHERE res_id = {$res_id};");
    $qry->execute();
    header("Location: res.php");
}


function res_insert() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO res_info (res_name) VALUES ('new');");
    $qry->execute();
    $res_id = $qry->insert_id;
    header("Location: res.php?mth=edit&res_id=".$res_id);
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


function res_del() {
    $db = new cls_db();
    $qry = $db->conn->prepare("DELETE FROM res_info WHERE res_id NOT IN (SELECT DISTINCT res_id FROM evt_info);");
    $qry->execute();
    header("Location: res.php");
}