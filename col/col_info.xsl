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
                <th>col_id</th>
                <th>col_name</th>
                <th style="text-align:left;">description</th>
                <th>assumption</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_desc"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_ass"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        

    </xsl:template>
</xsl:stylesheet>