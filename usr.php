<?php

require "db1.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch($mth){
case "list_all":
    usr_list_all();
    break;
default:
    usr_list();
}


function usr_list() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE `usr_created` != `usr_updated`;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
    $xsl = $db->xml2dom("usr_info.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}


function usr_list_all() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    //    echo $xml->saveXML();
    $xsl = $db->xml2dom("usr_info.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}
