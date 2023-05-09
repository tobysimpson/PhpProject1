<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">300</xsl:variable>
    <xsl:variable name="w">600</xsl:variable>
    
    <xsl:variable name="ph">200</xsl:variable>
    <xsl:variable name="pw">500</xsl:variable>
    
    <!--    <xsl:include href="../nav.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>-->
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style>
             
            <text x="0" y="20" alignment-baseline="hanging" style="font-weight: bold;">cloud</text>
            
            <g id="plot" transform="translate(0,40)"> 
                <xsl:variable name="t_min">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@t"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:variable name="t_max">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@t"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:variable name="v_min">
                    <xsl:for-each select="row">
                        <xsl:sort select="@cld_v1" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@cld_v1"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="v_max">
                    <xsl:for-each select="row">
                        <xsl:sort select="@cld_v1" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@cld_v1"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

         
                <xsl:variable name="t_rng">
                    <xsl:value-of select="$t_max - $t_min"/>
                </xsl:variable>
                <xsl:variable name="v_rng">
                    <xsl:value-of select="$v_max - $v_min"/>
                </xsl:variable>
            
                <g id="grid">
                    <line x1="0" y1="{$ph * 0.0}" x2="{$pw}" y2="{$ph * 0.0}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.2}" x2="{$pw}" y2="{$ph * 0.2}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.4}" x2="{$pw}" y2="{$ph * 0.4}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.6}" x2="{$pw}" y2="{$ph * 0.6}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.8}" x2="{$pw}" y2="{$ph * 0.8}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 1.0}" x2="{$pw}" y2="{$ph * 1.0}" stroke="lightgrey" />
                </g>
                
                
<!--                <g id="key">
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($t_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($t_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($t_rng,'0.000')"/>
                    </text>
                    <text x="0" y="60">
                        <xsl:value-of select="format-number($v_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($v_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($v_rng,'0.000')"/>
                    </text>
                </g>-->
                
                <g id="labels">
                    <text x="{$pw + 10}" y="0" alignment-baseline="middle">
                        <xsl:value-of select="format-number($v_max,'0.000')"/>
                    </text>
                    <text x="{$pw + 10}" y="{$ph}" alignment-baseline="middle">
                        <xsl:value-of select="format-number($v_min,'0.000')"/>
                    </text>
                    <text x="0" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($t_min,'0')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($t_max,'0')"/>
                    </text>
                    <text x="{$pw + 10}" y="{format-number($ph * (1 - (row[last()]/@cld_v1 - $v_min) div $v_rng),'0.0')}" alignment-baseline="middle" style="font-weight: bold;">
                        <xsl:value-of select="format-number(row[last()]/@cld_v1,'0.000')"/>
                    </text>
                </g>
                
                
         

                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="row">
                            <xsl:sort select="@t" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@cld_v1 - $v_min) div $v_rng),'0')"/>
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
                    <path fill="none" stroke="blue" d="{$line1}"/>
                </g>
               
              
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

