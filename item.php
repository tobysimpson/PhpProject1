<?php

require "db1.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "list":
        item_list();
        break;
    case "edit":
        item_edit();
        break;
    case "update":
        item_update();
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
