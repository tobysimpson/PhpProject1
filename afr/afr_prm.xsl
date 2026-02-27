<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>pos</th>
                <th>prm_id</th>
                <th>prm_name</th>
                <th>unit</th>
                <th>r /GWh/yr</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@pos"/>
                    </td>   
                    <td>
                        <a href= "prm.php?mth=brw&amp;prm_id={@prm_id}">
                            <xsl:value-of select="@prm_id"/>
                        </a>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@name"/>
                    </td> 
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@r,'#,##0.00000000','fmt1')"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>