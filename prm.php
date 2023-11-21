<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "dsp":
        prm_dsp();
        break;
    case "edit":
        prm_edit();
        break;
    case "rst":
        prm_rst();
        break;
    case "upd":
        prm_upd();
        break;
    case "plt1":
        prm_plt1();
        break;
    case "ups":
        prm_ups();
        break;
    case "clr":
        prm_clr();
        break;
    case "xml":
        prm_xml();
        break;
    default:
        prm_dsp();
}

/*
 * =========================
 *  admin¯
 * =========================
 */


function prm_dsp() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prm_dsp;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "prm/prm_dsp.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function prm_edit() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM prm_dsp WHERE prm_id = {$prm_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_edit.xsl");
    header('Content-Type: text/html');
    echo cls_xml::xsltrans($xml, $xsl);
}


function prm_upd() {
    $db = new cls_db();
    $prm_id     = filter_input(INPUT_POST, "prm_id", FILTER_VALIDATE_INT);
    $prm_def    = filter_input(INPUT_POST, "prm_def", FILTER_VALIDATE_FLOAT);
    $prm_tick   = filter_input(INPUT_POST, "prm_tick", FILTER_VALIDATE_FLOAT);
    $prm_cal    = filter_input(INPUT_POST, "prm_cal", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("UPDATE prm_info SET prm_def = {$prm_def}, prm_tick = {$prm_tick}, prm_cal = {$prm_cal} WHERE prm_id = {$prm_id};"); 
    $qry->execute();
    header("Location: prm.php");
}


function prm_rst() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("DELETE FROM prm_usr WHERE res_id={$res_id} AND prm_id={$prm_id};");
    $qry->execute();
    header("Location: prm.php?mth=plt1&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_plt1() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_plt1({$res_id},{$prm_id});");
    $xml = cls_xml::mul2dom($db->conn);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prm/prm_plt1.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}


function prm_ups() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $u = filter_input(INPUT_GET, "u", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("INSERT INTO prm_usr (res_id, prm_id, p, u) VALUES ({$res_id},{$prm_id},{$p},{$u}) ON DUPLICATE KEY UPDATE u = {$u};");
    $qry->execute();
    header("Location: prm.php?mth=plt1&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_clr() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("DELETE FROM prm_usr WHERE res_id={$res_id} AND prm_id={$prm_id} AND p={$p};");
    $qry->execute();
    header("Location: prm.php?mth=plt1&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_xml() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_plot({$res_id},{$prm_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}