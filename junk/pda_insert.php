<?php

require "db1.php";
$db = new db1();

$pdt_id   = filter_input(INPUT_POST,"pdt_id",   FILTER_VALIDATE_INT);

$qry = $db->conn->prepare("INSERT INTO pda_info (pdt_id,usr_id) VALUES (?,?);");
$qry->bind_param("ii",$pdt_id, $db->$usr_id);
$qry->execute();

header ("Location: pdt_pda.php?pdt_id=".$pdt_id);

?>