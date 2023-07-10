<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    
    <xsl:variable name="h">200</xsl:variable>
    <xsl:variable name="w">600</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.05 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    

    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
            
           
            <g id="plot" transform="translate({$wo},{$ho})"> 
                
                
                <xsl:variable name="tt" select="row/@t" />
                <xsl:variable name="vv" select="row/@v1" />
                
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
                
                <xsl:variable name="trng" select="$tmax - $tmin"/>
             
                
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
                
                <xsl:variable name="vrng" select="$vmax - $vmin"/>
                <xsl:variable name="vzro" select="$ph * $vmax div $vrng"/>

            
                <g id="grid">
                    <line x1="0" y1="{0.0}" x2="{$pw}" y2="{0.0}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph}" x2="{$pw}" y2="{$ph}" stroke="lightgrey" />
                    <line x1="0" y1="{$vzro}" x2="{$pw}" y2="{$vzro}" stroke="black" />
                </g>
                
                
                <g id="key">
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($tmin,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($tmax,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($trng,'0.000')"/>
                    </text>
                    <text x="0" y="60">
                        <xsl:value-of select="format-number($vmin,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($vmax,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($vrng,'0.000')"/>
                    </text>
                </g>
                
                <g id="dots">
                    <xsl:call-template name="dots">
                        <xsl:with-param name="nodes" select="row"/>
                        <xsl:with-param name="ph" select="$ph"/>
                        <xsl:with-param name="pw" select="$pw"/>
                        <xsl:with-param name="tmin" select="$tmin"/>
                        <xsl:with-param name="trng" select="$trng"/>
                        <xsl:with-param name="vmin" select="$vmin"/>
                        <xsl:with-param name="vrng" select="$vrng"/>
                    </xsl:call-template>
                </g>
                
                
                <g id="labels">
                    <text x="{$pw + 10}" y="0" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmax,'0')"/>
                    </text>
                    <text x="{$pw + 10}" y="{$ph}" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmin,'0')"/>
                    </text>
                    <text x="0" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmin,'0')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmax,'0')"/>
                    </text>
<!--                    <text x="{$pw + 10}" y="{format-number($ph * (1 - (row[last()]/@v1 - $vmin) div $vrng),'0.0')}" alignment-baseline="middle" style="font-weight: bold;">
                        <xsl:value-of select="format-number(row[last()]/@v1,'0.000')"/>
                    </text>-->
                </g>
                
                
                <!--                <g id="bar1">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $v_min) div $v_rng),'0')"/>
                        <rect x="{$x - ($t_w div 2)}" y="{$ph - $y}" width="{$t_w}" height="{$y}" fill="#EEEEFF"/>
                    </xsl:for-each>
                </g>-->
                
                <!--                <g id="dots1">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $v_min) div $v_rng),'0')"/>
                        <circle cx="{$x}" cy="{$y}" r="1" fill="blue"/>
                    </xsl:for-each>
                </g>-->
                

                <!--                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="row">
                            <xsl:sort select="@t" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $v_min) div $v_rng),'0')"/>
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
                    <path fill="none" stroke="blue" d="{$line1}" stroke-width="0.25"/>
                </g>-->
                
                <!--<circle cx="{$pw}" cy="{format-number($ph * (1 - (row[last()]/@v1 - $v_min) div $v_rng),'0')}" r="2" fill="blue"/>--> 
              
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

