<?php

require_once "db1.php";
require_once 'cls_lin.php';
require_once "cls_pd.php";

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
    case "eig":
        pdt_eig();
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
    $pdt_r1 = filter_input(INPUT_POST, "pdt_r1", FILTER_VALIDATE_FLOAT);
    $pdt_r2 = filter_input(INPUT_POST, "pdt_r2", FILTER_VALIDATE_FLOAT);
    $pdt_r3 = filter_input(INPUT_POST, "pdt_r3", FILTER_VALIDATE_FLOAT);
    $pdt_r4 = filter_input(INPUT_POST, "pdt_r4", FILTER_VALIDATE_FLOAT);
    $pdt_iter = filter_input(INPUT_POST, "pdt_iter", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("UPDATE pdt_info SET pdt_updated = LOCALTIMESTAMP(), pdt_name = ?, pdt_r1 = ?, pdt_r2 = ?, pdt_r3 = ?, pdt_r4 = ?, pdt_iter = ?  WHERE pdt_id = ? AND usr_id = ?;");
    $qry->bind_param("sddddiii", substr($pdt_name, 0, 20), $pdt_r1, $pdt_r2, $pdt_r3, $pdt_r4, $pdt_iter, $pdt_id, $db->$usr_id);
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

function pdt_eig() {
    $db = new db1();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    //tournament
    $qry = $db->conn->prepare("SELECT * FROM pdt_info WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $pdt = $db->res2arr($res);
    $res->close();
    //agents
    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $pda = $db->res2arr($res);
    $res->close();

    //debug
    $xml = $db->arr2dom($pdt, "pdt");
    echo $xml->saveXML();
    $xml = $db->arr2dom($pda, "pda");
    echo $xml->saveXML();

    //params (first row)
    $na = count($pda);
    $nt = $pdt[0]['pdt_iter'];
    $r = array($pdt[0]['pdt_r1'], $pdt[0]['pdt_r2'], $pdt[0]['pdt_r3'], $pdt[0]['pdt_r4']);

    //payoff
    $P = array();
    $keys = array();
    $vals = array();
    //tensor agents
    for ($i = 0; $i < $na; $i++) {
        $p = array($pda[$i]['pda_p1'], $pda[$i]['pda_p2'], $pda[$i]['pda_p3'], $pda[$i]['pda_p4']);
        for ($j = 0; $j < $na; $j++) {
            $q = array($pda[$j]['pda_p1'], $pda[$j]['pda_p2'], $pda[$j]['pda_p3'], $pda[$j]['pda_p4']);
            //markov
            $A = cls_pd::fn_mark($p, $q);
            //eig
            $v = cls_pd::fn_eig1($A);
            //row
            $keys[$j] = sprintf("r%dc%d", $i, $j);
//            $keys[$j] = sprintf("r%dc%d",$pda[$i]['pda_id'],$pda[$j]['pda_id']);
            $vals[$j] = cls_lin::fn_dot($v, $r);
            //payoff
            $P[$i] = array_combine($keys, $vals);
        }
    }


    $xml = $db->arr2dom($P, "P");
    echo $xml->saveXML();

    //init
    $vals = array_fill(0, $na, 1 / $na);
    //keys
    for ($i = 0; $i < $na; $i++) {
        $keys[$i] = sprintf("a%d", $i);
    }

    $R = array();
    $s = array();
    
    //loop time
    for ($i = 0; $i < $nt; $i++) {
        $R[$i] = array_combine($keys, $vals);
        $vals = cls_lin::fn_Au($P, $vals);//res
        $s[$i]['s'] = array_sum($vals);
        $vals = cls_lin::fn_smul($vals, 1e0 / cls_lin::fn_nrm1($vals));//re-weight
    }
    
//    var_dump($P);
//    var_dump($R);
//    var_dump($s);
    
    $xml = $db->arr2dom($R, "R");
    echo $xml->saveXML();
    $xml = $db->arr2dom($s, "s");
    echo $xml->saveXML();
    
}
