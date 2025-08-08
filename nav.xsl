<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:template name="head">
        <a href="https://toby.euler.usi.ch/index.php">
            <img style="width:100px; height:auto;" src="https://toby.euler.usi.ch/img/logo_usi1.svg"/>
        </a>
    </xsl:template>    
    
    
    <xsl:template name="page">
        <html>
            <head>
                <title></title>
                <link rel="stylesheet" href="https://toby.euler.usi.ch/styles.css"/>
                <!--<script src="xmlhttp.js"></script>-->
                <!--<script src="bal.js"></script>-->
            </head>
            <body>
                <!--layout--> 
                <table width="100%">
                    <tr>
                        <!--logo--> 
                        <td>
                            <a href="https://toby.euler.usi.ch/index.php">
                                <img style="width:100px; height:auto;" src="https://toby.euler.usi.ch/img/logo_usi1.svg"/>
                            </a>
                        </td>
                        <!--head--> 
                        <td style="vertical-align:bottom;">
                            
                        </td>
                    </tr>
                    <tr>
                        <!-- navigation -->
                        <td width="120px" style="vertical-align:top">
                            <xsl:call-template name="menu"/>
                        </td>
                        <!-- body -->
                        <td style="vertical-align:top">
                            <xsl:apply-templates/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    

    <xsl:template name="menu">
        <table width="100%" class="table2">
            <tr>
                <th style="text-align:left">catalogue</th>
            </tr>
            <tr>
                <td>
                    <a href="grp.php?mth=brw">browse</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="grp.php?mth=ovw">overview</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">active</th>
            </tr>
            <tr>
                <td>
                    <a href="grp.php?mth=lst&amp;grp_act=1">groups</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="tbl.php?mth=lst&amp;tbl_act=1">tables</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="col.php?mth=lst&amp;col_act=1">columns</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">inactive</th>
            </tr>
            <tr>
                <td>
                    <a href="grp.php?mth=lst&amp;grp_act=0">groups</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="tbl.php?mth=lst&amp;tbl_act=0">tables</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="col.php?mth=lst&amp;col_act=0">columns</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">test</th>
            </tr>
            <tr>
                <td>
                    <a href="item.php">item</a>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>