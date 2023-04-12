<?php

require_once "cls_db.php";
require_once "cls_usr.php";
require_once "cls_xml.php";
require_once "cls_utl.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
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
    case "del":
        pda_del();
        break;
    default:
        pda_all();
}

function pda_all() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_pda WHERE pda_del = 0 ORDER BY pdt_id,pda_usr_id,pda_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pda_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function pda_del() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_pda WHERE pda_del = 1 ORDER BY pdt_id,pda_usr_id,pda_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pda_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function pda_edit() {
    $db = new cls_db();
    $pda_id = filter_input(INPUT_GET, "pda_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE pda_id = ?;");
    $qry->bind_param("i", $pda_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pda_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function pda_insert() {
    $usr_id = cls_usr::check();
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    if (!is_null($usr_id)) {
        $db = new cls_db();
        $qry = $db->conn->prepare("INSERT INTO pda_info (pdt_id,usr_id,pda_p1,pda_p2,pda_p3,pda_p4) VALUES (?,?,RAND(),RAND(),RAND(),RAND());");
        $qry->bind_param("ii", $pdt_id, $usr_id);
        $qry->execute();
    }
    header("Location: pdt.php?mth=pda&pdt_id=" . $pdt_id);
}

function pda_update() {
    $usr_id = cls_usr::check();
    $db = new cls_db();
    $pda_id = filter_input(INPUT_POST, "pda_id", FILTER_VALIDATE_INT);
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    $pda_name = filter_input(INPUT_POST, "pda_name", FILTER_SANITIZE_STRING);
    $pda_p1 = filter_input(INPUT_POST, "pda_p1", FILTER_VALIDATE_FLOAT);
    $pda_p2 = filter_input(INPUT_POST, "pda_p2", FILTER_VALIDATE_FLOAT);
    $pda_p3 = filter_input(INPUT_POST, "pda_p3", FILTER_VALIDATE_FLOAT);
    $pda_p4 = filter_input(INPUT_POST, "pda_p4", FILTER_VALIDATE_FLOAT);
    $pda_del = isset($_POST['pda_del']);
//    var_dump($pda_del);
    //check ownership
    $qry = $db->conn->prepare("UPDATE pda_info SET pda_updated = LOCALTIMESTAMP(), pda_name = ?, pda_p1 = ?, pda_p2 = ?, pda_p3 = ?, pda_p4 = ?,pda_del = ? WHERE pda_id = ? AND usr_id = ?;");
    $qry->bind_param("sddddiii", substr($pda_name, 0, 20), cls_utl::clamp($pda_p1, 0, 1), cls_utl::clamp($pda_p2, 0, 1), cls_utl::clamp($pda_p3, 0, 1), cls_utl::clamp($pda_p4, 0, 1), $pda_del, $pda_id, $usr_id);//
    $qry->execute();

    header("Location: pdt.php?mth=pda&pdt_id=" . $pdt_id);
}

function pda_usr() {
    $usr_id = filter_input(INPUT_GET, "usr_id", FILTER_VALIDATE_INT);
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_pda WHERE pda_del = 0 AND pda_usr_id = ? ORDER BY pdt_id, pda_usr_id, pda_id;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pda_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}
