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

            $qry = $db->conn->prepare("SELECT * FROM item_info;");
            $qry->execute();
            $res = $qry->get_result();

            echo "<tr>";
            echo "<th>item_id</th>";
            echo "<th>item_created</th>";
            echo "<th>item_updated</th>";
            echo "<th>item_val1</th>";
            echo "<th>item_val2</th>";
            echo "<th></td>";
            echo "</tr>";

            while ($row = $res->fetch_assoc()) {
                echo "<tr>";
                echo "<td style=\"text-align:center\">", $row["item_id"], "</td>";
                echo "<td>", $row["item_created"], "</td>";
                echo "<td>", $row["item_updated"], "</td>";
                echo "<td style=\"text-align:right\">", number_format($row["item_val1"], 4), "</td>";
                echo "<td style=\"text-align:right\">", number_format($row["item_val2"], 4), "</td>";
                echo "<td><a href=\"item_edit.php?item_id=", $row['item_id'], "\">edit</a></td>";
                echo "</tr>";
            }

            $res->close();
            ?>
        </table>
    </body>
</html>