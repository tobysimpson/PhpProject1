<?php

require_once "cls_db.php";
require_once "cls_xml.php";

//method
$mth = filter_input(INPUT_GET, "mth", FILTER_SANITIZE_STRING);

//call
$func = "plt_" . $mth;
$func();

function plt_lin1() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $fmt = filter_input(INPUT_GET, "fmt", FILTER_VALIDATE_INT);
    $db->conn->multi_query("CALL sp_plt_lin1({$prm_id});");
//    $dom = cls_xml::mul2dom($db->conn, "plt/plt_lin1.xsl");
    switch ($fmt) {
        case 1:
            header('Content-Type: text/xml');
//            header('Content-Type: image/svg+xml');
            $dom = cls_xml::mul2dom($db->conn, "plt/plt_lin1.xsl");
            echo $dom->saveXML();
            break;
        case 2:
//            header('Content-Type: text/xml');
            header('Content-Type: image/svg+xml');
            $xml = cls_xml::mul2dom($db->conn);
            $xsl = cls_xml::file2dom("plt/plt_lin1.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        case 3:
            header('Content-Type: text/xml');
//            header('Content-Type: image/svg+xml');
            $xml = cls_xml::mul2dom($db->conn);
            $xsl = cls_xml::file2dom("plt/plt_lin1.xsl");
            echo cls_xml::xsltrans($xml, $xsl);
            break;
        default:
            header('Content-Type: text/xml');
            $dom = cls_xml::mul2dom($db->conn);
            echo $dom->saveXML();
            break;
    }
}


function plt_lin2() {
    $db = new cls_db();
    $prm_id = filter_input(INPUT_GET, "prm_id", FILTER_VALIDATE_INT);
    $scn_ids = filter_input(INPUT_GET, "scn_ids", FILTER_SANITIZE_STRING);
    $db->conn->multi_query("CALL sp_plt_lin2({$prm_id},'{$scn_ids}');");

    header('Content-Type: image/svg+xml');
    $xml = cls_xml::mul2dom($db->conn);
    $xsl = cls_xml::file2dom("plt/plt_lin2.xsl");
    echo cls_xml::xsltrans($xml, $xsl);
//    header('Content-Type: text/xml');
//    echo $xml->saveXML();
}
