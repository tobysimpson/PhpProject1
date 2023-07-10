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
                <xsl:for-each select="row[1]/@*">
                    <th>
                        <xsl:value-of select="name(.)" />
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <xsl:for-each select="@*">
                        <td>
                            <xsl:value-of select="." />
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
        

    </xsl:template>
</xsl:stylesheet>