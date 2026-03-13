<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "cmp_".$mth;
$func();



function cmp_shk1() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_cmp_shk1({$prm_id});");
    $dom = cls_xml::mul2dom($db->conn, "cmp/cmp_shk1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function cmp_shk2() {
    $db = new cls_db();
    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_cmp_shk2({$mc_id});");
    $dom = cls_xml::mul2dom($db->conn, "cmp/cmp_shk2.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function cmp_vlm1() {
    $db = new cls_db();
//    $mc_id = filter_input(INPUT_GET, "mc_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_cmp_vlm1();");
    $dom = cls_xml::mul2dom($db->conn, "cmp/cmp_vlm1.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

