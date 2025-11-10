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
                <th>rpt_id</th>
                <th>rpt_name</th>
                <th>rpt_typ</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <!--                <xsl:variable name="rpt" select="."/>-->
                <tr>
                    <td>
                        <xsl:value-of select="@rpt_id"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="rpt.php?mth=sps&amp;rpt_id={@rpt_id}">
                            <xsl:value-of select="@rpt_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@rpt_typ"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 