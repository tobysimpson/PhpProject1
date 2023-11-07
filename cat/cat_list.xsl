<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="root">
        
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>cat_grp</th>
                <th>cat_ord</th>
                <th>cat_id</th>
                
                <th>cat_code</th>
                <th>cat_name</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@cat_grp"/>
                    </td>
                    <td>
                        <xsl:value-of select="@cat_ord"/>
                    </td>
                    <td>
                        <xsl:value-of select="@cat_id"/>
                    </td>

                    <td>
                        <xsl:value-of select="@cat_code"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#0" onclick="fn_get('cat.php?mth=prm&amp;res_id={@res_id}&amp;cat_id={@cat_id}',div2);">
                            <xsl:value-of select="@cat_name"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <hr/>
        <div id="div2"></div>
    </xsl:template>
</xsl:stylesheet>