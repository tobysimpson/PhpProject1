<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:php="http://php.net/xsl">
    
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">
        <xsl:variable name="scn_id" select="tbl[1]/row/@scn_id"/>
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>prm_name</th>
                <th>prm_unit</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="$scn_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>