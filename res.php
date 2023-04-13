<?php

require_once "cls_db.php";
require_once "cls_xml.php";


//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "grid":
        res_grid();
        break;
    default:
        res_grid();
}

function res_grid() {
    $db = new cls_db();
    
    //master
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));
    
    //query
    $qry = $db->conn->prepare("SELECT * FROM prc_info;");
    $qry->execute();
    $res = $qry->get_result();
    $dom2 = cls_xml::res2dom($res);
    $res->close();
    
    //label
    $dom2->documentElement->setAttribute("name", "prc_info");
        
    //import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);
    
    //transform
    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("res/res_grid.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}