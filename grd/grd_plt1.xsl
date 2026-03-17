<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:php="http://php.net/xsl">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <!--<xsl:include href="URI"/>-->
    

    <xsl:template match="root">
        

        <xsl:variable name="w" select="tbl[1]/row/@w"/>
        <xsl:variable name="h" select="tbl[1]/row/@h"/>
        
        
        
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 5pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <rect x="0" y="0" width="{$w}" height="{$h}" stroke="#EEEEEE" stroke-width="1" fill="none" />
            <!--<circle cx="1" cy="1" r="2" stroke="red" fill="none"/> transform="translate(0,{$h}) scale(1,-1)"-->

            <g id="plot">
                <g id="con">
                    <xsl:for-each select="tbl[3]/row">
                        <xsl:variable name="bus1_id" select="@bus1_id"/>
                        <xsl:variable name="bus2_id" select="@bus2_id"/>
                        <xsl:variable name="bus1" select="//root/tbl[2]/row[@bus_id = $bus1_id]"/>
                        <xsl:variable name="bus2" select="//root/tbl[2]/row[@bus_id = $bus2_id]"/>
                        <xsl:variable name="x1" select="$bus1/@x"/>
                        <xsl:variable name="y1" select="$bus1/@y"/>
                        <xsl:variable name="x2" select="$bus2/@x"/>
                        <xsl:variable name="y2" select="$bus2/@y"/>
                        <line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}" stroke="lightgray" stroke-linecap="round"/>
                    </xsl:for-each>
                </g>
                
                <g id="bus">
                    <xsl:for-each select="tbl[2]/row">                   
                        <circle cx="{@x}" cy="{@y}" r="2.5" stroke="blue" stroke-width="1" fill="none" />
                        <text x="{@x + 4}" y="{@y}" alignment-baseline="middle" text-anchor="start">
                            <!--                            <xsl:text>(</xsl:text>
                            <xsl:value-of select="format-number(@x_pos,'0.000')"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="format-number(@y_pos,'0.000')"/>
                            <xsl:text>)</xsl:text>-->
                            <xsl:value-of select="@bus_lbl"/>
                        </text>
                    </xsl:for-each>
                </g>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>
