<?php
require "db1.php";
$db = new db1();
?>
<html>
    <head>
        <link rel="stylesheet" href="styles.css"/>
        <title></title>
    </head>
    <body>
        <!-- layout -->
        <table width="100%">
            <tr>
                <td colspan="2">head</td>
            </tr>
            <tr>
                <td width="150px" style="vertical-align:top">
                    <?php
                    $nav = $db->xml2dom("nav.xml");
                    echo $nav->saveXML();
                    ?>
                </td>
                <td>
                    <?php
                    $qry = $db->conn->prepare("SELECT * FROM usr_info;");
                    $qry->execute();
                    $res = $qry->get_result();
                    $xml = $db->res2dom($res);
//                    echo $xml->saveXML();
                    $xsl = $db->xml2dom("user_info.xsl");
                    echo $db->trans($xml, $xsl);
                    $res->close();
                    ?>
                </td>
            </tr>
        </table>
    </body>
</html>