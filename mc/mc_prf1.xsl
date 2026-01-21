<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="w" select="800"/>
    <xsl:variable name="h" select="600"/>
    
    <xsl:variable name="mw" select="30"/>
    <xsl:variable name="mh" select="40"/>
    
    <xsl:variable name="pw" select="680"/>
    <xsl:variable name="ph" select="450"/>
    

    
    <xsl:variable name="u_min" select="root/tbl[4]/row/@u_min" />
    <xsl:variable name="u_max" select="root/tbl[4]/row/@u_max" />
    <xsl:variable name="u_rng" select="root/tbl[4]/row/@u_rng" />
    <xsl:variable name="u_tic" select="root/tbl[4]/row/@u_tic" />
    
    <xsl:variable name="dash" select="5"/>
    <xsl:variable name="cc" select="'FC9630'"/>
    
    <xsl:variable name="x_rng" select="root/tbl[4]/row/@x_rng" />
    <xsl:variable name="bw" select="$pw div $x_rng"/>
    <xsl:variable name="tc" select="$u_rng div $u_tic"/>
    <xsl:variable name="y0" select="$ph * $u_max div $u_rng"/>
    
   
    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <rect width="{$w}" height="{$h}" x="0" y="0" stroke="#DDDDDD" fill="none" />
            
            
            <g id="title">
                <text x="10" y="20" alignment-baseline="top">
                    <xsl:value-of select="tbl[3]/row/@yr"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="tbl[2]/row/@scn_code"/>
<!--                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$x_rng"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$bw"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$u_min"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$u_max"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$u_rng"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="$tc"/>-->
                </text>
            </g>


            <g id="plot" transform="translate({$mw},{$mh})">
                <rect width="{$pw}" height="{$ph}" x="0" y="0" stroke="#DDDDDD" fill="none" />
                <xsl:for-each select="tbl[3]/row">
                    <xsl:variable name="x" select="(position() - 0.5) * $bw"/>
                    <xsl:variable name="h1" select="$ph * @p1 div $u_rng"/>
                    <xsl:variable name="y1" select="$ph * ($u_max - @p1) div $u_rng"/>
                    <xsl:variable name="y2" select="$ph * ($u_max + @p2) div $u_rng"/>
                    <line x1="{$x}" y1="{$y0}" x2="{$x}" y2="{$y1}" stroke="#ffb000" stroke-width="{0.75 * $bw}" fill="none" />
                    <line x1="{$x}" y1="{$y0}" x2="{$x}" y2="{$y2}" stroke="#fe6100"   stroke-width="{0.75 * $bw}" fill="none" />
                    
                    
                    <circle cx="{$x}" cy="{$y0}" r="2" stroke="gray" stroke-width="1" fill="none"/>
                    <circle cx="{$x}" cy="{$y1}" r="4" stroke="blue" stroke-width="1" fill="none"/>
                    <circle cx="{$x}" cy="{$y2}" r="4" stroke="red"  stroke-width="1" fill="none"/>
                </xsl:for-each>
            </g>


                
            
        </svg>
    </xsl:template>
    

</xsl:stylesheet>
