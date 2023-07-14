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
                <td>
                    <a href="bal.php?mth=disp&amp;n={@n - 1}">&lt;</a>
                </td>
                <td>
                    <!--<xsl:value-of select="@n"/>-->
                    <input type="text" value="{@n}" class="input1" onchange="window.location.href='bal.php?mth=disp&amp;n='+this.value;"/>
                </td>
                <td>
                    <a href="bal.php?mth=disp&amp;n={@n+1}">&gt;</a>
                </td>
            </tr>
        </table>
        

        
        
        <table class="table3">
            <tr>
                <th></th>
                <th>pet</th>
                <th>gas</th>
                <th>nuc</th>
                <th>riv</th>
                <th>res</th>
                <th>pmp</th>
                <th>sol</th>
                <th>wnd</th>
                <th>bio</th>
                <th>wst</th>
                <th>geo</th>
                <th>ele</th>
                <th>hds</th>
                <th>hyd</th>
            </tr>
            <tr>
                <td>availability</td>
                <td><input type="text" value="{format-number(@avl_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=1&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_gas,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=2&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_nuc,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=3&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_riv,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=4&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_res,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=5&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_pmp,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=6&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_sol,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=7&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wnd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=8&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_bio,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=9&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wst,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=10&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_geo,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=avl_geo',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=11&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>production</td>
                <td><input type="text" value="{format-number(@prd_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=15&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_gas,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=16&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_nuc,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=17&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_riv,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=18&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_res,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=19&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_pmp,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=20&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_sol,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=21&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_wnd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=22&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_bio,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=23&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_wst,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=24&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_geo,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=prd_geo',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=25&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th colspan="15">capacity</th>
            </tr>
            <tr>
                <td>electricity</td>
                <td><input type="text" value="{format-number(@cap_ele_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=29&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_gas,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=30&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_nuc,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=31&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_riv,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=32&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_res,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=33&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_pmp,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=34&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_sol,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=35&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wnd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=36&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_bio,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=37&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wst,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=38&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_geo,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_ele_geo',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=39&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th colspan="15">generation</th>
            </tr>
           
            <tr>
                <td>electricity</td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_geo,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_geo',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele',disp);"/></td>
                <td></td>
                <td>
                    <xsl:value-of select="format-number(@con_ele,'0.00')"/>
                </td>
            </tr>


            <tr>
                <th colspan="15">capacity</th>
                <th>total</th>
            </tr>
            
            <tr>
                <td>electricity base</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_base_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_base_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=68&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_base,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_base',disp);"/></td>

            </tr>
            
            <tr>
                <td>electricity cool</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_cool_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_cool_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=82&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_cool,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_cool',disp);"/></td>
            </tr>
            
          
            <tr>
                <td>heat industrial</td>
                <td><input type="text" value="{format-number(@cap_hind_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=85&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_gas,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=86&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_hind_bio,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=93&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_wst,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=94&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_geo,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_geo',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=95&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=96&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hds,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=97&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hyd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=98&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_hind,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hind',disp);"/></td>
            </tr>
            
            <tr>
                <td>heat residential</td>
                <td><input type="text" value="{format-number(@cap_hres_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=99&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_gas,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=100&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_hres_bio,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=107&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_wst,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=108&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_geo,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_geo',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=109&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=110&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hds,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=111&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hyd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=112&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_hres,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_hres',disp);"/></td>
            </tr>
            <tr>
                <td>transport road</td>
                <td><input type="text" value="{format-number(@cap_road_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_road_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=113&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_road_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_road_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=124&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_road_hyd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_road_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=126&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_road,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_road',disp);"/></td>
            </tr>
            <tr>
                <td>transport rail</td>
                <td><input type="text" value="{format-number(@cap_rail_pet,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_rail_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=127&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_rail_ele,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_rail_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=138&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_rail_hyd,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_rail_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=140&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_rail,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=cap_rail',disp);"/></td>
            </tr>
            
            
            <tr>
                <th colspan="15">consumption</th>
                <th>supply</th>
                <th>demand</th>
                <th>balance</th>
            </tr>
            
            
            <tr>
                <td>electricity base</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_base_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_base_ele',disp);"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_base,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_base',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_base,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_base',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=231&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_base,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_base',disp);"/></td>
            </tr>
            <tr>
                <td style="text-align:left">electricity cool</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_cool_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_cool_ele',disp);"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_cool, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_cool',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_cool,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_cool',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=232&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_cool, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_cool',disp);"/></td>
            </tr>
            
            <tr>
                <td>heat industrial</td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_gas',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_geo,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_geo',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_hyd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_hind, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_hind',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_hind,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_hind',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=233&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hind, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hind',disp);"/></td>
            </tr>
            
            <tr>
                <td>heat residential</td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_gas',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_geo,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_geo',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_hyd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_hres, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_hres',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_hres,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_hres',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=234&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hres, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hres',disp);"/></td>
            </tr>
            <tr>
                <td>transport road</td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_pet',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_ele',disp);"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_hyd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_road, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_road',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_road,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_road',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=235&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_road, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_road',disp);"/></td>
            </tr>

            <tr>
                <td>transport rail</td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_pet',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_ele',disp);"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_hyd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_rail, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_rail',disp);"/></td>
                <td><input type="text" value="{format-number(@dem_rail,'0.00')}" onfocus="fn_get('col.php?mth=disp&amp;col_name=dem_rail',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=236&amp;n={@n}&amp;v1='+(this.value);" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_rail, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_rail',disp);"/></td>
            </tr>
            
            <tr>
                <td>subtotal</td>
                <td><input type="text" readonly="true" value="{format-number(@con_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_gas',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_wst',disp);"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hyd',disp);"/></td>
            </tr>
            
            <tr>
                <th colspan="15">export</th>
            </tr>
            
            <tr>
                <td>balance</td>
                <td><input type="text" readonly="true" value="{format-number(@bal_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_nuc',disp);"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_wst',disp);"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hyd',disp);"/></td>
            </tr>
            
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>