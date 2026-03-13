<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="fmt1" NaN=""/>
    
    <xsl:template match="root">
        <table class="table1" style="font-size:80%;">
            <tr>
                <td colspan="3"></td>
                <xsl:for-each select="//tbl[2]/row">
                    <th style="font-size:8pt;">
                        <xsl:value-of select="@mc_grp"/>
                    </th>
                </xsl:for-each>
            </tr>
            
            <tr>
                <td colspan="3"></td>
                <xsl:for-each select="//tbl[2]/row">
                    <th>
                        <xsl:value-of select="@prm_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            
            <xsl:for-each select="//tbl[1]/row">
                <xsl:variable name="scn_id" select= "@scn_id"/>
                <tr>
                    <th>
                        <xsl:value-of select="@sps_code"/>
                    </th>
                    <th>
                        <xsl:value-of select="@shk_code"/>
                    </th>
                    <th>
                        <xsl:value-of select="@shk_lvl"/>
                    </th>
                    <xsl:for-each select="//tbl[2]/row">
                        <xsl:variable name="prm_id" select= "@prm_id"/>
                        <xsl:variable name="row" select= "//tbl[3]/row[@prm_id = $prm_id and @scn_id = $scn_id]"/>
                        <td style="text-align:right;">
                            <xsl:value-of select="$row/@u"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>