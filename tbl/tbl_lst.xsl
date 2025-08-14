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
                <th>tbl_id</th>
                <th>tbl_pos</th>
                <th>tbl_name</th>
                <th>tbl_desc</th>
                <th>tbl_act</th>
            </tr>
            <xsl:apply-templates select="tbl[1]/row" mode="tbl"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row" mode="tbl">
        <tr>
            <td>
                <xsl:value-of select="@grp_id"/>
            </td>
            <td>
                <xsl:value-of select="@tbl_id"/>
            </td>
            <td>
                <xsl:value-of select="@tbl_pos"/>
            </td>
            <td>
                <a href="tbl.php?mth=edt&amp;tbl_id={@tbl_id}">
                    <xsl:value-of select="@tbl_name"/>
                </a>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@tbl_desc"/>
            </td>
            <td>
                <xsl:value-of select="@tbl_act"/>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>