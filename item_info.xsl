<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="/root">
        <table>
            <tr>
                <th>item_id</th>
                <th>item_created</th>
                <th>item_updated</th>
                <th>item_name</th>
                <th>item_val1</th>
                <th>item_val2</th>
                <th></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@item_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@item_created"/>
                    </td>
                    <td>
                        <xsl:value-of select="@item_updated"/>
                    </td>
                    <td>
                        <xsl:value-of select="@item_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@item_val1"/>
                    </td>
                    <td>
                        <xsl:value-of select="@item_val2"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>item_edit.php?item_id=</xsl:text>
                                <xsl:value-of select="@item_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                            <!--<xsl:value-of select="@item_id"/>-->
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>