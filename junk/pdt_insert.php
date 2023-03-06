<?php

require "db1.php";
$db = new db1();

$qry = $db->conn->prepare("INSERT INTO pdt_info (usr_id) VALUES (?);");
$qry->bind_param("i",$db->$usr_id);
$qry->execute();

header ("Location: pdt_info.php");

?>