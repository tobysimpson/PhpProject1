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
                <!--                <td>
                    <xsl:value-of select="@usr_id"/>
                </td>-->
                <td>
                    <a href="bal.php?mth=disp&amp;n={@n - 1}">&lt;</a>
                </td>
                <td>
                    <!--<xsl:value-of select="@n"/>-->
                    <input id="weeks" type="text" value="{@n}" style="width: 60px; text-align: center;" onchange="window.location.href='bal.php?mth=disp&amp;n='+this.value;"/>
                </td>
                <td>
                    <a href="bal.php?mth=disp&amp;n={@n+1}">&gt;</a>
                </td>
                <td>
                    <xsl:value-of select="@t"/>
                    <xsl:text> years</xsl:text>
                </td>
            </tr>
        </table>
        

        
        
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
                <th>availability</th>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@avl_nuc, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_nuc',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@avl_riv, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_riv',disp);"/>
                </td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@avl_sol, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_sol',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@avl_wnd, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_wnd',disp);"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>production</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@prd_bio, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_bio',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@prd_wst, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_wst',disp);"/>
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
                <th>electricity</th>
                <td></td>
                <td>
                    <input type="text" value="{format-number(@cap_gas, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=7&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_gas',disp);"/>
                    
                    <!--<a style="font-family: Webdings; font-size:24;" href="#" onclick="fn_get('col.php?mth=disp&amp;col_name=cap_gas',disp);"></a>-->
                    <!--<a style="font-family: Webdings; font-size:24;" href="col.php?mth=disp&amp;col_name=cap_gas"></a>-->
                    <!--<a style="font-family: Webdings; font-size:20;" href="evt.php?mth=list&amp;col_id=7"></a>-->
                    
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_nuc, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=8&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_nuc',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_riv, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=9&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_riv',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_res, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=10&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_res',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_sol, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=11&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_sol',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_wnd, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=12&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_wnd',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_bio, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=13&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_bio',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@cap_wst, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=14&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_wst',disp);"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <th>chp</th>
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
                <th>hydrogen</th>
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
                    <input type="text" value="{format-number(@cap_h2, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=15&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=cap_h2',disp);"/>
                </td>
                <td></td>
                <td></td>
 
            </tr>
            
            
            
            <tr>
                <th>generation</th>
                <td colspan="13"></td>
            </tr>
            
            
            
            <tr>
                <td></td>
                <th>electricity</th>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_gas, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_gas',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_nuc, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_nuc',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_riv, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_riv',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_res, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_res',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_sol, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_sol',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_wnd, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_wnd',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_bio, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_bio',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele_wst, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_wst',disp);"/>
                </td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele',disp);"/>
                </td>
                <td></td>
                <td></td>
            </tr>
        

            <tr>
                <td></td>
                <th>chp</th>
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
                <th>hydrogen</th>
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
                    <xsl:value-of select="format-number(-@gen_h2_ele, '###,##0.00')"/>
                </td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@gen_h2_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_h2_ele',disp);"/>
                </td>
            </tr>
        
        
            <tr>
                <th >consumption</th>
                <td colspan="13"></td>
                <th style="width:100px;text-align:right;">supply</th>
                <th style="text-align:right;">demand</th>
                <th style="text-align:right;">surplus</th>
            </tr>
            
            
            <tr>
                <td></td>
                <th>electricity base</th>
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
                    <input type="text" value="{format-number(@con_base_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=19&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_base_ele',disp);"/>
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
                    <input type="text" value="{format-number(@con_cool_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=20&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_cool_ele',disp);"/>
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
                <th>heat industrial</th>
                <td>
                    <input type="text" value="{format-number(@con_hind_pet, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=21&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_pet',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hind_gas, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=22&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_gas',disp);"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" value="{format-number(@con_hind_bio, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=23&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_bio',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hind_wst, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=24&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_wst',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hind_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=25&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_ele',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hind_hdst, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=26&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_hdst',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hind_h2, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=27&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hind_h2',disp);"/>
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
                <th>heat residential</th>
                <td>
                    <input type="text" value="{format-number(@con_hres_pet, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=28&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_pet',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hres_gas, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=29&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_gas',disp);"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" value="{format-number(@con_hres_bio, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=30&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_bio',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hres_wst, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=31&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_wst',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hres_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=32&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_ele',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hres_hdst, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=33&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_hdst',disp);"/>
                </td>
                <td>
                    <input type="text" value="{format-number(@con_hres_h2, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=34&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_hres_h2',disp);"/>
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
                <th>transport road</th>
                <td>
                     <input type="text" value="{format-number(@con_road_pet, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=44&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_road_pet',disp);"/>
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
                    <input type="text" value="{format-number(@con_road_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=45&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_road_ele',disp);"/>
                </td>
                <td></td>
                <td>
                    <input type="text" value="{format-number(@con_road_h2, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=46&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_road_h2',disp);"/>
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
                <th>transport rail</th>
                <td>
                    <input type="text" value="{format-number(@con_rail_pet, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=47&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_rail_pet',disp);"/>
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
                    <input type="text" value="{format-number(@con_rail_ele, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=50&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_rail_ele',disp);"/>
                </td>
                <td></td>
                <td>
                    <input type="text" value="{format-number(@con_rail_h2, '###,##0.00')}" style="width: 60px; text-align: center;" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=51&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value - this.old_value);" onfocus="this.old_value = this.value;fn_get('col.php?mth=disp&amp;col_name=con_rail_h2',disp);"/>
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
                <th>balance</th>
                <td colspan="13"></td>
            </tr>
            
            <tr>
                <th></th>
                <th>surplus</th>
                <td>
                    <xsl:value-of select="format-number(@bal_pet, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_gas, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_nuc, '###,##0.00')"/>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@bal_bio, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_wst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_ele, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_hdst, '###,##0.00')"/>
                </td>
                <td>
                    <xsl:value-of select="format-number(@bal_h2, '###,##0.00')"/>
                </td>
            </tr>
            
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>