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
    case "table":
        res_table();
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
//echo $res_name,$res_id,$res_val1,$res_val2;
    $qry = $db->conn->prepare("UPDATE res_info SET res_name = ?, res_n1 = ? WHERE res_id = ?;");
    $qry->bind_param("sii", substr($res_name, 0, 20), $res_n1, $res_id);
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


function res_table() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    
    //master
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));
    
    //label
    $dom1->documentElement->setAttribute("res_id", $res_id);
    
    //query
    $qry = $db->conn->prepare("SELECT * FROM prc_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();
    
    //label
    $dom2->documentElement->setAttribute("name", "prc_info");
        
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
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_table.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
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
    $qry = $db->conn->prepare("SELECT * FROM prc_info WHERE res_id = ?;");
    $qry->bind_param("i", $res_id);
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();
    
    //label
    $dom2->documentElement->setAttribute("name", "prc_info");
        
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
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_grid.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


//function res_grid() {
//    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    
//    //master
//    $dom1 = new DOMDocument('1.0', 'utf-8');
//    $dom1->formatOutput = true;
//    $dom1->appendChild($dom1->createElement('root'));
//    
//    //label
//    $dom1->documentElement->setAttribute("res_id", $res_id);
//    
//    //query
//    $qry = $db->conn->prepare("SELECT * FROM prc_info;");
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom2 = cls_xml::res2dom($res);
//    $res->close();
//    
//    //label
//    $dom2->documentElement->setAttribute("name", "prc_info");
//        
//    //import
//    $node = $dom1->importNode($dom2->firstChild, true);
//    $dom1->documentElement->appendChild($node);
//    
//    //query
//    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prd_col ORDER BY prd_id) AS prd_rnk FROM prd_info;");
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom2 = cls_xml::res2dom($res);
//    $res->close();
//    
//    //label
//    $dom2->documentElement->setAttribute("name", "prd_info");
//        
//    //import
//    $node = $dom1->importNode($dom2->firstChild, true);
//    $dom1->documentElement->appendChild($node);
//    
//    //query
//    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prc_id ORDER BY prd_id) AS sup_rnk FROM prd_sup WHERE res_id = ?;");
//    $qry->bind_param("i", $res_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom2 = cls_xml::res2dom($res);
//    $res->close();
//    
//    //label
//    $dom2->documentElement->setAttribute("name", "prd_sup");
//        
//    //import
//    $node = $dom1->importNode($dom2->firstChild, true);
//    $dom1->documentElement->appendChild($node);
//    
//    //query
//    $qry = $db->conn->prepare("SELECT *, RANK() OVER (PARTITION BY prc_id ORDER BY prd_id) AS dem_rnk FROM prd_dem WHERE res_id = ?;");
//    $qry->bind_param("i", $res_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $dom2 = cls_xml::res2dom($res);
//    $res->close();
//    
//    //label
//    $dom2->documentElement->setAttribute("name", "prd_dem");
//        
//    //import
//    $node = $dom1->importNode($dom2->firstChild, true);
//    $dom1->documentElement->appendChild($node);
//    
//    
//    //transform
//    echo $dom1->saveXML();
//    $xsl = cls_xml::file2dom("res/res_grid.xsl");
//    echo cls_xml::xsltrans($dom1, $xsl);
//}