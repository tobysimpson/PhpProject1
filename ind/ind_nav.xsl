<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>yr</th>
                <th>htm</th>
                <th>csv</th>
                <th>xls</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="ind.php?mth=htm&amp;yr={@yr}">
                            <xsl:value-of select="@yr"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="ind.php?mth=csv&amp;yr={@yr}">
                            <xsl:value-of select="@yr"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="ind.php?mth=xls&amp;yr={@yr}">
                            <xsl:value-of select="@yr"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 