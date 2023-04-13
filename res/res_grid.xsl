<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
            <!-- title -->
            
            <circle cx="10" cy="15" r="5" fill="blue"/>
            <text x="20" y="20">hello</text>
            
 
            <g id="grids">
                <xsl:call-template name="hgrid">
                    <xsl:with-param name="i" select="0" />
                </xsl:call-template>
            
                <xsl:call-template name="vgrid">
                    <xsl:with-param name="i" select="0" />
                </xsl:call-template>
            </g>
            

            <xsl:call-template name="prc_col">
                <xsl:with-param name="i" select="1" />
            </xsl:call-template>
  
        </svg>
    </xsl:template>
    
    
    <xsl:template name="hgrid">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt; 11">
            <line x1="0" x2="{$w}" y1="{$h *0.1*$i}" y2="{$h *0.1*$i}" stroke="lightgrey" />
            <xsl:call-template name="hgrid">
                <xsl:with-param name="i" select="$i + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="vgrid">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt; 11">
            <line y1="0" y2="{$h}" x1="{$w *0.1*$i}" x2="{$w *0.1*$i}" stroke="lightgrey" />
            <xsl:call-template name="vgrid">
                <xsl:with-param name="i" select="$i + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="prc_col">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt; 4">
            <xsl:for-each select="root[@name='prc_info']/row[@prc_col = $i]">
                <text x="{20 + $i*40}" y="{40 + position()*20}">
                    <xsl:value-of select="@prc_name" />
                </text>
            </xsl:for-each>
            <xsl:call-template name="prc_col">
                <xsl:with-param name="i" select="$i + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>

