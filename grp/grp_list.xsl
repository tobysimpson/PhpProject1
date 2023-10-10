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
                <th>grp_id</th>
                <th>grp_ord</th>
                <th style="text-align:left;">grp_name</th>
                <th colspan="3"/>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_ord"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@grp_name"/>
                    </td>
                    <td>
                        <a href="col.php?mth=grp&amp;grp_id={@grp_id}&amp;res_id={../@res_id}">col</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>