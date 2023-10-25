<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        prm_list();
        break;
    case "def":
        prm_def();
        break;
    case "edit":
        prm_edit();
        break;
    case "plot":
        prm_plot();
        break;
    case "tbl":
        prm_tbl();
        break;
    case "ups1":
        prm_ups1();
        break;
    case "ups2":
        prm_ups2();
        break;
    case "clr":
        prm_clr();
        break;
    case "grp":
        prm_grp();
        break;
    default:
        prm_list();
}

/*
 * =========================
 *  admin¯
 * =========================
 */


function prm_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM prm_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "prm/prm_list.xsl");
    $res->close();
    header('Content-Type: text/xml');
    echo $xml->saveXML();
}


function prm_edit() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_prm WHERE res_id = {$res_id} AND prm_id = {$prm_id} AND p = {$p};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_edit.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}

function prm_plot() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("CALL sp_prm_plot({$res_id},{$prm_id});");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_plot.xsl");
//    header("Content-Type: image/svg+xml");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}

function prm_tbl() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("CALL sp_prm_plot({$res_id},{$prm_id});");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_tbl.xsl");
//    header("Content-Type: image/svg+xml");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}


function prm_ups1() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $u = filter_input(INPUT_GET, "u", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("INSERT INTO prm_usr (res_id, prm_id, p, u) VALUES ({$res_id},{$prm_id},{$p},{$u}) ON DUPLICATE KEY UPDATE u = {$u};");
    $qry->execute();
    header("Location: prm.php?mth=plot&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_ups2() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
//    $u0 = filter_input(INPUT_GET, "u0", FILTER_VALIDATE_FLOAT);
    $u1 = filter_input(INPUT_GET, "u1", FILTER_VALIDATE_FLOAT);
    //get prior
    $qry = $db->conn->prepare("SELECT u FROM res_prm WHERE res_id={$res_id} AND prm_id={$prm_id} AND p={$p} LIMIT 1;");
    $qry->execute();
    $res = $qry->get_result();
    $val = $res->fetch_array(MYSQLI_NUM);
    $u0 = $val[0];
    //diff
    $du = $u1 - $u0; 
    $qry = $db->conn->prepare("INSERT INTO prm_usr (res_id, prm_id, p, du) VALUES ({$res_id},{$prm_id},{$p},{$du}) ON DUPLICATE KEY UPDATE du = du + {$du};"); //works
    $qry->execute();
    //nav
    header("Location: res.php?mth=prm&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_clr() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $p = filter_input(INPUT_GET, "p", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("DELETE FROM prm_usr WHERE res_id={$res_id} AND prm_id={$prm_id} AND p={$p};");
    $qry->execute();
    header("Location: prm.php?mth=plot&res_id=".$res_id."&prm_id=".$prm_id);
}


function prm_grp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $grp_id = filter_input(INPUT_GET, "grp_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT *, {$res_id} AS res_id FROM prm_info WHERE grp_id = {$grp_id};");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("prm/prm_grp.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}