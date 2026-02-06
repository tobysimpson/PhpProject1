<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <xsl:variable name="rpt" select="tbl[1]/row[1]"/>
        <xsl:variable name="sps" select="tbl[2]/row[1]"/>
        <table class="table1">
            <tr>
                <th>rpt_id</th>
                <th>rpt_name</th>
            </tr>
            <!--<xsl:for-each select="tbl[1]/row">-->
            <tr>
                <td>
                    <xsl:value-of select="$rpt/@rpt_id"/>
                </td>
                <td style="text-align:left;">
                    <a href="tpl.php?mth=sps&amp;rpt_id={$rpt/@rpt_id}">
                        <xsl:value-of select="$rpt/@rpt_name"/>
                    </a>
                </td>
            </tr>
            <!--</xsl:for-each>-->
        </table>
<!--        <p/>
        <table class="table1">
            <tr>
                <th>sps_id</th>
                <th>sps_code</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
            <tr>
                <td>
                    <xsl:value-of select="$sps/@sps_id"/>
                </td>
                <td>
                    <a href="tpl.php?mth=shk&amp;rpt_id={$rpt/@rpt_id}&amp;sps_id={$sps/@sps_id}">
                        <xsl:value-of select="$sps/@sps_code"/>
                    </a>
                </td>
            </tr>
            </xsl:for-each>
        </table>-->
        <p/>
        <table class="table1">
            <tr>
                <th>scn_id</th>
                <th>sps_id</th>
                <th>sps_code</th>
                <th>shk_id</th>
                <th>shk_code</th>
                <th>shk_lvl</th>
                <th>scn_code</th>
                <th colspan="3">view</th>
                <th colspan="2">download</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <xsl:variable name="fname" select="concat($rpt/@rpt_name,'_',@scn_code)"/>
                <tr>
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
                        <xsl:value-of select="@scn_code"/>
                    </td>
                    
                    <td>
                        <a href="tpl.php?mth=htm&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}">
                            <xsl:text>htm</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a href="tpl.php?mth=csv&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}&amp;fname={$fname}&amp;dwn=0">
                            <xsl:text>csv</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a href="tpl.php?mth=xml&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}">
                            <xsl:text>xml</xsl:text>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="tpl.php?mth=csv&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}&amp;fname={$fname}&amp;dwn=1">
                            <xsl:value-of select="$fname"/>
                            <xsl:text>.csv</xsl:text>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="tpl.php?mth=xls&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}&amp;fname={$fname}&amp;dwn=1">
                            <xsl:value-of select="$fname"/>
                            <xsl:text>.xls</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 