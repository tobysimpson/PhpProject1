<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mc_name</th>
            </tr>
            <xsl:apply-templates select="tbl[1]/row"/>
        </table>
        <p/>
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>prm_id</th>
                <th>mc_grp</th>
                <th>mc_code</th>
                
                <th>prm_name</th>
                <th>prm_src</th>
                <th>prm_unit</th>
                <th>mc_sgn</th>
                <th>mc_pref</th>
                <th>mc_p</th>
                <th>mc_q</th>
                <th>mc_w0</th>
                <th>mc_w1</th>
                <th>prm_desc</th>
            </tr>
            <xsl:apply-templates select="tbl[2]/row"/>
        </table>
    </xsl:template>
    
    <xsl:template match="root/tbl[1]/row">
        <tr>
            <td>
                <xsl:value-of select="@mc_id"/>
            </td>
            <td>
                <xsl:value-of select="@mc_name"/>
            </td>
        </tr>
    </xsl:template>
    
    
    <xsl:template match="root/tbl[2]/row">
        <tr>
            <td>
                <xsl:value-of select="@mc_id"/>
            </td>
            <td>
                <a href="https://toby.euler.usi.ch/prm.php?mth=brw&amp;prm_id={@prm_id}">
                    <xsl:value-of select="@prm_id"/>
                </a>
            </td>
            <td style="text-align:left;">
                <xsl:value-of select="@mc_grp"/>
            </td>
            <td>
                <xsl:value-of select="@mc_code"/>
            </td>
            <td style="text-align:left;">
                <xsl:value-of select="@prm_name"/>
            </td>
            <td>
                <xsl:value-of select="@prm_src"/>
            </td>
            <td>
                <xsl:value-of select="@unit"/>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="@mc_sgn > 0">
                        <xsl:text>+</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                    </xsl:otherwise>  
                </xsl:choose>
                <!--<xsl:value-of select="@mc_sgn"/>-->
            </td>
            <td>
                <xsl:value-of select="@mc_pref"/>
            </td>
            <td  style="text-align:right;">
                <xsl:value-of select="format-number(@mc_p,'#,##0.0000')"/>
            </td>
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@mc_q,'#,##0.0000')"/>
            </td>
            <td>
                <xsl:value-of select="format-number(@mc_w0, '#,##0.0000', 'fmt1')"/>
            </td>
            <td>
                <xsl:value-of select="format-number(@mc_w1, '#,##0.0000', 'fmt1')"/>
            </td>
            <td>
                <xsl:value-of select="@prm_desc"/>
            </td>

        </tr>
    </xsl:template>
</xsl:stylesheet>