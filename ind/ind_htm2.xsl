<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>ind_id</th>
                <th>ind_name</th>
                <xsl:for-each select="tbl[2]/row">
<!--                    <th>
                        <xsl:value-of select="@scn_id"/>
                    </th>-->
                    <th>
                        <xsl:value-of select="@scn_code"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="ind" select="."/>
                <tr>
                    <td>
                        <xsl:value-of select="$ind/@ind_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="$ind/@ind_name"/>
                    </td>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="scn" select="."/>
                        <td style="text-align:right;">
                            <xsl:value-of select="//root/tbl[3]/row[@scn_id = $scn/@scn_id and @ind_id = $ind/@ind_id]/@u"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

 
    <!--    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>scn_code</th>
                <xsl:for-each select="tbl[1]/row">
                    <th>
                        <xsl:value-of select="@ind_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <xsl:variable name="scn_id" select="@scn_id"/>
                <tr>
                    <td style="text-align:left;">
                        <xsl:value-of select="@scn_code"/>
                    </td>
                    <xsl:for-each select="//root/tbl[1]/row">
                        <xsl:variable name="prm_id" select="@prm_id"/>
                        <td style="text-align:right;">
                            <xsl:value-of select="//root/tbl[3]/row[@scn_id = $scn_id and @prm_id = $prm_id]/@u"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>-->
</xsl:stylesheet>