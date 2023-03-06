<?php

require "db1.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "all":
        pdt_all();
        break;
    case "edit":
        pdt_edit();
        break;
    case "update":
        pdt_update();
        break;
    case "insert":
        pdt_insert();
        break;
    case "pda":
        pdt_pda();
        break;
    case "usr":
        pdt_usr();
        break;
    default:
        pdt_all();
}

function pdt_all() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM pdt_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pdt_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pdt_edit() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pdt_info WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pdt_edit.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pdt_insert() {
    $db = new db1();
    $qry = $db->conn->prepare("INSERT INTO pdt_info (usr_id) VALUES (?);");
    $qry->bind_param("i", $db->$usr_id);
    $qry->execute();
    $pdt_id = $db->conn->insert_id;
    header("Location: pdt.php?mth=edit&pdt_id=".$pdt_id);
}

function pdt_update() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    $pdt_name = filter_input(INPUT_POST, "pdt_name", FILTER_SANITIZE_STRING);
    $qry = $db->conn->prepare("UPDATE pdt_info SET pdt_updated = LOCALTIMESTAMP(), pdt_name = ? WHERE pdt_id = ? AND usr_id = ?;");
    $qry->bind_param("sii", substr($pdt_name, 0, 20), $pdt_id, $db->$usr_id);
    $qry->execute();
//    echo $db->conn->$error;
    header("Location: pdt.php");
}

function pdt_pda() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pda_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}


function pdt_usr() {
    $db = new db1();
    $usr_id = filter_input(INPUT_GET, "usr_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pdt_info WHERE usr_id = ?;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pdt_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}