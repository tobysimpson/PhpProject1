<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prm_list();
        break;
    case "prm_plot":
        prm_plot();
        break;
    default:
        prm_hist();
}

/*
 * =========================
 *  admin
 * =========================
 */

function prm_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM `vw_prm_hist` WHERE res_id = ? AND t = (SELECT MAX(t) FROM vw_prm_hist WHERE res_id = ? );");
    $qry->bind_param("ii", $res_id, $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
    
    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("prm/prm_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


function prm_plot() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT t,prx,r2 FROM vw_prm_hist WHERE prm_id = ?;");
    $qry->bind_param("i", $prm_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("prm/prm_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

