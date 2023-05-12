<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        avl_list();
        break;
    case "plot":
        avl_plot();
        break;
    default:
        avl_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function avl_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM avl_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
    
    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("avl/avl_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


function avl_plot() {
    $db = new cls_db();
    $avl_id = filter_input(INPUT_GET, "avl_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT t,v1 FROM vw_avl WHERE avl_id = ? ORDER BY t;");
    $qry->bind_param("i", $avl_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("avl/avl_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

//cum sum
//function avl_plot() {
//    $db = new cls_db();
//    $avl_id = filter_input(INPUT_GET, "avl_id", FILTER_VALIDATE_INT);
//
//    //query
//    $qry = $db->conn->prepare("SELECT t, avl_id, SUM(v1)  over( ORDER BY t ) as v1 FROM vw_avl WHERE avl_id = ? ORDER BY t;");
//    $qry->bind_param("i", $avl_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom1 = cls_xml::res2dom($res);
//    $res->close();
//
//    //transform
//    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("avl/avl_plot.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//    header("Content-Type: image/svg+xml");
//}