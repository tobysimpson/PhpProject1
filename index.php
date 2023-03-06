<?php

require "db1.php";


usr_list();


function usr_list() {
    $db = new db1();
    $qry = $db->conn->prepare("SELECT * FROM usr_info WHERE `usr_created` != `usr_updated`;");
    $qry->execute();
    $res = $qry->get_result();
    $xml = $db->res2dom($res);
//    echo $xml->saveXML();
    $xsl = $db->xml2dom("usr_info.xsl");
    echo $db->trans($xml, $xsl);
    $res->close();
}