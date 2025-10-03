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
                <xsl:for-each select="//root/tbl[1]/row[1]/@*">
                    <th>
                        <xsl:choose>
                            <xsl:when test="substring-before(name(.),'_') = 'col'">
                                <xsl:value-of select="substring-after(name(.),'_')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="name(.)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <xsl:for-each select="@*">
                        <td>
                            <xsl:if test="contains(name(), 'path')">
                                <xsl:attribute name="style">text-align:left;</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="."/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>