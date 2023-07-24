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



function evt_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM evt_info WHERE col_id = {$col_id} AND res_id = {$res_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "evt/evt_list.xsl");
    $res->close();
    $xml->documentElement->setAttribute("res_id", $res_id); //for insert
    $xml->documentElement->setAttribute("col_id", $col_id);     
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function evt_edit() {
    $db = new cls_db();
    $evt_id = filter_input(INPUT_GET, "evt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM evt_info WHERE evt_id = {$evt_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "evt/evt_edit.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function evt_update() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $evt_id = filter_input(INPUT_POST, "evt_id", FILTER_VALIDATE_INT);
    $col_id = filter_input(INPUT_POST, "col_id", FILTER_VALIDATE_INT);
    $n = filter_input(INPUT_POST, "n", FILTER_VALIDATE_FLOAT);
    $v1 = filter_input(INPUT_POST, "v1", FILTER_VALIDATE_FLOAT);
   
    $qry = $db->conn->prepare("UPDATE evt_info SET n={$n}, v1={$v1} WHERE evt_id={$evt_id} AND res_id={$res_id};");
    $qry->execute();
    
    $qry1 = $db->conn->prepare("DELETE FROM evt_info WHERE v1 = 0;");
    $qry1->execute();
    
    header("Location: evt.php?mth=list&res_id=".$res_id."&col_id=".$col_id);
}


function evt_insert() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $col_id = filter_input(INPUT_POST, "col_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO evt_info (col_id, res_id) VALUES ({$col_id},{$res_id}) ON DUPLICATE KEY UPDATE evt_id=evt_id;");
    $qry->execute();
    header("Location: evt.php?mth=list&res_id=".$res_id."&col_id=".$col_id);
}



function evt_upsert() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $col_id = filter_input(INPUT_GET, "col_id", FILTER_VALIDATE_INT);
    $n = filter_input(INPUT_GET, "n", FILTER_VALIDATE_INT);
    $v1 = filter_input(INPUT_GET, "v1", FILTER_VALIDATE_FLOAT);


//    $qry = $db->conn->prepare("SELECT col_name from col_info where col_id = {$col_id};");
//    $qry->execute();
//    $res = $qry->get_result();
//    $col_name = $res->fetch_row()[0];
//    
//    
//    
//    $qry = $db->conn->prepare("SELECT {$col_name} FROM col_def WHERE n={$n} ;");//AND res_id = {$res_id}
//    $qry->execute();
//    $res = $qry->get_result();
//    $col_def = $res->fetch_row()[0];
//    
//
//    //subtract default value
//    $v1 = $v1 - $col_def;
//    
//    echo $col_name, $col_def, $v1;
    
    
    $qry = $db->conn->prepare("INSERT INTO evt_info (res_id, col_id, n, v1 ) VALUES ({$res_id},{$col_id},{$n},{$v1}) ON DUPLICATE KEY UPDATE res_id={$res_id}, col_id={$col_id}, n={$n}, v1= {$v1};");
//    $qry->bind_param("iiidiiid", $res_id, $col_id, $n, $v1, $res_id, $col_id, $n, $v1);
    $qry->execute();
    
    

    header("Location: bal.php?mth=disp&n=".$n."&res_id=".$res_id);
}

