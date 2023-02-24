<html>
    <head>
        <link rel="stylesheet" href="styles.css"/>
        <title></title>
    </head>
    <body>
        
        <a href="index.php">home</a>
        <a href="user_info.php">user_info</a>
        <a href="item_info.php">item_info</a>
        
        <table>
            <?php
            require "db1.php";
            $db = new db1();

            $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);

//            echo "item_id=",$item_id;
            
            $qry = $db->conn->prepare("SELECT * FROM item_info WHERE item_id = ?;");
            $qry->bind_param("i", $item_id);
            $qry->execute();
            $res = $qry->get_result();
            $row = $res->fetch_assoc(); //first row
            
//            var_dump($row);
            
            echo "<form action=\"item_update.php\" method=\"post\">";
            echo "<tr><td>item_id</td><td><input type=text name=item_id value=\"",$row["item_id"],"\" readonly=\"true\"></td></tr>";
            echo "<tr><td>item_val1</td><td><input type=\"text\" name=\"item_val1\" value=\"",$row["item_val1"],"\"></td></tr>";
            echo "<tr><td>item_val2</td><td><input type=\"text\" name=\"item_val2\" value=\"",$row["item_val2"],"\"></td></tr>";
            echo "<tr><td><input type=\"submit\"></td><td></td></tr>";
            echo "</form>";
           
            $res->close();
            ?>
        </table>
    </body>
</html>