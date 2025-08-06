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
    default:
        grp_lst();
}



function grp_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_grp_lst()");
    $dom = cls_xml::mul2dom($db->conn, "grp/grp_lst.xsl");
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
    $grp_name = filter_input(INPUT_POST, "grp_name", FILTER_SANITIZE_STRING);
    $grp_act  = filter_input(INPUT_POST, "grp_act",  FILTER_VALIDATE_INT);
//    echo $grp_id,$grp_name,$grp_val1,$grp_val2,$grp_act;'
    $db->conn->multi_query("CALL sp_grp_upd({$grp_id},{$grp_act},'{$grp_name}')");
    header("Location: grp.php");
}


function grp_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO grp_info VALUES ();");
    $qry->execute();
    header("Location: grp.php");
}
