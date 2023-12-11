<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/tbl[1]">

        <table class="table1">
            <tr>
                <th>item_id</th>
                <th>item_created</th>
                <th>item_updated</th>
                <th>item_name</th>
                <th>item_val1</th>
                <th>item_val2</th>
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
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val2, '###,##0.000')"/>
                    </td>
                 </tr>
            </xsl:for-each> 
        </table>
        <hr/>
    </xsl:template>
    
    <xsl:template match="root/tbl[2]">

        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>res_name</th>
                <th>dt</th>
                <th>nt</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <a href="res.php?mth=disp&amp;res_id={@res_id}">
                            <xsl:value-of select="@res_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@dt,'0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@nt"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>

    </xsl:template>
    
    
</xsl:stylesheet>