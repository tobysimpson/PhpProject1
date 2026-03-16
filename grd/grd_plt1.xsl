<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:php="http://php.net/xsl">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>


    

    <xsl:template match="root">
        
        <xsl:variable name="s" select="400"/>
        
        <xsl:variable name="x_min" select="$s * tbl[1]/row/@x_min"/>
        <xsl:variable name="x_max" select="$s * tbl[1]/row/@x_max"/>
        <xsl:variable name="y_min" select="$s * tbl[1]/row/@y_min"/>
        <xsl:variable name="y_max" select="$s * tbl[1]/row/@y_max"/>
    
        <xsl:variable name="w" select="$x_max - $x_min"/>
        <xsl:variable name="h" select="$y_max - $y_min"/>
        
        
        
        <svg viewBox="{$x_min} {$y_min} {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 8pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <rect width="{$w}" height="{$h}" x="{$x_min}" y="{$y_min}" stroke="#EEEEEE" stroke-width="1" fill="none" />
            <!--<circle cx="1" cy="1" r="2" stroke="red" fill="none"/> transform="translate(0,{$h}) scale(1,-1)"-->

            <g id="plot">
                <xsl:for-each select="tbl[3]/row">
                    <g id="con">
                        <xsl:variable name="bus1_id" select="@bus1_id"/>
                        <xsl:variable name="bus2_id" select="@bus2_id"/>
                        <xsl:variable name="bus1" select="//root/tbl[2]/row[@bus_id = $bus1_id]"/>
                        <xsl:variable name="bus2" select="//root/tbl[2]/row[@bus_id = $bus2_id]"/>
                        <xsl:variable name="x1" select="$s * $bus1/@x_pos"/>
                        <xsl:variable name="y1" select="$s * $bus1/@y_pos"/>
                        <xsl:variable name="x2" select="$s * $bus2/@x_pos"/>
                        <xsl:variable name="y2" select="$s * $bus2/@y_pos"/>
                        
                        <line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}" stroke="lightgray" stroke-linecap="round"/>

                    </g>
                </xsl:for-each>
                
                <xsl:for-each select="tbl[2]/row">
                    <g id="bus">
                        <xsl:variable name="x" select="$s * @x_pos"/>
                        <xsl:variable name="y" select="$s * @y_pos"/>
                        <circle cx="{$x}" cy="{$y}" r="2" stroke="blue" stroke-width="1" fill="none" />
                        <text x="{$x}" y="{$y}" alignment-baseline="top" text-anchor="middle">
                            <xsl:value-of select="@bus_name"/>
                        </text>
                    </g>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
