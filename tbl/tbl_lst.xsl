<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <tr>
                <th>grp_id</th>
                <th>tbl_id</th>
                <th>tbl_name</th>
                <th>tbl_act</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@tbl_id"/>
                    </td>
                    <td style="text-align:left">
                        <a href="tbl.php?mth=edt&amp;tbl_id={@tbl_id}">
                            <xsl:value-of select="@tbl_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@tbl_act"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>