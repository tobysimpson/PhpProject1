<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="styles.css"/>
        <script src="xmlhttp.js"></script>
    </head>
    <body >
        <!-- layout -->
        <table width="100%">
            <tr>
                <td colspan="2">
                    <?php include "lay_head.php" ?>
                </td>
            </tr>
            <tr>
                <td width="150px" style="vertical-align:top">
                    <?php include "lay_nav.php" ?>
                </td>
                <!-- body -->
                <td>
                    <?php
                    require "db1.php";
                    $db = new db1();

                    $pdt_id = filter_input(INPUT_GET, "pdt_id", FILTER_VALIDATE_INT);

                    $qry = $db->conn->prepare("SELECT * FROM pdt_info WHERE pdt_id = ?;");
                    $qry->bind_param("i", $pdt_id);
                    $qry->execute();
                    $res = $qry->get_result();
                    $xml = $db->res2dom($res);
//                    echo $xml->saveXML();
                    $xsl = $db->xml2dom("pdt_edit.xsl");
                    echo $db->trans($xml, $xsl);
                    $res->close();
                    ?>
                </td>
            </tr>
        </table>
    </body>
</html>