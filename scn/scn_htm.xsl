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
                <th>scn_id</th>
                <th>sps_id</th>
                <th>sps_code</th>
                <th>shk_id</th>
                <th>shk_name</th>
                <th>shk_code</th>
                <th>shk_lvl</th>
                <th>scn_code</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
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
                    
                    <td style="text-align:left;">
                        <xsl:value-of select="@shk_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_lvl"/>
                    </td>
                    <td  style="text-align:left;">
                        <xsl:value-of select="@scn_code"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 