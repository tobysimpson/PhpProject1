<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prd_list();
        break;
    case "exp":
        prd_exp();
        break;
    default:
        prd_list();
}

/*
 * =========================
 *  admin
 * =========================
 */



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


function prd_exp() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);

    $qry = $db->conn->prepare("SELECT * FROM vw_prd_exp WHERE prd_id = ? ORDER BY t;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_imp.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}
