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
                <th>tbl_id</th>
                <th>col_id</th>
                <th>col_pos</th>
                <th>col_name</th>
                <th>col_desc</th>
                <th>col_typ</th>
                <th>col_len</th>
                <th>col_dec</th>
                <th>col_unq</th>
                <th>col_act</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@tbl_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_pos"/>
                    </td>
                    <td>
                        <a href="col.php?mth=edt&amp;col_id={@col_id}">
                            <xsl:value-of select="@col_name"/>
                        </a>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@col_desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_typ"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_len"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_dec"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_unq"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_act"/>
                    </td>
                </tr>
            </xsl:for-each>

        </table>
    </xsl:template>    
</xsl:stylesheet>