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
    case "gen":
        ts_gen();
        break;
    case "evt":
        ts_evt();
        break;
    case "sum":
        ts_sum();
        break;
    case "acc":
        ts_acc();
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
    //query
    $qry = $db->conn->prepare("SELECT * FROM ts_info ORDER BY res_id,ts_id;");
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
    $qry = $db->conn->prepare("SELECT * FROM vw_ts WHERE ts_id = ? ORDER BY t;");
    $qry->bind_param("i", $ts_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("ts/ts_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}



/*
 * 
 * DEBUG 
 * 
 */


function ts_gen() {
    $db = new cls_db();
    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_ts1 WHERE ts_id = ? ORDER BY t;");
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

function ts_evt() {
    $db = new cls_db();
    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_ts2 WHERE ts_id = ? ORDER BY t;");
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

function ts_sum() {
    $db = new cls_db();
    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_ts3 WHERE ts_id = ? ORDER BY t;");
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


function ts_acc() {
    $db = new cls_db();
    $ts_id = filter_input(INPUT_GET, "ts_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_ts4 WHERE ts_id = ? ORDER BY t;");
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
