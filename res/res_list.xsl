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
                <th>res_name</th>
                <th>res_n1</th>
                <th colspan="5"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@res_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@res_n1"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=edit&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=grid&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>grid</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=table&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>table</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=init&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>init</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=step&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>step</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>res.php?mth=hist&amp;res_id=</xsl:text>
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                            <xsl:text>hist</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>