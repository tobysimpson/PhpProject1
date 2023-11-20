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
        
    </xsl:template>
    
</xsl:stylesheet>