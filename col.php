<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        col_list();
        break;
    case "disp":
        col_disp();
        break;
    case "dat":
        col_dat();
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
    $qry = $db->conn->prepare("SELECT * FROM col_info WHERE col_typ = ? ORDER BY col_ord;");
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
    $qry = $db->conn->prepare("SELECT * FROM col_info ORDER BY col_typ,col_ord,col_id;");

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
    //less dodgy
    $col_name = substr($col_name, 0, 25);

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
    $usr_id = cls_usr::check();
    //dodgy - will do subquery later :0)
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);
    $col_name = substr($col_name, 0, 25);
    //query
    $qry = $db->conn->prepare("SELECT n, t, {$col_name} AS v1 FROM col_calc1 WHERE usr_id = {$usr_id} ORDER BY t;");

    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    $dom1->documentElement->setAttribute("col_name", $col_name);
    
    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("col/col_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

function col_dat() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    //dodgy - will do subquery later :0)
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);
    $col_name = substr($col_name, 0, 25);
    //query
    $qry = $db->conn->prepare("SELECT n, t, {$col_name} AS v1 FROM col_calc1 WHERE usr_id = {$usr_id} ORDER BY t;");

    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    $dom1->documentElement->setAttribute("col_name", $col_name);
    
    //disp
    header("Content-Type: text/xml");
    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("col/col_plot.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
    
}


