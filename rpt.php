<?php

//for rptoad?
//header('Content-Type: text/html; charset=utf-8');

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "rpt_" . $mth;
$func();

function rpt_lst() {
    $db = new cls_db();
//    $id = filter_input(INPUT_GET, "id", FILTER_VALIDATE_INT);
    $db->conn->multi_query("SELECT * FROM rpt JOIN scn ORDER BY rpt_id, scn_id;");
    $dom = cls_xml::mul2dom($db->conn, "rpt/rpt_lst.xsl");
    header('Content-Type: text/xml');
    echo $dom->saveXML();
}

function rpt_dsp() {
    $db = new cls_db();
    $rpt_id = filter_input(INPUT_GET, "rpt_id", FILTER_VALIDATE_INT);
    $scn_id = filter_input(INPUT_GET, "scn_id", FILTER_VALIDATE_INT);
    $dsp = filter_input(INPUT_GET, "dsp", FILTER_VALIDATE_INT);
    $fmt = filter_input(INPUT_GET, "fmt", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_rpt1({$rpt_id},{$scn_id});");
    
    
    switch ($fmt) {
        case 1:
            header('Content-Type: text/html');
            break;
        case 2:
            header("Content-type: text/csv");
            header("Content-Disposition: attachment; filename=rpt{$rpt_id}_scn{$scn_id}_dsp{$dsp}.csv");
            header("Pragma: no-cache");
            header("Expires: 0");
            break;
        case 3:
            $xsl = cls_xml::file2dom("rpt/xls_res3.xsl");
            header('Content-Type: application/vnd.ms-excel');
            header("Content-Disposition: attachment; filename=rpt{$rpt_id}_scn{$scn_id}_dsp{$dsp}.xls");
            break;
        default:
            header('Content-Type: text/html');
            break;
    }
    $xml = cls_xml::mul2dom($db->conn);
    $xsl = cls_xml::file2dom("rpt/rpt1_dsp{$dsp}.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
}

//
////    header('Content-Type: text/xml');
//    echo $dom->saveXML();




//switch ($xsl) {
//        case 1:
//            $xsl = cls_xml::file2dom("rpt/rpt_res3.xsl");
//            header('Content-Type: text/html');
//            echo cls_xml::xsltrans($xml, $xsl);
//            break;
//        case 2:
//            $xsl = cls_xml::file2dom("rpt/xls_res3.xsl");
//            header('Content-Type: application/vnd.ms-excel');
//            header("Content-Disposition: attachment; filename=rpt_res3.xml");
//            echo cls_xml::xsltrans($xml, $xsl);
//            break;
//        default:
//            header('Content-Type: text/xml');
//            echo $xml->saveXML();
//            break;
//    }