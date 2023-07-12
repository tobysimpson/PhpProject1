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
                <th>col_ord</th>
                <th style="text-align:left;">col_name</th>
<!--                <th>prd_in</th>
                <th>prd_out</th>
                <th>dem_out</th>-->
                <!--<th>col_def</th>-->
                <th colspan="3"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_typ"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_ord"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_name"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@prd_in"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_out"/>
                    </td>
                    <td>
                        <xsl:value-of select="@dem_out"/>
                    </td>-->
<!--                    <td>
                        <xsl:value-of select="@col_def"/>
                    </td>-->
                    <td>
                        <a href="#" onclick="fn_get('col.php?mth=disp&amp;col_name={@col_name}',disp);">plot</a>
                    </td>
                    <td>
                        <xsl:if test="@col_evt=1">
                            <a href="evt.php?mth=list&amp;col_id={@col_id}">event</a>
                        </xsl:if>
                    </td>
                    <td>
                        <a href="col.php?mth=dat&amp;col_name={@col_name}">data</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>