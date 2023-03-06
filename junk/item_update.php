<?php

require "db1.php";
$db = new db1();

//echo "hello";

$item_id   = filter_input(INPUT_POST,"item_id",   FILTER_VALIDATE_INT);
$item_name = filter_input(INPUT_POST,"item_name", FILTER_SANITIZE_STRING);
$item_val1 = filter_input(INPUT_POST,"item_val1", FILTER_VALIDATE_FLOAT);
$item_val2 = filter_input(INPUT_POST,"item_val2", FILTER_VALIDATE_FLOAT);

//echo $item_name,$item_id,$item_val1,$item_val2;

$qry = $db->conn->prepare("UPDATE item_info SET item_updated = LOCALTIMESTAMP(), item_name = ?, item_val1 = ?, item_val2 = ? WHERE item_id = ?;");
$qry->bind_param("sddi",substr($item_name,0,20), $item_val1, $item_val2, $item_id);
$qry->execute();

header ("Location: item_info.php");

?>