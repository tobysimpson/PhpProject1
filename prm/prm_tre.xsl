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
                <th>prm_id</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>0</th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>6</th>
                <th>7</th>
                <th>8</th>
                <th>9</th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@prm_id"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@leaf"/>
            </td>
            <td colspan="{@lvl + 1}"/>
            <td colspan="{10 - @lvl}" style="text-align:left;">
                <a href="prm.php?mth=brw&amp;prm_id={@prm_id0}">
                    <xsl:value-of select="@name"/>
                </a>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>