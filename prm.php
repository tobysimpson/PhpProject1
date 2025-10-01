<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "prm_".$mth;
$func();

function prm_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM prm");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function prm_pth() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM vw_prm_path ORDER BY pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7;");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_pth.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function prm_brw() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_prm_brw({$prm_id});");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_brw.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

