<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    
    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">1000</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.1 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    
    <xsl:variable name="tt" select="root/row/@t" />
    <xsl:variable name="vv" select="root/row/@v1" />

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
        <xsl:call-template name="min0">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="vmax">
        <xsl:call-template name="max0">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="trng" select="$tmax - $tmin"/>
    <xsl:variable name="vrng" select="$vmax - $vmin"/>
    <xsl:variable name="pzro" select="$ph * $vmax div $vrng"/>
    
    
   
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <xsl:call-template name="title">
                <xsl:with-param name="txt" select="@col_name" />
            </xsl:call-template>
           
    
            <g id="plot" transform="translate({$wo},{$ho})"> 
                
                <g id="hgrid">
                    <line x1="0" y1="{0.0}" x2="{$pw}" y2="{0.0}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="0" y1="{$ph}" x2="{$pw}" y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                </g>
                
                
                <g id="labels">
                    <text x="{$pw + 10}" y="0" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmax,'0.00')"/>
                    </text>
                    <text x="{$pw + 10}" y="{$ph}" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmin,'0.00')"/>
                    </text>
                    <text x="0" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmin,'0.00')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmax,'0.00')"/>
                    </text>
                </g>
                
                <!--                <g id="zero">
                    <xsl:if test="$vmin != 0">
                    
                        <text x="{$pw + 10}" y="{$pzro}" alignment-baseline="middle">
                            <xsl:value-of select="format-number(0,'0.00')"/>
                        </text>
                        <line x1="0" y1="{$pzro}" x2="{$pw}" y2="{$pzro}" stroke="lightgrey" />
                    </xsl:if>
                </g>-->

                
<!--                <g id="bar1">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $v_min) div $v_rng),'0')"/>
                        <rect x="{$x - ($t_w div 2)}" y="{$ph - $y}" width="{$t_w}" height="{$y}" fill="#EEEEFF"/>
                    </xsl:for-each>
                </g>-->
                

                
                
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s10'" />
                    <xsl:with-param name="fill1" select="'#EEEEFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s9'" />
                    <xsl:with-param name="fill1" select="'#DDDDFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s8'" />
                    <xsl:with-param name="fill1" select="'#CCCCFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s7'" />
                    <xsl:with-param name="fill1" select="'#BBBBFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s6'" />
                    <xsl:with-param name="fill1" select="'#AAAAFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s5'" />
                    <xsl:with-param name="fill1" select="'#9999FF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s4'" />
                    <xsl:with-param name="fill1" select="'#8888FF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s3'" />
                    <xsl:with-param name="fill1" select="'#7777FF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s2'" />
                    <xsl:with-param name="fill1" select="'#6666FF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s1'" />
                    <xsl:with-param name="fill1" select="'#5555FF'" />
                </xsl:call-template>
                
                
                                
                <!--<xsl:call-template name="polyline"/>-->
                <!--<xsl:call-template name="bars"/>-->
                <xsl:call-template name="zero"/>
                <xsl:call-template name="line"/>
                <!--<xsl:call-template name="last"/>-->
                <!--<xsl:call-template name="key"/>-->
                <!--<xsl:call-template name="dots"/>-->
                
                <g id="vgrid">
                    <line x1="{( 5.0 div $tmax) * $pw}" x2="{( 5.0 div $tmax) * $pw}" y1="{0.0}"  y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="{(10.0 div $tmax) * $pw}" x2="{(10.0 div $tmax) * $pw}" y1="{0.0}"  y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="{(15.0 div $tmax) * $pw}" x2="{(15.0 div $tmax) * $pw}" y1="{0.0}"  y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="{(20.0 div $tmax) * $pw}" x2="{(20.0 div $tmax) * $pw}" y1="{0.0}"  y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="{(25.0 div $tmax) * $pw}" x2="{(25.0 div $tmax) * $pw}" y1="{0.0}"  y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                </g>
                
              

            </g>
        </svg>
    </xsl:template>
    
    
    <xsl:template name="polyline1">
        <xsl:param name="att1" />
        <xsl:param name="fill1" />
        <xsl:variable name="points">
            <xsl:for-each select="row">
                <xsl:sort select="@t" data-type="number" order="ascending"/>
                <xsl:variable name="x" select="format-number($pw * (@t - $tmin) div $trng,'0.0')"/>
                <xsl:variable name="y" select="format-number($ph * (1 - (@*[name() = $att1] - $vmin) div $vrng),'0.0')"/>
                <!--<xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $vmin) div $vrng),'0.0')"/>-->
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
                        <xsl:value-of select="$pw"/>
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
            <polyline points="{$points}" fill="{$fill1}" stroke="none" />
        </g>
    </xsl:template>
    
    
</xsl:stylesheet>


