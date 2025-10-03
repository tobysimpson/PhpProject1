<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:template match="root">
        <html>
            <head>
                <title></title>
                <link rel="stylesheet" href="https://toby.euler.usi.ch/styles.css"/>
                <!--<script src="xmlhttp.js"></script>-->
                <!--<script src="bal.js"></script>-->
            </head>
            <body>
                <table class="table1">
                    <tr>
                        <th>rpt_id</th>
                        <th>scn_id</th>
                        <th>prm_id</th>
                        <th>yr</th>
                        <th>u</th>
                    </tr>
                    <xsl:for-each select="tbl[1]/row">
                        <tr>
                            <td>
                                <xsl:value-of select="@rpt_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@scn_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@prm_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@yr"/>
                            </td>
                            <td style="text-align:right;">
                                <xsl:value-of select="@u"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>