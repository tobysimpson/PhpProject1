<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="layout.xsl"/>
    
    <xsl:variable name="w">800</xsl:variable>
    <xsl:variable name="h">600</xsl:variable>
    
    <xsl:variable name="pw">600</xsl:variable>
    <xsl:variable name="ph">400</xsl:variable>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <div id="body">
            <xsl:apply-templates select="res[@name='pdt']"/>
            <xsl:apply-templates select="res[@name='pda']"/>
            <xsl:apply-templates select="res[@name='mark']" mode="eig"/>
            <xsl:apply-templates select="res[@name='mark']" mode="pay"/>
            <xsl:apply-templates select="res[@name='R']"/>
            <xsl:apply-templates select="res[@name='s']"/>
        </div>
    </xsl:template>

       
    <xsl:template match="res[@name='pdt']/row">
        <h1>
            <i>game:</i>
        </h1>
        <table class="table2">
            <tr>
                <th>pdt_id</th>
                <td>
                    <xsl:value-of select="@pdt_id"/>
                </td>
            </tr>
            <tr>
                <th>pdt_name</th>
                <td>
                    <xsl:value-of select="@pdt_name"/>
                </td>
            </tr>
            <tr>
                <th>payoff</th>
                <td>
                    <table border="2">
                        <tr>
                            <td>cc=<xsl:value-of select="@pdt_r1"/></td>
                            <td>cd=<xsl:value-of select="@pdt_r2"/></td>
                        </tr>
                        <tr>
                            <td>dc=<xsl:value-of select="@pdt_r3"/></td>
                            <td>dd=<xsl:value-of select="@pdt_r4"/></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <p/>
    </xsl:template>
    
    <xsl:template match="res[@name='pda']">
        <h1>
            <i>agents:</i>
        </h1>
        <table class="table1">
            <tr>
                <th>pda_id</th>
                <th>pda_name</th>
                <th>pda_p1</th>
                <th>pda_p2</th>
                <th>pda_p3</th>
                <th>pda_p4</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@pda_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@pda_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p1, '###,##0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p2, '###,##0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p3, '###,##0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p4, '###,##0.0000')"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <p/>
    </xsl:template>
    
    
    <xsl:template match="res[@name='mark']" mode="eig">
        <h1>
            <i>markov matrices &amp; eigenvectors:</i>
        </h1>
        <table border="1">
            <tr>
                <th/>
                <xsl:for-each select="mrow[1]/mcol">
                    <th colspan="2">
                        <xsl:value-of select="@pda_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="mrow">
                <tr>
                    <th>
                        <xsl:value-of select="@pda_name"/>
                    </th>
                    <xsl:for-each select="mcol">
                        <td>
                            <table border="1">
                                <xsl:for-each select="res/row">
                                    <tr>
                                        <xsl:for-each select="@*">
                                            <td>
                                                <xsl:value-of select="format-number(current(), '0.000')"/>
                                            </td>
                                        </xsl:for-each>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                        <td>
                            <table border="1">
                                <xsl:for-each select="res[@name='v']/vec/@*">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="format-number(current(), '0.000')"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
        <p/>
    </xsl:template>
    
    <xsl:template match="res[@name='mark']" mode="pay">
        <h1>
            <i>expected payoffs per encounter:</i>
        </h1>
        <table border="2">
            <tr>
                <th/>
                <xsl:for-each select="mrow[1]/mcol">
                    <th>
                        <xsl:value-of select="@pda_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="mrow">
                <tr>
                    <th>
                        <xsl:value-of select="@pda_name"/>
                    </th>
                    <xsl:for-each select="mcol">
                        <td>
                            <xsl:value-of select="format-number(@pda_pay, '0.0000')"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
        <p/>
    </xsl:template>
       
    <xsl:template match="res[@name='s']">
        <h1>
            <i>total payoff per generation:</i>
        </h1>
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
 
            <g id="plot" transform="translate(20 20)">
                 vars 
                <xsl:variable name="x_min">0</xsl:variable>
                <xsl:variable name="x_max">
                    <xsl:value-of select="count(row) - 1"/>
                </xsl:variable>
                <xsl:variable name="y_min">
                    <xsl:for-each select="row">
                        <xsl:sort select="@s" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@s"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="y_max">
                    <xsl:for-each select="row">
                        <xsl:sort select="@s" data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="@s"/>
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
                        <xsl:text>min, max, range</xsl:text>
                    </text>
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($x_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_rng,'0.000')"/>
                    </text>
                    <text x="0" y="60">
                        <xsl:value-of select="format-number($y_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_rng,'0.000')"/>
                    </text>
                </g>

                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="row">
                            <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (position() - 1 - $x_min) div $x_rng,'0.000')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@s - $y_min) div $y_rng),'0.000')"/>
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
                
                <g id= "dots">
                    <xsl:for-each select="row">
                        <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (position() - 1 - $x_min) div $x_rng,'0.000')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@s - $y_min) div $y_rng),'0.000')"/>
                        <circle cx="{$x}" cy="{$y}" r="2" fill="blue"/>
                    </xsl:for-each>
                </g>
                
                <g id="labels">
                    <text x="0" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                        <xsl:value-of select="format-number($x_min,'0')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                        <xsl:value-of select="format-number($x_max,'0')"/>
                    </text>
                    
                    <text x="{$pw + 10}" y="{$ph}" text-anchor="start" alignment-baseline="middle">
                        <xsl:value-of select="format-number($y_min,'0.000')"/>
                    </text>
                    <text x="{$pw + 10}" y="0" text-anchor="start" alignment-baseline="middle">
                        <xsl:value-of select="format-number($y_max,'0.000')"/>
                    </text>
                </g>
            </g>
           
        </svg>
    </xsl:template>
    
    <xsl:template match="res[@name='R']">
        <h1>
            <i>frequencies per generation:</i>
        </h1>
        <svg width="{$w}" height="{$h}" xmlns="http://www.w3.org/2000/svg" >
            <style>* { font-size: 100%; font-family: sans-serif; font-weight: 300; }</style> 
 
            <g id="plot" transform="translate(20 20)">
                <!-- vars -->
                <xsl:variable name="x_min">0</xsl:variable>
                <xsl:variable name="x_max">
                    <xsl:value-of select="count(row) - 1"/>
                </xsl:variable>
                <xsl:variable name="y_min">0</xsl:variable>
                <xsl:variable name="y_max">1</xsl:variable>

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
                        <xsl:text>min, max, range</xsl:text>
                    </text>
                    <text x="0" y="40">
                        <xsl:value-of select="format-number($x_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($x_rng,'0.000')"/>
                    </text>
                    <text x="0" y="60">
                        <xsl:value-of select="format-number($y_min,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_max,'0.000')"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="format-number($y_rng,'0.000')"/>
                    </text>
                </g>

                <g id="call">
                    <xsl:for-each select="row[1]/@*">
                        <xsl:call-template name="line">
                            <xsl:with-param name="p1" select="//res[@name='R']/row"/>
                            <xsl:with-param name="p2" select="position()"/>
                            <xsl:with-param name="x_min" select="$x_min"/>
                            <xsl:with-param name="x_rng" select="$x_rng"/>
                            <xsl:with-param name="y_min" select="$y_min"/>
                            <xsl:with-param name="y_rng" select="$y_rng"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </g>



                <!--                <g id="line1">
                    <xsl:variable name="line1">
                        <xsl:for-each select="row">
                            <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                            <xsl:variable name="x" select="format-number($pw * (position() - 1 - $x_min) div $x_rng,'0.000')"/>
                            <xsl:variable name="y" select="format-number($ph * (1 - (@s - $y_min) div $y_rng),'0.000')"/>
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
                </g>-->
                
                <!--                <g id= "dots">
                    <xsl:for-each select="row">
                        <xsl:sort select="@item_val1" data-type="number" order="ascending"/>
                        <xsl:variable name="x" select="format-number($pw * (position() - 1 - $x_min) div $x_rng,'0.000')"/>
                        <xsl:variable name="y" select="format-number($ph * (1 - (@s - $y_min) div $y_rng),'0.000')"/>
                        <circle cx="{$x}" cy="{$y}" r="2" fill="blue"/>
                    </xsl:for-each>
                </g>-->
                
                <g id="labels">
                    <text x="0" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                        <xsl:value-of select="format-number($x_min,'0')"/>
                    </text>
                    <text x="{$pw}" y="{$ph + 20}" text-anchor="middle" alignment-baseline="middle">
                        <xsl:value-of select="format-number($x_max,'0')"/>
                    </text>
                    
                    <text x="{$pw + 10}" y="{$ph}" text-anchor="start" alignment-baseline="middle">
                        <xsl:value-of select="format-number($y_min,'0.000')"/>
                    </text>
                    <text x="{$pw + 10}" y="0" text-anchor="start" alignment-baseline="middle">
                        <xsl:value-of select="format-number($y_max,'0.000')"/>
                    </text>
                </g>
            </g>
           
        </svg>
    </xsl:template>
    
    
    <xsl:template name="line">
        <xsl:param name="p1"/>
        <xsl:param name="p2"/>
        <xsl:param name="x_min"/>
        <xsl:param name="x_rng"/>
        <xsl:param name="y_min"/>
        <xsl:param name="y_rng"/>

        <xsl:variable name="line1">
            <xsl:for-each select="$p1">
                <xsl:variable name="x" select="format-number($pw * (position() - 1 - $x_min) div $x_rng,'0.000')"/>
                <xsl:variable name="y" select="format-number($ph * (1 - (@*[$p2] - $y_min) div $y_rng),'0.000')"/>
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
    </xsl:template>
    
    
</xsl:stylesheet>


<!--        <xsl:call-template name="pdt">
    <xsl:with-param name="p1">
        <xsl:text>v1</xsl:text>
    </xsl:with-param>
</xsl:call-template>-->
        
        
<!--    <xsl:template name="pdt">
    <xsl:param name="p1"/>
    <xsl:value-of select="$p1"/>
    <xsl:text>hello</xsl:text>
</xsl:template>-->