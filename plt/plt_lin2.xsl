<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:php="http://php.net/xsl">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="w" select="800"/>
    <xsl:variable name="h" select="550"/>
    
    <xsl:variable name="mw" select="30"/>
    <xsl:variable name="mh" select="40"/>
    
    <xsl:variable name="pw" select="680"/>
    <xsl:variable name="ph" select="450"/>
    
    <xsl:variable name="t_min" select="root/tbl[5]/row/@t_min" />
    <xsl:variable name="t_rng" select="root/tbl[5]/row/@t_rng" />
    <xsl:variable name="t_tic" select="root/tbl[5]/row/@t_tic" />
    
    <xsl:variable name="u_min" select="root/tbl[5]/row/@u_min" />
    <xsl:variable name="u_rng" select="root/tbl[5]/row/@u_rng" />
    <xsl:variable name="u_tic" select="root/tbl[5]/row/@u_tic" />
    
    <xsl:variable name="dash" select="5"/>
    <xsl:variable name="cc" select="'FC9630'"/>
    
    
    <xsl:template name="fmt">
        <xsl:param name="x"/>
        <xsl:if test="number($x) = number($x)">
            <xsl:value-of select="php:function('sprintf','%6.3e', number($x))"/>
        </xsl:if>
    </xsl:template>
    
   
    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <!--<rect width="{$w}" height="{$h}" x="0" y="0" stroke="#DDDDDD" fill="none" />-->
            
            <g id="title">
                <text x="10" y="20" alignment-baseline="top">
                    <xsl:value-of select="tbl[1]/row/@prm_id"/>
                    <xsl:text> - </xsl:text>
                    <xsl:value-of select="tbl[1]/row/@name"/>
                    <xsl:if test="not(tbl[1]/row/@unit = '')">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="tbl[1]/row/@unit"/>
                        <xsl:text>)</xsl:text> 
                    </xsl:if>
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
                        <line x1="{$x}" y1="0" x2="{$x}" y2="{$ph}" stroke="lightgray" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{0.5 * $dash}"/>   
                        <!--<line x1="{$x}" y1="{-$dash}" x2="{$x}" y2="{$ph + $dash}" stroke="lightgray" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{-0.5 * $dash}"/>-->   
                        <!--<line x1="{$x}" y1="{-$dash}" x2="{$x}" y2="{$ph + $dash}" stroke="lightgray" />-->  
                        <text x="{$x}" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                            <xsl:value-of select="@yr"/>
                        </text>
                    </xsl:for-each>  
                </g> 
                
                <g id="series">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <xsl:variable name="c" select="substring($cc,position(),1)"/>
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
                        <path fill="none" d="{$line1}" stroke-width="1" stroke="{concat('#6666',$c,$c)}"/>
                    </xsl:for-each>
                </g>
                
                <g id="series">
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <xsl:variable name="c" select="substring($cc,position(),1)"/>
                        <g id="dots">
                            <xsl:for-each select="//root/tbl[4]/row[@scn_id = $scn_id]">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($pw * (@yr - $t_min) div $t_rng,'0.00')"/>
                                <xsl:variable name="y" select="format-number($ph * (1 - (@u - $u_min) div $u_rng),'0.00')"/>
                                <circle cx="{$x}" cy="{$y}" r="2" stroke="{concat('#6666',$c,$c)}" fill="{concat('#6666',$c,$c)}"/>
                                          
                                <!--                                <text x="{$x}" y="{$y + 20}" text-anchor="middle" alignment-baseline="bottom">
                                    <xsl:value-of select="format-number(@u,'0.000')"/>
                                </text>-->
                            </xsl:for-each>
                        </g>
                    </xsl:for-each>
                </g>
            </g>
            
            <g id="key" transform="translate({$mw + 100},{$mh + $ph + 45})">
                <xsl:for-each select="tbl[2]/row">
                    <xsl:variable name="i" select="position()"/>
                    <xsl:variable name="x" select="($i - 1) * 120"/>
                    <xsl:variable name="c" select="substring($cc,$i,1)"/>
                    <line x1="{$x}" x2="{$x + 20}" y1="0" y2="0" stroke-width="2" stroke="{concat('#6666',$c,$c)}"/>
                    <text x="{$x + 30}" y="0" text-anchor="left" alignment-baseline="middle">
                        <xsl:value-of select="@scn_code"/>
                    </text>
                </xsl:for-each>
            </g>
            
        </svg>
    </xsl:template>
    
    
    <xsl:template name="hgrid">
        <xsl:param name="i"/>
        <xsl:param name="n" select="10"/>
        <xsl:variable name="y" select="format-number($ph * $i * $u_tic div $u_rng,'0.000')"/>
        <text xmlns="http://www.w3.org/2000/svg" x="{$pw + 80}" y="{$y}" alignment-baseline="middle" text-anchor="end">
            <!--<xsl:value-of select="format-number($u_min + ($n - $i) * $u_tic,'0.000')"/>-->
            <xsl:call-template name="fmt">
                <xsl:with-param name="x" select="$u_min + ($n - $i) * $u_tic"/>
            </xsl:call-template>
        </text>
        <!--<line xmlns="http://www.w3.org/2000/svg" x1="{-$dash}" y1="{$y}" x2="{$pw + $dash}" y2="{$y}" stroke="lightgrey"/>-->
        <!--        <line xmlns="http://www.w3.org/2000/svg" x1="{-$dash}" y1="{$y}" x2="{$pw + $dash}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{-0.5 * $dash}" />-->
        <line xmlns="http://www.w3.org/2000/svg" x1="0" y1="{$y}" x2="{$pw}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$dash},{$dash}" stroke-dashoffset="{0.5 * $dash}" />
        <xsl:if test="$i &lt; $n">
            <xsl:call-template name="hgrid">
                <xsl:with-param name="i" select="$i + 1" />
                <xsl:with-param name="n" select="$n" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
</xsl:stylesheet>
