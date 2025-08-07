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
                <th>grp_name</th>
                <th>grp_desc</th>
                <th>grp_act</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <a href="grp.php?mth=edt&amp;grp_id={@grp_id}">
                            <xsl:value-of select="@grp_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_act"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>