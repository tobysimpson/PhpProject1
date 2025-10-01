<?php

//for rptoad?
//header('Content-Type: text/html; charset=utf-8');

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "rpt_".$mth;
$func();


function rpt_lst() {
    $db = new cls_db();
//    $id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt JOIN scn ORDER BY rpt_id, scn_id;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_dsp() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt1({$rpt_id},{$scn_id});");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt1_dsp.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_prm() {
    $db = new cls_db();
    $id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);
    $ts = filter_input(INPUT_GET, "ts", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("SELECT * FROM cub1 where id = {$id} AND ts = '{$ts}' ORDER BY id,scn,yr;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_prm.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
