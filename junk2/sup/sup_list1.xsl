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
                <th>prd_id</th>
                <th>prd_name</th>
                <th>sup_id</th>
                <th>sup_ord</th>
                <th>sup_name</th>
                <th>sup_cap</th>
                <th>ts_avl</th>
                <th>avl_name</th>
                <th>ts_cap</th>
                <th>cap_name</th>
                <th>ts_prc</th>
                <th>prc_name</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sup_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@sup_ord"/>
                    </td>
                    
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('sup.php?mth=plot&amp;sup_id={@sup_id}',disp);"><xsl:value-of select="@sup_name"/></a>
                    </td>
                    <td>
                        <xsl:value-of select="@sup_cap"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_avl"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=plot&amp;ts_id={@ts_avl}',disp);"><xsl:value-of select="@avl_name"/></a>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_cap"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=plot&amp;ts_id={@ts_cap}',disp);"><xsl:value-of select="@cap_name"/></a>
                    </td>
                    <td>
                        <xsl:value-of select="@ts_prc"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#" onclick="fn_get('ts.php?mth=plot&amp;ts_id={@ts_prc}',disp);"><xsl:value-of select="@prc_name"/></a>
                    </td>
<!--                    <td>
                        <object type="image/svg+xml" data="sup.php?mth=plot&amp;sup_id={@sup_id}" style="width:600; height:200;"/>
                    </td>-->
                </tr>
            </xsl:for-each> 
        </table>
        <div id="disp"></div>
    </xsl:template>
</xsl:stylesheet>