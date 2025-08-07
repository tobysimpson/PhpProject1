<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        col_lst();
        break;
    case "edt":
        col_edt();
        break;
    case "upd":
        col_upd();
        break;
    case "ins":
        col_ins();
        break;
    default:
        col_lst();
}


function col_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_col_lst()");
    $dom = cls_xml::mul2dom($db->conn, "col/col_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function col_edt() {
    $db = new cls_db();
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_col_edt({$col_id})");
    $dom = cls_xml::mul2dom($db->conn, "col/col_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function col_upd() {
    $db = new cls_db();
    $col_id   = filter_input(INPUT_POST, "col_id",   FILTER_VALIDATE_INT);
    $col_act  = filter_input(INPUT_POST, "col_act",  FILTER_VALIDATE_INT);
    $tbl_id   = filter_input(INPUT_POST, "tbl_id",   FILTER_VALIDATE_INT);
    $col_name = filter_input(INPUT_POST, "col_name", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("CALL sp_col_upd({$col_id},{$col_act},{$tbl_id},'{$col_name}')");
    header("Location: tbl.php?mth=col&tbl_id={$tbl_id}");
}


function col_ins() {
    $db = new cls_db();
    $tbl_id   = filter_input(INPUT_POST, "tbl_id",   FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO col_info (tbl_id) VALUES ({$tbl_id});");
    $qry->execute();
    header("Location: tbl.php?mth=col&tbl_id={$tbl_id}");
}
