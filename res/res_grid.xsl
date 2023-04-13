<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="h1">50</xsl:variable>
    <xsl:variable name="w1">50</xsl:variable>
    
    <xsl:variable name="h2">50</xsl:variable>
    <xsl:variable name="w2">50</xsl:variable>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
            <!-- title -->
            
            <xsl:variable name="n" select="count(root[@name='prc_info']/row)"/>
            
            <circle cx="10" cy="15" r="5" fill="blue"/>
            <text x="20" y="20">n=<xsl:value-of select="$n"/></text>
            

            <g id="grids">
                <xsl:call-template name="hgrid">
                    <xsl:with-param name="i" select="1" />
                </xsl:call-template>
            
                <xsl:call-template name="vgrid">
                    <xsl:with-param name="i" select="1" />
                </xsl:call-template>
            </g>
            

            <xsl:for-each select="root[@name='prc_info']/row">
                <xsl:variable name="i" select="@prc_row"/>
                <xsl:variable name="j" select="@prc_col"/>
                
                <rect x="{2*$j*$w1}" y="{2*$i*$h1}" width="{$w1}" height="{$h1}" fill="#EEEEFF" stroke="black" rx="{0.2*$w1}"/>
                
                <text x="{(2*$j+0.5)*$w1}" y="{(2*$i+0.5)*$h1}" text-anchor="middle" alignment-baseline="middle">
                    <xsl:value-of select="@prc_name" />
                </text>
            </xsl:for-each>
        </svg>
    </xsl:template>
    
    
    <xsl:template name="hgrid">
        <xsl:param name="i"/>
        <xsl:if test="($i*$h1) &lt; $h">
            <line x1="0" x2="{$w}" y1="{$i*$h1}" y2="{$i*$h1}" stroke="lightgrey" />
            <xsl:call-template name="hgrid">
                <xsl:with-param name="i" select="$i + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="vgrid">
        <xsl:param name="i"/>
        <xsl:if test="($i*$w1) &lt; $w">
            <line y1="0" y2="{$h}" x1="{$i*$w1}" x2="{$i*$w1}" stroke="lightgrey" />
            <xsl:call-template name="vgrid">
                <xsl:with-param name="i" select="$i + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>

