<?php

require_once "cls_db.php";
require_once "cls_usr.php";
require_once "cls_xml.php";

echo "hello\n";

//$db = new cls_db();
//$qry = $db->conn->prepare("SELECT * FROM item_info;");
//$qry->execute();
//$xml = cls_xml::res2dom($qry->get_result());
//$xsl = cls_xml::file2dom("item_list.xsl");
//echo cls_xml::xsltrans($xml, $xsl);
//$db = new cls_usr();

$usr_id = cls_usr::check();

var_dump($usr_id);