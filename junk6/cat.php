<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        cat_list();
        break;
    case "grp":
        cat_grp();
        break;
    case "prm":
        cat_prm();
        break;
    default:
        cat_list();
}


/*
 * =========================
 *  admin
 * =========================
 */


function cat_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $cat_grp = filter_input(INPUT_GET, "cat_grp", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT *, {$res_id} AS res_id FROM cat_info WHERE cat_grp={$cat_grp} ORDER BY cat_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("cat/cat_list.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}


function cat_prm() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $cat_id = filter_input(INPUT_GET, "cat_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT *, {$res_id} AS res_id FROM prm_dsp WHERE cat_id = {$cat_id} ORDER BY cat_ord, dem_id, obj_ord, fld_ord;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $res->close();
    $xsl = cls_xml::file2dom("cat/cat_prm.xsl");
    header('Content-Type: text/xml');
    echo cls_xml::xsltrans($xml, $xsl);
}

