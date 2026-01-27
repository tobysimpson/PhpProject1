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
                <th>yr</th>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>u_n</th>
                <th>u_avg</th>
                <th>u_std</th>
                
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td>
                        <a href= "prm.php?mth=brw&amp;prm_id={@prm_id}">
                            <xsl:value-of select="@prm_id"/>
                        </a>
                    </td>
                    
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@u_n,'#,##0.0000','fmt1')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@u_avg,'#,##0.0000','fmt1')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@u_std,'#,##0.0000','fmt1')"/>
                    </td>
                    
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    
    
    <!--    <xsl:template match="root">
        <table class="table1">
            <xsl:for-each select="//root/tbl[3]/row">
                <xsl:variable name="yr" select="@yr"/>

                <xsl:for-each select="//root/tbl[1]/row">
                    <xsl:variable name="prm" select="."/>
                    <tr>
                        
                        <td>
                            <xsl:value-of select="$yr"/>
                        </td>
                        <td colspan="20" style="text-align:left;">
                            <a href= "prm.php?mth=brw&amp;prm_id={$prm/@prm_id}">
                                <xsl:value-of select="$prm/@prm_id"/>
                            </a>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="$prm/@prm_name"/>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <xsl:for-each select="//root/tbl[2]/row">
                            <th>
                                <xsl:value-of select="@scn_id"/>
                            </th>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="scn1" select="."/>
                        <tr>
                            <th>
                                <xsl:value-of select="$scn1/@scn_id"/>
                            </th>
                            <xsl:for-each select="//root/tbl[2]/row">
                                <xsl:variable name="scn2" select="."/>
                                <xsl:variable name="row" select="//root/tbl[4]/row[@scn_id1 = $scn1/@scn_id and @scn_id2 = $scn2/@scn_id and @prm_id = $prm/@prm_id and @yr = $yr]"/>
                                <td style="text-align:right;">
                                    <xsl:value-of select="format-number($row/@d, '#,##0.00', 'fmt1')"/>
                                    <xsl:value-of select="format-number($row/@p1, '#,##0.0', 'fmt1')"/>
                                    <xsl:value-of select="format-number($row/@phi, '#,##0.0', 'fmt1')"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>-->
</xsl:stylesheet>