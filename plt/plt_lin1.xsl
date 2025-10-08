<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h" select="200"/>
    <xsl:variable name="w" select="400"/>
    
    <xsl:variable name="t_min" select="root/tbl[5]/row/@t_min" />
    <xsl:variable name="t_rng" select="root/tbl[5]/row/@t_rng" />
    <xsl:variable name="t_tic" select="root/tbl[5]/row/@t_tic" />
    
    <xsl:variable name="u_min" select="root/tbl[5]/row/@u_min" />
    <xsl:variable name="u_rng" select="root/tbl[5]/row/@u_rng" />
    <xsl:variable name="u_tic" select="root/tbl[5]/row/@u_tic" />
   
    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <g id="title" transform="translate(0,10)">
                <text x="0" y="0" alignment-baseline="middle">
                    <xsl:value-of select="tbl[1]/row/@prm_id"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="tbl[1]/row/@path"/>
                </text>
                <text x="0" y="20" alignment-baseline="middle">
                    <xsl:value-of select="format-number(tbl[5]/row/@u_min,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@u_max,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@u_rng,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@u_tic,'0.00000')"/>
                </text>
                <text x="0" y="40" alignment-baseline="middle">
                    <xsl:value-of select="format-number(tbl[5]/row/@t_min,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@t_max,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@t_rng,'0.00000')"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="format-number(tbl[5]/row/@t_tic,'0.00000')"/>
                </text>
            </g>

            <g id="plot" transform="translate(0,0)">
                <rect width="{$w}" height="{$h}" x="0" y="0" rx="10" ry="10" stroke="blue" fill="none" />
                
                <!--                <g id="lines">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="$scn_id"/>
                        <xsl:variable name="line1">
                            <xsl:for-each select="tbl[4]/row[@scn_id = $scn_id]">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($w * (@yr - $t_min) div $t_rng,'0.0000')"/>
                                <xsl:variable name="y" select="format-number($h * (1 - (@u - $u_min) div $u_rng),'0.0000')"/>
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
                    </xsl:for-each>
                    <path fill="none"  d="{$line1}" stroke-width="1" stroke="#6666FF" />
                </g>-->
                

                <g id="range">
                    <circle cx="0" cy="0" r="1" stroke="red" fill="red"/>
                    <circle cx="{$w}" cy="0" r="1" stroke="red" fill="red"/>
                    <circle cx="0" cy="{$h}" r="1" stroke="red" fill="red"/>
                    <circle cx="{$w}" cy="{$h}" r="1" stroke="red" fill="red"/>
                </g>
                
                <g id="series">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <g id="dots">
                            <xsl:for-each select="//root/tbl[4]/row[@scn_id = $scn_id]">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($w * (@yr - $t_min) div $t_rng,'0.0000')"/>
                                <xsl:variable name="y" select="format-number($h * (1 - (@u - $u_min) div $u_rng),'0.0000')"/>
                                <circle cx="{$x}" cy="{$y}" r="2" stroke="#6666FF" fill="#6666FF"/>
                                <text x="{$x}" y="{$y}" text-anchor="middle" alignment-baseline="middle">
                                    <xsl:value-of select="format-number(@u,'0.000')"/>
                                </text>
                            </xsl:for-each>
                        </g>
                    </xsl:for-each>
                </g>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

            
            
<!-- 


<xsl:variable name="pzro" select="format-number($ph * (1 + $vinf div $vrng),'0.0')"/>
<g id="poly">
    <xsl:variable name="points">
        <xsl:for-each select="tbl[2]/row">
            <xsl:sort select="@yr" data-type="number" order="ascending"/>
            <xsl:variable name="x" select="format-number($pw * (@yr - $tmin) div $trng,'0.00')"/>
            <xsl:variable name="y" select="format-number($ph * (1 - (@tj - $vinf) div $vrng),'0.0')"/>
            <xsl:choose>
                <xsl:when test="position()=1">
                    <xsl:text>0,</xsl:text>
                    <xsl:value-of select="$pzro"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$x"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$y"/>
                    <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:when test="position()=last()">
                    <xsl:value-of select="$x"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$y"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$x"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$pzro"/>
                    <xsl:text> </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$x"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="$y"/>
                    <xsl:text> </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:variable>
    <g id="polyline">
        <polyline points="{$points}" fill="#EEEEFF" stroke="none" />
    </g>
</g>-->
                
                
                
<!--                <g id="vgrid">
    <xsl:for-each select="$tt">
        <xsl:variable name="i" select="position()"/>
        <xsl:if test="$tt[$i] mod $ttick = 0">
            <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
            <line x1="{$x}" y1="0" x2="{$x}" y2="{$ph}" stroke="lightgray" stroke-dasharray="{$vdash},{$vdash}" stroke-dashoffset="{$vdash * 0.5}"/>
           
            <g id="label" transform="translate({$x}, {$ph + 10})">
                <text text-anchor="end" transform="rotate(-90)" alignment-baseline="middle">
                    <xsl:value-of select="format-number($tt[$i],'0')"/>
                </text>
            </g>
            
        </xsl:if>
    </xsl:for-each>  
</g> -->
              
              
<!--                <g id="hgrid">       
    <xsl:call-template name="hgrid">
        <xsl:with-param name="vpos" select="$vinf" />
    </xsl:call-template>
</g>-->
                
                
<!--<g id="hist">-->
<!--                    <g id="line1">
    <xsl:variable name="line1">
        <xsl:for-each select="tbl[2]/row">
            <xsl:variable name="i" select="position()"/>
            <xsl:variable name="x" select="format-number($pw * (@yr - $tmin) div $trng,'0.00')"/>
            <xsl:variable name="y" select="format-number($ph * (1 - (@tj - $vinf) div $vrng),'0.00')"/>
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
    <path fill="none"  d="{$line1}" stroke-width="1" stroke="#6666FF" />
</g>-->
                    
<!--                    <g id="reg">
    <xsl:variable name="line2">
        <xsl:for-each select="tbl[2]/row[@yr &gt;= 2005]">
            <xsl:variable name="i" select="position()"/>
            <xsl:variable name="x" select="format-number($pw * (@yr - $tmin) div $trng,'0.00')"/>
            <xsl:variable name="y" select="format-number($ph * (1 - (@reg - $vinf) div $vrng),'0.00')"/>
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
    <path fill="none"  d="{$line2}" stroke-width="1" stroke="#FF6666" />
</g>-->
<!--</g>-->
                
               
<!--                <g id="dots">
    <g id="series">
        <xsl:for-each select="tbl[2]/row">
            <xsl:variable name="i" select="position()"/>
            <xsl:variable name="x" select="format-number($pw * (@yr - $tmin) div $trng,'0.00')"/>
            <xsl:variable name="y" select="format-number($ph * (1 - (@tj - $vinf) div $vrng),'0.00')"/>
            <circle cx="{$x}" cy="{$y}" r="2" stroke="#6666FF" fill="#6666FF"/>
        </xsl:for-each>
    </g>
    
    <g id="reg">
        <xsl:for-each select="tbl[2]/row[@yr &gt;= 2005]">
            <xsl:variable name="i" select="position()"/>
            <xsl:variable name="x" select="format-number($pw * (@yr - $tmin) div $trng,'0.00')"/>
            <xsl:variable name="y" select="format-number($ph * (1 - (@reg - $vinf) div $vrng),'0.00')"/>
            <circle cx="{$x}" cy="{$y}" r="2" stroke="#FF6666" fill="#FFFFFF"/>
        </xsl:for-each>
    </g>
</g>-->
<!--</g>-->
                
  


<!--    <xsl:template name="hgrid">
    <xsl:param name="vpos"/>
    <xsl:variable name="y" select="format-number($ph * (1 - ($vpos - $vinf) div $vrng),'0.00')"/>
    <text xmlns="http://www.w3.org/2000/svg" x="{$pw + 10}" y="{$y}" alignment-baseline="middle" text-anchor="start">
        <xsl:value-of select="format-number($vpos,'#,##0')"/>
        <xsl:value-of select="php:function('sprintf','%5.3E', $vpos)"/>
    </text>
    <line xmlns="http://www.w3.org/2000/svg" x1="0" y1="{$y}" x2="{$pw}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$tdash},{$tdash}" stroke-dashoffset="{$tdash * 0.5}" />
    <xsl:if test="format-number($vpos,'0.000') &lt; format-number($vsup,'0.000')">
        <xsl:call-template name="hgrid">
            <xsl:with-param name="vpos" select="$vpos + $vtick" />
        </xsl:call-template>
    </xsl:if>
</xsl:template>-->
    
    



