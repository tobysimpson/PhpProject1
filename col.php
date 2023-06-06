<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        col_list();
        break;
    case "plot":
        col_plot();
        break;
    default:
        col_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function col_list() {
    $db = new cls_db();
    //query
    $qry = $db->conn->prepare("SELECT * FROM col_met ORDER BY col_id;");
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}

function col_plot() {
    $db = new cls_db();
 
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);
    echo $col_name;
    //query
    $qry = $db->conn->prepare("SELECT t, {$col_name} AS v1 FROM res_dat;");
//    $qry->bind_param("s", $col_name);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}


