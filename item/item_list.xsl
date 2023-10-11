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
                <th></th>
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
                        <!--<xsl:value-of select="@item_created"/>-->
                    </td>
                    <td>
                        <xsl:value-of select="substring(@item_updated,0,11)"/>
                        <!--<xsl:value-of select="@item_updated"/>-->
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@item_name"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val1, '###,##0.000')"/>
                    </td>
                    <td>                       
                        <input type="range"  value="{@item_val1}" onchange="window.location.assign('item.php?mth=test&amp;item_id={@item_id}&amp;fld_name=item_val1&amp;fld_val='+this.value)"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val2, '###,##0.000')"/>
                    </td>
                    <td>
                        <!-- style="appearance: slider-vertical;" -->
                        <input type="range" value="{@item_val2}" onchange="window.location.assign('item.php?mth=test&amp;item_id={@item_id}&amp;fld_name=item_val2&amp;fld_val='+this.value)"/>
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
                </tr>
            </xsl:for-each> 
        </table>
        <p/>
        <form action="item.php?mth=reset" method="post">
            <input type="submit" value="reset"/>
        </form>
    </xsl:template>
</xsl:stylesheet>