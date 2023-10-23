<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        grp_list();
        break;
    case "prm":
        grp_prm();
        break;
    default:
        grp_list();
}

/*
 * =========================
 *  admin¯
 * =========================
 */


function grp_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM grp_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "grp/grp_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function grp_prm() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT *, {$res_id} AS res_id FROM grp_info WHERE grp_info.grp_id IN (SELECT DISTINCT prm_info.grp_id FROM prm_info);");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("grp/grp_prm.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}