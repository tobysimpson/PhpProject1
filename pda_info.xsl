<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/root">
<!--        <form action="pda_insert.php" method="post">
            <input type="submit" value="add new"/>
        </form>-->
        <table class="table1">
            <tr>
                <th>pda_id</th>
                <th>pdt_id</th>
                <th>usr_id</th>
                <th>pda_created</th>
                <th>pda_updated</th>
                <th>pda_name</th>
                <th>pda_val1</th>
                <th>pda_val2</th>
                <th></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@pda_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pdt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pda_created"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pda_updated"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@pda_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_val1, '###,##0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_val2, '###,##0.000')"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>pda_edit.php?pda_id=</xsl:text>
                                <xsl:value-of select="@pda_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>