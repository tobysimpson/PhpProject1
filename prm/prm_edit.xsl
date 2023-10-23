<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>


    <xsl:template match="root">
        <table>
            <tr>
                <th>res_id</th>
                <th>prm_id</th>
                <th>p</th>
                <th>t</th>
                <th>u</th>
                <th/>
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
                        <xsl:value-of select="format-number(@u, '###,##0.000')"/>
                    </td>
                    <td>
                        <input type="range" value="{format-number(@u, '###,##0.000')}"  min="-1" max="1" step="0.1" onchange="fn_get('prm.php?mth=ups1&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}&amp;u='+this.value, div3);"/>
                    </td>
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=clr&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}', div3);">prm_clr</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
   
    </xsl:template>
</xsl:stylesheet>