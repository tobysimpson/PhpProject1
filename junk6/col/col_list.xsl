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
                <th>col_id</th>
                <th>grp_id</th>
                <th>col_ord</th>
                <th style="text-align:left;">col_name</th>
                <th colspan="3"/>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_ord"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_name"/>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('col.php?mth=disp&amp;col_name={@col_name}&amp;res_id={../@res_id}',disp);">plot</a>
                    </td>
                    <td>
                        <a href="col.php?mth=data&amp;col_name={@col_name}&amp;res_id={../@res_id}">data</a>
                    </td>
                    <td>
                        <xsl:if test="@col_evt=1">
                            <a href="evt.php?mth=list&amp;res_id={../@res_id}&amp;col_id={@col_id}">event</a>
                        </xsl:if>
                    </td>

                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>