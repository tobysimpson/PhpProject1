<?php

require_once "cls_db.php";
require_once "cls_usr.php";
require_once "cls_xml.php";
require_once 'cls_la.php';
require_once "cls_pd.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);
switch ($mth) {
    case "all":
        pdt_all();
        break;
    case "del":
        pdt_del();
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
    case "play":
        pdt_play();
        break;
    default:
        pdt_all();
}

function pdt_all() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_pdt WHERE pdt_del = 0 ORDER BY pdt_usr_id,pdt_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pdt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function pdt_del() {
    $db = new cls_db();
    $qry = $db->conn->prepare("SELECT * FROM vw_pdt WHERE pdt_del = 1 ORDER BY pdt_usr_id,pdt_id;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pdt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

function pdt_edit() {
    $db = new cls_db();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM pdt_info WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pdt_edit.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function pdt_insert() {
    $usr_id = cls_usr::check();
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO pdt_info (usr_id) VALUES (?);");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $pdt_id = $db->conn->insert_id;
    header("Location: pdt.php?mth=edit&pdt_id=" . $pdt_id);
}

function pdt_update() {
    $usr_id = cls_usr::check();
    $db = new cls_db();
    $pdt_id = filter_input(INPUT_POST, "pdt_id", FILTER_VALIDATE_INT);
    $pdt_name = filter_input(INPUT_POST, "pdt_name", FILTER_SANITIZE_STRING);
    $pdt_r1 = filter_input(INPUT_POST, "pdt_r1", FILTER_VALIDATE_FLOAT);
    $pdt_r2 = filter_input(INPUT_POST, "pdt_r2", FILTER_VALIDATE_FLOAT);
    $pdt_r3 = filter_input(INPUT_POST, "pdt_r3", FILTER_VALIDATE_FLOAT);
    $pdt_r4 = filter_input(INPUT_POST, "pdt_r4", FILTER_VALIDATE_FLOAT);
    $pdt_iter = filter_input(INPUT_POST, "pdt_iter", FILTER_VALIDATE_INT);
    $pdt_del = isset($_POST['pdt_del']);
    $qry = $db->conn->prepare("UPDATE pdt_info SET pdt_updated = LOCALTIMESTAMP(), pdt_name = ?, pdt_r1 = ?, pdt_r2 = ?, pdt_r3 = ?, pdt_r4 = ?, pdt_iter = ?, pdt_del = ?  WHERE pdt_id = ? AND usr_id = ?;");
    $qry->bind_param("sddddiiii", substr($pdt_name, 0, 20), $pdt_r1, $pdt_r2, $pdt_r3, $pdt_r4, $pdt_iter, $pdt_del, $pdt_id, $usr_id);
    $qry->execute();
    header("Location: pdt.php");
}

function pdt_pda() {
    $db = new cls_db();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_pda WHERE pda_del = 0 AND pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pda_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}

function pdt_usr() {
    $db = new cls_db();
    $usr_id = filter_input(INPUT_GET, "usr_id", FILTER_VALIDATE_INT);
    $qry = $db->conn->prepare("SELECT * FROM vw_pdt WHERE pdt_del = 0 AND pdt_usr_id = ?;");
    $qry->bind_param("i", $usr_id);
    $qry->execute();
    $res = $qry->get_result();
    $xml = cls_xml::res2dom($res);
    $xsl = cls_xml::file2dom("pdt_list.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
    $res->close();
}


//plays the game
function pdt_play() {
    $db = new cls_db();
    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);

    //master
    $dom1 = new DOMDocument('1.0', 'utf-8');
    $dom1->formatOutput = true;
    $dom1->appendChild($dom1->createElement('root'));

    //tournament
    $qry = $db->conn->prepare("SELECT * FROM vw_pdt WHERE pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $pdt = cls_xml::res2arr($res);
    $res->close();
    //import
    $dom2 = cls_xml::arr2dom($pdt, "pdt");
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //agents
    $qry = $db->conn->prepare("SELECT * FROM vw_pda WHERE pda_del = 0 AND pdt_id = ?;");
    $qry->bind_param("i", $pdt_id);
    $qry->execute();
    $res = $qry->get_result();
    $pda = cls_xml::res2arr($res);
    $res->close();
    //import
    $dom2 = cls_xml::arr2dom($pda, "pda");
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    //params (first row)
    $na = count($pda);
    $nt = $pdt[0]['pdt_iter'];
    $r = array($pdt[0]['pdt_r1'], $pdt[0]['pdt_r2'], $pdt[0]['pdt_r3'], $pdt[0]['pdt_r4']);

    //payoff
    $P = array();
    $keys = array();
    $vals = array();

    $node = $dom1->createElement("res");
    cls_xml::addAttribute($dom1, $node, "name", "mark");
    $dom1->documentElement->appendChild($node);

    //tensor agents
    for ($i = 0; $i < $na; $i++) {
        $p = array($pda[$i]['pda_p1'], $pda[$i]['pda_p2'], $pda[$i]['pda_p3'], $pda[$i]['pda_p4']);

        //node
        $node1 = $dom1->createElement("mrow");
        cls_xml::addAttribute($dom1, $node1, "pda_id", $pda[$i]['pda_id']);
        cls_xml::addAttribute($dom1, $node1, "pda_name", $pda[$i]['pda_name']);
        $node->appendChild($node1);

        for ($j = 0; $j < $na; $j++) {
            $q = array($pda[$j]['pda_p1'], $pda[$j]['pda_p2'], $pda[$j]['pda_p3'], $pda[$j]['pda_p4']);

            //node
            $node2 = $dom1->createElement("mcol");
            cls_xml::addAttribute($dom1, $node2, "pda_id", $pda[$j]['pda_id']);
            cls_xml::addAttribute($dom1, $node2, "pda_name", $pda[$j]['pda_name']);
            $node1->appendChild($node2);

            //markov
            $A = cls_pd::fn_mark($p, $q);
            //import
            $dom2 = cls_xml::arr2dom($A, "A");
            $node3 = $dom1->importNode($dom2->firstChild, true);
            $node2->appendChild($node3);

            //eig
            $v = cls_pd::fn_eig1($A);
            //import
            $dom2 = cls_xml::vec2dom($v, "v");
            $node3 = $dom1->importNode($dom2->firstChild, true);
            $node2->appendChild($node3);

            //payoffs
            $keys[$j] = sprintf("r%dc%d", $i, $j);
            $vals[$j] = cls_la::fn_dot($v, $r);
            $P[$i] = array_combine($keys, $vals);
            //expected payoff
            cls_xml::addAttribute($dom1, $node2, "pda_pay", $vals[$j]);
        }
    }

    //init
    $f = array_fill(0, $na, 1 / $na);
    //keys
    for ($i = 0; $i < $na; $i++) {
        $keys[$i] = sprintf("a%d", $i);
    }

    $R = array();
    $s = array();

    //loop time
    for ($i = 0; $i < $nt; $i++) {
        $R[$i] = array_combine($keys, $f);
        $vals = cls_la::fn_Au($P, $f);
        $s[$i]['s'] = array_sum($vals);
        $m = array_sum($vals) / $na; //mean
        //loop agents
        for ($j = 0; $j < $na; $j++) {
            $f[$j] *= ($vals[$j] / $m); //update
        }
        $f = cls_la::fn_smul($f, 1e0 / cls_la::fn_nrm1($f)); //re-weight
    }


    //import
    $dom2 = cls_xml::arr2dom($R, "R");
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);
    //import
    $dom2 = cls_xml::arr2dom($s, "s");
    $node = $dom1->importNode($dom2->firstChild, true);
    $dom1->documentElement->appendChild($node);

    echo $dom1->saveXML();
    $xsl = cls_xml::file2dom("pdt_play.xsl");
    echo cls_xml::xsltrans($dom1, $xsl);
}
