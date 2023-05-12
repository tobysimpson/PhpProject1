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
                <!--<th>grp_id</th>-->
                <th>avl_id</th>
                <th>avl_name</th>
<!--                <th>avl_base</th>
                <th>avl_trend</th>
                <th>avl_osc</th>
                <th>avl_sig</th>
                <th>avl_rev</th>-->
                <th colspan="1"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>-->
                    <td>
                        <xsl:value-of select="@avl_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@avl_name"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@avl_base"/>
                    </td>
                    <td>
                        <xsl:value-of select="@avl_trend"/>
                    </td>
                    <td>
                        <xsl:value-of select="@avl_osc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@avl_sig"/>
                    </td>
                    <td>
                        <xsl:value-of select="@avl_rev"/>
                    </td>-->
                    <td>
                        <object type="image/svg+xml" data="avl.php?mth=plot&amp;avl_id={@avl_id}" style="width:400; height:120;"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>