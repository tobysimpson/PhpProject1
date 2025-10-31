<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "ind_" . $mth;
$func();

function ind_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT ind_typ.ind_typ_id, ind.ind_id, ind_typ.ind_typ_name, ind.ind_code, ind.ind_name, ind.ind_unit FROM ind JOIN ind_typ ON ind.ind_typ_id = ind_typ.ind_typ_id ORDER BY ind_pos;");
    $dom = cls_xml::mul2dom($db->conn, "ind/ind_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}
