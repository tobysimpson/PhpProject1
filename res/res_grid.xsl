<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">1000</xsl:variable>
    
    <xsl:variable name="h1">60</xsl:variable>
    <xsl:variable name="w1">100</xsl:variable>
    
    <xsl:variable name="h2">30</xsl:variable>
    <xsl:variable name="w2">30</xsl:variable>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
        
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>text { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
     
            <xsl:variable name="n1" select="count(root[@name='prc_info']/row[@prc_col = 1])"/>
            <xsl:variable name="n2" select="count(root[@name='prd_info']/row[@prd_col = 2])"/>
            
            <g id="process">
                <xsl:for-each select="root[@name='prc_info']/row">
                    <xsl:variable name="i" select="@prc_row"/>
                    <xsl:variable name="j" select="@prc_col - 1"/>
                    <xsl:variable name="k" select="count(../../root[@name='prd_info']/row[@prd_col &lt; current()/@prc_col])"/>
                    
                    <xsl:variable name="x" select="$j*$w1 + $k*$w2 + $j*$w2 + $w2"/>
                    <xsl:variable name="y" select="$i*$h1 + $i*$h2"/>
            
                    <rect x="{$x}" y="{$y}" width="{$w1}" height="{$h1}" fill="#EEEEFF" stroke="black" rx="5"/>
 
                    <text x="{$x + 0.5*$w1}" y="{$y + 0.5*$h1}" text-anchor="middle" alignment-baseline="middle">
                        <xsl:text>PRC </xsl:text><xsl:value-of select="@prc_id"/>
                    </text>
                </xsl:for-each>
            </g>
            
            
            <g id="product">
                <xsl:for-each select="root[@name='prd_info']/row">
                    <xsl:variable name="i" select="@prd_col"/>
                    <xsl:variable name="j" select="@prd_rnk"/>
                    <xsl:variable name="k" select="count(../row[@prd_col &lt; current()/@prd_col])"/>
                    <!-- spacing , padding -->
                    <xsl:variable name="x" select="$i*$w1 + $k*$w2 + $j*$w2 + $i*$w2"/>
                    <xsl:variable name="y" select="60"/>
                    
                    <line x1="{$x}" x2="{$x}" y1="0" y2="{$h}" stroke="grey"/>

                    <text x="{$x}" y="{$y - 3}" text-anchor="left" alignment-baseline="bottom"  transform="rotate(-90,{$x},{$y})">
                        <xsl:text>PRD </xsl:text><xsl:value-of select="@prd_id"/>
                    </text>
                </xsl:for-each>
            </g>
            
            
            <g id="supply">
                <xsl:for-each select="root[@name='vw_sup']/row">
                    <xsl:variable name="prc" select="../../root[@name='prc_info']/row[@prc_id = current()/@prc_id]"/>
                    <xsl:variable name="prd" select="../../root[@name='prd_info']/row[@prd_id = current()/@prd_id]"/>
                    
                    <xsl:variable name="k1" select="count(../../root[@name='prd_info']/row[@prd_col &lt; $prc/@prc_col])"/>
                    <xsl:variable name="k2" select="count(../../root[@name='prd_info']/row[@prd_col &lt; $prd/@prd_col])"/>
                    
                    <xsl:variable name="x1" select="$prc/@prc_col*$w1 + $k1*$w2 + $prc/@prc_col*$w2"/>
                    <xsl:variable name="x2" select="$prd/@prd_col*$w1 + $k2*$w2 + $prd/@prd_rnk*$w2 + $prd/@prd_col*$w2"/>
                    
                    <xsl:variable name="l" select="count(../row[@prc_id = $prc/@prc_id]) + 1"/>
                    <xsl:variable name="dh" select="$h1 div $l"/>
                    
                    <xsl:variable name="y"  select="format-number($prc/@prc_row*$h1 + $prc/@prc_row*$h2 + current()/@sup_rnk*$dh,'0.00')"/>

                    <line x1="{$x1}" x2="{$x2}" y1="{$y}" y2="{$y}" stroke="grey"/>
                    <circle cx="{$x1}" cy="{$y}" r="3" stroke="grey" fill="white"/>
                    <circle cx="{$x2}" cy="{$y}" r="3" fill="grey"/>
                    
                </xsl:for-each>
            </g>
            
            
            <g id="demand">
                <xsl:for-each select="root[@name='vw_dem']/row">
                    <xsl:variable name="prc" select="../../root[@name='prc_info']/row[@prc_id = current()/@prc_id]"/>
                    <xsl:variable name="prd" select="../../root[@name='prd_info']/row[@prd_id = current()/@prd_id]"/>
                    
                    <xsl:variable name="k1" select="count(../../root[@name='prd_info']/row[@prd_col &lt; $prc/@prc_col])"/>
                    <xsl:variable name="k2" select="count(../../root[@name='prd_info']/row[@prd_col &lt; $prd/@prd_col])"/>
                    
                    <xsl:variable name="x1" select="$prc/@prc_col*$w1 + $k1*$w2 + $prc/@prc_col*$w2 - $w1"/>
                    <xsl:variable name="x2" select="$prd/@prd_col*$w1 + $k2*$w2 + $prd/@prd_rnk*$w2 + $prd/@prd_col*$w2"/>
                    
                    <xsl:variable name="l" select="count(../row[@prc_id = $prc/@prc_id]) + 1"/>
                    <xsl:variable name="dh" select="$h1 div $l"/>
                    
                    <xsl:variable name="y"  select="format-number($prc/@prc_row*$h1 + $prc/@prc_row*$h2 + current()/@dem_rnk*$dh,'0.00')"/>
                    
                    <line x1="{$x1}" x2="{$x2}" y1="{$y}" y2="{$y}" stroke="grey"/>
                    <circle cx="{$x1}" cy="{$y}" r="3" stroke="grey" fill="white"/>
                    <circle cx="{$x2}" cy="{$y}" r="3" fill="grey"/>
                    
                </xsl:for-each>
            </g>
            
            
        </svg>
    </xsl:template>
    
</xsl:stylesheet>

