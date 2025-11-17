<?php

//for upload?
//header('Content-Type: text/html; charset=utf-8');

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "upl_" . $mth;
$func();

function upl_hst() {
    $db = new cls_db();
//    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_upl_hst();");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_hst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function upl_dsp() {
    $db = new cls_db();
    $ts = filter_input(INPUT_GET, "ts", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("SELECT * FROM cub1 WHERE ts = '{$ts}';");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_dsp.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function upl_nav() {
    $db = new cls_db();
    $db->conn->multi_query("SELECT 1 as txt;");
    $dom = cls_xml::mul2dom($db->conn, "upl/upl_nav.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

//standard format
function upl_rpt1() {
    $db = new cls_db();
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

    $names = array($name0, $name1, $name2);

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

    header("Location: upl.php?mth=hst");
}

//premise
function upl_prem1() {
//    header('Content-Type: text/plain');
//    echo 'upl_prem1' . PHP_EOL;
//    echo 'post_max_size = ' . ini_get('post_max_size') . PHP_EOL;
//    echo 'upload_max_filesize = ' . ini_get('upload_max_filesize') . PHP_EOL;

    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

//    echo $name0 . PHP_EOL;
//    echo $name1 . PHP_EOL;
//    echo $name2 . PHP_EOL;

    $names = array($name0, $name1, $name2);

    try {
        move_uploaded_file($names[1], $names[2]);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_prem1";
    $sql2 = "LOAD DATA INFILE '" . $names[2] . "' INTO TABLE db2.in_prem1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' IGNORE 1 LINES (sector,variable,year,region,model,scenario,impact,location,value,unit);";
    $sql3 = "CALL db2.sp_ins_prem1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($names[1]);
    unlink($names[2]);

    $files2 = scandir($dir);
    print_r($files2);
    header("Location: upl.php?mth=hst");
}

//stem_flex_grid
function upl_flex1() {
    $db = new cls_db();
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

    $names = array($name0, $name1, $name2);

    preg_match_all('/\d+/', $name0, $matches);
//    print_r($matches);

    [$rpt_id, $scn_id] = $matches[0];

    //open
    $file1 = fopen($names[1], "r");

    //read
    $head1 = fgetcsv($file1);
    $head2 = fgetcsv($file1);
    $head3 = fgetcsv($file1);

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


    $sql1 = "TRUNCATE TABLE db2.in_flex1";
    $sql2 = "LOAD DATA INFILE '" . $names[2] . "' INTO TABLE db2.in_flex1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (rpt_id,scn_id,yr,qtr,wkd,day,io,reg,u);";
    $sql3 = "CALL db2.sp_flex1_ins()";

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
    header("Location: upl.php?mth=hst");
}

//gem csv
function upl_gem1() {
    $db = new cls_db();
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

    $scn_code = substr($name0, 0, 9);

    //open
    $file1 = fopen($name1, "r");

    $s = 1;
    $t = NULL;

    //read
    $data = [];
    while (($row1 = fgetcsv($file1)) !== FALSE) {
        $m = count($row1);      //column count

        if ($m > 1) {           //not a gap
            if ($s == 1) {      //header
                $t = $row1;
                $s = 0;
            } else {            //data
                //columns
                for ($i = 1; $i < 2; $i++) {
//                    echo $scn_code . ' ' .  $t[0] . ' ' . $row1[0] . ' ' . $t[$i] . ' ' . $row1[$i] . PHP_EOL; //scn_code, prm_name, yr, u)
                    $data[] = array($scn_code, $t[0], $row1[0], $t[$i], $row1[$i]); //scn, grp, prm, yr, u
                }
                $s = 0;
            }
        } else {
            $s = 1;     //gap
        }
    }
    fclose($file1);

    //write
    $n = count($data);
    $file2 = fopen($name1, "w");
    for ($i = 0; $i < $n; $i++) {
        fputcsv($file2, $data[$i]);
    }
    fclose($file2);

    //move
    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    //insert
    $sql1 = "TRUNCATE TABLE db2.in_gem1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_gem1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (scn_code, grp_name, prm_name, yr, u);";
//    $sql3 = "CALL db2.sp_gem1_ins()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
//        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }




    //close
//    unlink($name0);

    echo "done" . PHP_EOL;

//    header("Location: upl.php?mth=hst");
}
