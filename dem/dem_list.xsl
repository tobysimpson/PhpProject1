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
                <th>dem_id</th>
                <th>dem_code</th>
                <th style="text-align:left;">dem_name</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@dem_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@dem_code"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@dem_name"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
    </xsl:template>
</xsl:stylesheet>