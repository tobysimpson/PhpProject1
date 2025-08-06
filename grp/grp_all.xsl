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
                        <xsl:value-of select="@grp_name"/>
                    </td>
                    <!--                    <td>
                        <form action="tbl.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                            <input type="hidden" name="grp_id" value="{$grp_id}"/>
                            <input type="submit" value="add tbl"/>
                        </form>
                    </td>-->
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
                                        <xsl:value-of select="@tbl_name"/>
                                    </td>
                                    <!--                                    <td>
                                        <form action="col.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                                            <input type="hidden" name="tbl_id" value="{$tbl_id}"/>
                                            <input type="submit" value="add col"/>
                                        </form>
                                    </td>-->
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
                                                        <xsl:value-of select="@col_name"/>
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