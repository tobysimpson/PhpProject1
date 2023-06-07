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
                <th>col_typ</th>
                <th style="text-align:left;">col_name</th>
                <th colspan="4"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_typ"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_name"/>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('col.php?mth=disp&amp;tbl_name=res_def&amp;col_name={@col_name}',disp);">default</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('col.php?mth=disp&amp;tbl_name=vw_usr&amp;col_name={@col_name}',disp);">user</a>
                    </td>
                    <td>
                        <a href="evt.php?mth=list&amp;col_id={@col_id}">
                            <xsl:text>events (</xsl:text>
                            <xsl:value-of select="@evt_ct"/>
                            <xsl:text>)</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('col.php?mth=disp&amp;tbl_name=vw_fac&amp;col_name={@col_name}',disp);">factor</a>
                    </td>
                    
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>