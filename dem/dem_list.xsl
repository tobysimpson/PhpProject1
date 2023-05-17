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
                <th>res_id</th>
                <th>prd_id</th>
                <th>prd_name</th>
                <th>dem_id</th>
                <th>dem_name</th>
                <th>ts_id</th>
                <th>ts_name</th>
                <th colspan="1"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@dem_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@dem_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ts_name"/>
                    </td>
                    <td>
                        <object type="image/svg+xml" data="dem.php?mth=plot&amp;dem_id={@dem_id}" style="width:400; height:120;"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>