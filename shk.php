<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "shk_" . $mth;
$func();

function shk_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM shk;");
    $dom = cls_xml::mul2dom($db->conn, "shk/shk_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
