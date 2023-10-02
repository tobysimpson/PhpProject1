<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <form action="item.php?mth=insert" method="post">
            <input type="submit" value="add new"/>
        </form>
        <table class="table1">
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
                        <xsl:value-of select="substring(@item_created,0,11)"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@item_updated,0,11)"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@item_name"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val1, '###,##0.0000')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val2, '###,##0.0000')"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>item.php?mth=edit&amp;item_id=</xsl:text>
                                <xsl:value-of select="@item_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>
                    <td>
                        <input type="range" min="-1" max="1" step="0.01" value="{@item_val1}" onchange="console.log(this.value);"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <p/>
        <form action="item.php?mth=reset" method="post">
            <input type="submit" value="reset"/>
        </form>
    </xsl:template>
</xsl:stylesheet>