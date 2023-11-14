<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:include href="../plot.xsl"/>
    
    
    <xsl:variable name="h">600</xsl:variable>
    <xsl:variable name="w">1000</xsl:variable>
    
    <xsl:variable name="ph" select="0.8 * $h"/>
    <xsl:variable name="pw" select="0.8 * $w"/>
    
    <xsl:variable name="ho" select="0.1 * $h"/>
    <xsl:variable name="wo" select="0.05 * $w"/>
    
    <xsl:variable name="tt" select="root/tbl[1]/row/@t" />
    <xsl:variable name="v1" select="root/tbl[1]/row/@v1" />
    <xsl:variable name="v2" select="root/tbl[1]/row/@v2" />
    <xsl:variable name="vv" select="root/tbl[1]/row/@v1 | root/tbl[1]/row/@s7" />

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
            <xsl:with-param name="nodes" select="$v2" />
        </xsl:call-template>
    </xsl:variable>
                
    <xsl:variable name="vmax">
        <xsl:call-template name="max0">
            <xsl:with-param name="nodes" select="$vv" />
        </xsl:call-template>
    </xsl:variable>
                
                
                
    <xsl:variable name="ttick" select="1"/>
    <xsl:variable name="vtick" select="1"/>
                
    <xsl:variable name="trng" select="$tmax - $tmin"/>
    <xsl:variable name="vinf" select="(floor($vmin div $vtick)) * $vtick"/>
    <xsl:variable name="vsup" select="(ceiling($vmax div $vtick)) * $vtick"/>
    <xsl:variable name="vrng" select="$vsup - $vinf"/>
    <xsl:variable name="pzro" select="$ph * $vsup div $vrng"/>
                
                
    <xsl:variable name="tdash" select="$pw * $ttick div $trng * 0.125"/>
    <xsl:variable name="vdash" select="$ph * $vtick div $vrng * 0.125"/>
    
    
   
    <xsl:template match="root">
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <xsl:call-template name="title">
                <xsl:with-param name="txt" select="@col_name" />
            </xsl:call-template>
           
    
            <g id="plot" transform="translate({$wo},{$ho})"> 
                
 
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s7'" />
                    <xsl:with-param name="fill1" select="'#EEEEFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s6'" />
                    <xsl:with-param name="fill1" select="'#DDDDFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s5'" />
                    <xsl:with-param name="fill1" select="'#CCCCFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s4'" />
                    <xsl:with-param name="fill1" select="'#BBBBFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s3'" />
                    <xsl:with-param name="fill1" select="'#AAAAFF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s2'" />
                    <xsl:with-param name="fill1" select="'#9999FF'" />
                </xsl:call-template>
                <xsl:call-template name="polyline1">
                    <xsl:with-param name="att1" select="'s1'" />
                    <xsl:with-param name="fill1" select="'#8888FF'" />
                </xsl:call-template>


                
       
                <g id="vgrid">
                    <xsl:for-each select="$tt">
                        <xsl:variable name="i" select="position()"/>
                        <xsl:if test="$tt[$i] mod $ttick = 0">
                            <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
                            <line x1="{$x}" y1="0" x2="{$x}" y2="{$ph}" stroke="lightgray" stroke-dasharray="{$vdash},{$vdash}" stroke-dashoffset="{$vdash * 0.5}"/>
                            <text x="{$x}" y="{$ph + 10}" text-anchor="middle" alignment-baseline="hanging">
                                <xsl:value-of select="format-number($tt[$i],'0.000')"/>
                            </text>
                        </xsl:if>
                    </xsl:for-each>  
                </g> 
              
              
                <g id="hgrid">       
                    <xsl:call-template name="hgrid">
                        <xsl:with-param name="vpos" select="$vinf" />
                    </xsl:call-template>
                </g>
                
                
                <xsl:call-template name="line2">
                    <xsl:with-param name="tt" select="$tt" />
                    <xsl:with-param name="vv" select="$v1" />
                </xsl:call-template>
                
                <xsl:call-template name="line2">
                    <xsl:with-param name="tt" select="$tt" />
                    <xsl:with-param name="vv" select="$v2" />
                </xsl:call-template>
              
            </g>
        </svg>
    </xsl:template>
    
    
    <xsl:template name="polyline1">
        <xsl:param name="att1" />
        <xsl:param name="fill1" />
        <xsl:variable name="points">
            <xsl:for-each select="tbl[1]/row">
                <xsl:sort select="@t" data-type="number" order="ascending"/>
                <xsl:variable name="x" select="format-number($pw * (@t - $tmin) div $trng,'0.0')"/>
                <xsl:variable name="y" select="format-number($ph * (1 - (@*[name() = $att1] - $vmin) div $vrng),'0.0')"/>
                <!--<xsl:variable name="y" select="format-number($ph * (1 - (@v1 - $vmin) div $vrng),'0.0')"/>-->
                <xsl:choose>
                    <xsl:when test="position()=1">
                        <xsl:text>0,</xsl:text>
                        <xsl:value-of select="$pzro"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$x"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="$y"/>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <xsl:when test="position()=last()">
                        <xsl:value-of select="$x"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="$y"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$pw"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="$pzro"/>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$x"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="$y"/>
                        <xsl:text> </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <g id="polyline">
            <polyline points="{$points}" fill="{$fill1}" stroke="none" />
        </g>
    </xsl:template>
    
    <xsl:template name="line2">
        <xsl:param name="tt"/>
        <xsl:param name="vv"/>
        <g id="line">
            <xsl:variable name="line1">
                <xsl:for-each select="$tt">
                    <xsl:variable name="i" select="position()"/>
                    <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.00')"/>
                    <xsl:variable name="y" select="format-number($ph * (1 - ($vv[$i] - $vinf) div $vrng),'0.00')"/>
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
            <path fill="none" stroke="gray" d="{$line1}"/>
        </g>
    </xsl:template>
    
    <!--    <xsl:template name="line2">
        <xsl:param name="tt"/>
        <xsl:param name="vv"/>
        <xsl:variable name="line1">
            <xsl:for-each select="$tt">
                <xsl:variable name="i" select="position()"/>
                <xsl:variable name="x" select="format-number($pw * ($tt[$i] - $tmin) div $trng,'0.0')"/>
                <xsl:variable name="y" select="format-number($ph * (1 - ($vv[$i] - $vmin) div $vrng),'0.0')"/>
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
        <g id="line">
            <path fill="none" stroke="black" d="{$line1}" stroke-width="1"/>
        </g>
    </xsl:template>-->
    
    
    
    <xsl:template name="hgrid">
        <xsl:param name="vpos"/>
        <xsl:variable name="y" select="format-number($ph * (1 - ($vpos - $vinf) div $vrng),'0.0')"/>
        <text x="{$pw + 50}" y="{$y}" alignment-baseline="middle" text-anchor="end">
            <xsl:value-of select="format-number($vpos,'0.000')"/>
        </text>
        <line x1="0" y1="{$y}" x2="{$pw}" y2="{$y}" stroke="lightgrey" stroke-dasharray="{$tdash},{$tdash}" stroke-dashoffset="{$tdash * 0.5}" />
        <xsl:if test="$vpos &lt; $vsup">
            <xsl:call-template name="hgrid">
                <xsl:with-param name="vpos" select="$vpos + $vtick" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
</xsl:stylesheet>


