<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="rpt" select="."/>
                <table class="table1">
                    <tr>
                        <th>rpt_id</th>
                        <th>rpt_name</th>
                        <th>rpt_typ</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="@rpt_id"/>
                        </td>
                        <td style="text-align:left;">
                            <xsl:value-of select="@rpt_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@rpt_typ"/>
                        </td>
                    </tr>
                </table>
                <p/>
                <table class="table1">
                    <tr>
                        <th>scn_id</th>
                        <th>scn_sps</th>
                        <th>shk_code</th>
                        <th>shk_lvl</th>
                        <th colspan="2">download</th>
                    </tr>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <tr>
                            <td>
                                <xsl:value-of select="@scn_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@scn_sps"/>
                            </td>
                            <td>
                                <xsl:value-of select="@shk_code"/>
                            </td>
                            <td>
                                <xsl:value-of select="@shk_lvl"/>
                            </td>
                            <td>
                                <a href="rpt.php?mth=dsp&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}&amp;fmt=1">htm</a>
                            </td>
                            <td>
                                <a href="rpt.php?mth=dsp&amp;rpt_id={$rpt/@rpt_id}&amp;scn_id={@scn_id}&amp;fmt=2">csv</a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p/>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

 