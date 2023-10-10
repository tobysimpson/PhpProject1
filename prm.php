<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prm_list();
        break;
    case "def":
        prm_def();
        break;
    case "usr":
        prm_usr();
        break;
    case "plot":
        prm_plot();
        break;
    default:
        prm_list();
}

/*
 * =========================
 *  admin¯
 * =========================
 */


function prm_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prm_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "prm/prm_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function prm_def() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prm_def WHERE prm_id = {$prm_id} ORDER BY t ASC;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "prm/prm_def.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function prm_usr() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prm_usr WHERE prm_id = {$prm_id} ORDER BY res_id, prm_id, t ASC;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "prm/prm_usr.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function prm_plot() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prm_def WHERE prm_id = {$prm_id} ORDER BY t ASC;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    header("Content-Type: image/svg+xml");
    echo $xml->saveXML();
}
