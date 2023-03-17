<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="urn:my-scripts">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="h">800</xsl:variable>
    <xsl:variable name="w">1000</xsl:variable>
    <xsl:variable name="ph">600</xsl:variable>
    <xsl:variable name="pw">800</xsl:variable>



    <xsl:template match="root">

        <xsl:variable name="x_min">
            <xsl:for-each select="t">
                <xsl:sort select="@exp_days" data-type="number" order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="@exp_days"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="x_max">
            <xsl:for-each select="t">
                <xsl:sort select="@exp_days" data-type="number" order="ascending"/>
                <xsl:if test="position() = last()">
                    <xsl:value-of select="@exp_days"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="x_range">
            <xsl:value-of select="$x_max - $x_min"/>
        </xsl:variable>


        <xsl:variable name="y_min">
            -<xsl:for-each select="fut_info/fut_px/fut_exp">
                <xsl:sort select="@ois_fwd" data-type="number" order="ascending"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="@ois_fwd"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="y_max">
            <xsl:for-each select="t">
                <xsl:sort select="@fut_fwd" data-type="number" order="ascending"/>
                <xsl:if test="position() = last()">
                    <xsl:value-of select="@fut_fwd"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>


        <xsl:variable name="y_range">
            <xsl:value-of select="$y_max - $y_min"/>
        </xsl:variable>

        <xsl:variable name="y_tick">
            <xsl:value-of select="user:pow(10,user:round(user:log10($y_max - $y_min))) div 10"/>
        </xsl:variable>

        <xsl:variable name="y_sup">
            <xsl:value-of select="user:ceiling($y_max div $y_tick) * $y_tick"/>
        </xsl:variable>

        <xsl:variable name="y_inf">
            <xsl:value-of select="user:floor($y_min div $y_tick) * $y_tick"/>
        </xsl:variable>

        <xsl:variable name="y_range2">
            <xsl:value-of select="$y_sup - $y_inf"/>
        </xsl:variable>




        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg">


            <g id="plot_area" transform="translate(100,700)">

                <!--<text x="0" y="-300">
                  <xsl:value-of select="$y_min"/>,
                  <xsl:value-of select="$y_max"/>,
                  <xsl:value-of select="format-number($y_range,'0.000000')"/>,
                  <xsl:value-of select="$y_tick"/>,
                  <xsl:value-of select="$y_sup"/>,
                  <xsl:value-of select="$y_inf"/>
                </text>
        
                <text x="0" y="-400">
                  <xsl:value-of select="$x_min"/>,
                  <xsl:value-of select="$x_max"/>,
                  <xsl:value-of select="format-number($x_range,'0.0000')"/>
                </text>-->


                <!-- y grids -->
                <g name="y_grids">
                    <xsl:call-template name="loop">
                        <xsl:with-param name="y_val" select="$y_inf" />
                        <xsl:with-param name="y_tick" select="$y_tick" />
                        <xsl:with-param name="y_sup" select="$y_sup" />
                        <xsl:with-param name="y_inf" select="$y_inf" />
                    </xsl:call-template>
                </g>



                <!-- title -->
                <text x="0" y="-620" font-family="Trebuchet MS" font-size="28">
                    <xsl:text>Implied 3-Month Forward Rates</xsl:text>
                </text>

                <text x="800" y="-620" font-family="Trebuchet MS" font-size="28" text-anchor="end">
                    <xsl:value-of select="t/@px_date"/>
                </text>


                <!-- x axis -->
                <xsl:for-each select="t">
                    <xsl:variable name="x" select="format-number($pw * (@exp_days - $x_min) div $x_range,'0.00')"/>
                    <!--<xsl:variable name="y" select="format-number(-$ph * ((@fut_fwd - $y_min) div $y_range),'0.00')"/>-->
                    <line x1="{$x}" x2="{$x}" y1="000" y2="-600" stroke="#cccccc"/>
                    <!-- labels -->
                    <text x="{$x}" y="10" font-family="Trebuchet MS"  transform="rotate(270,{$x},10)" text-anchor="end"  alignment-baseline="central">
                        <xsl:value-of select="@exp_date"/>
                    </text>
                </xsl:for-each>


                <!-- dots/labels -->
                <xsl:for-each select="t">
                    <xsl:variable name="x" select="format-number($pw * (@exp_days - $x_min) div $x_range,'0.00')"/>
                    <xsl:variable name="y" select="format-number(-$ph * ((@fut_fwd - $y_inf) div $y_range2),'0.00')"/>
                    <circle cx="{$x}" cy="{$y}" r="3" style="fill:blue;"/>
                    <!-- labels -->
                    <!--<text x="{$x}" y="{$y + 20}" font-family="Trebuchet MS">
                      <xsl:value-of select="format-number(@fut_fwd,'0.000%')"/>
                    </text>-->
                </xsl:for-each>

                <!--draw the line chart-->
                <xsl:variable name="plot1">
                    <xsl:for-each select="t">
                        <xsl:sort select="@exp_days" data-type="number"/>
                        <!--co-ordinates-->
                        <xsl:variable name="x" select="format-number($pw * (@exp_days - $x_min) div $x_range,'0.00')"/>
                        <xsl:variable name="y" select="format-number(-$ph * ((@fut_fwd - $y_inf) div $y_range2),'0.00')"/>
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
                <!--draw-->
                <path fill="none" stroke="blue" d="{$plot1}"/>





                <!-- dots/labels -->
                <xsl:for-each select="t">
                    <xsl:variable name="x" select="format-number($pw * (@exp_days - $x_min) div $x_range,'0.00')"/>
                    <xsl:variable name="y" select="format-number(-$ph * ((@ois_fwd - $y_inf) div $y_range2),'0.00')"/>
                    <circle cx="{$x}" cy="{$y}" r="3" style="fill:red;"/>
                    <!-- labels -->
                    <!--<text x="{$x}" y="{$y + 20}" font-family="Trebuchet MS">
                      <xsl:value-of select="format-number(@ois_fwd,'0.000%')"/>
                    </text>-->
                </xsl:for-each>

                <!--draw the line chart-->
                <xsl:variable name="plot2">
                    <xsl:for-each select="t">
                        <xsl:sort select="@exp_days" data-type="number"/>
                        <!--co-ordinates-->
                        <xsl:variable name="x" select="format-number($pw * (@exp_days - $x_min) div $x_range,'0.00')"/>
                        <xsl:variable name="y" select="format-number(-$ph * ((@ois_fwd - $y_inf) div $y_range2),'0.00')"/>
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
                <!--draw-->
                <path fill="none" stroke="red" d="{$plot2}"/>






                <!-- key -->
                <!--<line x1="10" x2="30" y1="-580" y2="-580" stroke="green" stroke-width="4"/>
                <text x="40" y="-575" font-family="Trebuchet MS">EURIBOR Cash</text>-->

                <line x1="10" x2="30" y1="-555" y2="-555" stroke="blue" stroke-width="4"/>
                <text x="40" y="-550" font-family="Trebuchet MS">3M EURIBOR Future</text>

                <line x1="10" x2="30" y1="-530" y2="-530" stroke="red" stroke-width="4"/>
                <text x="40" y="-525" font-family="Trebuchet MS">EONIA Swap</text>

            </g>
        </svg>
    </xsl:template>

    <!--y grids loop--> 
    <xsl:template name="loop">
        <xsl:param name="y_val"/>
        <xsl:param name="y_tick"/>
        <xsl:param name="y_sup"/>
        <xsl:param name="y_inf"/>

        <xsl:variable name="y" select="format-number($ph * ($y_val - $y_inf) div ($y_sup - $y_inf),'0.00')"/>
        <text x="-10" y="{-$y}" text-anchor="end" xmlns="http://www.w3.org/2000/svg" alignment-baseline="central" font-family="Trebuchet MS">
            <xsl:value-of select="format-number($y_val,'0.00%')"/>
        </text>
        <line x1="000" x2="800" y1="{-$y}" y2="{-$y}" stroke="#cccccc" xmlns="http://www.w3.org/2000/svg"/>
        <xsl:variable name="y_next" select="$y_val + $y_tick" />
        <xsl:if test="$y_next &lt; ($y_sup + $y_tick)">
            <xsl:call-template name="loop">
                <xsl:with-param name="y_val" select="$y_next" />
                <xsl:with-param name="y_tick" select="$y_tick" />
                <xsl:with-param name="y_sup" select="$y_sup" />
                <xsl:with-param name="y_inf" select="$y_inf" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

