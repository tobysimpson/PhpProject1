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
                <th>res_name</th>
                <th>res_n1</th>
                <th colspan="7"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@res_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@res_n1"/>
                    </td>
                    <td>
                        <a href="res.php?mth=edit&amp;res_id={@res_id}">edit</a>
                    </td>
                    <td>
                        <a href="res.php?mth=grid&amp;res_id={@res_id}">grid</a>
                    </td>
                    <td>
                        <a href="res.php?mth=disp&amp;res_id={@res_id}">disp</a>
                    </td>
                    <td>
                        <a href="res.php?mth=init&amp;res_id={@res_id}">init</a>
                    </td>
                    <td>
                        <a href="res.php?mth=step&amp;res_id={@res_id}">step</a>
                    </td>
                    <td>
                        <a href="res.php?mth=trunc&amp;res_id={@res_id}">trunc</a>
                    </td>
                    <td>
                        <a href="res.php?mth=hist&amp;res_id={@res_id}">hist</a>
                    </td>
                </tr>   
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>