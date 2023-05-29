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
                <th colspan="4"></th>
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
                        <a href="#" onclick="fn_get('sup.php?mth=agg&amp;prd_id={@prd_id}',disp);">sup_agg</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('dem.php?mth=agg&amp;prd_id={@prd_id}',disp);">dem_agg</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('sup.php?mth=piv&amp;prd_id={@prd_id}',disp);">sup_piv</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('dem.php?mth=piv&amp;prd_id={@prd_id}',disp);">dem_piv</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <div id="disp"></div>
    </xsl:template>
</xsl:stylesheet>