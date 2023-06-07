<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prd_list();
        break;
    case "sd1":
        prd_sd1();
        break;
    case "su1":
        prd_su1();
        break;
    case "dd1":
        prd_dd1();
        break;
    case "du1":
        prd_du1();
        break;
    case "ed1":
        prd_ed1();
        break;
    case "eu1":
        prd_eu1();
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
    $qry = $db->conn->prepare("SELECT * FROM prd_info WHERE prd_id=1;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("prd/prd_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_sd1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,s1,s2,s3,s4,s5,s6,d1 FROM vw_agg_def;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_sup.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_su1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,s1,s2,s3,s4,s5,s6,d1 FROM vw_agg_usr;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_sup.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_dd1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,d1,d2,d3,d4 FROM vw_agg_def;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_dem.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_du1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,d1,d2,d3,d4 FROM vw_agg_usr;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_dem.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_ed1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,s6,d4,i1 FROM vw_agg_def;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_exp.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function prd_eu1() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT t,s6,d4,i1 FROM vw_agg_usr;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("prd/prd_exp.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

