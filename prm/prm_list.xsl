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
                <th>prm_id</th>
                <th>grp_id</th>
                <th>prm_name</th>
                <th>prm_desc</th>
                <th>prm_def</th>
                <th>prm_tick</th>
                <th>prm_cal</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_def, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_tick, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_cal"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
      
    </xsl:template>
</xsl:stylesheet>