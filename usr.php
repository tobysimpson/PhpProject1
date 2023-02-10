<?php

//database
require "db1.php";
$db = new db1();

//$db->hello();
//$item_id = $db->item_insert();
//echo $item_id;
//$db->item_update(1);
//$db->item_select();


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

setcookie("usr_id", $usr_id, time() + (86400), "/"); // 86400 = 1 day

$db->usr_select();



//echo "<pre>";
//
//echo "usr_id=",$usr_id,"\n";
//echo "REMOTE_ADDR=",$remote_addr,"\n";
//echo "REMOTE_PORT=",$remote_port,"\n";
//echo "hostname=",$hostname,"\n";
//
//echo "</pre>";
//
//
////foreach ($_SERVER as $parm => $value)  echo "$parm = '$value'\n";

?>
