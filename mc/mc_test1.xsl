<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <p class="h1">experiment</p>
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mc_name</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mc_name"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">criteria</p>
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mcg_id</th>
                <th>mcg_name</th>
                <th>mcg_pref</th>
                <th>mcg_sca</th>
                <th>mcg_p</th>
                <th>mcg_q</th>
                <th>mcg_w</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_pref"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_sca"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_p"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_q"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mcg_w"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">alternative</p>
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mca_id</th>
                <th>mca_name</th>
            </tr>
            <xsl:for-each select="tbl[3]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mca_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mca_name"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">scaled criteria</p>
        <table class="table1">
            <tr>
                <th/>
                <xsl:for-each select="//root/tbl[2]/row">
                    <xsl:variable name="mcg" select="."/>
                    <th>
                        <xsl:value-of select="$mcg/@mcg_id"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[3]/row">
                <xsl:variable name="mca" select="."/>
                <tr>
                    <th>
                        <xsl:value-of select="$mca/@mca_id"/>
                    </th>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="mcg" select="."/>
                        <td>
                            <xsl:value-of select="//root/tbl[4]/row[@mcg_id = $mcg/@mcg_id and @mca_id = $mca/@mca_id]/@c"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
        <p class="h1">preference</p>
        <table class="table1">
            <tr>
                <th>mcg_id</th>
                <th>mca_id</th>
                <xsl:for-each select="//root/tbl[3]/row">
                    <xsl:variable name="mca" select="."/>
                    <th>
                        <xsl:value-of select="$mca/@mca_id"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <xsl:variable name="mcg" select="."/>
                <xsl:for-each select="//root/tbl[3]/row">
                    <xsl:variable name="mca1" select="."/>
                    <tr>
                        <th>
                            <xsl:value-of select="$mcg/@mcg_id"/>
                        </th>
                        <th>
                            <xsl:value-of select="$mca1/@mca_id"/>
                        </th>
                        <xsl:for-each select="//root/tbl[3]/row">
                            <xsl:variable name="mca2" select="."/>
                            <td>
                                <xsl:value-of select="//root/tbl[5]/row[@mcg_id = $mcg/@mcg_id and @mca_id1 = $mca1/@mca_id and @mca_id2 = $mca2/@mca_id]/@p1"/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 