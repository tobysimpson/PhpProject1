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
                <th>grp_id</th>
                <th>grp_name</th>
                <th>grp_act</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="@grp_id"/>
                </td>
                <td style="text-align:left">
                    <a href="grp.php?mth=edt&amp;grp_id={@grp_id}">
                        <xsl:value-of select="@grp_name"/>
                    </a>
                </td>
                <td>
                    <xsl:value-of select="@grp_act"/>
                </td>
            </tr>
        </table>
        <p/>
        <table class="table1">
            <tr>
                <th>tbl_id</th>
                <th>tbl_name</th>
                <th>tbl_act</th>
            </tr>
            <xsl:for-each select="//root/tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@tbl_id"/>
                    </td>
                    <td style="text-align:left">
                        <a href="tbl.php?mth=col&amp;tbl_id={@tbl_id}">
                            <xsl:value-of select="@tbl_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@tbl_act"/>
                    </td>
                </tr>
            </xsl:for-each>
            <tr>
                <td>        
                    <form action="tbl.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                        <input type="hidden" name="grp_id" value="{//root/tbl[1]/row/@grp_id}"/>
                        <input type="submit" value="new"/>
                    </form>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    

    
    
    
</xsl:stylesheet>