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
                <th>evt_id</th>
                <th>ts_id</th>
                <th>ts_name</th>
                <th>t</th>
                <th>v1</th>
                <th>mod</th>
                <th colspan="1"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@evt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ts_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@t"/>
                    </td>
                    <td>
                        <xsl:value-of select="@v1"/>
                    </td>
                    <td>
                        <xsl:value-of select="@evt_mod"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('evt.php?mth=plot&amp;evt_id={@evt_id}',disp);">
                            <xsl:text>plot</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>