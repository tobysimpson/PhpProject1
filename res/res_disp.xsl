<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        
        <a href="res.php?mth=step&amp;res_id={row/@res_id}">res_step</a>
        <xsl:text> </xsl:text>
        <a href="met.php?mth=init&amp;res_id={row/@res_id}">met_init</a>
        <xsl:text> </xsl:text>
        <a href="met.php?mth=step&amp;res_id={row/@res_id}">met_step</a>
        <p/>
        <table>
            <tr>
                <td id="met">
                    <table>
                        <tr>
                            <td>
                                <img style="width:auto; height:200;" src="met.php?mth=tmp_plot&amp;res_id={row/@res_id}"/>
                            </td>
                            <td>
                                <img style="width:auto; height:200;" src="met.php?mth=wnd_plot&amp;res_id={row/@res_id}"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="prd">
                    <table class="table1">
                        <tr>
                            <th>res_id</th>
                            <th>prd_id</th>
                            <th>prd_name</th>
                            <th colspan="2"></th>
                        </tr>
                        <xsl:for-each select="row">
                            <tr>
                                <td>
                                    <xsl:value-of select="@res_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@prd_id"/>
                                </td>
                                <td style="text-align:left;">
                                    <xsl:value-of select="@prd_name"/>
                                </td>
                                <td>
                                    <img style="width:auto; height:80;" src="prd.php?mth=hist&amp;prd_id={@prd_id}"/>
                                </td>
                            </tr>
                        </xsl:for-each> 
                    </table>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>