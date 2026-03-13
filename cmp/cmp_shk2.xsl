<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:decimal-format name="fmt1" NaN=""/>
    
    <xsl:variable name="rel_max" select="//tbl[5]/row/@rel_max"/>
    <xsl:variable name="rel_min" select="//tbl[5]/row/@rel_min"/>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th colspan="3"></th>
                <xsl:for-each select="//tbl[4]/row">
                    
                    <th>
                        <xsl:value-of select="@yr"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="//tbl[1]/row">
                <xsl:variable name="sps_id" select= "@sps_id"/>
                <xsl:variable name="sps_code" select= "@sps_code"/>
                <xsl:for-each select="//tbl[2]/row">
                    <xsl:variable name="shk_id" select= "@shk_id"/>
                    <xsl:variable name="shk_code" select= "@shk_code"/>
                    <xsl:for-each select="//tbl[3]/row">
                        <xsl:variable name="shk_lvl" select= "@shk_lvl"/>
                        <tr>
                            <td>
                                <xsl:value-of select="$sps_code"/>
                            </td>
                            <td>
                                <xsl:value-of select="$shk_code"/>
                            </td>
                            <td>
                                <xsl:value-of select="$shk_lvl"/>
                            </td>
                            <xsl:for-each select="//tbl[4]/row">
                                <xsl:variable name="yr" select= "@yr"/>
                                <xsl:variable name="u_rel" select="//tbl[6]/row[@yr = $yr and @sps_id = $sps_id and @shk_id = $shk_id and @shk_lvl = $shk_lvl]/@u_rel"/>  
                                <xsl:choose>
                                    <xsl:when test="$u_rel &gt; 0">
                                        <xsl:variable name="a" select="format-number($u_rel div $rel_max,'0.000')"/>
                                        <xsl:variable name="b" select="255 * $a"/>
                                        <td style="text-align:right;background-color:rgba(0,125,0,{$a});color:rgb({$b},{$b},{$b});">
                                            <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                        </td>
                                    </xsl:when>
                                    <xsl:when test="$u_rel &lt; 0">
                                        <xsl:variable name="a" select="format-number($u_rel div $rel_min,'0.000')"/>
                                        <xsl:variable name="b" select="255 * $a"/>
                                        <td style="text-align:right;background-color:rgba(255,0,0,{$a});color:rgb({$b},{$b},{$b});">
                                            <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td style="text-align:right;color:#CCCCCC;">
                                            <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>