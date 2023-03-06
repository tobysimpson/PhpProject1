<?php

require "db1.php";
$db = new db1();

$pda_id   = filter_input(INPUT_POST,"pda_id",   FILTER_VALIDATE_INT);
$pda_name = filter_input(INPUT_POST,"pda_name", FILTER_SANITIZE_STRING);
$pda_val1 = filter_input(INPUT_POST,"pda_val1", FILTER_VALIDATE_FLOAT);
$pda_val2 = filter_input(INPUT_POST,"pda_val2", FILTER_VALIDATE_FLOAT);

//echo $pda_id, $db->$usr_id, $pda_name;

$qry = $db->conn->prepare("UPDATE pda_info SET pda_updated = LOCALTIMESTAMP(), pda_name = ?, pda_val1 = ?, pda_val2 = ? WHERE pda_id = ? AND usr_id = ?;");
$qry->bind_param("sddii", substr($pda_name,0,20), $db->clamp($pda_val1,0,1), $db->clamp($pda_val2,0,1), $pda_id, $db->$usr_id); //clamp [0,1]
$qry->execute();

//echo $db->conn->$error;

header ("Location: pda_info.php");

?>