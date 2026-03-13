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
        <table class="table1" style="table-layout: fixed ; width: 100%;">
            <tr>
                <td></td>
                <xsl:for-each select="//tbl[2]/row">
                    <th>
                        <xsl:value-of select="@mc_grp"/>
                    </th>
                </xsl:for-each>
            </tr>
            
            <tr>
                <td></td>
                <xsl:for-each select="//tbl[2]/row">
                    <th>
                        <a href="https://toby.euler.usi.ch/prm.php?mth=brw&amp;prm_id={@prm_id}">
                            <xsl:value-of select="@prm_name"/>
                        </a>
                    </th>
                </xsl:for-each>
            </tr>
            
            <xsl:for-each select="//tbl[1]/row">
                <xsl:variable name="scn_id" select= "@scn_id"/>
                <tr>
                    <th>
                        <xsl:value-of select="@sps_code"/>
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="@shk_code"/>
                        <xsl:value-of select="@shk_lvl"/>
                    </th>
                    <xsl:for-each select="//tbl[2]/row">
                        <xsl:variable name="prm_id" select= "@prm_id"/>
                        <xsl:variable name="row" select= "//tbl[3]/row[@prm_id = $prm_id and @scn_id = $scn_id]"/>
                        <xsl:variable name="u" select= "$row/@u"/>
                        <xsl:variable name="u_max" select= "$row/@u_max"/>
                        <xsl:variable name="u_min" select= "$row/@u_min"/>

                        <xsl:choose>
                            <xsl:when test="$u &gt; 0">
                                <xsl:variable name="a" select="format-number($u div $u_max,'0.000')"/>
                                <xsl:variable name="b" select="255 * $a"/>
                                <td style="text-align:right;background-color:rgba(0,125,0,{$a});color:rgb({$b},{$b},{$b});">
                                    <xsl:value-of select="format-number($u,'0.00%','fmt1')"/>
                                </td>
                            </xsl:when>
                            <xsl:when test="$u &lt; 0">
                                <xsl:variable name="a" select="format-number($u div $u_min,'0.000')"/>
                                <xsl:variable name="b" select="255 * $a"/>
                                <td style="text-align:right;background-color:rgba(255,0,0,{$a});color:rgb({$b},{$b},{$b});">
                                    <xsl:value-of select="format-number($u,'0.00%','fmt1')"/>
                                </td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td style="text-align:right;color:#CCCCCC;">
                                    <xsl:value-of select="format-number($u,'0.00%','fmt1')"/>
                                </td>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        
                        
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>