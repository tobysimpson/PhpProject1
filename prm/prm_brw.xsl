<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:key name="scn" match="root/tbl[3]/row" use="@scn_id"/>
    <xsl:key name="prm" match="root/tbl[3]/row" use="@prm_id"/>
    <xsl:key name="yr"  match="root/tbl[3]/row" use="@yr"/>


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
        
        <p/>

        <xsl:if test="not(count(tbl[2]/row) = 0)">
            
            <p class="h1">children</p>
            
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>lvl</th>
                    <th>leaf</th>
                    <th>name</th>
                    <th>unit</th>
                    <!--<th>ts</th>-->
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
                        <!--                    <td>
                            <xsl:value-of select="@ts"/>
                        </td>-->
                    </tr>
                </xsl:for-each>
            </table>
        </xsl:if>
        
        
        <xsl:if test="not(count(tbl[3]/row) = 0)">
            
            <p class="h1">data</p>
        
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>prm_name</th>
                    <th>ts</th>
                    <th>scn_id</th>
                    <th>scn_name</th>
                    <th>yr</th>
                    <th>u</th>
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
                            <xsl:value-of select="@ts"/>
                        </td>
                        <td>
                            <xsl:value-of select="@scn_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="@scn_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@yr"/>
                        </td>
                        <td style="text-align:right;">
                            <xsl:value-of select="@u"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        
            <p class="h1">pivot</p>
        
            <table class="table1">
                <tr>
                    <th>prm_id</th>
                    <th>scn_id</th>
                    <th>scn_name</th>
                    <th>name</th>
                    <xsl:for-each select="//root/tbl[3]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                        <th>
                            <xsl:value-of select="@yr"/>
                        </th>
                    </xsl:for-each>
                </tr>
            
            
                <xsl:for-each select="//root/tbl[3]/row[generate-id() = generate-id(key('scn',@scn_id)[1])]">
                    <xsl:variable name="scn_id" select= "@scn_id"/>
                    <xsl:variable name="scn_name" select= "@scn_name"/>
            
            
                    <xsl:for-each select="//root/tbl[3]/row[generate-id() = generate-id(key('prm',@prm_id)[1])]">
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
                            <td>
                                <xsl:value-of select="$scn_name"/>
                            </td>

                            <xsl:for-each select="//root/tbl[3]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                                <xsl:variable name="yr" select= "@yr"/>
                                <td style="text-align:right;">
                                    <!--<xsl:value-of select="$prm_id"/>,<xsl:value-of select="$yr"/>-->
                                    <xsl:value-of select="//root/tbl[3]/row[@scn_id = $scn_id and @prm_id = $prm_id and @yr = $yr]/@u"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each> 
            
                </xsl:for-each>
            
            
            </table>
        
            
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
            <xsl:for-each select="tbl[4]/row">
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