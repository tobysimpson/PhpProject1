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
    case "disp":
        col_disp();
        break;
    default:
        col_list_all();
}

/*
 * =========================
 *  admin
 * =========================
 */

function col_list() {
    $db = new cls_db();

    $col_typ = filter_input(INPUT_GET, "col_typ", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_col WHERE col_typ = ? ORDER BY col_id;");
    $qry->bind_param("i", $col_typ);
    
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}



function col_list_all() {
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
    //dodgy
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);

    //query
    $qry = $db->conn->prepare("SELECT t, {$col_name} AS v1 FROM res_def ORDER BY t;");
//    $qry->bind_param("s", $col_name);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

function col_disp() {
    $db = new cls_db();
    //dodgy
    $tbl_name = filter_input(INPUT_GET, "tbl_name", FILTER_SANITIZE_STRING);
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);

    //query
    $qry = $db->conn->prepare("SELECT t, {$col_name} AS v1 FROM {$tbl_name} ORDER BY t;");

    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}


