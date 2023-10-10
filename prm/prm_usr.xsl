<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>prm_id</th>
                <th>ele_id</th>
                <th>t</th>
                <th>v</th>
                <th colspan="3"/>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ele_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@v, '###,##0.000')"/>
                    </td>
<!--                    <td>
                        <a href="prm.php?mth=def&amp;prm_id={@prm_id}">def</a>
                    </td>-->
                </tr>
            </xsl:for-each> 
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>