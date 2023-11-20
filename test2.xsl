<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="root">
        
 
        <table border="1" style="white-space: nowrap;">
           
            <xsl:for-each select="tbl[2]/row[1]/@*">
                <tr>
                    <th style="text-align:left;">
                        <xsl:value-of select="name(.)" />
                    </th>
                    <td>
                        <xsl:value-of select="." />
                    </td>
                </tr>

            </xsl:for-each>
            <!--            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <xsl:for-each select="@*">
                        <td>
                            <xsl:value-of select="." />
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> -->
        </table>

    </xsl:template>
</xsl:stylesheet>