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
                <script src="xmlhttp.js"></script>
                <script src="bal.js"></script>
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
                        <td/>
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
            <!--
            <tr>
                <td>
                    <a href="prd.php">prd_info</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="dem.php">dem_info</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="col.php">col_desc</a>
                </td>
            </tr>-->
            <tr>
                <td>
                    <a href="res.php">res_info</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="prm.php?mth=dsp&amp;xsl=1">prm_dsp</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="api.php">api_dsp</a>
                </td>
            </tr>
<!--            
            <tr>
                <td>
                    <a href="raw.php?mth=">raw_hh</a>
                </td>
            </tr>-->
            
            <tr>
                <td>
                    <a href="res.php?mth=del">res_del</a>
                </td>
            </tr>
            
            <tr>
                <td>
                    <a href="hst.php?mth=dsp&amp;xsl=1">hst_dsp</a>
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
            <!--<tr>
                <td>
                    <a href="item.php?mth=csv">item_csv</a>
                </td>
            </tr>-->
            <tr>
                <td>
                    <a href="item.php?mth=svg">item_svg</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="item.php?mth=sp&amp;res_id=1&amp;prm_id=1">item_sp</a>
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
                    <a href="usr.php">usr_info</a>
                </td>
            </tr>
            
            <tr>
                <th style="text-align:left">docs</th>
            </tr>
            <tr>
                <td>
                    <a href="sure_spec2.pdf">specification</a>
                </td>
            </tr>            

            
        </table>
    </xsl:template>
    
    

 
</xsl:stylesheet>