<?php

//database
require "db1.php";
$db = new db1();

/*
 * ===========================
 * user stuff
 * ===========================
 */

$usr_id         = filter_input(INPUT_COOKIE,"usr_id",FILTER_SANITIZE_NUMBER_INT);
$remote_addr    = filter_input(INPUT_SERVER,"REMOTE_ADDR",FILTER_VALIDATE_IP);
$remote_port    = filter_input(INPUT_SERVER,"REMOTE_PORT",FILTER_VALIDATE_INT);
$hostname       = gethostbyaddr($remote_addr);

if(is_null($usr_id)) {
    $usr_id = $db->usr_insert($remote_addr, $remote_port, $hostname); 
} 
else {
    $db->usr_update($usr_id);
}

setcookie("usr_id", $usr_id, time() + (365*86400), "/"); // 86400 = 1 day

/*
 * ===========================
 * query stuff
 * ===========================
 */

$item_id = filter_input(INPUT_POST,"item_id",FILTER_VALIDATE_INT);


//echo "<log>",$_SERVER['REQUEST_METHOD'],"</log>";
//echo "<log>",$_POST["item_id"],"</log>";
//echo "<log>",$item_id,"</log>";


//$db->usr_select();
//$db->hello();
//$item_id = $db->item_insert();
//echo $item_id;
//$db->item_update(1);
$db->item_select($item_id);

?>
