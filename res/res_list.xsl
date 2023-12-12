<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <form action="res.php?mth=insert" method="post">
            <input type="submit" value="insert"/>
        </form>
        <table class="table1">
            <tr>
                <th>res_id hello</th>
                <th>res_name</th>
                <th>res_dt</th>
                <th>res_nt</th>
                <th>res_mod</th>
                <th>res_del</th>
                <th>soc_pop</th>
                <th>cst_fxd</th>
                <th>cst_flt</th>
                <th>ext_lnd</th>
                <th>ext_emi</th>
                <th>ext_wst</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="res.php?mth=disp&amp;res_id={@res_id}">
                            <xsl:value-of select="@res_name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@res_dt,'0.000000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@res_nt"/>
                    </td>
                    <!--                    <td>
                        <xsl:value-of select="format-number(@res_tick,'0.000')"/>
                    </td>-->
                    <td>
                        <xsl:value-of select="@res_mod"/>
                    </td>
                    <td>
                        <xsl:value-of select="@res_del"/>
                    </td>
                    
                    
                    <td>
                        <xsl:value-of select="format-number(@soc_pop,'0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@cst_fxd,'0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@cst_flt,'0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@ext_lnd,'0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@ext_emi,'0.0000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@ext_wst,'0.0000')"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>