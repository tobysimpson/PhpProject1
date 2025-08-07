<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]/row">
        <table class="table1">
            <tr>
                <th>tbl_id</th>
                <th>tbl_name</th>
                <th>tbl_act</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="@tbl_id"/>
                </td>
                <td>
                    <a href="tbl.php?mth=edt&amp;tbl_id={@tbl_id}">
                        <xsl:value-of select="@tbl_name"/>
                    </a>
                </td>
                <td>
                    <xsl:value-of select="@tbl_act"/>
                </td>
            </tr>
        </table>
        <p/>
        <table class="table1">
            <tr>
                <th>col_id</th>
                <th>col_pos</th>
                <th>col_name</th>
                <th>col_desc</th>
                <th>col_typ</th>
                <th>col_dec</th>
                <th>col_act</th>
            </tr>
            <xsl:for-each select="//root/tbl[2]/row">
                <!--<xsl:sort select="@col_pos"/>-->
                <tr>
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
                        <xsl:value-of select="@col_dec"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_act"/>
                    </td>
                </tr>
            </xsl:for-each>
            <tr>
                <td>        
                    <form action="col.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                        <input type="hidden" name="tbl_id" value="{//root/tbl[1]/row/@tbl_id}"/>
                        <input type="submit" value="new"/>
                    </form>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>