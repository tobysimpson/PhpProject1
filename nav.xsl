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
                <th style="text-align:left">series</th>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=brw&amp;prm_id=2423">browse</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=lst">list</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=pth">path</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">exchange</th>
            </tr>
            <tr>
                <td>
                    <a href="rpt.php?mth=lst">report</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="upl.php?mth=nav">upload</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">mcda</th>
            </tr> 
            <tr>
                <td>
                    <a href="ind.php?mth=lst">indicator</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="scn.php?mth=sps">pathway</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="shk.php?mth=lst">shock</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="scn.php?mth=lst">scenario</a>
                </td>
            </tr>

            <tr>
                <td>
                    <a href="ind.php?mth=scn">all</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">raw data</th>
            </tr>
            <tr>
                <td>
                    <a href="raw.php?mth=lst">download</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="raw.php?mth=nav">upload</a>
                </td>
            </tr>
            <tr>
                <th style="text-align:left">upload</th>
            </tr>
            <tr>
                <td>
                    <a href="upl.php?mth=hst">history</a>
                </td>
            </tr>

            <tr>
                <th style="text-align:left">test</th>
            </tr>
            <tr>
                <td>
                    <a href="itm.php?mth=lst">list</a>
                </td>
            </tr>
            <!--            <tr>
                <td>
                    <a href="itm.php?mth=tst">test</a>
                </td>
            </tr>-->
        </table>
    </xsl:template>
</xsl:stylesheet>