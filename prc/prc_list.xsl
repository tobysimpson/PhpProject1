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
                <th>res_id</th>
                <th>prc_id</th>
                <th>prc_name</th>
                <th colspan="2"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prc_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@prc_name"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>prc.php?mth=dem&amp;prc_id=</xsl:text>
                                <xsl:value-of select="@prc_id"/>
                            </xsl:attribute>
                            <xsl:text>dem</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>prc.php?mth=sup&amp;prc_id=</xsl:text>
                                <xsl:value-of select="@prc_id"/>
                            </xsl:attribute>
                            <xsl:text>sup</xsl:text>
                        </a>
                    </td>

                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>