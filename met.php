<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "init":
        met_init();
        break;
    case "step":
        met_step();
        break;
    case "tmp_plot":
        tmp_plot();
        break;
    case "wnd_plot":
        wnd_plot();
        break;
    default:
        met_hist();
}

/*
 * =========================
 *  admin
 * =========================
 */

function tmp_plot() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM met_hist WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("met/tmp_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

function wnd_plot() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM met_hist WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("met/wnd_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

function met_init() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_met_init(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=disp&res_id=".$res_id);
}

function met_step() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_met_step(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=disp&res_id=".$res_id);
}
