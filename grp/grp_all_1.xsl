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
            <table class="table1">
                <tr>
                    <th>grp_id</th>
                    <th>grp_name</th>
                    <th>grp_act</th>
                    <th/>
                </tr>
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@grp_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_act"/>
                    </td>
                    <td>
                        <a href="grp.php?mth=edt&amp;grp_id={@grp_id}">edit</a>
                    </td>
                </tr>
            </table>
            <p/>
            <xsl:for-each select="//root/tbl[2]/row[@grp_id=$grp_id]">
                <xsl:variable name="tbl_id" select="@tbl_id"/>
                <table class="table1">
                    <tr>
                        <th>grp_id</th>
                        <th>tbl_id</th>
                        <th>tbl_name</th>
                        <th>tbl_act</th>
                        <th/>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="@grp_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@tbl_id"/>
                        </td>
                        <td style="text-align:left">
                            <xsl:value-of select="@tbl_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@tbl_act"/>
                        </td>
                        <td>
                            <a href="tbl.php?mth=edt&amp;tbl_id={@tbl_id}">edit</a>
                        </td>
                    </tr>
                </table>
                <p/>
                <table class="table1">
                    <tr>
                        <th>grp_id</th>
                        <th>tbl_id</th>
                        <th>col_id</th>
                        <th>col_name</th>
                        <th>col_act</th>
                        <th/>
                    </tr> 
                    <xsl:for-each select="//root/tbl[3]/row[@tbl_id=$tbl_id]">
                        <tr>
                            <td>
                                <xsl:value-of select="$grp_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@tbl_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@col_id"/>
                            </td>
                            <td style="text-alignÏ:left">
                                <xsl:value-of select="@col_name"/>
                            </td>
                            <td>
                                <xsl:value-of select="@col_act"/>
                            </td>
                            <td>
                                <a href="col.php?mth=edt&amp;col_id={@col_id}">edit</a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p/>
            </xsl:for-each>
            <hr/>
        </xsl:for-each>
    </xsl:template>
    
    

    <!--                            
                                
                                
                                
                                
                                     <td></td>
    
        
            <th>col_id</th>
            <th>col_act</th>
            <th>col_name</th>
            <th/>
        </tr>
    -->
    <!--                                            -->
    <!--                                            <tr>
        <td>        
            <form action="col.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                <input type="submit" value="new"/>
            </form>
        </td>
    </tr>-->

    <!--</xsl:for-each>-->
    <!--                            <tr>
        <td>        
            <form action="tbl.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                <input type="hidden" name="grp_id" value="{$grp_id}"/>
                <input type="submit" value="new"/>
            </form>
        </td>
    </tr>-->
    <!--                        </table>
                </td>
            </tr>
        </xsl:for-each>
        <tr>
            <td>        
                <form action="grp.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                    <input type="submit" value="new"/>
                </form>
            </td>
        </tr>
    </table>-->
   
    
  
</xsl:stylesheet>