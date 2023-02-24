<?php

//database
require "db1.php";
$db = new db1();



//echo "hello",$db->$usr_id;
//echo "hello",is_null($db->$usr_id);

//$db->usr_reset();
//$db->item_reset();
$db->item_select_all();

//var_dump($db);

?>

