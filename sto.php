<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        sto_list();
        break;
    case "init":
        sto_init();
        break;
    case "step":
        sto_step();
        break;
    case "sto_plot":
        sto_plot();
        break;
    default:
        sto_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function sto_list() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM `vw_sto_hist` WHERE t = (SELECT MAX(t) FROM vw_sto_hist WHERE res_id = ? );");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
    
    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("sto/sto_list.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


function sto_init() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_sto_init(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=list&res_id=" . $res_id);
}

function sto_step() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_sto_step(?);");
    $qry->bind_param("i", $res_id);

    for ($i = 0; $i <= 90; $i++) {
        $qry->execute();
    }
    header("Location: res.php?mth=list&res_id=" . $res_id);
}

function sto_plot() {
    $db = new cls_db();
    $sto_id = filter_input(INPUT_GET, "sto_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT sto_id, t, v2 FROM vw_sto_hist WHERE sto_id = ?;");
    $qry->bind_param("i", $sto_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("sto/sto_plot.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}
