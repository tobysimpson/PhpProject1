<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="w" select="800"/>
    <xsl:variable name="h" select="600"/>
    
    <xsl:variable name="mw" select="10"/>
    <xsl:variable name="mh" select="30"/>
    
    <xsl:variable name="pw" select="600"/>
    <xsl:variable name="ph" select="560"/>
    

    
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
    <xsl:variable name="x0" select="$mw + $pw"/>
    
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>
   
    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <rect width="{$w}" height="{$h}" x="0" y="0" stroke="#DDDDDD" fill="none" />
            
            
            <g id="title">
                <text x="10" y="20" alignment-baseline="top">
                    <xsl:value-of select="tbl[3]/row/@yr"/>
                    <xsl:text> - </xsl:text>
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
                <g id="bars">
                    <xsl:for-each select="tbl[3]/row">
                        <xsl:variable name="prm_id" select="@prm_id"/>
                        <xsl:variable name="x" select="(position() - 0.5) * $bw"/>
                        <xsl:variable name="h1" select="$ph * @p1 div $u_rng"/>
                        <xsl:variable name="y1" select="$ph * ($u_max - @p1) div $u_rng"/>
                        <xsl:variable name="y2" select="$ph * ($u_max + @p2) div $u_rng"/>
                        <xsl:variable name="y3" select="$ph * ($u_max - @phi) div $u_rng"/>
                        <line x1="{$x}" y1="{$y0}" x2="{$x}" y2="{$y1}" stroke="#ffb000" stroke-width="{0.75 * $bw}"/>
                        <line x1="{$x}" y1="{$y0}" x2="{$x}" y2="{$y2}" stroke="#fe6100"   stroke-width="{0.75 * $bw}"/>
                        <line x1="{$x}" y1="{$y3}" x2="{$x0}" y2="{$y3}" stroke="#cccccc" stroke-width="1" stroke-dasharray="5,5"/>
                        <text x="{$x0+5}" y="{$y3}" alignment-baseline="middle">
                            <xsl:value-of select="format-number(@phi,'#,##0.000','fmt1')"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//root/tbl[1]/row[@prm_id = $prm_id]/@prm_name"/>
                        </text>
                        <circle cx="{$x}" cy="{$y3}" r="4" stroke-width="2" stroke="black" fill="none"/>
                    </xsl:for-each>
                </g>

                
                <line x1="0" y1="{$y0}" x2="{$pw}" y2="{$y0}" stroke="#999999"   stroke-width="1" />
                <g id="line">
                    <xsl:variable name="line1">
                        <xsl:for-each select="tbl[3]/row">
                            <xsl:variable name="i" select="position()"/>
                            <xsl:variable name="x" select="(position() - 0.5) * $bw"/>
                            <xsl:variable name="y" select="$ph * ($u_max - @phi) div $u_rng"/>
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
                    <path fill="none" d="{$line1}" stroke="black" stroke-width="2" stroke-linecap="round"/>
                </g>
                
            </g>


                
            
        </svg>
    </xsl:template>
    

</xsl:stylesheet>
