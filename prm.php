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
    $db->conn->multi_query("SELECT * FROM prm ORDER BY path");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_lst.xsl");
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

function prm_pth() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT lvl, leaf,prm_id,prm_id0, prm_id1, prm_id2, prm_id3, prm_id4, prm_id5, prm_id6, prm_id7, prm_id8, prm_id9, prm_id10, name0,name1,name2,name3,name4,name5,name6,name7,name8,name9,name10 FROM vw_prm_path ORDER BY path;");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_pth.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function prm_tre() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM prm ORDER BY path");
    $dom = cls_xml::mul2dom($db->conn, "prm/prm_tre.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


