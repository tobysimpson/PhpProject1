<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    <xsl:variable name="h">400</xsl:variable>
    <xsl:variable name="w">800</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.1 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    
    <xsl:variable name="tt" select="root/row/@t" />
    <xsl:variable name="vv" select="root/row/@u" />
                
    <xsl:variable name="tmin">
        <xsl:call-template name="min">
            <xsl:with-param name="nodes" select="$tt" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="tmax">
        <xsl:call-template name="max">
            <xsl:with-param name="nodes" select="$tt" />
        </xsl:call-template>
    </xsl:variable>
                 
    <xsl:variable name="vmin">
        <xsl:call-template name="min0">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="vmax">
        <xsl:call-template name="max0">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="trng" select="$tmax - $tmin"/>
    <xsl:variable name="vrng" select="$vmax - $vmin"/>
    <xsl:variable name="pzro" select="$ph * $vmax div $vrng"/>
    
   
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <xsl:call-template name="title">
                <xsl:with-param name="txt" select="row/@prm_name" />
            </xsl:call-template>
           
    
            <g id="plot" transform="translate({$wo},{$ho})"> 
                
                <g id="hgrid">
                    <line x1="0" y1="{0.0}" x2="{$pw}" y2="{0.0}" stroke="lightgrey" stroke-dasharray="5,5"/>
                    <line x1="0" y1="{$ph}" x2="{$pw}" y2="{$ph}" stroke="lightgrey" stroke-dasharray="5,5"/>
                </g>
                
                
                <g id="labels">
                    <text x="{$pw + 10}" y="0" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmax,'0.00')"/>
                    </text>
                    <text x="{$pw + 10}" y="{$ph}" alignment-baseline="middle">
                        <xsl:value-of select="format-number($vmin,'0.00')"/>
                    </text>
                    <text x="0" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmin,'0.00')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                        <xsl:value-of select="format-number($tmax,'0.00')"/>
                    </text>
                </g>
                

                <!--                <xsl:call-template name="dots1">
                    <xsl:with-param name="tt" select="$tt" />
                    <xsl:with-param name="vv" select="$vv" />
                </xsl:call-template>-->
                
                
                
                <g id="steps">
                    <xsl:for-each select="$tt">
                        <xsl:variable name="p" select="position()"/>
                        <xsl:variable name="x1" select="format-number($pw * ($tt[$p] - $tmin) div $trng,'0.0')"/>
                        <xsl:variable name="y1" select="format-number($ph * (1 - ($vv[$p] - $vmin) div $vrng),'0.0')"/>
                        <xsl:variable name="x2" select="format-number($pw * ($tt[$p + 1] - $tmin) div $trng,'0.0')"/>
                        <xsl:variable name="y2" select="format-number($ph * (1 - ($vv[$p + 1] - $vmin) div $vrng),'0.0')"/>
                        <xsl:if test="position() != last()">
                            <line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y1}" stroke="gray" />
                            <xsl:if test="position() != 0">
                                <line x1="{$x2}" y1="{$y1}" x2="{$x2}" y2="{$y2}" stroke="gray"  stroke-dasharray="5,5"/> 
                                <circle cx="{$x2}" cy="{$y1}" r="3" stroke="gray" fill="white"/>
                            </xsl:if>
                        </xsl:if>
                        <a href="#0" onclick="fn_get('prm.php?mth=edit&amp;res_id={//row/@res_id}&amp;prm_id={//row/@prm_id}&amp;p={$p - 1}',div4);">
                            <circle cx="{$x1}" cy="{$y1}" r="3" stroke="gray" fill="gray"/>
                        </a>
                    </xsl:for-each>
                </g>
               
            </g>
        </svg>
    </xsl:template>
    
    
</xsl:stylesheet>

