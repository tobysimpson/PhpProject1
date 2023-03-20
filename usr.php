<?php

//require_once "db1.php";
require_once "cls_db.php";
require_once "cls_usr.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "all":
        usr_all();
        break;
    case "edit":
        usr_edit();
        break;
    case "update":
        usr_update();
        break;
    default:
        usr_list();
}

function usr_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE usr_name IS NOT NULL");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("usr_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function usr_all() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM usr_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("usr_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function usr_edit() {
    $usr_id = cls_usr::check();
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE usr_id = ?;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("usr_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function usr_update() {
    $usr_id = cls_usr::check();
    $usr_name = filter_input(INPUT_POST, "usr_name", FILTER_SANITIZE_STRING);
    var_dump($usr_id);
    if (is_null($usr_id)) {
        cls_usr::insert($usr_name);
    } else {
        cls_usr::update($usr_id, $usr_name);
    }
    header("Location: usr.php");
}
