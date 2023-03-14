<?php

require "db1.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch($mth){
case "all":
    usr_list_all();
    break;
case "edit":
    usr_edit();
    break;
case "update":
    usr_update();
    break;
default:
    usr_list();
}


function usr_list() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE usr_name IS NOT NULL");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("usr_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}


function usr_list_all() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("usr_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function usr_edit() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE usr_id = ?;");
    $qry->bind_param("i", $db->$usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("usr_edit.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}


function usr_update() {
    $db = new db1();
    $usr_name = filter_input(INPUT_POST, "usr_name", FILTER_SANITIZE_STRING);
    $qry = $db->conn->prepare("UPDATE usr_info SET usr_updated = LOCALTIMESTAMP(), usr_name = ? WHERE usr_id = ?;");
    $qry->bind_param("si", substr($usr_name, 0, 20), $db->$usr_id);
    $qry->execute();
    header("Location: usr.php");
}