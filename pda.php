<?php

require "db1.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "all":
        pda_all();
        break;
    case "edit":
        pda_edit();
        break;
    case "update":
        pda_update();
        break;
    case "insert":
        pda_insert();
        break;
    case "usr":
        pda_usr();
        break;
    default:
        pda_all();
}

function pda_all() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM pda_info;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pda_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pda_edit() {
    $db = new db1();
    $pda_id = filter_input(INPUT_GET, "pda_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE pda_id = ?;");
    $qry->bind_param("i", $pda_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pda_edit.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pda_insert() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("INSERT INTO pda_info (pdt_id,usr_id) VALUES (?,?);");
    $qry->bind_param("ii", $pdt_id, $db->$usr_id);
    $qry->execute();
    header("Location: pdt.php?mth=pda&pdt_id=".$pdt_id);
}

function pda_update() {
    $db = new db1();
    $pda_id = filter_input(INPUT_POST, "pda_id", FILTER_VALIDATE_INT);
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    $pda_name = filter_input(INPUT_POST, "pda_name", FILTER_SANITIZE_STRING);
    $pda_val1 = filter_input(INPUT_POST, "pda_val1", FILTER_VALIDATE_FLOAT);
    $pda_val2 = filter_input(INPUT_POST, "pda_val2", FILTER_VALIDATE_FLOAT);
    $qry = $db->conn->prepare("UPDATE pda_info SET pda_updated = LOCALTIMESTAMP(), pda_name = ?, pda_val1 = ?, pda_val2 = ? WHERE pda_id = ? AND usr_id = ?;");
    $qry->bind_param("sddii", substr($pda_name, 0, 20), $db->clamp($pda_val1, 0, 1), $db->clamp($pda_val2, 0, 1), $pda_id, $db->$usr_id); //clamp [0,1]
    $qry->execute();
    //echo $db->conn->$error;
//    header("Location: pda.php");
    header("Location: pdt.php?mth=pda&pdt_id=".$pdt_id);
}

function pda_usr() {
    $db = new db1();
    $usr_id = filter_input(INPUT_GET, "usr_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE usr_id = ?;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pda_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}
