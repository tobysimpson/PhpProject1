<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>

    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mc_name</th>
                <th>prm_id</th>
                <th>mc_sgn</th>
                <th>mc_sca</th>
                <th>mc_pref</th>
                <th>mc_w</th>
                <th>scn_id</th>
                <th>yr</th>
                <th>u</th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@mc_id"/>
            </td>
            <td style="text-align:left;">
                <xsl:value-of select="@mc_name"/>
            </td>
            <td>
                <xsl:value-of select="@prm_id"/>
            </td>
            <td>
                <xsl:value-of select="@mc_sgn"/>
            </td>
            <td>
                <xsl:value-of select="@mc_sca"/>
            </td>
            <td>
                <xsl:value-of select="@mc_pref"/>
            </td>
            <td>
                <xsl:value-of select="format-number(@mc_w, '#,##0.0000', 'fmt1')"/>
            </td>
            <td>
                <xsl:value-of select="@scn_id"/>
            </td>
            <td>
                <xsl:value-of select="@yr"/>
            </td>
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@u, '#,##0.0000', 'fmt1')"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>