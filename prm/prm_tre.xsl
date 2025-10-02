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
                <th>name</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <xsl:apply-templates select="row[@lvl = 0]"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <xsl:variable name="prm_id" select="@prm_id"/>
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
            <td colspan="{@lvl}"/>
            <td colspan="10" style="text-align:left;">
                <a href="prm.php?mth=brw&amp;prm_id={@prm_id0}">
                    <xsl:value-of select="@name"/>
                </a>
            </td>
        </tr>
        <xsl:apply-templates select="//root/tbl[1]/row[@pid = $prm_id]"/>
    </xsl:template>
    
    
    
</xsl:stylesheet>