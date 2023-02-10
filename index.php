<html>
    <head>
        <link rel="stylesheet" href="styles.css"/>
        <title>test</title>
    </head>
    <body>
        <?php
        
        $servername = "localhost";
        $username = "root";
        $password = "Flowerdb1";
        $dbname = "webgame";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("<div>Connection failed</div></p>" . $conn->connect_error);
        }
        echo "<div>Connected successfully</div></p>";

//        $sql = "SELECT item_id, item_created, FORMAT(item_val1,4) AS item_val1, FORMAT(item_val2,4) AS item_val2 FROM item WHERE 1;";
//        $sql = "SELECT * FROM item AS item1 INNER JOIN item AS item2 ON item1.item_id >= item2.item_id ORDER BY item1.item_id, item2.item_id;";
//        $sql = "SELECT item1.item_id AS item1_id, item2.item_id AS item2_id, item1.item_created AS item1_created, item2.item_created AS item2_created, FORMAT(item1.item_val1,4) AS item1_val1, FORMAT(item1.item_val2,4) AS item1_val2, FORMAT(item2.item_val1,4) AS item2_val1, FORMAT(item2.item_val2,4) AS item2_val2 FROM item AS item1 INNER JOIN item AS item2 ON item1.item_id >= item2.item_id ORDER BY item1.item_id, item2.item_id;";
//        $sql = "SELECT * FROM item;";

//        $result = $conn->query($sql);
        
        
        $query = $conn->prepare("SELECT item_id, item_created, FORMAT(item_val1,4) AS item_val1, FORMAT(item_val2,4) AS item_val2 FROM item WHERE item_id >= ?;");
        $query->bind_param("i", $item_id);
        
        $item_id = 2;
        
        $query->execute();
        $result = $query->get_result();

        if ($result->num_rows > 0) {

            //fields
            $finfo = $result->fetch_fields();

//            foreach ($finfo as $fld) {
//                printf("Name:      %s\n", $fld->name);
//                printf("Table:     %s\n", $fld->table);
//                printf("Max. Len:  %d\n", $fld->max_length);
//                printf("Length:    %d\n", $fld->length);
//                printf("charsetnr: %d\n", $fld->charsetnr);
//                printf("Flags:     %d\n", $fld->flags);
//                printf("Type:      %d\n", $fld->type);
//                printf("\n");
//            }
            
            //table
            echo "<table>\n";

            //thead
            echo "<tr>\n";
            foreach ($finfo as $fld) {
//                echo "<th>",$fld->orgtable,".",$fld->orgname,"</th>";
                echo "<th>", $fld->name, "</th>";
            }
            echo "</tr>\n";

            //tbody
            while ($row = $result->fetch_row()) {
                echo "<tr>\n";
                foreach ($row as $idx => $value) {
                    echo "<td>", $value, "</td>";
                }
                echo "</tr>\n";
            }

            echo "</table>";

        } else {
            echo "0 results";
        }

        $conn->close();
        ?>

    </body>
</html>
