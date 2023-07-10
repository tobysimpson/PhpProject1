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
                <th>ts_id</th>
                <th>ts_typ</th>
                <th style="text-align:left;">ts_name</th>
                <th colspan="4"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_typ"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=plot&amp;ts_id={@ts_id}',disp);">
                            <xsl:value-of select="@ts_name"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=gen&amp;ts_id={@ts_id}',disp);">gen</a>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=evt&amp;ts_id={@ts_id}',disp);">evt</a>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=sum&amp;ts_id={@ts_id}',disp);">sum</a>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=acc&amp;ts_id={@ts_id}',disp);">acc</a>
                    </td>
                    <!--                    <td>
                        <object type="image/svg+xml" data="ts.php?mth=plot&amp;ts_id={@ts_id}" style="width:600; height:200;"/>
                    </td>-->
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>