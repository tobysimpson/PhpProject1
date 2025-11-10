<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
   
    <xsl:template match="root">
        <xsl:variable name="rpt" select="tbl[1]/row[1]"/>
        <table class="table1">
            <tr>
                <th>rpt_id</th>
                <th>rpt_name</th>
                <th>rpt_typ</th>
            </tr>
            <!--<xsl:for-each select="tbl[1]/row">-->
                <tr>
                    <td>
                        <xsl:value-of select="$rpt/@rpt_id"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="rpt.php?mth=sps&amp;rpt_id={$rpt/@rpt_id}">
                            <xsl:value-of select="$rpt/@rpt_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="$rpt/@rpt_typ"/>
                    </td>
                </tr>
            <!--</xsl:for-each>-->
        </table>
        <p/>
        <table class="table1">
            <tr>
                <th>sps_id</th>
                <th>sps_code</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@sps_id"/>
                    </td>
                    <td>
                        <a href="rpt.php?mth=shk&amp;rpt_id={$rpt/@rpt_id}&amp;sps_id={@sps_id}">
                            <xsl:value-of select="@sps_code"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 