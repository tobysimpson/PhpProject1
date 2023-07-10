<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        
        <!-- layout -->
        <table>
            <tr>
                <!-- list -->
                <td style="vertical-align:top">
                    
                    <select onchange="fn_get('bal.php?mth=disp&amp;n='+this.value,disp);">
                    <!--<select onchange="disp.innerHTML = this.value;">-->
                        <xsl:for-each select="row">
                            <option value="{@n}">
                                <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                                <xsl:text> years</xsl:text>
                            </option>
                        </xsl:for-each>                    
                    </select>
                    
                    
<!--                    <table class="table1">
                        <tr>
                            <th>usr_id</th>
                            <th>n</th>
                            <th>t</th>
                            <th colspan="3"></th>
                        </tr>
                        <xsl:for-each select="row">
                            <tr>
                                <td>
                                    <xsl:value-of select="@usr_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@n"/>
                                </td>
                                <td>
                                    <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                                </td>
                                <td>
                                    <a href="#" onclick="fn_get('bal.php?mth=disp&amp;n={@n}',disp);">
                                        <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each> 
                    </table>-->
                </td>
            </tr>
            <tr>
                
                <!-- content -->
                <td style="vertical-align:top">
                    <div id="disp">
                        
                    </div>
                </td>
            </tr>
        </table>
        
        
        
        
        
        
    </xsl:template>
</xsl:stylesheet>