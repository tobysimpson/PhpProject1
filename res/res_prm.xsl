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
                <th>prm_id</th>
                <th>prm_name</th>
                <th colspan="3"/>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                                       <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_name"/>
                    </td>
<!--                    <td>
                        <a href="#" onclick="fn_get('prm.php?mth=plot&amp;prm_id={@prm_id}',disp);">plot</a>
                    </td>-->
                    <td>
                        <a href="res.php?mth=itp&amp;res_id={@res_id}&amp;prm_id={@prm_id}">res_itp</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>