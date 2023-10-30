<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/row">
        <table>
            <tr>
                <th>res_id</th>
                <th>res_name</th>
                <th>dt</th>
                <th>nt</th>
                <th>res_tick</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="@res_id"/>
                </td>
                <td style="text-align:left;">
                    <xsl:value-of select="@res_name"/>
                </td>
                <td>
                    <xsl:value-of select="@dt"/>
                </td>
                <td>
                    <xsl:value-of select="@nt"/>
                </td>
                <td>
                    <xsl:value-of select="@res_tick"/>
                </td>
            </tr>
        </table>
        <hr/>
        <table>
            <tr>
                <td>
                    <a href="#0" onclick="fn_get('grp.php?mth=prm&amp;res_id={@res_id}',div1)">parameters</a>
                </td>
                <td>
                    <a href="#0" onclick="fn_get('res.php?mth=edit&amp;res_id={@res_id}',div1)">settings</a>
                </td>
            </tr>
        </table>
        <hr/>
        <div id="div1"></div>
    </xsl:template>
    
</xsl:stylesheet>