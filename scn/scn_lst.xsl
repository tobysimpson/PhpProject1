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
                <th>scn_sps</th>
                <th>shk_fin</th>
                <th>shk_hot</th>
                <th>shk_cld</th>
                <th>shk_soc</th>
                <th>shk_nuc</th>
                <th>scn_name</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_sps"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_fin"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_hot"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_cld"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_soc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_nuc"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@scn_name"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 