<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mc_name</th>
                <th colspan="4"></th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>

        
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@mc_id"/>
            </td>
            <td style="text-align:left;">
                <xsl:value-of select="@mc_name"/>
            </td>
            <td>
                <a href="mc.php?mth=mc1&amp;mc_id={@mc_id}">mc1</a>
            </td>
            <td>
                <a href="mc.php?mth=mc2&amp;mc_id={@mc_id}">mc2</a>
            </td>
            <td>
                <a href="mc.php?mth=mc3&amp;mc_id={@mc_id}">mc3</a>
            </td>
            <td>
                <a href="mc.php?mth=mc4&amp;mc_id={@mc_id}">mc4</a>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>