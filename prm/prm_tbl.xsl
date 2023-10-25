<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="root">
        <table>
            <tr>
                <th>res_id</th>
                <th>prm_id</th>
                <th>p</th>
                <th>t</th>
                <th>u</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@p"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@t, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@u, '0.000')"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
    
</xsl:stylesheet>

