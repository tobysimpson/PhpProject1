<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "hh":
        raw_hh(); 
        break;
    default:
        raw_hh();
}



function raw_hh() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $xsl = filter_input(INPUT_GET, "xsl", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM raw_hh;");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    if ($xsl==1) {
        $xsl = cls_xml::file2dom("raw/raw_rnk1.xsl");
        echo cls_xml::xsltrans($xml, $xsl);
    } else {
        echo $xml->saveXML();
    }
}

