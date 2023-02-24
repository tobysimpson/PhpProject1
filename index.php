<?php
require "db1.php";
$db = new db1();
?>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="styles.css"/>
        <script src="xmlhttp.js"></script>
        <script type="text/javascript">

            function fn_init()
            {
                div1.innerText = "hello";
            }

        </script>
    </head>
    <body onload="fn_init();">

        <div><?php echo "usr_id=", $db->$usr_id;?></div>
        
        <a href="index.php">home</a>
        <a href="user_info.php">user_info</a>
        <a href="item_info.php">item_info</a>

        
        <div id="frm1">
            <input id="item_id" type="text"   value="1">
            <input id="btn1" type="button" value="submit" onclick="fn_submit(frm1,'/xml.php',div1);" >
        </div>

        <div id="div1">div1</div>
        
        
        <div><?php $db->usr_select_all(); ?></div>
        
    </body>
</html>