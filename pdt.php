<?php

require "db1.php";
include "la4.php";

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
    case "mark":
        pdt_mark();
        break;
    case "eigs":
        pdt_eigs();
        break;
    default:
        pdt_all();
}

function pdt_all() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT pdt_info.*, usr_info.usr_name FROM pdt_info INNER JOIN usr_info ON pdt_info.usr_id = usr_info.usr_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
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
    header("Location: pdt.php?mth=edit&pdt_id=" . $pdt_id);
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
    $qry = $db->conn->prepare("SELECT pda_info.*, pdt_info.pdt_name, usr_info.usr_name FROM pda_info INNER JOIN pdt_info ON pda_info.pdt_id = pdt_info.pdt_id INNER JOIN usr_info ON usr_info.usr_id = pda_info.usr_id  WHERE pdt_info.pdt_id = ?;");
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
    $qry = $db->conn->prepare("SELECT pdt_info.*, usr_info.usr_name FROM pdt_info INNER JOIN usr_info ON pdt_info.usr_id = usr_info.usr_id WHERE usr_info.usr_id = ?;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
    $xsl = $db->xml2dom("pdt_list.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pdt_mark() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT pdt_id, pda_id1, pda_id2, a11,a12,a13,a14, a21,a22,a23,a24, a31,a32,a33,a34, a41,a42,a43,a44 FROM pdt_mark WHERE pdt_id = ? ORDER BY pda_id1, pda_id2 ASC;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
    $xsl = $db->xml2dom("pdt_mark.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}

function pdt_eigs() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT pdt_id, pda_id1, pda_id2, a11,a12,a13,a14, a21,a22,a23,a24, a31,a32,a33,a34, a41,a42,a43,a44 FROM pdt_mark WHERE pdt_id = ? ORDER BY pda_id1, pda_id2 ASC;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();

    //rows
    while ($row = $res->fetch_assoc()) {
        //disp
        echo $row['pdt_id'], " ", $row['pda_id1'], " ", $row['pda_id2'], "\n";
        //fill mtx
//        $a1 = [$row['a11'], $row['a12'], $row['a13'], $row['a14']];
//        $a2 = [$row['a21'], $row['a22'], $row['a23'], $row['a24']];
//        $a3 = [$row['a31'], $row['a32'], $row['a33'], $row['a34']];
//        $a4 = [$row['a41'], $row['a42'], $row['a43'], $row['a44']];
        
        //transpose!
        $a1 = [$row['a11'], $row['a21'], $row['a31'], $row['a41']];
        $a2 = [$row['a12'], $row['a22'], $row['a32'], $row['a42']];
        $a3 = [$row['a13'], $row['a23'], $row['a33'], $row['a43']];
        $a4 = [$row['a14'], $row['a24'], $row['a34'], $row['a44']];

        $A = [$a1, $a2, $a3, $a4];

//        fn_disp4x4($A);
//        echo "\n";
//        echo "v\n";
        $v = [1e0, 1e0, 1e0, 1e0];
//        $n = fn_nrm($v);
//        echo $n,"\n";
//        $v = fn_smul($v,1/$n);
//        $n = fn_nrm($v);
//        echo $n,"\n";


//        fn_disp4($v);
//        echo "\n";

//        fn_disp4(fn_Av($A,$v));
//        echo "loop\n";
        for ($i = 0; $i < 100; $i++) {
            $v = fn_Av($A, $v);
            $n = fn_nrm($v);
//            echo $n,"\n";
            $v = fn_smul($v,1e0/$n);
        }//i
        
        fn_disp4($v);
        echo "\n";

        
    }//rows
    $res->close();
}
