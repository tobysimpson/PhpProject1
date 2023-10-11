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
                <th>prm_id</th>
                <th>grp_id</th>
                <!--<th>prm_ord</th>-->
                <th style="text-align:left;">prm_name</th>
                <th colspan="3"/>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@prm_ord"/>
                    </td>-->
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_name"/>
                    </td>
                    <td>
                        <a href="#" onclick="console.log('plot'+{@prm_id});fn_get('prm.php?mth=plot&amp;prm_id={@prm_id}',disp);">plot</a>
                    </td>
                    <td>
                        <a href="prm.php?mth=def&amp;prm_id={@prm_id}">prm_def</a>
                    </td>
                    <td>
                        <a href="prm.php?mth=usr&amp;prm_id={@prm_id}">prm_usr</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>