<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <table class="table1" onload="fn_get('prm.php?mth=plot&amp;res_id={row/@res_id}&amp;prm_id={row/@prm_id}',disp);">
            <tr>
                <th>res_id</th>
                <th>prm_id</th>
                <th>p</th>
                <th>t</th>
                <th>du</th>
                <th></th>
                <th>u</th>
                <th colspan="1"/>
                <th>
                    <a href="#" onclick="fn_get('prm.php?mth=plot&amp;res_id={row/@res_id}&amp;prm_id={row/@prm_id}',disp);">prm_plot</a>
                </th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@p"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                    </td>

                    <td>
                        <!-- style="appearance: slider-vertical;" -->
                        <input type="range" value="{format-number(@du, '###,##0.000')}"  min="-1" max="1" step="0.25" onchange="window.location.assign('prm.php?mth=ups1&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}&amp;du='+this.value)"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@du, '0.000')"/>
                    </td>
                    <td>
                        <input type="range" value="{format-number(@u, '###,##0.000')}"  min="-1" max="1" step="0.25" onchange="window.location.assign('prm.php?mth=ups2&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}&amp;u1='+this.value)"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@u, '###,##0.000')"/>
                    </td>
                    <td>
                        <a href="prm.php?mth=clr&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}">prm_clr</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>