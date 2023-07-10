<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <!--    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>-->

    <xsl:template match="root/row">
<!--        <table>
            <tr>
                <td>
                    <xsl:value-of select="@usr_id"/>
                </td>
                <td>
                    <xsl:value-of select="@n"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@t, '###,##0.000')"/>
                </td>
                                    <td>
                    <a href="#" onclick="fn_get('bal.php?mth=disp&amp;n={@n}',disp);">disp</a>
                </td>
            </tr>
        </table>-->
        
        
        <table class="table3">
            <tr>
                <th></th>
                <th style="width:150px"></th>
                <th>pet</th>
                <th>gas</th>
                <th>nuc</th>
                <th>riv</th>
                <th>res</th>
                <th>sol</th>
                <th>wnd</th>
                <th>bio</th>
                <th>wst</th>
                <th>elec</th>
                <th>hdst</th>
                <th>H2</th>
            </tr>
            <tr>
                <th style="text-align:left">availability</th>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@avl_nuc, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@avl_riv, '###,##0.00')"/>
                </td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@avl_sol, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@avl_wnd, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th style="text-align:left">production</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@prd_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@prd_wst, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th style="text-align:left">capacity</th>
                <td colspan="13"></td>
            </tr>
            
            <tr>
                <td></td>
                <th style="text-align:left">electricity</th>
                <td></td>
                <td>
                    <a href="evt.php?mth=list&amp;col_id=7">
                        <xsl:value-of select="format-number(@cap_gas, '###,##0.00')"/>
                    </a>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_nuc, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_riv, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_res, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_sol, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_wnd, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@cap_wst, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align:left">chp</th>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@chp_gas, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@chp_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@chp_wst, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align:left">hydrogen</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                
                <td>
                    <xsl:value-of select="format-number(@cap_h2, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
 
            </tr>
            
            
            
            <tr>
                <th style="text-align:left">generation</th>
                <td colspan="13"></td>
            </tr>
            
            
            
            <tr>
                <td></td>
                <th style="text-align:left">electricity</th>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_gas, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_nuc, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_riv, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_res, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_sol, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_wnd, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele_wst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@gen_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
            </tr>
        

            <tr>
                <td></td>
                <th style="text-align:left">chp</th>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@chp_gas, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@chp_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@chp_wst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(0, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(0, '###,##0.00')"/>
                </td>
                <td></td>
            </tr>
        
            <tr>
                <td></td>
                <th style="text-align:left">hydrogen</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@cnv_h2_ele, '-###,##0.00')"/>
                </td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@cnv_h2_ele, '###,##0.00')"/>
                </td>
            </tr>
        
        
            <tr>
                <th style="text-align:left">consumption</th>
                <td colspan="13"></td>
                <th>supply</th>
                <th>demand</th>
                <th>surplus</th>
            </tr>
            
            
            <tr>
                <td></td>
                <th style="text-align:left">electricity base</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_base_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@sup_base, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_base, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_base, '###,##0.00')"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align:left">electricity cool</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_cool_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@sup_cool, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_cool, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_cool, '###,##0.00')"/>
                </td>
            </tr>
            
            <tr>
                <td></td>
                <th style="text-align:left">heat industrial</th>
                <td>
                    <xsl:value-of select="format-number(@con_hind_pet, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_gas, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_wst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_ele, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_hdst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hind_h2, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sup_hind, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_hind, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_hind, '###,##0.00')"/>
                </td>
            </tr>
            
            <tr>
                <td></td>
                <th style="text-align:left">heat residential</th>
                <td>
                    <xsl:value-of select="format-number(@con_hres_pet, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_gas, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_wst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_ele, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_hdst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@con_hres_h2, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sup_hres, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_hres, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_hres, '###,##0.00')"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align:left">transport road</th>
                <td>
                    <xsl:value-of select="format-number(@con_road_pet, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_road_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_road_h2, '###,##0.00')"/>
                </td>
                
                <td>
                    <xsl:value-of select="format-number(@sup_road, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_road, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_road, '###,##0.00')"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <th style="text-align:left">transport rail</th>
                <td>
                    <xsl:value-of select="format-number(@con_rail_pet, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_rail_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_rail_h2, '###,##0.00')"/>
                </td>
                
                <td>
                    <xsl:value-of select="format-number(@sup_rail, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@dem_rail, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@sur_rail, '###,##0.00')"/>
                </td>
            </tr>
            
            <tr>
                <th style="text-align:left">balance</th>
                <td colspan="13"></td>
            </tr>
            
            <tr>
                <th></th>
                <th style="text-align:left">surplus</th>
                <td><xsl:value-of select="format-number(@bal_pet, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_gas, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_nuc, '###,##0.00')"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><xsl:value-of select="format-number(@bal_bio, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_wst, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_ele, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_hdst, '###,##0.00')"/></td>
                <td><xsl:value-of select="format-number(@bal_h2, '###,##0.00')"/></td>
            </tr>
            
        </table>
        
        
        
    </xsl:template>
</xsl:stylesheet>