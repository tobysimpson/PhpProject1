<?php

require "db1.php";
$db = new db1();

$pdt_id   = filter_input(INPUT_POST,"pdt_id",   FILTER_VALIDATE_INT);
$pdt_name = filter_input(INPUT_POST,"pdt_name", FILTER_SANITIZE_STRING);

echo $pdt_id, $db->$usr_id, $pdt_name;

$qry = $db->conn->prepare("UPDATE pdt_info SET pdt_updated = LOCALTIMESTAMP(), pdt_name = ? WHERE pdt_id = ? AND usr_id = ?;");
$qry->bind_param("sii", substr($pdt_name,0,20), $pdt_id, $db->$usr_id);
$qry->execute();

echo $db->conn->$error;

header ("Location: pdt_info.php");

?>