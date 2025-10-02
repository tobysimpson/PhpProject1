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
                <th>scn_id</th>
                <th>scn_name</th>
                <th colspan="2">html</th>
                <th colspan="2">csv</th>
                <th colspan="2">xls</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@rpt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@rpt_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_name"/>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=1&amp;fmt=1">data</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=2&amp;fmt=1">pivot</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=3&amp;fmt=2">data</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=4&amp;fmt=2">pivot</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=5&amp;fmt=3">data</a>
                    </td>
                    <td>
                        <a href="rpt.php?mth=dsp&amp;rpt_id={@rpt_id}&amp;scn_id={@scn_id}&amp;dsp=6&amp;fmt=3">pivot</a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        

        
    </xsl:template>
</xsl:stylesheet>