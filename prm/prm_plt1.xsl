<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    <xsl:variable name="h">400</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.09 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    
    <xsl:variable name="tt" select="root/tbl[3]/row/@t" />
    <xsl:variable name="vv" select="root/tbl[3]/row/@u" />
                
    <xsl:variable name="tmin">
        <xsl:call-template name="min">
            <xsl:with-param name="nodes" select="$tt" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="tmax">
        <xsl:call-template name="max">
            <xsl:with-param name="nodes" select="$tt" />
        </xsl:call-template>
    </xsl:variable>
                 
    <xsl:variable name="vmin">
        <xsl:call-template name="min">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="vmax">
        <xsl:call-template name="max">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
  
    
    <xsl:variable name="res_mod" select="root/tbl[1]/row/@res_mod"/>
    <xsl:variable name="ttick" select="root/tbl[1]/row/@res_tick"/>
    <xsl:variable name="vtick" select="root/tbl[2]/row/@prm_tick"/>
                
    <xsl:variable name="trng" select="$tmax - $tmin"/>
    <xsl:variable name="vinf" select="(floor($vmin div $vtick) - 1) * $vtick"/>
    <xsl:variable name="vsup" select="(ceiling($vmax div $vtick) + 1) * $vtick"/>
    <xsl:variable name="vrng" select="$vsup - $vinf"/>
    <xsl:variable name="pzro" select="$ph * $vsup div $vrng"/>
    
    <xsl:variable name="tdash" select="$pw * $ttick div $trng * 0.125"/>
    <xsl:variable name="vdash" select="$ph * $vtick div $vrng * 0.125"/>
    
    
   
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            
          
            <g id="title">
                <text x="10" y="20">
                    <xsl:value-of select="tbl[1]/row/@res_name"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tbl[2]/row/@cat_name"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="tbl[2]/row/@obj_name"/>
                 
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="tbl[2]/row/@dem_name"/>
                    
                    
                    <xsl:if test="string-length(tbl[2]/row/@fld_name) &gt; 0">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="tbl[2]/row/@fld_name"/>
                        <xsl:text>)</xsl:text>
                    </xsl:if>
                    
                    <!--<xsl:value-of select="$vtick"/>,<xsl:value-of select="$vinf"/>,<xsl:value-of select="$vsup"/>, <xsl:value-of select="$ttick"/>,  <xsl:value-of select="$vdash"/>, <xsl:value-of select="$tdash"/>-->
                </text>
            </g>
            

            <g id="plot" transform="translate({$wo},{$ho})"> 
      
                <g id="hgrid">       
                    <xsl:call-template name="hgrid">
                        <xsl:with-param name="vpos" select="$vinf" />
                    </xsl:call-template>
                </g>
                

                <g id="vgrid">
                    <xsl:for-each select="$tt">
                        <xsl:variable name="i" select="position()"/>
                        <!--<xsl:if test="$tt[$i] mod $ttick = 0">-->
                        <xsl:if test="((position() - 1) mod $res_mod) = 0">
                            <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
                            <line x1="{$x}" y1="0" x2="{$x}" y2="{$ph}" stroke="lightgray" stroke-dasharray="{$vdash},{$vdash}" stroke-dashoffset="{$vdash * 0.5}"/>
                            <!--                            <text x="{$x}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                                <xsl:value-of select="format-number($tt[$i],'0.000')"/>
                            </text>-->
                        
                            <g id="label" transform="translate({$x}, {$ph + 10})">
                                <text text-anchor="end" transform="rotate(-90)" alignment-baseline="middle">
                                    <xsl:value-of select="format-number($tt[$i],'0.00')"/>
                                </text>
                            </g>
                        
                        </xsl:if>
                    </xsl:for-each>
                </g>  
               
               
                <!-- editable -->
                <xsl:choose>
                    <xsl:when test="tbl[2]/row/@prm_cal = 0">
                        <g id="steps">
                            <xsl:for-each select="$tt">
                                <xsl:variable name="p" select="position()"/>
                                <!--<xsl:if test="$tt[$p] mod $ttick = 0">-->
                                <xsl:if test="((position() - 1) mod $res_mod) = 0">
                                    <xsl:variable name="x1" select="format-number($pw * ($tt[$p] - $tmin) div $trng,'0.00')"/>
                                    <xsl:variable name="y1" select="format-number($ph * (1 - ($vv[$p] - $vinf) div $vrng),'0.00')"/>
                                    <xsl:variable name="x2" select="format-number($pw * ($tt[$p] + $ttick - $tmin) div $trng,'0.00')"/>
                                    <!--<xsl:variable name="y2" select="format-number($ph * (1 - ($vv[$p + 1] - $vinf) div $vrng),'0.0')"/>-->
                                    <xsl:if test="position() != last()">
                                        <line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y1}" stroke="gray" />
                                        <xsl:if test="position() != 0">
                                            <!--<line x1="{$x2}" y1="{$y1}" x2="{$x2}" y2="{$y2}" stroke="gray"  stroke-dasharray="5,5"/>--> 
                                            <circle cx="{$x2}" cy="{$y1}" r="3" stroke="black" fill="white"/>
                                        </xsl:if>
                                    </xsl:if>
                                    <!--<a href="#0" onclick="fn_get('prm.php?mth=edit&amp;res_id={//row/@res_id}&amp;prm_id={//row/@prm_id}&amp;p={$p - 1}',div4);">-->
                                    <a href="javascript:console.log({$p});">
                                        <circle cx="{$x1}" cy="{$y1}" r="3" stroke="black" fill="black"/>
                                    </a>
                                </xsl:if>
                            </xsl:for-each>
                        </g>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- calculated -->
                        <g id="line">
                            <xsl:variable name="line1">
                                <xsl:for-each select="$tt">
                                    <xsl:variable name="i" select="position()"/>
                                    <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
                                    <xsl:variable name="y" select="format-number($ph * (1 - ($vv[$i] - $vinf) div $vrng),'0.00')"/>
                                    <xsl:choose>
                                        <xsl:when test="position()=1">
                                            <xsl:text>M </xsl:text>
                                            <xsl:value-of select="$x"/>
                                            <xsl:text>,</xsl:text>
                                            <xsl:value-of select="$y"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text> L </xsl:text>
                                            <xsl:value-of select="$x"/>
                                            <xsl:text>,</xsl:text>
                                            <xsl:value-of select="$y"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:variable>
                            <path fill="none" stroke="gray" d="{$line1}"/>
                        </g>

                        <g id="dots">
                            <xsl:for-each select="$tt">
                                <xsl:variable name="i" select="position()"/>
                                <!--<xsl:if test="$tt[$i] mod $ttick = 0">-->
                                <xsl:if test="((position() - 1) mod $res_mod) = 0">
                                    <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
                                    <xsl:variable name="y" select="format-number($ph * (1 - ($vv[$i] - $vinf) div $vrng),'0.00')"/>
                                    <circle cx="{$x}" cy="{$y}" r="3" stroke="black" fill="black"/>
                                </xsl:if>
                            </xsl:for-each>
                        </g>
                    </xsl:otherwise>
                </xsl:choose>
               
               
               

            </g>
        </svg>
        <hr/>
        
        <div id="div4"></div>
        
        <!-- table -->
        
        <!--<input type="range" style="transform:rotate(-90deg);"/>-->
        
        <xsl:choose>
            <xsl:when test="tbl[2]/row/@prm_cal = 0">
                

                <table>
                    <tr>
                        <th>res_id</th>
                        <th>prm_id</th>
                        <th>p</th>
                        <th>t</th>
                        <th>u</th>
                    </tr>
                    <xsl:for-each select="tbl[3]/row">
                        <xsl:if test="@t mod $ttick = 0">
                            <xsl:if test="((position() - 1) mod $res_mod) = 0">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@res_id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@prm_id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@p"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="format-number(@t, '0.000')"/>
                                    </td>
                                    <td>
                                        <input style="width:60px;text-align:right;" value="{format-number(@u, '0.000')}" onchange="fn_get('prm.php?mth=ups&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}&amp;u='+this.value, div3);"/>
                                    </td>
                                    <td>
                                        <input type="range" value="{format-number(@u,'0.000')}"  min="{$vinf}" max="{$vsup}" step="{$vtick * 0.5}" onchange="fn_get('prm.php?mth=ups&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}&amp;u='+this.value, div3);"/>
                                    </td>
                                    <td>
                                        <a href="#0" onclick="fn_get('prm.php?mth=clr&amp;res_id={@res_id}&amp;prm_id={@prm_id}&amp;p={@p}', div3);">clear</a>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each> 
                </table>
            </xsl:when>
            <xsl:otherwise>
                <table>
                    <tr>
                        <th>res_id</th>
                        <th>prm_id</th>
                        <th>p</th>
                        <th>t</th>
                        <th>u</th>
                    </tr>
                    <xsl:for-each select="tbl[3]/row">
                        <tr>
                            <td>
                                <xsl:value-of select="@res_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@prm_id"/>
                            </td>
                            <td>
                                <xsl:value-of select="@p"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number(@t, '0.000')"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number(@u, '0.000')"/>
                            </td>
                        </tr>
                    </xsl:for-each> 
                </table>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
   
    
    
    <xsl:template name="hgrid">
        <xsl:param name="vpos"/>
        <xsl:variable name="y" select="format-number($ph * (1 - ($vpos - $vinf) div $vrng),'0.0')"/>
        <text x="{$pw + 50}" y="{$y}" alignment-baseline="middle" text-anchor="end">
            <xsl:value-of select="format-number($vpos,'0.000')"/>
        </text>
        <line x1="0" y1="{$y}" x2="{$pw}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$tdash},{$tdash}" stroke-dashoffset="{$tdash * 0.5}" />
        <xsl:if test="$vpos &lt; $vsup">
            <xsl:call-template name="hgrid">
                <xsl:with-param name="vpos" select="$vpos + $vtick" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
</xsl:stylesheet>

