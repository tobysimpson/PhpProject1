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
                <th>rpt_id</th>
                <th>rpt_name</th>
                <th>rpt_typ</th>
                <th>scn_id</th>
                <th>sps_id</th>
                <th>sps_code</th>
                <th>shk_id</th>
                <th>shk_code</th>
                <th>shk_lvl</th>
                <th>htm</th>
                <th>download</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="rpt" select="."/>
                <xsl:for-each select="//root/tbl[2]/row">
                    <tr>
                        <td>
                            <xsl:value-of select="$rpt/@rpt_id"/>
                        </td>
                        <td style="text-align:left;">
                            <xsl:value-of select="$rpt/@rpt_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="$rpt/@rpt_typ"/>
                        </td>
                        <td>
                            <xsl:value-of select="@scn_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@sps_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@sps_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@shk_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@shk_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@shk_lvl"/>
                        </td>
                        <td style="text-align:left;">
                            <a href="raw.php?mth=htm&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}">
                                <xsl:value-of select="@scn_code"/>  
                            </a>
                        </td>
                        <td style="text-align:left;">
                            <a href="raw.php?mth=csv&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}">
                                <xsl:text>raw</xsl:text>
                                <xsl:value-of select="format-number($rpt/@rpt_id,'00')"/>
                                <xsl:text>_scn</xsl:text>
                                <xsl:value-of select="format-number(@scn_id,'00')"/>
                                <xsl:text>.csv</xsl:text>
                            </a>
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 