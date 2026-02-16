<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <xsl:variable name="mc" select="tbl[1]/row"/>
        
        <p class="h1">
            <xsl:value-of select="tbl[1]/row/@mc_name"/>
        </p>
        
        
        <table class="table1">
            <tr>
                <th>shk_id</th>
                <th>shk_code</th>
                <th>shk_lvl</th>
                <xsl:for-each select="//root/tbl[3]/row">
                    <th colspan="2">
                        <xsl:value-of select="@yr"/>
                    </th>
                </xsl:for-each>
            </tr>
           
            <xsl:for-each select="tbl[2]/row">
                <xsl:variable name="shk" select="."/>
                <tr>
                    <td>
                        <xsl:value-of select="@shk_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@shk_lvl"/>
                    </td>
                    <xsl:for-each select="//root/tbl[3]/row">
                        <td>
                            <a href="mc.php?mth=htm1&amp;mc_id={$mc/@mc_id}&amp;shk_id={$shk/@shk_id}&amp;shk_lvl={$shk/@shk_lvl}&amp;yr={@yr}">htm</a>
                        </td>
                        <td>
                            <a href="mc.php?mth=csv1&amp;mc_id={$mc/@mc_id}&amp;shk_id={$shk/@shk_id}&amp;shk_lvl={$shk/@shk_lvl}&amp;yr={@yr}">csv</a>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>

 