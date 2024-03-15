<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/tbl[1]">
        <table>
            <tr>
                <th colspan="3"/>
                <xsl:for-each select="/root/tbl[3]/row">
                    <th>
                        <xsl:value-of select="@prd_code"/>
                        <xsl:value-of select="@prd_id"/>
                    </th>
                </xsl:for-each>
            </tr>
            <!-- group -->
            <xsl:for-each select="row">
                <xsl:variable name="grp" select="current()"/>
                <tr>
                    <td style="font-weight:bold;">
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td style="font-weight:bold;">
                        <xsl:value-of select="@grp_code"/>
                    </td>
                    <td style="font-weight:bold;" colspan="10">
                        <xsl:value-of select="@grp_name"/>
                    </td>
                </tr>
                <!-- process -->
                <xsl:for-each select="/root/tbl[2]/row[@grp_id = $grp/@grp_id]">
                    <xsl:variable name="prc" select="current()"/>
                    <tr>
                        <td>
                            <xsl:value-of select="@prc_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@prc_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@prc_name"/>
                        </td>
                        <!-- product -->
                        <xsl:for-each select="/root/tbl[3]/row">
                            <xsl:variable name="prd" select="current()"/>
                            <xsl:variable name="hst" select="/root/tbl[4]/row[@prc_id = $prc/@prc_id][@prd_id = $prd/@prd_id]"/>
                            <td style="text-align:right;width:50px">
                                <!-- cell --> 
                                <xsl:if test="$hst">
                                    
                                    <!-- plt -->
                                    <a href="hst.php?mth=plt&amp;hst_id={$hst/@hst_id}&amp;xsl=1">
                                        <img  src="https://toby.euler.usi.ch/hst.php?mth=plt&amp;hst_id={$hst/@hst_id}&amp;xsl=2"/>
                                    </a>
                                    
<!--                                    <a href="hst.php?mth=plt&amp;prc_id={$prc/@prc_id}&amp;prd_id={$prd/@prd_id}&amp;xsl=1">
                                        <xsl:value-of select="$grp/@grp_code"/>
                                        <xsl:text>_</xsl:text>
                                        <xsl:value-of select="$prc/@prc_code"/>
                                        <xsl:text>_</xsl:text>
                                        <xsl:value-of select="$prd/@prd_code"/>
                                    </a>-->
                                    
                                    <!--<xsl:value-of select="$prd_prc/@sgn"/>-->
                                    <!--<xsl:value-of select="$prd_prc/@eff"/>-->
                                    <xsl:value-of select="$hst/@yr"/>=<xsl:value-of select="format-number($hst/@tj,'#,##0')"/><br/>
                                    
                                    <xsl:variable name="att" select="concat($grp/@grp_code,'_',$prc/@prc_code,'_',$prd/@prd_code)"/>
                                    <!--<xsl:value-of select="$att"/>-->
                                    
                                    <!--<xsl:value-of select="/root/tbl[5]/row/@*[name()=$att]"/>-->
                                    <xsl:value-of select="format-number(/root/tbl[5]/row/@*[name()=$att],'#,##0')"/>
                                    
                                    
                                </xsl:if>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>