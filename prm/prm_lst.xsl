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
                <th>id</th>
                <th>lvl</th>
                <th>path</th>
             
            </tr>
            <xsl:apply-templates select="row"/>

        </table>

        
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@path"/>
            </td>

        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>