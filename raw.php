<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "raw_" . $mth;
$func();

function raw_lst() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT * FROM rpt ORDER BY rpt_name; SELECT * FROM scn ORDER BY sps_id, shk_id, shk_lvl;");
    $dom = cls_xml::mul2dom($db->conn, "raw/raw_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function raw_htm() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_raw1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    cls_xml::procxsl($xml, "raw/raw_htm.xsl");
    echo $xml->saveXML();
}


function raw_csv() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_raw1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("raw%02d_scn%02d", $rpt_id, $scn_id);
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("raw/raw_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}


function raw_dsp() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $fmt    = filter_input(INPUT_GET, "fmt", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_raw1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("raw%02d_scn%02d", $rpt_id, $scn_id);

    switch ($fmt) {
        case 1:
            header('Content-Type: text/xml');
            cls_xml::procxsl($xml, "raw/raw_htm.xsl");
            echo $xml->saveXML();
            break;
        case 2:
            header("Content-type: text/csv");
            header("Content-Disposition: attachment; filename={$fname}.csv");
            header("Pragma: no-cache");
            header("Expires: 0");
            $xsl = cls_xml::file2dom("raw/raw_csv.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        case 3:
            header('Content-Type: application/vnd.ms-excel');
            header("Content-Disposition: attachment; filename=r{$fname}.xls");
            $xsl = cls_xml::file2dom("raw/raw_xls.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        default:
            header('Content-Type: text/xml');
            break;
    }
}



function raw_upl() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT 1 as txt;");
    $dom = cls_xml::mul2dom($db->conn, "raw/raw_upl.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function raw_ins() {
    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name1 = $_FILES["file_upload"]["tmp_name"];
    $name2 = $dir . basename($name1);
    //read
    $file1 = fopen($name1, "r");
    $head = fgetcsv($file1);
//    print_r($head);
    $data = [];
    while (($row = fgetcsv($file1, 1000)) !== FALSE) {
        $data[] = $row;
    }
    fclose($file1);
//    print_r($data);

    $m = count($head);
    $n = count($data);
    echo $m . "," . $n . PHP_EOL;

    //write
    $file2 = fopen($name1, "w");
    for ($i = 0; $i < $n; $i++) {
        for ($j = 3; $j < $m; $j++) {
            print_r(array($data[$i][0], $data[$i][1], $head[$j], $data[$i][$j]));
            if (is_numeric($head[$j]) and is_numeric($data[$i][$j])) {
                fputcsv($file2, array($data[$i][0], $data[$i][1], $head[$j], $data[$i][$j]));
            }
        }
    }
    fclose($file2);

    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage();
    }


    $files2 = scandir($dir);
    print_r($files2);

    $sql1 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.cub1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.cub1 CHARACTER SET UTF8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";

    try {
        $res1 = $db->conn->query($sql1);
        print_r($res1);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    //    unlink($name1);
    unlink($name2);

    header("Location: upl.php?mth=lst");
}
