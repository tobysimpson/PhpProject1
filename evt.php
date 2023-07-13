<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        evt_list();
        break;
    case "edit":
        evt_edit();
        break;
    case "update":
        evt_update();
        break;
    case "insert":
        evt_insert();
        break;
    case "reset":
        evt_reset();
        break;
    case "upsert":
        evt_upsert();
        break;
    default:
        evt_list_all();
}


function evt_list_all() {
    $db = new cls_db();
    $qry1 = $db->conn->prepare("DELETE FROM evt_info WHERE v1 = 0;");
    $qry1->execute();
    $qry = $db->conn->prepare("SELECT * FROM evt_info ORDER BY usr_id, col_id, n;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("evt/evt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function evt_list() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM evt_info WHERE col_id = {$col_id} AND usr_id = {$usr_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xml->documentElement->setAttribute("col_id", $col_id);     //for insert
    $xsl = cls_xml::file2dom("evt/evt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function evt_insert() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $col_id = filter_input(INPUT_POST, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO evt_info (col_id, usr_id) VALUES ({$col_id},{$usr_id});");
    $qry->execute();
    header("Location: evt.php?mth=list&col_id=".$col_id);
}

function evt_edit() {
    $db = new cls_db();
    $evt_id = filter_input(INPUT_GET, "evt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM evt_info WHERE evt_id = {$evt_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("evt/evt_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


function evt_update() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $evt_id = filter_input(INPUT_POST, "evt_id", FILTER_VALIDATE_INT);
    $col_id = filter_input(INPUT_POST, "col_id", FILTER_VALIDATE_INT);
    $n = filter_input(INPUT_POST, "n", FILTER_VALIDATE_FLOAT);
    $v1 = filter_input(INPUT_POST, "v1", FILTER_VALIDATE_FLOAT);
   
    $qry = $db->conn->prepare("UPDATE evt_info SET n={$n}, v1={$v1} WHERE evt_id={$evt_id} AND usr_id={$usr_id};");
    $qry->execute();
    
    $qry1 = $db->conn->prepare("DELETE FROM evt_info WHERE v1 = 0;");
    $qry1->execute();
    
    header("Location: evt.php?mth=list&col_id=".$col_id);
//    evt_list_all();
}


function evt_upsert() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $n = filter_input(INPUT_GET, "n", FILTER_VALIDATE_INT);
    $v1 = filter_input(INPUT_GET, "v1", FILTER_VALIDATE_FLOAT);


//    echo 'usr_id=',$usr_id, ' col_id=', $col_id,' t=',  $t,' n=',  $n,' v1=',  $v1;
    
    
    $qry = $db->conn->prepare("INSERT INTO evt_info (usr_id, col_id, n, v1 ) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE usr_id = ?, col_id = ?, n = ?, v1 = ?;");
    $qry->bind_param("iiidiiid", $usr_id, $col_id, $n, $v1, $usr_id, $col_id, $n, $v1);
    $qry->execute();

    header("Location: bal.php?mth=disp&n=".$n);

}

