<?php

require_once "db1.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        item_list();
        break;
    case "xml":
        item_xml();
        break;
    case "xls":
        item_xls();
        break;
    case "csv":
        item_csv();
        break;
    case "edit":
        item_edit();
        break;
    case "update":
        item_update();
        break;
    case "svg":
        item_svg();
        break;
    case "insert":
        item_insert();
        break;
    case "reset":
        item_reset();
        break;
    default:
        item_list();
}

function item_list() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("item_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function item_xml() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    header('Content-Type: text/xml');
    echo $xml->saveXML();
    $res->close();
}

function item_csv() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
    $xsl = $db->xml2dom("item_csv.xsl");
    header("Content-Type: text/plain");
    echo $db->trans($xml, $xsl);
}

function item_xls() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
    $xsl = $db->xml2dom("item_xls.xsl");
//    header("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//    header("Content-Disposition: attachment;filename=\"item_info.xlsx\"");
//    header("Cache-Control: max-age=0");
    echo $db->trans($xml, $xsl);
}

function item_edit() {
    $db = new db1();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM item_info WHERE item_id = ?;");
    $qry->bind_param("i", $item_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//echo $xml->saveXML();
    $xsl = $db->xml2dom("item_edit.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function item_update() {
    $db = new db1();
    $item_id = filter_input(INPUT_POST, "item_id", FILTER_VALIDATE_INT);
    $item_name = filter_input(INPUT_POST, "item_name", FILTER_SANITIZE_STRING);
    $item_val1 = filter_input(INPUT_POST, "item_val1", FILTER_VALIDATE_FLOAT);
    $item_val2 = filter_input(INPUT_POST, "item_val2", FILTER_VALIDATE_FLOAT);
//echo $item_name,$item_id,$item_val1,$item_val2;
    $qry = $db->conn->prepare("UPDATE item_info SET item_updated = LOCALTIMESTAMP(), item_name = ?, item_val1 = ?, item_val2 = ? WHERE item_id = ?;");
    $qry->bind_param("sddi", substr($item_name, 0, 20), $item_val1, $item_val2, $item_id);
    $qry->execute();
    header("Location: item.php");
}

function item_svg() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $arr = $db->res2arr($res);
    $res->close();

    $dom2 = cls_xml::arr2dom($arr, "item");
//    echo $dom2->saveXML();
//main
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));
//    echo $dom1->saveXML();
//import
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);
//    echo $dom1->saveXML();

//transform
    $xsl = $db->xml2dom("item_svg.xsl");
    echo $db->trans($dom1, $xsl);
}

function item_insert() {
    $db = new db1();
    $v1 = 2 * (rand() / getrandmax()) - 1;
    $v2 = sin($v1 * pi());
    $qry = $db->conn->prepare("INSERT INTO item_info (item_val1, item_val2) VALUES (?,?);");
    $qry->bind_param("dd", $v1, $v2);
    $qry->execute();
    header("Location: item.php?mth=list");
}

function item_reset() {
    $db = new db1();
    $qry = $db->conn->prepare("DELETE FROM item_info;");
    $qry->execute();
    header("Location: item.php?mth=list");
}
