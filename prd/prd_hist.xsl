<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="ph">400</xsl:variable>
    <xsl:variable name="pw">600</xsl:variable>
    
    <xsl:include href="../nav.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
            <!-- title -->
            <!--            <g id="title">
                <circle cx="10" cy="15" r="5" fill="blue"/>
                <text x="20" y="20">
                    <a href="index.php">
                        <xsl:text>SVG test</xsl:text>
                    </a>
                </text>
            </g>-->
            
            <g id="plot" transform="translate(100,100)"> 
                <xsl:variable name="t_tot">
                    <xsl:value-of select="count(row)+1"/>
                </xsl:variable>
                <xsl:variable name="t_w">
                    <xsl:value-of select="format-number($pw div $t_tot,'0.0000')"/>
                </xsl:variable>
                    
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
                <xsl:variable name="p_min">
                    <xsl:for-each select="row">
                        <xsl:sort select="@px" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@px"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="p_max">
                    <xsl:for-each select="row">
                        <xsl:sort select="@px" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@px"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="q_min">
                    <xsl:for-each select="row">
                        <xsl:sort select="@qty" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@qty"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="q_max">
                    <xsl:for-each select="row">
                        <xsl:sort select="@qty" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@qty"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="t_rng">
                    <xsl:value-of select="$t_max - $t_min"/>
                </xsl:variable>
                <xsl:variable name="p_rng">
                    <xsl:value-of select="$p_max - $p_min"/>
                </xsl:variable>
                <xsl:variable name="q_rng">
                    <xsl:value-of select="$q_max - $q_min"/>
                </xsl:variable>
            
                <g id="grid">
                    <line x1="0" y1="{$ph * 0.0}" x2="{$pw}" y2="{$ph * 0.0}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.2}" x2="{$pw}" y2="{$ph * 0.2}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.4}" x2="{$pw}" y2="{$ph * 0.4}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.6}" x2="{$pw}" y2="{$ph * 0.6}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 0.8}" x2="{$pw}" y2="{$ph * 0.8}" stroke="lightgrey" />
                    <line x1="0" y1="{$ph * 1.0}" x2="{$pw}" y2="{$ph * 1.0}" stroke="lightgrey" />
                </g>
         
                <g id="key">
                    <text x="0" y="20">
                        <xsl:value-of select="$t_tot"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($t_w,'0.000')"/>
                    </text>
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($t_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($t_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($t_rng,'0.000')"/>
                    </text>
                    <text x="0" y="60">
                        <xsl:value-of select="format-number($p_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($p_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($p_rng,'0.000')"/>
                    </text>
                    <text x="0" y="80">
                        <xsl:value-of select="format-number($q_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($q_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($q_rng,'0.000')"/>
                    </text>
                </g>
                
                <g id="bar1">
                    <xsl:for-each select="row">
                        <xsl:sort select="@t" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0.000')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@qty - $q_min) div $q_rng),'0.000')"/>
                        <rect x="{$x - ($t_w div 2)}" y="{$ph - $y}" width="{$t_w}" height="{$y}" fill="#EEEEFF"/>
                    </xsl:for-each>
                </g>

                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="row">
                            <xsl:sort select="@t" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0.000')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@px - $p_min) div $p_rng),'0.000')"/>
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
                

                                
                <g id="line2">
                    <xsl:variable name="line2">
                        <xsl:for-each select="row">
                            <xsl:sort select="@t" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (@t - $t_min) div $t_rng,'0.000')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@qty - $q_min) div $q_rng),'0.000')"/>
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
                    <path fill="none" stroke="red" d="{$line2}"/>
                </g>
                

            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>

