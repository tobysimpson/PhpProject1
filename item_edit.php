<html>
    <head>
        <link rel="stylesheet" href="styles.css"/>
        <title></title>
    </head>
    <body>

        <a href="index.php">home</a>
        <a href="user_info.php">user_info</a>
        <a href="item_info.php">item_info</a>

        <?php
        require "db1.php";
        $db = new db1();

        $item_id = filter_input(INPUT_GET, "item_id", FILTER_VALIDATE_INT);
//            echo "item_id=",$item_id;
        $qry = $db->conn->prepare("SELECT * FROM item_info WHERE item_id = ?;");
        $qry->bind_param("i", $item_id);
        $qry->execute();
        $res = $qry->get_result();
        $xml = $db->res2dom($res);
//        echo $xml->saveXML();
        $xsl = $db->xml2dom("item_edit.xsl");
        echo $db->trans($xml, $xsl);
        $res->close();
        ?>
    </body>
</html>