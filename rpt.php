<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "rpt_" . $mth;
$func();

function rpt_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM rpt ORDER BY rpt_name; SELECT * FROM scn ORDER BY scn_sps, shk_id, shk_lvl;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_upl() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT 1 as txt;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_upl.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_dsp() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $fmt = filter_input(INPUT_GET, "fmt", FILTER_VALIDATE_INT);
    $rpt_typ = rpt_typ($rpt_id);
    $db->conn->multi_query("CALL sp_rpt{$rpt_typ}({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("rpt%02d_scn%02d", $rpt_id, $scn_id);

    switch ($fmt) {
        case 1:
            header('Content-Type: text/xml');
            cls_xml::procxsl($xml, "rpt/rpt{$rpt_typ}_htm.xsl");
            echo $xml->saveXML();
            break;
        case 2:
//            header ('Content-Type: text/plain'); //display in browser
            header("Content-type: text/csv");
            header("Content-Disposition: attachment; filename={$fname}.csv");
            header("Pragma: no-cache");
            header("Expires: 0");
            $xsl = cls_xml::file2dom("rpt/rpt{$rpt_typ}_csv.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        case 3:
            header('Content-Type: application/vnd.ms-excel');
            header("Content-Disposition: attachment; filename={$fname}.xls");
            $xsl = cls_xml::file2dom("rpt/rpt{$rpt_typ}_xls.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        default:
            header('Content-Type: text/xml');
            echo $xml->saveXML();
            break;
    }
}


function rpt_typ($rpt_id) {
    $db = new cls_db();
    $res = $db->conn->query("SELECT * FROM rpt WHERE rpt_id = {$rpt_id};");
    $row = $res->fetch_assoc();
    return $row['rpt_typ'];
}


function rpt_ins() {
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);
    
    $names = array($name0, $name1, $name2);

    preg_match_all('/\d+/', $name0, $matches);
//    print_r($matches);

    [$rpt_id, $scn_id] = $matches[0];
    
    $rpt_typ = rpt_typ($rpt_id);

    
    echo $rpt_id . PHP_EOL;
    echo $scn_id . PHP_EOL;
    
    //call
    $func = "rpt{$rpt_typ}_ins";
    $func(intval($rpt_id), intval($scn_id), $names);
}

function rpt1_ins($rpt_id, $scn_id, $names) {
    $db = new cls_db();

    //read
    $file1 = fopen($names[1], "r");
    $head = fgetcsv($file1);
    
    //parse
    $data = [];
    while (($row = fgetcsv($file1)) !== FALSE) {
        $data[] = $row;
    }
    fclose($file1);

    //write
    $m = count($head);
    $n = count($data);

    $file2 = fopen($names[1], "w");
    for ($i = 0; $i < $n; $i++) {
        for ($j = 4; $j < $m; $j++) {
//            print_r(array($data[$i][0], $data[$i][1], $head[$j], $data[$i][$j]));
            if (is_numeric($head[$j]) and is_numeric($data[$i][$j])) {
                fputcsv($file2, array($data[$i][0], $data[$i][1], $head[$j], $data[$i][$j]));
            }
        }
    }
    fclose($file2);

    //move
    try {
        move_uploaded_file($names[1], $names[2]);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    //load
    $sql1 = "LOAD DATA INFILE '" . $names[2] . "' INTO TABLE db2.cub1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";

    try {
        $db->conn->query($sql1);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    //clean
    unlink($names[2]);

    header("Location: upl.php?mth=lst");
}



function rpt2_ins($rpt_id, $scn_id, $names) {
    $db = new cls_db();

    //open
    $file1 = fopen($names[1], "r");

    //read
    $head1 = fgetcsv($file1);
    $head2 = fgetcsv($file1);
    $head3 = fgetcsv($file1);

    
//    echo implode(',', $head1) . PHP_EOL;
//    echo implode(',', $head2) . PHP_EOL;
//    echo implode(',', $head3) . PHP_EOL;

    //parse
    $data1 = [];
    while (($row1 = fgetcsv($file1)) !== FALSE) {
        $data1[] = $row1;
    }

    //close
    fclose($file1);

    
    //write
    $m = count($head1);
    $n = count($data1);
    
    echo $m . PHP_EOL;
    echo $n . PHP_EOL;

    $file2 = fopen($names[1], "w");
    for ($i = 0; $i < $n; $i++) {
        for ($j = 3; $j < $m; $j++) {
//            echo $i . ' ' . $j . PHP_EOL;
            if (is_numeric($data1[$i][$j])) {
                $row2 = array($rpt_id, $scn_id, $head1[$j], $data1[$i][0], $data1[$i][1], $data1[$i][2], $head2[$j], $head3[$j], $data1[$i][$j]);
//                echo sprintf("%03d %03d",$i, $j) . ' ' . implode(',', $row2) . PHP_EOL;
                fputcsv($file2, $row2);
            }
        }
    }
    fclose($file2);

    try {
        move_uploaded_file($names[1], $names[2]);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_rpt2";
    $sql2 = "LOAD DATA INFILE '" . $names[2] . "' INTO TABLE db2.in_rpt2 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (rpt_id,scn_id,yr,qtr,wkd,day,io,reg,u);";
    $sql3 = "CALL db2.sp_rpt2_ins()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($names[1]);
    unlink($names[2]);

//    $files2 = scandir($dir);
//    print_r($files2);
    header("Location: upl.php?mth=lst");
}
