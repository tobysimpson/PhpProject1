<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        item_list();
        break;
    case "xml":
        item_xml();
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
    case "test":
        item_test();
        break;
    case "sp":
        item_sp();
        break;
    default:
        item_list();
}

function item_list() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("item/item_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function item_xml() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res, "item/item_list.xsl");
    header('Content-Type: text/xml');
    echo $xml->saveXML();
    $res->close();
}

function item_csv() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM item_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("item/item_csv.xsl");
    header("Content-Type: text/plain");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function item_edit() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM item_info WHERE item_id = ?;");
    $qry->bind_param("i", $item_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("item/item_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function item_svg() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM item_info ORDER BY item_val1;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
//    echo $xml->saveXML();
    $xsl = cls_xml::file2dom("item/item_svg.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function item_update() {
    $db = new cls_db();
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

function item_insert() {
    $db = new cls_db();
    $v1 = 100 * rand() / getrandmax();
    $v2 = pow($v1 / 10, 2);
//    $v2 = 10*sin($v1 * pi());
    $qry = $db->conn->prepare("INSERT INTO item_info (item_val1, item_val2) VALUES ({$v1},{$v2});");
//    $qry->bind_param("dd", $v1, $v2);
    $qry->execute();
    header("Location: item.php?mth=list");
}

function item_reset() {
    $db = new cls_db();
    $qry = $db->conn->prepare("DELETE FROM item_info;");
    $qry->execute();
    header("Location: item.php?mth=list");
}

function item_test() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $fld_name = filter_input(INPUT_GET, "fld_name", FILTER_SANITIZE_STRING);
    $fld_val = filter_input(INPUT_GET, "fld_val", FILTER_VALIDATE_FLOAT);

    $qry = $db->conn->prepare("UPDATE item_info SET item_updated = LOCALTIMESTAMP(), {$fld_name} = {$fld_val} WHERE item_id = {$item_id};");

    $qry->execute();

    header("Location: item.php?mth=list");
}

function item_sp() {
    $db = new cls_db();
    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_test1({$res_id},{$prm_id});");
    $dom = cls_xml::mul2dom($db->conn, "item/item_test.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
