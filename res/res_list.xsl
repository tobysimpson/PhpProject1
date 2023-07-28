<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <form action="res.php?mth=insert" method="post">
            <input type="submit" value="insert"/>
        </form>
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>res_name</th>
                <th>res_v1</th>
                <th>res_v2</th>
                <th colspan="4"/>
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
                        <xsl:value-of select="@res_v1"/>
                    </td>
                    <td>
                        <xsl:value-of select="@res_v2"/>
                    </td>
                    <td>
                        <a href="res.php?mth=edit&amp;res_id={@res_id}">edit</a>
                    </td>
                    <td>
                        <a href="col.php?mth=list&amp;res_id={@res_id}">col</a>
                    </td>
                    <td>
                        <a href="bal.php?mth=disp&amp;res_id={@res_id}&amp;n=0">bal</a>
                    </td>
                    <td>
                        <a href="res.php?mth=evt&amp;res_id={@res_id}">evt</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>