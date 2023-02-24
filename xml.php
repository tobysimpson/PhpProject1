<?php

//database
require "db1.php";
$db = new db1();

$item_id = filter_input(INPUT_POST,"item_id",FILTER_VALIDATE_INT);

$db->item_select($item_id);

//$db->item_select_all();

?>
