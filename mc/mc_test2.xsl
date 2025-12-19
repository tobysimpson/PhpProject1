<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <p class="h1">indicator</p>
        <table class="table1">
            <tr>
                <th>ind_id</th>
                <th>prm_id</th>
                <th>ind_grp</th>
                <th>ind_name</th>
                <th>ind_pref</th>
                <th>ind_sca</th>
                <th>ind_w</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@ind_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ind_grp"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ind_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_pref"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_sca"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_w"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">scenario</p>
        <table class="table1">
            <tr>
                <th>scn_id</th>
                <th>sps_id</th>
                <th>shk_id</th>
                <th>shk_lvl</th>
                <th>scn_code</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sps_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_lvl"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_code"/>
                    </td>
                    
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">year</p>
        <table class="table1">
            <tr>
                <th>yr</th>
            </tr>
            <xsl:for-each select="tbl[3]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">single criterion flow</p>
        <table class="table1">
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <xsl:for-each select="//root/tbl[1]/row">
                    <xsl:variable name="ind" select="."/>
                    <th colspan="3">
                        <xsl:value-of select="$ind/@ind_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <tr>
                <th>yr</th>
                <th>scn_id</th>
                <th>scn_code</th>
                <xsl:for-each select="//root/tbl[1]/row">
                    <xsl:variable name="ind" select="."/>
                    <th>pos</th>
                    <th>neg</th>
                    <th>net</th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="//root/tbl[3]/row">
                <xsl:variable name="yr" select="."/>
                <xsl:for-each select="//root/tbl[2]/row">
                    <xsl:variable name="scn" select="."/>
                    <tr>
                        <td>
                            <xsl:value-of select="$yr/@yr"/>
                        </td>
                        <td>
                            <xsl:value-of select="$scn/@scn_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="$scn/@scn_code"/>
                        </td>
                        <xsl:for-each select="//root/tbl[1]/row">
                            <xsl:variable name="ind" select="."/>
                            <xsl:variable name="row" select="//root/tbl[4]/row[@yr = $yr/@yr and @ind_id = $ind/@ind_id and @scn_id = $scn/@scn_id]"/>
                            <td style="text-align:right;">
                                <xsl:value-of select="$row/@phi1"/>
                            </td>
                            <td style="text-align:right;">
                                <xsl:value-of select="$row/@phi2"/>
                            </td>
                            <td style="text-align:right;">
                                <xsl:value-of select="$row/@phi"/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
        <p class="h1">net flow weighted sum</p>
        <table class="table1">
            <tr>
                <th>yr</th>
                <th>scn_id</th>
                <th>phi_w</th>
            </tr>
            <xsl:for-each select="tbl[5]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td style="text-align:right;">
                        <xsl:value-of select="format-number(@phi_w,'0.00000')"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 