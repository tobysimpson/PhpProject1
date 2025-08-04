<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "api_dsp":
        api_dsp();
        break;
    case "res_lst":
        res_lst();
        break;
    case "res_dsp":
        res_dsp();
        break;
    case "res_ins":
        res_ins();
        break;
    case "res_upd":
        res_upd();
        break;
    case "prm_lst":
        prm_lst();
        break;
    case "prm_xml":
        prm_xml();
        break;
    case "prm_ups":
        prm_ups();
        break;
    case "prm_clr":
        prm_clr();
        break;
    case "prm_rst":
        prm_rst();
        break;
    default:
        api_dsp();
}

/*
 * ================
 *  examples
 * ================
 */

function api_dsp() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM res_info LIMIT 1;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "api/api_dsp.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

/*
 * ================
 *  res
 * ================
 */

function res_lst() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM res_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function res_dsp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_info WHERE res_id = {$res_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function res_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO res_info (res_name) VALUES ('new');");
    $qry->execute();
    $res_id = $qry->insert_id;
    header("Location: api.php?mth=res_dsp&res_id=" . $res_id);
}

function res_upd() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $res_name = filter_input(INPUT_POST, "res_name", FILTER_SANITIZE_STRING);
//    $res_dt = filter_input(INPUT_POST, "res_dt", FILTER_VALIDATE_FLOAT);
//    $res_nt = filter_input(INPUT_POST, "res_nt", FILTER_VALIDATE_FLOAT);
//    $res_mod = filter_input(INPUT_POST, "res_mod", FILTER_VALIDATE_FLOAT);
    $res_del = filter_input(INPUT_POST, "res_del", FILTER_VALIDATE_INT);
//    $qry = $db->conn->prepare("UPDATE res_info SET res_name = '{$res_name}', res_dt={$res_dt}, res_nt={$res_nt}, res_mod={$res_mod} WHERE res_id = {$res_id};");
    $qry = $db->conn->prepare("UPDATE res_info SET res_name = '{$res_name}', res_del = {$res_del} WHERE res_id = {$res_id};");
    $qry->execute();
    header("Location: api.php?mth=res_dsp&res_id=" . $res_id);
}

/*
 * ================
 *  prm
 * ================
 */

function prm_lst() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prm_dsp;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function prm_xml() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_plt1({$res_id},{$prm_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}

function prm_ups() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $u = filter_input(INPUT_GET, "u", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("INSERT INTO prm_usr (res_id, prm_id, p, u) VALUES ({$res_id},{$prm_id},{$p},{$u}) ON DUPLICATE KEY UPDATE u = {$u};");
    $qry->execute();
    header("Location: api.php?mth=prm_xml&res_id=" . $res_id . "&prm_id=" . $prm_id);
}

function prm_clr() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("DELETE FROM prm_usr WHERE res_id={$res_id} AND prm_id={$prm_id} AND p={$p};");
    $qry->execute();
    header("Location: api.php?mth=prm_xml&res_id=" . $res_id . "&prm_id=" . $prm_id);
}

function prm_rst() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("DELETE FROM prm_usr WHERE res_id={$res_id} AND prm_id={$prm_id};");
    $qry->execute();
    header("Location: api.php?mth=prm_xml&res_id=" . $res_id . "&prm_id=" . $prm_id);
}
