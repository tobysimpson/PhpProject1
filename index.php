<?php

require "db1.php";


$db = new db1();
$qry = $db->conn->prepare("SELECT pdt_info.*, usr_info.usr_name FROM pdt_info INNER JOIN usr_info ON pdt_info.usr_id = usr_info.usr_id;");
$qry->execute();
$res = $qry->get_result();
$xml = $db->res2dom($res);
//    echo $xml->saveXML();
$xsl = $db->xml2dom("pdt_list.xsl");
echo $db->trans($xml, $xsl);
$res->close();


