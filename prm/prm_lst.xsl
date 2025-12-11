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
                <th>pid</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>path</th>
                <th>unit</th>
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
                <xsl:value-of select="@pid"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@leaf"/>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@path"/>
            </td>
            <td>
                <xsl:value-of select="@unit"/>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>