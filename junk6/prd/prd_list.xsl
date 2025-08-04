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
                <th>prd_id</th>
                <th>prd_name</th>
                <th>prd_desc</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_desc"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
    </xsl:template>
</xsl:stylesheet>