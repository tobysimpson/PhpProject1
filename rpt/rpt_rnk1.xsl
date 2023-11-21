<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    
    <xsl:template match="root/tbl[1]/row">
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>res_name</th>
                <th>res_dt</th>
                <th>res_nt</th>
                <th>res_mod</th>
                <th>soc_pop</th>
                <th>cst_fxd</th>
                <th>cst_flt</th>
                <th>ext_lnd</th>
                <th>ext_emi</th>
                <th>ext_wst</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="@res_id"/>
                </td>
                <td style="text-align:left;">
                    <xsl:value-of select="@res_name"/>
                </td>
                <td>
                    <xsl:value-of select="@res_dt"/>
                </td>
                <td>
                    <xsl:value-of select="@res_nt"/>
                </td>
                <td>
                    <xsl:value-of select="@res_mod"/>
                </td>
                <td>
                    <xsl:value-of select="@soc_pop"/>
                </td>
                <td>
                    <xsl:value-of select="@cst_fxd"/>
                </td>
                <td>
                    <xsl:value-of select="@cst_flt"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_lnd"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_emi"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_wst"/>
                </td>
            </tr>
        </table>
        
        
        <hr/>
        
        <table class="table1">
            <tr>
                <th style="text-align:left;">metric</th>
                <th>value</th>
                <th>rank</th>
                <th>count</th>
                <th>percent</th>
            </tr>
            <tr>
                <td style="text-align:left;">fixed cost</td>
                <td>
                    <xsl:value-of select="format-number(@cst_fxd,'0.0000')"/>
                </td>
                <td>
                    <xsl:value-of select="@cst_fxd_rnk"/>
                </td>
                <td>
                    <xsl:value-of select="@res_count"/>
                </td>
                <td style="text-align:right;">
                    <xsl:value-of select="format-number(@cst_fxd_pct,'0%')"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:left;">floating cost</td>
                <td>
                    <xsl:value-of select="format-number(@cst_flt,'0.0000')"/>
                </td>
                <td>
                    <xsl:value-of select="@cst_flt_rnk"/>
                </td>
                <td>
                    <xsl:value-of select="@res_count"/>
                </td>
                <td style="text-align:right;">
                    <xsl:value-of select="format-number(@cst_flt_pct,'0%')"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:left;">land use</td>
                <td>
                    <xsl:value-of select="format-number(@ext_lnd,'0.0000')"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_lnd_rnk"/>
                </td>                
                <td>
                    <xsl:value-of select="@res_count"/>
                </td>
                <td style="text-align:right;">
                    <xsl:value-of select="format-number(@ext_lnd_pct,'0%')"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:left;">emissions</td>
                <td>
                    <xsl:value-of select="format-number(@ext_emi,'0.0000')"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_emi_rnk"/>
                </td>                
                <td>
                    <xsl:value-of select="@res_count"/>
                </td>
                <td style="text-align:right;">
                    <xsl:value-of select="format-number(@ext_emi_pct,'0%')"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:left;">waste</td>
                <td>
                    <xsl:value-of select="format-number(@ext_wst,'0.0000')"/>
                </td>
                <td>
                    <xsl:value-of select="@ext_wst_rnk"/>
                </td>                
                <td>
                    <xsl:value-of select="@res_count"/>
                </td>
                <td style="text-align:right;">
                    <xsl:value-of select="format-number(@ext_wst_pct,'0%')"/>
                </td>
            </tr>
        </table>
        
        
    </xsl:template>
    
</xsl:stylesheet>