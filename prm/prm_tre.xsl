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
            <colgroup>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
            </colgroup>
            <tr>
                <th colspan="11"></th>
                <th>prm_id</th>
                <th>lvl</th>
                <th>leaf</th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td colspan="{@lvl + 1}">        
            </td>
            <td colspan="{9 - @lvl}" style="text-align:left;">
                <a href="prm.php?mth=brw&amp;prm_id={@prm_id0}">
                    <xsl:value-of select="@name"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="@prm_id"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@leaf"/>
            </td>
            <!--<td colspan="{@lvl + 1}"/>-->
            <!--            <td colspan="{10 - @lvl}" style="text-align:left;">
                <a href="prm.php?mth=brw&amp;prm_id={@prm_id0}">
                    <xsl:value-of select="@name"/>
                </a>
            </td>-->
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>