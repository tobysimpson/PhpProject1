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
 
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="grp_id" select="@grp_id"/>
                <tr>
                    <th>grp_id</th>
                    <th style="text-align:left">grp_name</th>
                </tr>
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td style="text-align:left">
                        <a href="grp.php?mth=tbl&amp;grp_id={@grp_id}">
                            <xsl:value-of select="@grp_name"/>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <table class="table1">
                            
                            <xsl:for-each select="//root/tbl[2]/row[@grp_id=$grp_id]">
                                <xsl:variable name="tbl_id" select="@tbl_id"/>
                                <tr>
                                    <th>tbl_id</th>
                                    <th style="text-align:left">tbl_name</th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:value-of select="@tbl_id"/>
                                    </td>
                                    <td style="text-align:left">
                                        <a href="tbl.php?mth=col&amp;tbl_id={@tbl_id}">
                                            <xsl:value-of select="@tbl_name"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <table class="table1">
                                            <tr>
                                                <th>col_id</th>
                                                <th style="text-align:left">col_name</th>
                                            </tr>
                                            <xsl:for-each select="//root/tbl[3]/row[@tbl_id=$tbl_id]">
                                                <tr>
                                                    <td>
                                                        <xsl:value-of select="@col_id"/>
                                                    </td>
                                                    <td style="text-align:left">
                                                        <a href="col.php?mth=edt&amp;col_id={@col_id}">
                                                            <xsl:value-of select="@col_name"/>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>