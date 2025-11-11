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
    $db->conn->multi_query("CALL sp_dsp_raw1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    header('Content-Type: text/xml');
    cls_xml::procxsl($xml, "raw/raw_htm.xsl");
    echo $xml->saveXML();
}


function raw_csv() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_dsp_raw1({$rpt_id},{$scn_id});");
    $xml = cls_xml::mul2dom($db->conn);
    $fname = sprintf("raw%02d_scn%02d", $rpt_id, $scn_id);
    header("Content-type: text/csv");
    header("Content-Disposition: attachment; filename={$fname}.csv");
    header("Pragma: no-cache");
    header("Expires: 0");
    $xsl = cls_xml::file2dom("raw/raw_csv.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}



function raw_nav() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT 1 as txt;");
    $dom = cls_xml::mul2dom($db->conn, "raw/raw_nav.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}


function raw_upl() {
    $db = new cls_db();
    print_r($_FILES);

    $dir = "/var/lib/mysql-files/";
    $name1 = $_FILES["upload_file"]["tmp_name"];
    $name2 = basename($name1);


    echo $name1;
    echo '<br/>';
    echo $dir . $name2;
    echo '<br/>';

    try {
        move_uploaded_file($name1, $dir . $name2);
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    $files1 = scandir("/tmp");
    print_r($files1);

        
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.tbl_0001 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"';";
    $sql1 = "LOAD DATA INFILE '" . $dir.$name2 . "' INTO TABLE db2.cub1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";
//    $sql1 = "LOAD DATA INFILE '" . $dir.$name . "' INTO TABLE db2.cub1 CHARACTER SET UTF8 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (prm_id,scn_id,yr,u);";

    
    echo $sql1 . PHP_EOL;

    try {
        $res1 = $db->conn->query($sql1);
        print_r($res1);
    } catch (Exception $e) {
        echo $e->getMessage();
    }
    
    unlink($dir.$name2);
    
    echo '<br/>';
    $files2 = scandir($dir);
    print_r($files2);
    
    header("Location: upl.php?mth=hst");
}