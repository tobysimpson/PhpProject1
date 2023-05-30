<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        evt_list();
        break;
    case "plot":
        evt_plot();
        break;
    default:
        evt_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function evt_list() {
    $db = new cls_db();
    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_evt ORDER BY evt_id;");
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
    
    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("evt/evt_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


function evt_plot() {
    $db = new cls_db();
    $evt_id = filter_input(INPUT_GET, "evt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_evt_ts WHERE evt_id = ? ORDER BY t;");
    $qry->bind_param("i", $evt_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("evt/evt_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}
