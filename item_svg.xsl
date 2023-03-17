<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="ph">400</xsl:variable>
    <xsl:variable name="pw">600</xsl:variable>
    
    <xsl:include href="layout.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            
            <!--<svg viewBox="{-$w div 2} {-$h div 2} {$w} {$h}" width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" viewBox="0 {-$h} {$w} {$h}">-->
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
   
            <!-- title -->
            <g id="title">
                <circle cx="0" cy="0" r="10" fill="red"/>
                <text x="0" y="10">
                    <xsl:text>hello</xsl:text>
                </text>
            </g>
            
            <g id="plot" transform="translate(100 100)">
                <!-- vars -->
                <xsl:variable name="x_min">
                    <xsl:for-each select="res[@name='item']/row">
                        <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@item_val1"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="x_max">
                    <xsl:for-each select="res[@name='item']/row">
                        <xsl:sort select="@item_val1" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@item_val1"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="y_min">
                    <xsl:for-each select="res[@name='item']/row">
                        <xsl:sort select="@item_val2" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@item_val2"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="y_max">
                    <xsl:for-each select="res[@name='item']/row">
                        <xsl:sort select="@item_val2" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@item_val2"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="x_rng">
                    <xsl:value-of select="$x_max - $x_min"/>
                </xsl:variable>
                <xsl:variable name="y_rng">
                    <xsl:value-of select="$y_max - $y_min"/>
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
                        <xsl:value-of select="format-number($x_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_rng,'0.000')"/>
                    </text>
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($y_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_rng,'0.000')"/>
                    </text>
                </g>
            
                <g id= "dots">
                    <xsl:for-each select="res[@name='item']/row">
                        <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (@item_val1 - $x_min) div $x_rng,'0.000')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@item_val2 - $y_min) div $y_rng),'0.000')"/>
                        <circle cx="{$x}" cy="{$y}" r="5" stroke="red" fill="none"/>
                        <!--                        <text x="{$x}" y="{$y}">
                            <xsl:text>(</xsl:text>
                            <xsl:value-of select="format-number(@item_val1,'0.000')"/>
                            <xsl:text>,</xsl:text>
                            <xsl:value-of select="format-number(@item_val2,'0.000')"/>
                            <xsl:text>)</xsl:text>
                        </text>-->
                    </xsl:for-each>
                </g>

                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="res[@name='item']/row">
                            <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (@item_val1 - $x_min) div $x_rng,'0.000')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@item_val2 - $y_min) div $y_rng),'0.000')"/>
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

