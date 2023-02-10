<?php

$servername = "localhost";
$username = "root";
$password = "Flowerdb1";
$dbname = "webgame";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

        $sql = "SELECT item_id, item_created, FORMAT(item_val1,4) AS item_val1, FORMAT(item_val2,4) AS item_val2 FROM item WHERE 1;";
//        $sql = "SELECT * FROM item AS item1 INNER JOIN item AS item2 ON item1.item_id >= item2.item_id ORDER BY item1.item_id, item2.item_id;";
//$sql = "SELECT item1.item_id AS item1_id, item2.item_id AS item2_id, item1.item_created AS item1_created, item2.item_created AS item2_created, item1.item_val1 AS item1_val1, item1.item_val2 AS item1_val2, item2.item_val1 AS item2_val1, item2.item_val2 AS item2_val2 FROM item AS item1 INNER JOIN item AS item2 ON item1.item_id >= item2.item_id ORDER BY item1.item_id, item2.item_id;";
//        $sql = "SELECT * FROM item;";

$result = $conn->query($sql);

if ($result->num_rows > 0) {

    //dom
    $dom = new DOMDocument('1.0', 'utf-8');
    $dom->formatOutput = true;
    
    //xslt
    $xslt = $dom->createProcessingInstruction('xml-stylesheet', 'type="text/xsl" href="xsl1.xsl"');
    $dom->appendChild($xslt);

    $root = $dom->createElement('root');
    $dom->appendChild($root);
    
    while ($row = $result->fetch_assoc()) {
        $node = $dom->createElement('row');
        foreach ($row as $key => $val) {
            //ele
//            $child = $dom->createElement($key, $val);
            //att
            $child = $dom->createAttribute($key); //att
            $child->value = $val;
            $node->appendChild($child);
        }
        $root->appendChild($node);
    }

    header('Content-Type: text/xml');
//    header('Content-Disposition: attachment; filename="result.xml"');
    echo $dom->saveXML(); //dom
    
} else {
    echo "0 results";
}

$conn->close();
?>

