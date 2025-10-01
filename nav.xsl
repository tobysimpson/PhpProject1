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
                <th style="text-align:left">parameter</th>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=brw&amp;prm_id=2423">browse</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=pth">path</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">report</th>
            </tr>
            <tr>
                <td>
                    <a href="rpt.php?mth=lst">list</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">upload</th>
            </tr>
            <tr>
                <td>
                    <a href="upl.php?mth=lst">list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="upl.php?mth=frm">form</a>
                </td>
            </tr>
            
<!--            <tr>
                <th style="text-align:left">test</th>
            </tr>
            <tr>
                <td>
                    <a href="itm.php?mth=lst">item</a>
                </td>
            </tr>-->

        </table>
    </xsl:template>
</xsl:stylesheet>