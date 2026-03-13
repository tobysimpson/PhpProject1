<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="fmt1" NaN=""/>
    
    <xsl:variable name="rel_max" select="//tbl[8]/row/@rel_max"/>
    <xsl:variable name="rel_min" select="//tbl[8]/row/@rel_min"/>
    
    <xsl:template match="root">
        <xsl:variable name="prm_id" select="tbl[3]/row/@prm_id"/>
        <p class="h1">path</p>
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>name</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <xsl:sort select="@lvl" data-type="number" order="ascending"/>
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@lvl"/>
                    </td>
                    <td>
                        <xsl:value-of select="@leaf"/>
                    </td>
                    <td style="text-align:left;" >
                        <a href="prm.php?mth=brw&amp;prm_id={@prm_id}">
                            <xsl:value-of select="@name"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        


        <xsl:if test="not(count(tbl[2]/row) = 0)">
            <p class="h1">children</p>
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>lvl</th>
                    <th>leaf</th>
                    <th>name</th>
                    <th>unit</th>
                </tr>
                <xsl:for-each select="tbl[2]/row">
                    <tr>
                        <td>
                            <xsl:value-of select="@prm_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@lvl"/>
                        </td>
                        <td>
                            <xsl:value-of select="@leaf"/>
                        </td>
                        <td style="text-align:left;" >
                            <a href="prm.php?mth=brw&amp;prm_id={@prm_id}">
                                <xsl:value-of select="@name"/>
                            </a>
                        </td>
                        <td>
                            <xsl:value-of select="@unit"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        
        
        
        <p class="h1">description</p>
        
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>prm_name</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>calc</th>
                <th>unit</th>
                <th>path</th>
            </tr>
            <xsl:for-each select="tbl[3]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@lvl"/>
                    </td>
                    <td>
                        <xsl:value-of select="@leaf"/>
                    </td>
                    <td>
                        <xsl:value-of select="@calc"/>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@path"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        
        <xsl:if test="not(count(tbl[11]/row) = 0)">
            
            <p class="h1">pathways</p>
            
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,2,3,4">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,2,3,4"/>
            </a>
            
            <p class="h1">shocks</p>
            
            <p class="h1">SPS1</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,5,6,7">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,5,6,7"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,29,30,31">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,29,30,31"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,41,42,43">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,41,42,43"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,53,54,55">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,53,54,55"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,65,66,67">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=1,65,66,67"/>
            </a>
            
            <p class="h1">SPS2</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,8,9,10">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=2,8,9,10"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,32,33,34">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=2,32,33,34"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,44,45,46">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=2,44,45,46"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,56,57,58">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=2,56,57,58"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,68,69,70">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=2,68,69,70"/>
            </a>
        
            <p class="h1">SPS3</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,11,12,13">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=3,11,12,13"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,35,36,37">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=3,35,36,37"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,47,48,49">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=3,47,48,49"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,59,60,61">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=3,59,60,61"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,71,72,73">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=3,71,72,73"/>
            </a>
            
            <p class="h1">SPS4</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,14,15,16">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=4,14,15,16"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,38,39,40">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=4,38,39,40"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,50,51,52">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=4,50,51,52"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,62,63,64">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=4,62,63,64"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,74,75,76">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={$prm_id}&amp;scn_ids=4,74,75,76"/>
            </a>
           
           
            <p class="h1">comparison (shock vs. sps base)</p>
            

            <table class="table1">
                <tr>
                    
                    <th>sps_code</th>
                    <th>shk_code</th>
                    <th>shk_lvl</th>
                    <xsl:for-each select="//tbl[7]/row">
                        <th>
                            <xsl:value-of select="@yr"/>
                        </th>
                    </xsl:for-each>
                </tr>
                <xsl:for-each select="//tbl[5]/row">
                    <xsl:variable name="shk_id" select= "@shk_id"/>
                    <xsl:variable name="shk_code" select= "@shk_code"/>
                    <xsl:for-each select="//tbl[4]/row">
                        
                        <xsl:variable name="sps_id" select= "@sps_id"/>
                        <xsl:variable name="sps_code" select= "@sps_code"/>
                    
                        <xsl:for-each select="//tbl[6]/row">
                            <xsl:variable name="shk_lvl" select= "@shk_lvl"/>
                            <tr>
                                <td>
                                    <xsl:value-of select="$sps_code"/>
                                </td>
                                <td>
                                    <xsl:value-of select="$shk_code"/>
                                </td>
                                <td>
                                    <xsl:value-of select="$shk_lvl"/>
                                </td>
                                <xsl:for-each select="//tbl[7]/row">
                                    <xsl:variable name="yr" select= "@yr"/>
                                    <xsl:variable name="u_rel" select="//tbl[9]/row[@yr = $yr and @sps_id = $sps_id and @shk_id = $shk_id and @shk_lvl = $shk_lvl]/@u_rel"/>  
                                    <xsl:choose>
                                        <xsl:when test="$u_rel &gt; 0">
                                            <xsl:variable name="a" select="format-number($u_rel div $rel_max,'0.000')"/>
                                            <xsl:variable name="b" select="255 * $a"/>
                                            <td style="text-align:right;background-color:rgba(0,125,0,{$a});color:rgb({$b},{$b},{$b});">
                                                <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:when test="$u_rel &lt; 0">
                                            <xsl:variable name="a" select="format-number($u_rel div $rel_min,'0.000')"/>
                                            <xsl:variable name="b" select="255 * $a"/>
                                            <td style="text-align:right;background-color:rgba(255,0,0,{$a});color:rgb({$b},{$b},{$b});">
                                                <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                            </td>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <td style="text-align:right;color:#CCCCCC;">
                                                <xsl:value-of select="format-number($u_rel,'0.00%','fmt1')"/>
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </table>

            
            <p class="h1">data</p>
            
            
            <table class="table1">
                <tr>
                    <th>scn_id</th>
                    <th>sps_code</th>
                    <th>shk_code</th>
                    <th>shk_lvl</th>

                    <xsl:for-each select="//root/tbl[7]/row">
                        <th>
                            <xsl:value-of select="@yr"/>
                        </th>
                    </xsl:for-each>
                </tr>
                <xsl:for-each select="//root/tbl[10]/row">
                    <xsl:variable name="scn_id" select="@scn_id"/>
                    <tr>
                        <td>
                            <xsl:value-of select="$scn_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@sps_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@shk_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@shk_lvl"/>
                        </td>
                        <xsl:for-each select="//root/tbl[7]/row">
                            <xsl:variable name="yr" select="@yr"/>
                            <xsl:variable name="row" select="//root/tbl[11]/row[@scn_id = $scn_id and @yr = $yr]"/>
                            <td style="text-align:right;">
                                <xsl:value-of select="$row/@u"/>
                            </td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </table>
            
            
            
            <p class="h1">uploads (last 30 days)</p>
        
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>ts</th>
                    <th>n</th>
                </tr>
                <xsl:for-each select="tbl[12]/row">
                    <tr>
                        <td>
                            <xsl:value-of select="@prm_id"/>
                        </td>
                        <td>
                            <a href="upl.php?mth=prm&amp;prm_id={@prm_id}&amp;ts={@ts}">
                                <xsl:value-of select="@ts"/>
                            </a>
                        </td>
                        <td>
                            <xsl:value-of select="@n"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            
 
        </xsl:if>
        

        
        
    </xsl:template>
</xsl:stylesheet>