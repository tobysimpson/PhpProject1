<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prd_list();
        break;
    default:
        prd_list();
}

function prd_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prd_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}