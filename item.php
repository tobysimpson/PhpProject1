<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "lst":
        item_lst();
        break;
    case "edt":
        item_edt();
        break;
    case "upd":
        item_upd();
        break;
    case "ins":
        item_ins();
        break;
    default:
        item_lst();
}


function item_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_lst()");
    $dom = cls_xml::mul2dom($db->conn, "item/item_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}



//function item_edt() {
//    $db = new cls_db();
//    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
//    $qry = $db->conn->prepare("SELECT * FROM item_info WHERE item_id = {$item_id};");
////    $qry->bind_param("i", $item_id);
//    $qry->execute();
//    $res = $qry->get_result();
//    $xml = cls_xml::res2dom($res);
//    $xsl = cls_xml::file2dom("item/item_edt.xsl");
//    echo cls_xml::xsltrans($xml, $xsl);
//    $res->close();
//}


function item_edt() {
    $db = new cls_db();
    $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_item_edt({$item_id})");
    $dom = cls_xml::mul2dom($db->conn, "item/item_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}




function item_upd() {
    $db = new cls_db();
    $item_id   = filter_input(INPUT_POST, "item_id",   FILTER_VALIDATE_INT);
    $item_name = filter_input(INPUT_POST, "item_name", FILTER_SANITIZE_STRING);
    $item_val1 = filter_input(INPUT_POST, "item_val1", FILTER_VALIDATE_FLOAT);
    $item_val2 = filter_input(INPUT_POST, "item_val2", FILTER_VALIDATE_FLOAT);
//echo $item_name,$item_id,$item_val1,$item_val2;
    $qry = $db->conn->prepare("UPDATE item_info SET item_date = NOW(), item_name = ?, item_val1 = ?, item_val2 = ? WHERE item_id = ?;");
    $qry->bind_param("sddi", substr($item_name, 0, 20), $item_val1, $item_val2, $item_id);
    $qry->execute();
    header("Location: item.php");
}

function item_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO item_info VALUES ();");
    $qry->execute();
    header("Location: item.php");
}
