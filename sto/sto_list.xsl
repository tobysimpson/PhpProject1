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
                <th>sto_id</th>
                <th>sto_name</th>
                <th>sto_base</th>
                <th>sto_trend</th>
                <th>sto_osc</th>
                <th>sto_sig</th>
                <th>sto_rev</th>
                <th colspan="1"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@sto_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_base"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_trend"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_osc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_sig"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sto_rev"/>
                    </td>
                    <td>
                        <object type="image/svg+xml" data="sto.php?mth=sto_plot&amp;sto_id={@sto_id}" style="width:400; height:120;"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>