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
    case "sum":
        bal_sum();
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


function bal_sum() {
    $db = new cls_db();
    $usr_id = cls_usr::check();
    $qry = $db->conn->prepare("SELECT n,t,con_ele AS v1,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10 FROM col_calc5 WHERE usr_id = {$usr_id} ORDER BY n;");
    $qry->execute();
    $res = $qry->get_result();
    $dom1 = cls_xml::res2dom($res);
    $res->close();
//    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("bal/bal_sum.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}

