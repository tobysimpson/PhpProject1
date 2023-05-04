<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        res_list();
        break;
    case "edit":
        res_edit();
        break;
    case "update":
        res_update();
        break;
    case "insert":
        res_insert();
        break;
    case "grid":
        res_grid();
        break;
    case "disp":
        res_disp();
        break;
    case "hist":
        res_hist();
        break;
    case "init":
        res_init();
        break;
    case "step":
        res_step();
        break;
    case "trunc":
        res_trunc();
        break;
    default:
        res_list();
}

/*
 * =========================
 *  admin
 * =========================
 */

function res_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM res_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("res/res_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function res_edit() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM res_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("res/res_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function res_update() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_POST, "res_id", FILTER_VALIDATE_INT);
    $res_name = filter_input(INPUT_POST, "res_name", FILTER_SANITIZE_STRING);
    $res_n1 = filter_input(INPUT_POST, "res_n1", FILTER_VALIDATE_FLOAT);

    $tmp_base = filter_input(INPUT_POST, "tmp_base", FILTER_VALIDATE_FLOAT);
    $tmp_trend = filter_input(INPUT_POST, "tmp_trend", FILTER_VALIDATE_FLOAT);
    $tmp_osc = filter_input(INPUT_POST, "tmp_osc", FILTER_VALIDATE_FLOAT);
    $tmp_phase = filter_input(INPUT_POST, "tmp_phase", FILTER_VALIDATE_FLOAT);
    $tmp_noise = filter_input(INPUT_POST, "tmp_noise", FILTER_VALIDATE_FLOAT);

//echo $res_name,$res_id,$res_val1,$res_val2;
    $qry = $db->conn->prepare("UPDATE res_info SET res_name = ?, res_n1 = ?, tmp_base = ?, tmp_trend = ?, tmp_osc = ?, tmp_phase = ?, tmp_noise = ? WHERE res_id = ?;");
    $qry->bind_param("sidddddi", substr($res_name, 0, 20), $res_n1, $tmp_base, $tmp_trend, $tmp_osc, $tmp_phase, $tmp_noise, $res_id);
    $qry->execute();
    header("Location: res.php");
}

function res_insert() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO res_info DEFAULT VALUES;");
    $qry->execute();
    header("Location: res.php?mth=list");
}

/*
 * =========================
 *  grid
 * =========================
 */

function res_hist() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_hist WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();

    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_hist.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}

function res_init() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_hist_init(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=list");
}

function res_step() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_hist_step(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=disp&res_id=" . $res_id);
}

function res_trunc() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //query
    $qry = $db->conn->prepare("CALL sp_hist_trunc(?);");
    $qry->bind_param("i", $res_id);
    $qry->execute();

    header("Location: res.php?mth=list");
}

function res_grid() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //master
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));

    //label
    $dom1->documentElement->setAttribute("res_id", $res_id);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_prc WHERE res_id = ? ORDER BY prc_id;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "vw_prc");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //query
    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prd_col ORDER BY prd_id) AS prd_rnk FROM prd_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "prd_info");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //query
    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prc_id ORDER BY prd_id) AS sup_rnk FROM vw_sup WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "vw_sup");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //query
    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prc_id ORDER BY prd_id) AS dem_rnk FROM vw_dem WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "vw_dem");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //transform
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_grid.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
    header("Content-Type: image/svg+xml");
}

//function res_disp() {
//    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//
//    //query
//    $qry = $db->conn->prepare("SELECT * FROM prd_info WHERE res_id = ?;");
//    $qry->bind_param("i", $res_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom1 = cls_xml::res2dom($res);
//    $res->close();
//
//    //transform
////    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("res/res_disp.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//}


function res_disp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);

    //master
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));

    //label
    $dom1->documentElement->setAttribute("res_id", $res_id);

    //query
    $qry = $db->conn->prepare("SELECT * FROM prd_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "prd_info");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //query
    $qry = $db->conn->prepare("SELECT * FROM vw_met_dem WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();

    //label
    $dom2->documentElement->setAttribute("name", "met_dem");

    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);


    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_disp.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}
