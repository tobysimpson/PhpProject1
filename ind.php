<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "ind_" . $mth;
$func();

function ind_lst() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_ind_lst();");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function ind_scn() {
    $db = new cls_db();
    $db->conn->multi_query("CALL sp_ind_scn();");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_scn.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
