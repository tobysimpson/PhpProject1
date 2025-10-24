<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "itm_" . $mth;
$func();

function itm_lst() {
    $db = new cls_db();
//    $res_id = filter_input(INPUT_GET, "res_id", FILTER_VALIDATE_INT);
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_itm_lst()");
    $dom = cls_xml::mul2dom($db->conn, "itm/itm_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function itm_edt() {
    $db = new cls_db();
    $itm_id = filter_input(INPUT_GET, "itm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_itm_edt({$itm_id})");
    $dom = cls_xml::mul2dom($db->conn, "itm/itm_edt.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function itm_upd() {
    $db = new cls_db();
    $itm_id = filter_input(INPUT_POST, "itm_id", FILTER_VALIDATE_INT);
    $itm_name = filter_input(INPUT_POST, "itm_name", FILTER_SANITIZE_STRING);
    $itm_val1 = filter_input(INPUT_POST, "itm_val1", FILTER_VALIDATE_INT);
    $itm_val2 = filter_input(INPUT_POST, "itm_val2", FILTER_VALIDATE_FLOAT);
    $itm_act = filter_input(INPUT_POST, "itm_act", FILTER_VALIDATE_INT);
//    echo $itm_id,$itm_name,$itm_val1,$itm_val2,$itm_act;'
    $db->conn->multi_query("CALL sp_itm_upd({$itm_id},{$itm_act},'{$itm_name}',{$itm_val1},{$itm_val2})");
    header("Location: itm.php?mth=lst");
}

function itm_ins() {
    $db = new cls_db();
    $qry = $db->conn->prepare("INSERT INTO itm_info VALUES ();");
    $qry->execute();
    header("Location: itm.php?mth=lst");
}

//function itm_upl() {
//    $db = new cls_db();
//    print_r($_FILES);
////    echo '<br/>';
////    print_r($_FILES["fileToUpload"]["tmp_name"]);
////    echo '<br/>';
////    print_r($_FILES["fileToUpload"]["name"]);
//    $dir = "/var/lib/mysql-files/";
//    $tmp_name = $_FILES["fileToUpload"]["tmp_name"];
//    $name = basename($tmp_name);
////    $name = $_FILES["fileToUpload"]["name"];
////    echo $tmp_name;
////    echo '<br/>';
////    echo $dir . $name;
////    echo '<br/>';
//    try {
//        move_uploaded_file($tmp_name, $dir . $name);
//    } catch (Exception $e) {
//        echo $e->getMessage();
//    }
////    echo $db->conn->allow_local_infile = true;
////    echo '<br/>';
////    echo $db->conn->local_infile_directory = "/tmp";
////    echo '<br/>';
//    $files1 = scandir("/tmp");
//    print_r($files1);
////    echo '<br/>';
//    $sql1 = "LOAD DATA INFILE '" . $dir . $name . "' INTO TABLE db2.bsm2 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (lvl,name,col_2020,col_2025,col_2030,col_2035,col_2040,col_2045,col_2050);";
////    echo $sql1;
////    echo '<br/>';
//    try {
//        $res1 = $db->conn->query($sql1);
//        print_r($res1);
//    } catch (Exception $e) {
//        echo $e->getMessage();
//    }
//    unlink($dir . $name);
////    echo '<br/>';
////    $files2 = scandir($dir);
////    print_r($files2);
//}

function itm_tst() {
    $db = new cls_db();
    //$itm_id = filter_input(INPUT_GET, "itm_id", FILTER_VALIDATE_INT);
//    $xsl = filter_input(INPUT_POST, "xsl", FILTER_SANITIZE_STRING);
    $xsl = "itm/itm_lst.xsl";
    $db->conn->multi_query("CALL sp_itm_tst()");
    $dom = new DOMDocument('1.0', 'utf-8');
    $dom->appendChild($dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="' . $xsl . '"'));
    $root = $dom->appendChild($dom->createElement('root'));
    do {
        $res = $db->conn->store_result();
        if ($res) {
            $arr = $res->fetch_all(MYSQLI_ASSOC);
            cls_xml::arr2tbl($dom, $root, $arr);
            $res->free();
        }
    } while ($db->conn->next_result());
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function itm_upl() {
    $db = new cls_db();
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name1 = $_FILES["upfile"]["name"];
    $name2 = $_FILES["upfile"]["tmp_name"];
    $name3 = $dir . basename($name2);

    echo $name1 . PHP_EOL;
    echo $name2 . PHP_EOL;
    echo $name3 . PHP_EOL;

    preg_match_all('/\d+/', $name1, $matches);
//    print_r($matches);

    [$rpt_id, $scn_id] = $matches[0];

    echo $rpt_id . PHP_EOL;
    echo $scn_id . PHP_EOL;

    
    //==========
    // type dependent
    //==========
    
    //read
    $file1 = fopen($name2, "r");
    $head1 = fgetcsv($file1);
    $head2 = fgetcsv($file1);
    $head3 = fgetcsv($file1);

//    echo implode(',', $head1) . PHP_EOL;
//    echo implode(',', $head2) . PHP_EOL;
//    echo implode(',', $head3) . PHP_EOL;

    $data1 = [];
    while (($row1 = fgetcsv($file1, 1000)) !== FALSE) {
        $data1[] = $row1;
    }
    fclose($file1);

    $m = count($head1);
    $n = count($data1);

    echo $m . PHP_EOL;
    echo $n . PHP_EOL;

    //write
    $file2 = fopen($name2, "w");
    for ($i = 0; $i < $n; $i++) {
        for ($j = 3; $j < $m; $j++) {
//            echo $i . ' ' . $j . PHP_EOL;
            if (is_numeric($data1[$i][$j])) {
                $row2 = array($rpt_id, $scn_id, $head1[$j], $data1[$i][0], $data1[$i][1], $data1[$i][2], $head2[$j], $head3[$j], $data1[$i][$j]);
                echo implode(',', $row2) . PHP_EOL;
                fputcsv($file2, $row2);
            }
        }
    }
    fclose($file2);

    try {
        move_uploaded_file($name2, $name3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_rpt2";
    $sql2 = "LOAD DATA INFILE '" . $name3 . "' INTO TABLE db2.in_rpt2 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (rpt_id,scn_id,yr,stc_qtr_name,stc_wkd_name,stc_day_name,stc_io_name,stc_reg_name,u);";
    $sql3 = "CALL db2.sp_rpt2_ins()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name2);
    unlink($name3);

//    $files2 = scandir($dir);
//    print_r($files2);
    header("Location: upl.php?mth=lst");
}
