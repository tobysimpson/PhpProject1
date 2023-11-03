<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>grp_id</th>
                <th>grp_ord</th>
                <th>grp_desc</th>
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
                        <a href="#0" onclick="fn_get('prm.php?mth=grp&amp;res_id={@res_id}&amp;grp_id={@grp_id}',div3);">
                            <xsl:value-of select="@grp_desc"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <hr/>
        <div id="div3"/>

    </xsl:template>
</xsl:stylesheet>