<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "disp":
        bal_disp();
        break;
    default:
        bal_disp();
}


function bal_disp() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $n = filter_input(INPUT_GET, "n", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM col_calc5 WHERE usr_id = {$usr_id} AND n = {$n};");
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("bal/bal_disp.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}


