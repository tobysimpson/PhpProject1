<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
        
    <xsl:variable name="h">60</xsl:variable>
    <xsl:variable name="w">100</xsl:variable>

    <xsl:variable name="tt" select="root/tbl[2]/row/@yr" />
    <xsl:variable name="vv" select="root/tbl[2]/row/@*[name()='tj' or name()='v']" />
    
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
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg">
            <g id="plot"> 
                <g id="lines">

                    <xsl:variable name="pzro" select="format-number($h * (1 + $vmin div $vrng),'0.0')"/>
                    <g id="poly">
                        <xsl:variable name="points">
                            <xsl:for-each select="tbl[2]/row">
                                <xsl:sort select="@yr" data-type="number" order="ascending"/>
                                <xsl:variable name="x" select="format-number($w * (@yr - $tmin) div $trng,'0.0')"/>
                                <xsl:variable name="y" select="format-number($h * (1 - (@tj - $vmin) div $vrng),'0.0')"/>
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
                                        <xsl:value-of select="$w"/>
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
                    </g>
    
                    <g id="line">
                        <xsl:variable name="line1">
                            <xsl:for-each select="tbl[2]/row">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($w * (@yr - $tmin) div $trng,'0.00')"/>
                                <xsl:variable name="y" select="format-number($h * (1 - (@tj - $vmin) div $vrng),'0.00')"/>
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
                    </g>
                    
                    
                    <g id="line">
                        <xsl:variable name="line2">
                            <xsl:for-each select="tbl[2]/row">
                                <xsl:variable name="i" select="position()"/>
                                <xsl:variable name="x" select="format-number($w * (@yr - $tmin) div $trng,'0.00')"/>
                                <xsl:variable name="y" select="format-number($h * (1 - (@v - $vmin) div $vrng),'0.00')"/>
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
                    </g>
                </g>
            </g>
        </svg>
    </xsl:template>
    



    
</xsl:stylesheet>


