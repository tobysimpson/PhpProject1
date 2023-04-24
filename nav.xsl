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
            </head>
            <body >
                <!--layout--> 
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            <xsl:call-template name="head"/>
                        </td>
                    </tr>
                    <tr>
                        <!-- navigation -->
                        <td width="150px" style="vertical-align:top">
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
        <table width="100%">
            <tr>
                <td>
                    <a href="index.php">home</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">users</th>
            </tr>
            <tr>
                <td>
                    <a href="usr.php?mth=edit">my details</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="usr.php">user list</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">item</th>
            </tr>
            <tr>
                <td>
                    <a href="item.php">item_list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="item.php?mth=xml">item_xml</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="item.php?mth=csv">item_csv</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="item.php?mth=svg">item_svg</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">game</th>
            </tr>
            <tr>
                <td>
                    <a href="res.php?mth=list">res_list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prd.php?mth=list">prd_list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prc.php?mth=list">prc_list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prd.php?mth=dem">prd_dem</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prd.php?mth=sup">prd_sup</a>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    

   
</xsl:stylesheet>