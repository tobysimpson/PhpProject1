<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "mc_" . $mth;
$func();




function mc_test1() {
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_test1({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_test1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function mc_test2() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_mc_test2();");
    $dom = cls_xml::mul2dom($db->conn, "mc/mc_test2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


