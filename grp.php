<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        grp_lst();
        break;
    case "edt":
        grp_edt();
        break;
    case "upd":
        grp_upd();
        break;
    case "ins":
        grp_ins();
        break;
    case "ovw":
        grp_ovw();
        break;
    case "tbl":
        grp_tbl();
        break;
    default:
        grp_brw();
}



function grp_ovw() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_grp_ovw()");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_ovw.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function grp_brw() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_grp_brw()");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_brw.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function grp_lst() {
    $db = new cls_db();
    $grp_act = filter_input(INPUT_GET, "grp_act", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_grp_lst({$grp_act})");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function grp_tbl() {
    $db = new cls_db();
    $grp_id = filter_input(INPUT_GET, "grp_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_grp_tbl({$grp_id})");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_tbl.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function grp_edt() {
    $db = new cls_db();
    $grp_id = filter_input(INPUT_GET, "grp_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_grp_edt({$grp_id})");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function grp_upd() {
    $db = new cls_db();
    $grp_id   = filter_input(INPUT_POST, "grp_id",   FILTER_VALIDATE_INT);
    $grp_pos  = filter_input(INPUT_POST, "grp_pos",  FILTER_VALIDATE_FLOAT);
    $grp_act  = filter_input(INPUT_POST, "grp_act",  FILTER_VALIDATE_INT);
    $grp_name = filter_input(INPUT_POST, "grp_name", FILTER_SANITIZE_STRING);
    $grp_desc = filter_input(INPUT_POST, "grp_desc", FILTER_SANITIZE_STRING);
//    echo $grp_id,$grp_pos,$grp_act,$grp_name,$grp_desc;
    $db->conn->multi_query("CALL sp_grp_upd({$grp_id},{$grp_pos},{$grp_act},'{$grp_name}','{$grp_desc}')");
    header("Location: grp.php?mth=tbl&grp_id={$grp_id}");
}


function grp_ins() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_grp_ins();");
    header("Location: grp.php?mth=brw");
}
