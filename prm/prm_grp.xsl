<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="root">
        
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>grp_id</th>
                <th>grp_desc</th>
                <th>prm_id</th>
                <th>prm_name</th>
    
                <th>prm_desc</th>
                <th>prm_def</th>
                <th>prm_tick</th>
                <th>prm_cal</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=plot&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div4);">
                            <xsl:value-of select="@prm_name"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_def, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_tick, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_cal"/>
                    </td>
                    <!--
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=plot&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div3);">plot</a>
                    </td>
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=tbl&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div4);">table</a>
                    </td>
                    -->
                </tr>
            </xsl:for-each> 
        </table>
        <hr/>
        <div id="div4"></div>

    </xsl:template>
</xsl:stylesheet>