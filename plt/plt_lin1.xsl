<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="w" select="800"/>
    <xsl:variable name="h" select="600"/>
    
    <xsl:variable name="mw" select="30"/>
    <xsl:variable name="mh" select="40"/>
    
    <xsl:variable name="pw" select="700"/>
    <xsl:variable name="ph" select="400"/>
    
    <xsl:variable name="t_min" select="root/tbl[5]/row/@t_min" />
    <xsl:variable name="t_rng" select="root/tbl[5]/row/@t_rng" />
    <xsl:variable name="t_tic" select="root/tbl[5]/row/@t_tic" />
    
    <xsl:variable name="u_min" select="root/tbl[5]/row/@u_min" />
    <xsl:variable name="u_rng" select="root/tbl[5]/row/@u_rng" />
    <xsl:variable name="u_tic" select="root/tbl[5]/row/@u_tic" />
    
    <xsl:variable name="dash" select="10"/>
    
   
    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            
            <rect width="{$w}" height="{$h}" x="0" y="0" stroke="#DDDDDD" fill="none" />
            
            <g id="title">
                <text x="10" y="20" alignment-baseline="top">
                    <xsl:value-of select="tbl[1]/row/@prm_id"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="tbl[1]/row/@name"/>
                </text>
            </g>

            <g id="plot" transform="translate({$mw},{$mh})">

                <g id="hgrid">       
                    <xsl:call-template name="hgrid">
                        <xsl:with-param name="i" select="0"/>
                        <xsl:with-param name="n" select="format-number($u_rng div $u_tic, '0.0')"/>
                    </xsl:call-template>
                </g>
                
                <g id="vgrid">
                    <xsl:for-each select="tbl[3]/row">
                        <xsl:variable name="x" select="format-number($pw * (@yr - $t_min) div $t_rng,'0.00')"/>
                        <line x1="{$x}" y1="{-$dash}" x2="{$x}" y2="{$ph + $dash}" stroke="lightgray" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{-0.5 * $dash}"/>   
                        <text x="{$x}" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                            <xsl:value-of select="@yr"/>
                        </text>
                    </xsl:for-each>  
                </g> 
                
                <g id="series">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <xsl:variable name="line1">
                            <xsl:for-each select="//root/tbl[4]/row[@scn_id = $scn_id]">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($pw * (@yr - $t_min) div $t_rng,'0.00')"/>
                                <xsl:variable name="y" select="format-number($ph * (1 - (@u - $u_min) div $u_rng),'0.00')"/>
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
                    </xsl:for-each>
                </g>
                
                <g id="series">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <g id="dots">
                            <xsl:for-each select="//root/tbl[4]/row[@scn_id = $scn_id]">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($pw * (@yr - $t_min) div $t_rng,'0.00')"/>
                                <xsl:variable name="y" select="format-number($ph * (1 - (@u - $u_min) div $u_rng),'0.00')"/>
                                <circle cx="{$x}" cy="{$y}" r="2" stroke="#6666FF" fill="#6666FF"/>
<!--                                <text x="{$x}" y="{$y + 20}" text-anchor="middle" alignment-baseline="bottom">
                                    <xsl:value-of select="format-number(@u,'0.000')"/>
                                </text>-->
                            </xsl:for-each>
                        </g>
                    </xsl:for-each>
                </g>
 

                
            </g>
        </svg>
    </xsl:template>
    
    
    <xsl:template name="hgrid">
        <xsl:param name="i"/>
        <xsl:param name="n" select="10"/>
        <xsl:variable name="y" select="format-number($ph * $i * $u_tic div $u_rng,'0.000')"/>
        <text xmlns="http://www.w3.org/2000/svg" x="{$pw + 65}" y="{$y}" alignment-baseline="middle" text-anchor="end">
            <xsl:value-of select="format-number($u_min + ($n - $i) * $u_tic,'0.000')"/>
        </text>
        <line xmlns="http://www.w3.org/2000/svg" x1="{-$dash}" y1="{$y}" x2="{$pw + $dash}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{-0.5 * $dash}" />
        <xsl:if test="$i &lt; $n">
            <xsl:call-template name="hgrid">
                <xsl:with-param name="i" select="$i + 1" />
                <xsl:with-param name="n" select="$n" />
            </xsl:call-template>
        </xsl:if>
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
                
  



    
    



