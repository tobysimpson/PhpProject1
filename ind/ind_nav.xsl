<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        
        <p class="h1">scenarios by year</p>
        
        <table class="table1">
            <tr>
                <th>yr</th>
                <th>htm</th>
                <th>csv</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="ind.php?mth=htm1&amp;yr={@yr}">
                            <xsl:value-of select="@yr"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <a href="ind.php?mth=csv1&amp;yr={@yr}">
                            <xsl:value-of select="@yr"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        <p class="h1">shocks by year</p>
        
        <table class="table1">
            <tr>
                
                <th>shk_id</th>
                <th>shk_code</th>
                <th>shk_lvl</th>
                <th>yr</th>
                <th>htm</th>
                <th>csv</th>
            </tr>
            <xsl:for-each select="//root/tbl[2]/row">
                <xsl:variable name="shk" select="."/>
                <xsl:for-each select="//root/tbl[1]/row">
                    <tr>
                        <td>
                            <xsl:value-of select="$shk/@shk_id"/>
                        </td>
                        <td>
                            <xsl:value-of select="$shk/@shk_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="$shk/@shk_lvl"/>
                        </td>
                        <td>
                            <xsl:value-of select="@yr"/>
                        </td>
                        <td>
                            <a href="ind.php?mth=htm2&amp;yr={@yr}&amp;shk_id={$shk/@shk_id}&amp;shk_lvl={$shk/@shk_lvl}">
                                <xsl:value-of select="$shk/@shk_code"/>
                                <xsl:value-of select="$shk/@shk_lvl"/>
                                <xsl:text>_</xsl:text>
                                <xsl:value-of select="@yr"/>
                            </a>
                        </td>
                        <td style="text-align:left;">
                            <a href="ind.php?mth=csv2&amp;yr={@yr}&amp;shk_id={$shk/@shk_id}&amp;shk_lvl={$shk/@shk_lvl}">
                                <xsl:text>shk</xsl:text>
                                <xsl:value-of select="$shk/@shk_id"/>
                                <xsl:text>_lvl</xsl:text>
                                <xsl:value-of select="$shk/@shk_lvl"/>
                                <xsl:text>_</xsl:text>
                                <xsl:value-of select="@yr"/>
                                <xsl:text>.csv</xsl:text>
                            </a>
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>

 