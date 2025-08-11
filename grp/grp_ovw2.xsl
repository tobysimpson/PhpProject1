<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">
        
        <xsl:for-each select="tbl[1]/row">
            <xsl:variable name="grp_id" select="@grp_id"/> 
            <div>
                <table class="table1">
                    <tr>
                        <th>grp_id</th>
                        <th>grp_pos</th>
                        <th>grp_name</th>
                        <th>grp_desc</th>
                        <th>grp_act</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="@grp_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@grp_pos"/>
                        </td>
                        <td>
                            <a href="grp.php?mth=tbl&amp;grp_id={@grp_id}">
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
                </table>   
                <p/>
                <div style="margin-left:50px;">
                    <xsl:for-each select="//root/tbl[2]/row[@grp_id=$grp_id]">
                        <xsl:variable name="tbl_id" select="@tbl_id"/>
                        <table class="table1">
                            <tr>
                                <th>tbl_id</th>
                                <th>tbl_pos</th>
                                <th>tbl_name</th>
                                <th>tbl_desc</th>
                                <th>tbl_act</th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="@tbl_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@tbl_pos"/>
                                </td>
                                <td>
                                    <a href="tbl.php?mth=col&amp;tbl_id={@tbl_id}">
                                        <xsl:value-of select="@tbl_name"/>
                                    </a>
                                </td>
                                <td>
                                    <xsl:value-of select="@tbl_desc"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@tbl_act"/>
                                </td>
                            </tr>
                        </table>
                        <p/>
                        <div style="margin-left:44px;">
                            <table class="table1">
                                <tr>
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
                                <xsl:for-each select="//root/tbl[3]/row[@tbl_id=$tbl_id]">
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
                            <p/>
                        </div>
                    </xsl:for-each>
                </div>
            </div>    
        </xsl:for-each>                    
    </xsl:template>
</xsl:stylesheet>