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
                <th>rpt_typ</th>
                <th>rpt_name</th>
                <th>scn_id</th>
                <th>scn_name</th>
                <th colspan="2"></th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@rpt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@rpt_typ"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@rpt_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_name"/>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;rpt_typ={@rpt_typ}&amp;fmt=1">html</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;rpt_typ={@rpt_typ}&amp;fmt=2">csv</a>
                    </td>
<!--                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;rpt_typ={@rpt_typ}&amp;fmt=3">xls</a>
                    </td>-->
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 