<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.05 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    
    <xsl:variable name="tt" select="root/row/@t" />
    <xsl:variable name="vv" select="root/row/@d4" />
                
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
        <xsl:call-template name="max">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="trng" select="$tmax - $tmin"/>
    <xsl:variable name="vrng" select="$vmax - $vmin"/>
    <xsl:variable name="pzro" select="$ph * $vmax div $vrng"/>
    
    
   
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
            
           
            <g id="plot" transform="translate({$wo},{$ho})"> 
                
 
                <xsl:call-template name="grid"/>
                <xsl:call-template name="labels"/>
                <!--<xsl:call-template name="polyline"/>-->
                <!--<xsl:call-template name="zero"/>-->
                

                
                
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'d4'" />
                    <xsl:with-param name="fill1" select="'#CCCCFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'d3'" />
                    <xsl:with-param name="fill1" select="'#BBBBFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'d2'" />
                    <xsl:with-param name="fill1" select="'#AAAAFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'d1'" />
                    <xsl:with-param name="fill1" select="'#9999FF'" />
                </xsl:call-template>
                
                <!--<xsl:call-template name="dots"/>-->
                <!--<xsl:call-template name="key"/>-->
                
              
            </g>
        </svg>
    </xsl:template>
    
    
    
    <xsl:template name="line1">
        <xsl:param name="att1" />
        <xsl:variable name="line1">
            <xsl:for-each select="row">
                <xsl:sort select="@t" data-type="number" order="ascending"/>
                <xsl:variable name="x" select="format-number($pw * (@t - $tmin) div $trng,'0.0')"/>
                <xsl:variable name="y" select="format-number($ph * (1 - (@*[name() = $att1] - $vmin) div $vrng),'0.0')"/>
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
        <g id="line">
            <path fill="none" stroke="blue" d="{$line1}" stroke-width="0.5"/>
        </g>
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

