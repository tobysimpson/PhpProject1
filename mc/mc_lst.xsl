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
                <th colspan="7"></th>
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
                <a href="mc.php?mth=prm&amp;mc_id={@mc_id}">prm</a>
            </td>
            <td>
                <a href="mc.php?mth=scn&amp;mc_id={@mc_id}">scn</a>
            </td>
            <td>
                <a href="mc.php?mth=cal2&amp;mc_id={@mc_id}">cal2</a>
            </td>
            <td>
                <a href="mc.php?mth=cal3&amp;mc_id={@mc_id}">cal3</a>
            </td>
            <td>
                <a href="mc.php?mth=cal4&amp;mc_id={@mc_id}">cal4</a>
            </td>
            <td>
                <a href="mc.php?mth=cal5&amp;mc_id={@mc_id}">cal5</a>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>