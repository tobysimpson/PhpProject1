<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    
    
    <xsl:template match="root/tbl[1]/row">

    </xsl:template>
    

    <xsl:template match="root/tbl[2]/row">
        
        <table class="table1">
            <tr>
                <th>res_id</th>
                <th>soc_pop</th>
            </tr>
            <tr>
                <td><xsl:value-of select="@res_id"/></td>
                <td><xsl:value-of select="@soc_pop"/></td>
            </tr>
        </table>
        
        <hr/>
 
        <table class="table1">
            <col/>
            <col/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
  
            <tr>
                <th colspan="2"></th>
                <th>fixed cost</th>
                <th>floating cost</th>
                <th>land use</th>
                <th>emissions</th>
                <th>waste</th>
            </tr>
            <tr>
                <th style="text-align:left;">despatch</th>

                <td style="text-align:left;">gas</td>
                <td><xsl:value-of select="@cst_gas_fxd"/></td>
                <td><xsl:value-of select="@cst_gas_flt"/></td>
                <td><xsl:value-of select="@ext_gas_lnd"/></td>
                <td><xsl:value-of select="@ext_gas_emi"/></td>
                <td><xsl:value-of select="@ext_gas_wst"/></td>
            </tr>
            
            <tr>
                <td rowspan="6"></td>
                <td style="text-align:left;">nuclear</td>
                <td><xsl:value-of select="@cst_nuc_fxd"/></td>
                <td><xsl:value-of select="@cst_nuc_flt"/></td>
                <td><xsl:value-of select="@ext_nuc_lnd"/></td>
                <td><xsl:value-of select="@ext_nuc_emi"/></td>
                <td><xsl:value-of select="@ext_nuc_wst"/></td>
            </tr>
            
            <tr>
                <td style="text-align:left;">river</td>
                <td><xsl:value-of select="@cst_riv_fxd"/></td>
                <td><xsl:value-of select="@cst_riv_flt"/></td>
                <td><xsl:value-of select="@ext_riv_lnd"/></td>
                <td><xsl:value-of select="@ext_riv_emi"/></td>
                <td><xsl:value-of select="@ext_riv_wst"/></td>
            </tr>
            
            <tr>
                <td style="text-align:left;">reservoir</td>
                <td><xsl:value-of select="@cst_res_fxd"/></td>
                <td><xsl:value-of select="@cst_res_flt"/></td>
                <td><xsl:value-of select="@ext_res_lnd"/></td> 
                <td><xsl:value-of select="@ext_res_emi"/></td>
                <td><xsl:value-of select="@ext_res_wst"/></td>
            </tr>
            
            <tr>
                <td style="text-align:left;">solar</td>
                <td><xsl:value-of select="@cst_sol_fxd"/></td>
                <td><xsl:value-of select="@cst_sol_flt"/></td>
                <td><xsl:value-of select="@ext_sol_lnd"/></td>
                <td><xsl:value-of select="@ext_sol_emi"/></td>
                <td><xsl:value-of select="@ext_sol_wst"/></td>
            </tr>
            
            <tr>
                <td style="text-align:left;">wind</td>
                <td><xsl:value-of select="@cst_wnd_fxd"/></td>
                <td><xsl:value-of select="@cst_wnd_flt"/></td>
                <td><xsl:value-of select="@ext_wnd_lnd"/></td>
                <td><xsl:value-of select="@ext_wnd_emi"/></td>
                <td><xsl:value-of select="@ext_wnd_wst"/></td>
            </tr>
            
            <tr>
                <td style="text-align:left;">biomass/waste</td>
                <td><xsl:value-of select="@cst_bio_fxd"/></td>
                <td><xsl:value-of select="@cst_bio_flt"/></td>
                <td><xsl:value-of select="@ext_bio_lnd"/></td>
                <td><xsl:value-of select="@ext_bio_emi"/></td>
                <td><xsl:value-of select="@ext_bio_wst"/></td>
            </tr>
    
            
            <tr>
                <th style="text-align:left;">consumption</th>
 
                <td style="text-align:left;">heat industrial</td>
                <td><xsl:value-of select="@cst_hind_gas_fxd"/></td>
                <td><xsl:value-of select="@cst_hind_gas_flt"/></td>
                <td><xsl:value-of select="@ext_hind_gas_lnd"/></td>
                <td><xsl:value-of select="@ext_hind_gas_emi"/></td>
                <td><xsl:value-of select="@ext_hind_gas_wst"/></td>
            </tr>
            
            <tr>
                <td rowspan="3"></td>
                <td style="text-align:left;">heat residential</td>
                <td><xsl:value-of select="@cst_hres_gas_fxd"/></td>
                <td><xsl:value-of select="@cst_hres_gas_flt"/></td>
                <td><xsl:value-of select="@ext_hres_gas_lnd"/></td>
                <td><xsl:value-of select="@ext_hres_gas_emi"/></td>
                <td><xsl:value-of select="@ext_hres_gas_wst"/></td>
            </tr>
        
            <tr>
                <td style="text-align:left;">transport road</td>
                <td><xsl:value-of select="@cst_road_pet_fxd"/></td>
                <td><xsl:value-of select="@cst_road_pet_flt"/></td>
                <td><xsl:value-of select="@ext_road_pet_lnd"/></td>
                <td><xsl:value-of select="@ext_road_pet_emi"/></td>
                <td><xsl:value-of select="@ext_road_pet_wst"/></td>
            </tr>
        
        
            <tr>
                <td style="text-align:left;">transport rail</td>
                <td><xsl:value-of select="@cst_rail_pet_fxd"/></td>
                <td><xsl:value-of select="@cst_rail_pet_flt"/></td>
                <td><xsl:value-of select="@ext_rail_pet_lnd"/></td>
                <td><xsl:value-of select="@ext_rail_pet_emi"/></td>
                <td><xsl:value-of select="@ext_rail_pet_wst"/></td>
            </tr>
        
        
            <tr>
                <th style="text-align:left;">imports</th>
            
                <td style="text-align:left;">imported electricity</td>
                <td><xsl:value-of select="@cst_imp_fxd"/></td>
                <td><xsl:value-of select="@cst_imp_flt"/></td>
                <td><xsl:value-of select="@ext_imp_lnd"/></td>
                <td><xsl:value-of select="@ext_imp_emi"/></td>
                <td><xsl:value-of select="@ext_imp_wst"/></td>
            </tr>
            
            <tr>
                <td colspan="7">
                    <hr/>
                </td>
            </tr>
     
            
            <tr>
                <th style="text-align:left;">total</th>
                
                <td></td>
                <td><xsl:value-of select="@cst_fxd"/></td>
                <td><xsl:value-of select="@cst_flt"/></td>
                <td><xsl:value-of select="@ext_lnd"/></td>
                <td><xsl:value-of select="@ext_emi"/></td>
                <td><xsl:value-of select="@ext_wst"/></td>
            </tr>
         
        </table>
        
       
    </xsl:template>
</xsl:stylesheet>