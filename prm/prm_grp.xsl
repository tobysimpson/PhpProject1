<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="root">
        
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>prm_id</th>
                <th>grp_id</th>
                <th>prm_name</th>
                <th>u0</th>
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
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=plot&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div3);">
                            <xsl:value-of select="@prm_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@u0, '###,##0.000')"/>
                    </td>
                    <!--                    <td>
                        <a href="#" onclick="console.log('plot'+{@prm_id});fn_get('prm.php?mth=plot&amp;prm_id={@prm_id}',disp);">plot</a>
                    </td>-->
                    <!--                    <td>
                        <a href="prm.php?mth=def&amp;prm_id={@prm_id}">prm_def</a>
                    </td>
                    <td>
                        <a href="prm.php?mth=usr&amp;prm_id={@prm_id}">prm_usr</a>
                    </td>-->
                </tr>
            </xsl:for-each> 
        </table>
        <hr/>
        <div id="div3"></div>
        <hr/>
        <div id="div4"></div>
    </xsl:template>
</xsl:stylesheet>