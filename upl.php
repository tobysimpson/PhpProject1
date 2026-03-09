<?php

//folder permissions
//chmod 777 /var/lib/mysql-files

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

function upl_prm() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $ts = filter_input(INPUT_GET, "ts", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("SELECT * FROM cub1 WHERE ts = '{$ts}' AND prm_id = {$prm_id};");
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
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

    //read
    $file1 = fopen($name1, "r");
    $data = [];
    while (($row1 = fgetcsv($file1)) !== FALSE) {
        if (count($row1) > 1) {           //avoid double line break
            $data[] = $row1;
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

    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_prem1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_prem1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' IGNORE 1 LINES (sector,variable,year,region,model,scenario,impact,location,value,unit);";
    $sql3 = "CALL db2.sp_ins_prem1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name2);

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
                for ($i = 1; $i < $m; $i++) {
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
    $sql3 = "CALL db2.sp_ins_gem1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    //delete
    unlink($name2);

    echo "done" . PHP_EOL;

    header("Location: upl.php?mth=hst");
}

//flexeco
function upl_flex1() {
    $db = new cls_db();
//    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);

    //read
    $file1 = fopen($name1, "r");
    $data = [];
    while (($row1 = fgetcsv($file1)) !== FALSE) {
        $data[] = $row1;
    }
    fclose($file1);
    
//    print_r($data);

    //write
    $n = count($data);
    $file2 = fopen($name1, "w");
    for ($i = 1; $i < $n; $i++) {
//        print_r($data[$i]);
//        print_r(array($data[$i][0],$data[$i][1],$data[$i][2],$data[$i][3],$data[$i][4],$data[$i][5],19982,$data[$i][6]));
        fputcsv($file2, array($data[$i][0],$data[$i][1],$data[$i][2],$data[$i][3],$data[$i][4],$data[$i][5],19982,$data[$i][6]));
        fputcsv($file2, array($data[$i][0],$data[$i][1],$data[$i][2],$data[$i][3],$data[$i][4],$data[$i][5],19983,$data[$i][7]));
    }
    fclose($file2);

    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_flex1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_flex1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' (scn_key,pathway,shock,intensity,model,year,prm_id,u);";
    $sql3 = "CALL db2.sp_ins_flex1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name2);
//
//    $files2 = scandir($dir);
//    print_r($files2);
    header("Location: upl.php?mth=hst");
}





//stem cli sheet
function upl_cli1() {
//    header('Content-Type: text/plain');
//    echo 'upl_prem1' . PHP_EOL;
//    echo 'post_max_size = ' . ini_get('post_max_size') . PHP_EOL;
//    echo 'upload_max_filesize = ' . ini_get('upload_max_filesize') . PHP_EOL;

    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);


    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_cli1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_cli1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (txt1, txt2, @yr_2020, @yr_2022, @yr_2025, @yr_2030, @yr_2040, @yr_2050) SET "; 
    $sql2 .= "yr_2020 = IF(LENGTH(@yr_2020)>0, @yr_2020, NULL),";
    $sql2 .= "yr_2022 = IF(LENGTH(@yr_2022)>0, @yr_2022, NULL),";
    $sql2 .= "yr_2025 = IF(LENGTH(@yr_2025)>0, @yr_2025, NULL),";
    $sql2 .= "yr_2030 = IF(LENGTH(@yr_2030)>0, @yr_2030, NULL),";
    $sql2 .= "yr_2040 = IF(LENGTH(@yr_2040)>0, @yr_2040, NULL),";
    $sql2 .= "yr_2050 = IF(LENGTH(@yr_2050)>0, @yr_2050, NULL);";

//    $sql3 = "CALL db2.sp_ins_cli1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
//        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name1);
    unlink($name2);

//    header("Location: upl.php?mth=hst");
}


//expanse
function upl_xpn1() {
//    header('Content-Type: text/plain');
//    echo 'upl_prem1' . PHP_EOL;
//    echo 'post_max_size = ' . ini_get('post_max_size') . PHP_EOL;
//    echo 'upload_max_filesize = ' . ini_get('upload_max_filesize') . PHP_EOL;

    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);


    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_xpn1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' IGNORE INTO TABLE db2.in_xpn1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (sps_code, shk_code, shk_lvl, prm_id, yr, u);"; 
    $sql3 = "CALL db2.sp_ins_xpn1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name1);
    unlink($name2);

    header("Location: upl.php?mth=hst");
}


//ipw - bern
function upl_ipw1() {
//    header('Content-Type: text/plain');
//    echo 'upl_prem1' . PHP_EOL;
//    echo 'post_max_size = ' . ini_get('post_max_size') . PHP_EOL;
//    echo 'upload_max_filesize = ' . ini_get('upload_max_filesize') . PHP_EOL;

    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);


    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_ipw1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_ipw1 CHARACTER SET latin1 FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (scn_id, sps_code, prm_id, path, u) SET "; 
    $sql2 .= "sps_code = TRIM(sps_code);";
    $sql3 = "CALL db2.sp_ins_ipw1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name1);
    unlink($name2);

    header("Location: upl.php?mth=hst");
}


//stem
function upl_stem1() {
//    header('Content-Type: text/plain');
//    echo 'upl_prem1' . PHP_EOL;
//    echo 'post_max_size = ' . ini_get('post_max_size') . PHP_EOL;
//    echo 'upload_max_filesize = ' . ini_get('upload_max_filesize') . PHP_EOL;

    $db = new cls_db();
    print_r($_FILES);
    $dir = "/var/lib/mysql-files/";
//    $name0 = $_FILES["upfile"]["name"];
    $name1 = $_FILES["upfile"]["tmp_name"];
    $name2 = $dir . basename($name1);


    try {
        move_uploaded_file($name1, $name2);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }


    $sql1 = "TRUNCATE TABLE db2.in_stem1";
    $sql2 = "LOAD DATA INFILE '" . $name2 . "' INTO TABLE db2.in_stem1 CHARACTER SET latin1 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES (prm_id, scn_id, prm_name, prm_unit, yr_2020, yr_2022, yr_2025, yr_2030, yr_2035, yr_2040, yr_2050);"; 
    $sql3 = "CALL db2.sp_ins_stem1()";

    try {
        $db->conn->query($sql1);
        $db->conn->query($sql2);
        $db->conn->query($sql3);
    } catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;
    }

    unlink($name1);
    unlink($name2);

    header("Location: upl.php?mth=hst");
}
