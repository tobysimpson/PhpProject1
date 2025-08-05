<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        item_lst();
        break;
    case "edt":
        item_edt();
        break;
    case "upd":
        item_upd();
        break;
    case "ins":
        item_ins();
        break;
    default:
        item_lst();
}


function item_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_lst()");
    $dom = cls_xml::mul2dom($db->conn, "item/item_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function item_edt() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_edt({$item_id})");
    $dom = cls_xml::mul2dom($db->conn, "item/item_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function item_upd() {
    $db = new cls_db();
    $item_id   = filter_input(INPUT_POST, "item_id",   FILTER_VALIDATE_INT);
    $item_name = filter_input(INPUT_POST, "item_name", FILTER_SANITIZE_STRING);
    $item_val1 = filter_input(INPUT_POST, "item_val1", FILTER_VALIDATE_INT);
    $item_val2 = filter_input(INPUT_POST, "item_val2", FILTER_VALIDATE_FLOAT);
    $item_act  = filter_input(INPUT_POST, "item_act",  FILTER_VALIDATE_INT);
//    echo $item_id,$item_name,$item_val1,$item_val2,$item_act;'
    $db->conn->multi_query("CALL sp_item_upd({$item_id},{$item_act},'{$item_name}',{$item_val1},{$item_val2})");
    header("Location: item.php");
}


function item_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO item_info VALUES ();");
    $qry->execute();
    header("Location: item.php");
}
