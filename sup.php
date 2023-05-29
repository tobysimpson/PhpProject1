<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        sup_list();
        break;
    case "plot":
        sup_plot();
        break;
    case "agg":
        sup_agg();
        break;    
    case "piv":
        sup_piv();
        break;
    default:
        sup_list();
}

/*
 * =========================
 *  admin
 * =========================
 */


function sup_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_sup ORDER BY res_id, prd_id, sup_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("sup/sup_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function sup_plot() {
    $db = new cls_db();
    $sup_id = filter_input(INPUT_GET, "sup_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_sup_ts WHERE sup_id = ?;");
    $qry->bind_param("i", $sup_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("sup/sup_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}



function sup_agg() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_sup_ts_agg WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("sup/sup_plot.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function sup_piv() {
    $db = new cls_db();
    $prd_id = filter_input(INPUT_GET, "prd_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_sup_piv WHERE prd_id = ?;");
    $qry->bind_param("i", $prd_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("sup/sup_piv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

