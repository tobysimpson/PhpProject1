<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:key name="scn" match="root/tbl[4]/row" use="@scn_id"/>
    <xsl:key name="prm" match="root/tbl[4]/row" use="@prm_id"/>
    <xsl:key name="yr"  match="root/tbl[4]/row" use="@yr"/>


    <xsl:template match="root">
 
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
        
        
        <xsl:if test="not(count(tbl[4]/row) = 0)">
            
            <p class="h1">pathways</p>
            
            <!--            <a href="plt.php?mth=lin1&amp;prm_id={tbl[3]/row/@prm_id}&amp;fmt=3">
                <img width="450px" src="plt.php?mth=lin1&amp;prm_id={tbl[3]/row/@prm_id}&amp;fmt=2"/>
            </a>-->
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,2,3,4">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,2,3,4"/>
            </a>
            
            <p class="h1">shocks</p>
            
            <p class="h1">SPS1</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,5,6,7">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,5,6,7"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,29,30,31">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,29,30,31"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,41,42,43">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,41,42,43"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,53,54,55">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,53,54,55"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,65,66,67">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=1,65,66,67"/>
            </a>
            
            <p class="h1">SPS2</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,8,9,10">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,8,9,10"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,32,33,34">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,32,33,34"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,44,45,46">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,44,45,46"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,56,57,58">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,56,57,58"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,68,69,70">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=2,68,69,70"/>
            </a>
        
            <p class="h1">SPS3</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,11,12,13">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,11,12,13"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,35,36,37">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,35,36,37"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,47,48,49">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,47,48,49"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,59,60,61">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,59,60,61"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,71,72,73">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=3,71,72,73"/>
            </a>
            
            <p class="h1">SPS4</p>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,14,15,16">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,14,15,16"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,38,39,40">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,38,39,40"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,50,51,52">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,50,51,52"/>
            </a>
        
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,62,63,64">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,62,63,64"/>
            </a>
            
            <a href="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,74,75,76">
                <img width="450px" src="plt.php?mth=lin2&amp;prm_id={tbl[3]/row/@prm_id}&amp;scn_ids=4,74,75,76"/>
            </a>
           
            <p class="h1">pivot</p>
        
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>prm_name</th>
                    <th>scn_id</th>
                    <th>scn_code</th>
                    <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                        <th>
                            <xsl:value-of select="@yr"/>
                        </th>
                    </xsl:for-each>
                </tr>
                <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('scn',@scn_id)[1])]">
                    <xsl:variable name="scn_id" select= "@scn_id"/>
                    <xsl:variable name="scn_code" select= "@scn_code"/>
                    <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('prm',@prm_id)[1])]">
                        <xsl:variable name="prm_id" select= "@prm_id"/>
                        <xsl:variable name="prm_name" select= "@name"/>
                        <tr>
                            <td>
                                <xsl:value-of select="$prm_id"/>
                            </td>
                            <td style="text-align:left;">
                                <xsl:value-of select="$prm_name"/>
                            </td>
                            <td>
                                <xsl:value-of select="$scn_id"/>
                            </td>
                            <td style="text-align:left;">
                                <xsl:value-of select="$scn_code"/>
                            </td>
                            <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                                <xsl:variable name="yr" select= "@yr"/>
                                <td style="text-align:right;">
                                    <!--<xsl:value-of select="$prm_id"/>,<xsl:value-of select="$yr"/>-->
                                    <xsl:value-of select="//root/tbl[4]/row[@scn_id = $scn_id and @prm_id = $prm_id and @yr = $yr]/@u"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each> 
                </xsl:for-each>
            </table>
            

            
            <!--            <p class="h1">data</p>
             
            <table class="table1">
                <tr>
                    <th>ts</th>
                    <th>prm_id</th>
                    <th>prm_name</th>
                    <th>scn_id</th>
                    <th>scn_code</th>
                    <th>yr</th>
                    <th>u</th>
                </tr>
                <xsl:for-each select="tbl[4]/row">
                    <tr>
                        <td>
                            <xsl:value-of select="@ts"/>
                        </td>
                        <td>
                            <xsl:value-of select="@prm_id"/>
                        </td>
                        <td style="text-align:left;">
                            <xsl:value-of select="@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@scn_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@scn_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@yr"/>
                        </td>
                        <td style="text-align:right;">
                            <xsl:value-of select="@u"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>-->
            
        </xsl:if>
        
        
        
     
        <p class="h1">upload</p>
        
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>ts</th>
                <th>scn</th>
                <th>yr</th>
                <th>n</th>
            </tr>
            <xsl:for-each select="tbl[5]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <a href="upl.php?mth=dsp&amp;prm_id={@prm_id}&amp;ts={@ts}">
                            <xsl:value-of select="@ts"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td>
                        <xsl:value-of select="@n"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        
        
    </xsl:template>
</xsl:stylesheet>