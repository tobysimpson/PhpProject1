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
<!--                <th>ts_base</th>
                <th>ts_trend</th>
                <th>ts_osc</th>
                <th>ts_freq</th>
                <th>ts_phase</th>
                <th>ts_dev</th>
                <th>ts_lo</th>
                <th>ts_hi</th>-->
                <th colspan="1"></th>
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
                        <xsl:value-of select="@ts_name"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@ts_base"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_trend"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_osc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_freq"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_phase"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_dev"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_lo"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_hi"/>
                    </td>-->
                    <td>
                        <object type="image/svg+xml" data="ts.php?mth=plot&amp;ts_id={@ts_id}" style="width:600; height:200;"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>