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
        <table>
            <xsl:for-each select="tbl[3]/row">
                <xsl:variable name="yr" select="@yr"/>
<!--                <p class="h1">
                    <xsl:value-of select="@yr"/>
                </p>-->
                <tr>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                </tr>
                <!--<table class="table1">-->
                    <tr>
                        <td/>
                        <xsl:for-each select="//root/tbl[1]/row">
                            <th style="width:150px;">
                                <xsl:value-of select="@prm_id"/>
                            </th>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <tr>
                            <th>
                                <xsl:value-of select="$scn_id"/>
                            </th>
                        
                            <xsl:for-each select="//root/tbl[1]/row">
                                <td style="text-align:right;">
                                    <xsl:variable name="prm_id" select="@prm_id"/>
                                    <xsl:value-of select="format-number(//root/tbl[4]/row[@scn_id = $scn_id and @prm_id = $prm_id and @yr = $yr]/@u, '#,##0.0000', 'fmt1')"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                <!--</table>-->
            </xsl:for-each>
        </table>
    </xsl:template>
    
    
    
    <!--    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>yr</th>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>mc_pref</th>
                <th>mc_w1</th>
                <th>mc_sgn</th>
                <th>mc_avg</th>
                <th>mc_std</th>
                <th>u</th>
                <th>z</th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>-->
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@mc_id"/>
            </td>
            <td>
                <xsl:value-of select="@yr"/>
            </td>
            <td>
                <xsl:value-of select="@prm_id"/>
            </td>
            <td>
                <xsl:value-of select="@scn_id"/>
            </td>

            <td>
                <xsl:value-of select="@mc_pref"/>
            </td>
            <td>
                <xsl:value-of select="format-number(@mc_w1, '#,##0.0000', 'fmt1')"/>
            </td>
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@mc_sgn, '#,##0.0000', 'fmt1')"/>
            </td> 
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@mc_avg, '#,##0.0000', 'fmt1')"/>
            </td>            
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@mc_std, '#,##0.0000', 'fmt1')"/>
            </td>

            <td style="text-align:right;">
                <xsl:value-of select="format-number(@u, '#,##0.0000', 'fmt1')"/>
            </td>
            <td style="text-align:right;">
                <xsl:value-of select="format-number(@z, '#,##0.0000', 'fmt1')"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>