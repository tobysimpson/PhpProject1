<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        ts_list();
        break;
    case "plot":
        ts_plot();
        break;
    default:
        ts_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function ts_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM ts_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
    
    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("ts/ts_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


function ts_plot() {
    $db = new cls_db();
    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT t,v1 FROM vw_ts2 WHERE ts_id = ? ORDER BY t;");
    $qry->bind_param("i", $ts_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("ts/ts_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

//cum sum
//function ts_plot() {
//    $db = new cls_db();
//    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);
//
//    //query
//    $qry = $db->conn->prepare("SELECT t, ts_id, SUM(v1)  over( ORDER BY t ) as v1 FROM vw_avl WHERE ts_id = ? ORDER BY t;");
//    $qry->bind_param("i", $ts_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom1 = cls_xml::res2dom($res);
//    $res->close();
//
//    //transform
//    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("avl/ts_plot.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//    header("Content-Type: image/svg+xml");
//}