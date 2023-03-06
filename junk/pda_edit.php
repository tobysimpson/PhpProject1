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

                    $pda_id = filter_input(INPUT_GET, "pda_id", FILTER_VALIDATE_INT);

                    $qry = $db->conn->prepare("SELECT * FROM pda_info WHERE pda_id = ?;");
                    $qry->bind_param("i", $pda_id);
                    $qry->execute();
                    $res = $qry->get_result();
                    $xml = $db->res2dom($res);
//                    echo $xml->saveXML();
                    $xsl = $db->xml2dom("pda_edit.xsl");
                    echo $db->trans($xml, $xsl);
                    $res->close();
                    ?>
                </td>
            </tr>
        </table>
    </body>
</html>