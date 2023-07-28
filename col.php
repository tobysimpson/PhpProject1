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
    case "data":
        col_data();
        break;
    case "all":
        col_all();
        break;
        case "list":
    col_info();
        break;
    default:
        col_info();
}

/*
 * =========================
 *  admin
 * =========================
 */


function col_info() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM col_info WHERE col_def IS NOT NULL ORDER BY col_typ, col_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "col/col_info.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function col_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM col_info WHERE col_def IS NOT NULL ORDER BY col_typ, col_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "col/col_list.xsl");
    $xml->documentElement->setAttribute("res_id", $res_id);     //instead of cookie
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}



//function col_list() {
//    $db = new cls_db();
//    $col_typ = filter_input(INPUT_GET, "col_typ", FILTER_VALIDATE_INT);
//    $qry = $db->conn->prepare("SELECT * FROM col_info WHERE col_typ = {$col_typ} ORDER BY col_ord;");
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom1 = cls_xml::res2dom($res);
//    $res->close();
////    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("col/col_list.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//}
//
//
//
//function col_list_all() {
//    $db = new cls_db();
//    //query
//    $qry = $db->conn->prepare("SELECT * FROM col_info ORDER BY col_typ, col_ord, col_id;");
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom1 = cls_xml::res2dom($res);
//    $res->close();
////    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("col/col_list.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//}


function col_disp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    //dodgy - will do subquery later :0)
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);
    $col_name = substr($col_name, 0, 25);
    $qry = $db->conn->prepare("SELECT n, t, {$col_name} AS v1 FROM col_calc5 WHERE res_id = {$res_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $dom = cls_xml::res2dom($res);
    $res->close();

    $dom->documentElement->setAttribute("col_name", $col_name);

    $xsl = cls_xml::file2dom("col/col_plot.xsl");
    echo cls_xml::xsltrans($dom, $xsl);
    header("Content-Type: image/svg+xml");
    echo $dom->saveXML();
}

function col_data() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    //dodgy - will do subquery later :0)
    $col_name = filter_input(INPUT_GET, "col_name", FILTER_SANITIZE_STRING);
    $col_name = substr($col_name, 0, 25);
    $qry = $db->conn->prepare("SELECT n, t, {$col_name} AS v1 FROM col_calc5 WHERE res_id = {$res_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $dom = cls_xml::res2dom($res);
    $res->close();
    $dom->documentElement->setAttribute("col_name", $col_name);
    header("Content-Type: text/xml");
    echo $dom->saveXML();
}

