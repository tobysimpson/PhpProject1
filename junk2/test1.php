<?php

require_once "cls_db.php";
require_once "cls_xml.php";
require_once "cls_usr.php";

echo "hello\n";



$db = new cls_usr();
$usr_id = cls_usr::check();


$db = new cls_db();
$qry = $db->conn->prepare("SELECT * FROM item_info;");
$qry->execute();
$xml = cls_xml::res2dom($qry->get_result());
$xsl = cls_xml::file2dom("item/item_list.xsl");
echo cls_xml::xsltrans($xml, $xsl);


var_dump($usr_id);