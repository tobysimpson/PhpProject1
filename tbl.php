<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        tbl_lst();
        break;
    case "edt":
        tbl_edt();
        break;
    case "upd":
        tbl_upd();
        break;
    case "ins":
        tbl_ins();
        break;
    case "col":
        tbl_col();
        break;
    default:
        tbl_lst();
}


function tbl_lst() {
    $db = new cls_db();
    $tbl_act = filter_input(INPUT_GET, "tbl_act", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_tbl_lst({$tbl_act})");
    $dom = cls_xml::mul2dom($db->conn, "tbl/tbl_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function tbl_col() {
    $db = new cls_db();
    $tbl_id = filter_input(INPUT_GET, "tbl_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_tbl_col({$tbl_id})");
    $dom = cls_xml::mul2dom($db->conn, "tbl/tbl_col.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function tbl_edt() {
    $db = new cls_db();
    $tbl_id = filter_input(INPUT_GET, "tbl_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_tbl_edt({$tbl_id})");
    $dom = cls_xml::mul2dom($db->conn, "tbl/tbl_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function tbl_upd() {
    $db = new cls_db();
    $tbl_id   = filter_input(INPUT_POST, "tbl_id",   FILTER_VALIDATE_INT);
    $tbl_act  = filter_input(INPUT_POST, "tbl_act",  FILTER_VALIDATE_INT);
    $grp_id   = filter_input(INPUT_POST, "grp_id",   FILTER_VALIDATE_INT);
    $tbl_name = filter_input(INPUT_POST, "tbl_name", FILTER_SANITIZE_STRING);
//    echo $tbl_id,$tbl_name,$tbl_val1,$tbl_val2,$tbl_act;'
    $db->conn->multi_query("CALL sp_tbl_upd({$tbl_id},{$tbl_act},{$grp_id},'{$tbl_name}')");
    header("Location: tbl.php?mth=col&tbl_id={$tbl_id}");
}


function tbl_ins() {
    $db = new cls_db();
    $grp_id   = filter_input(INPUT_POST, "grp_id",   FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO tbl_info (grp_id) VALUES ({$grp_id});");
    $qry->execute();
    header("Location: grp.php?mth=tbl&grp_id={$grp_id}");
}
