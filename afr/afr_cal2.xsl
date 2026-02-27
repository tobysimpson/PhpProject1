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
                <!--<th>prm_id</th>-->
                <th>scn_id</th>
                <th>yr</th>
                <th>wr_twh</th>
                <th>f</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
<!--                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>-->
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@wr_twh,'#,##0.00','fmt1')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@f,'#,##0.00','fmt1')"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>