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
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>yr</th>
                <th>prm_id</th>
                <th>mc_w</th>
                <th>scn_id</th>
                <th>pos</th>
                <th>neg</th>
                <th>net</th>
            </tr>
            <xsl:for-each select="//root/tbl[4]/row">

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
                        <xsl:value-of select="format-number(@mc_w,'#,##0.00000','fmt1')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@p1,'#,##0.00000','fmt1')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@p2,'#,##0.00000','fmt1')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@phi,'#,##0.00000','fmt1')"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>



<!--        <table class="table1">
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
                <th>scn_id</th>
                <th>net flow</th>
            </tr>
            <xsl:for-each select="//root/tbl[2]/row">
                <xsl:variable name="scn" select="."/>
                <tr>
                    
                    <td>
                        <xsl:value-of select="$scn/@scn_id"/>
                    </td>
                    
                    <xsl:variable name="row" select="//root/tbl[4]/row[@scn_id = $scn/@scn_id and @prm_id = $prm/@prm_id and @yr = $yr]"/>
                    <td style="text-align:right;">
                        <xsl:value-of select="format-number($row/@s1, '#,##0.0', 'fmt1')"/>
                    </td>
                
                </tr>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:for-each>
</table>-->