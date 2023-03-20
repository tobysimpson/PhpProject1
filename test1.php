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
//$usr_id = filter_input(INPUT_COOKIE, "usr_id", FILTER_SANITIZE_NUMBER_INT);
var_dump($usr_id);

$usr_name = "toby";
//cls_usr::insert($usr_name);
//cls_usr::update($usr_id, $usr_name);
echo is_null($usr_id);

if (is_null($usr_id)) {
    echo "ins";
    cls_usr::insert($usr_name);
} else {
    cls_usr::update($usr_id, $usr_name);
    echo "upd";
}


//$qry = $db->conn->prepare("SELECT * FROM usr_info WHERE usr_id = ?;");
//$qry->bind_param("i", $usr_id);
//$qry->execute();
//$res = $qry->get_result();
//var_dump($res);
//echo $res->num_rows;
//$xml = cls_xml::res2dom($res);
//echo $xml->saveXML();
//$xsl = cls_xml::file2dom("usr_edit.xsl");
//echo cls_xml::xsltrans($xml, $xsl);

//$qry = $db->conn->prepare("INSERT INTO usr_info (usr_name) VALUES (?);");
//$qry->bind_param("s", $usr_name);
//$qry->execute();
////return mysqli_insert_id($db->conn);
//echo $db->conn->insert_id;
        






//if (is_null($usr_id)) {
//    $usr_id = $this->usr_insert($remote_addr, $remote_port, $hostname);
//} else {
//    $this->usr_update($usr_id);
//}
//setcookie("usr_id", $usr_id, time() + (365 * 86400), "/"); // 86400 = 1 day