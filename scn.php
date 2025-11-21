<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "scn_" . $mth;
$func();


function scn_sps() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM db2.sps;");
    $dom = cls_xml::mul2dom($db->conn, "scn/scn_sps.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function scn_lst() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_scn_lst();");
    $dom = cls_xml::mul2dom($db->conn, "scn/scn_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
