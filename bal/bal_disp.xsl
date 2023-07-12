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
                    <input id="weeks" type="text" value="{@n}" class="input1" onchange="window.location.href='bal.php?mth=disp&amp;n='+this.value;"/>
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
                <th>pmp</th>
                <th>sol</th>
                <th>wnd</th>
                <th>bio</th>
                <th>wst</th>
                <th>ele</th>
                <th>hds</th>
                <th>hyd</th>
            </tr>
            <tr>
                <th>availability</th>
                <td></td>
                <td><input type="text" value="{format-number(@avl_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=1&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=2&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=3&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=4&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=5&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=6&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=7&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=8&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=9&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=10&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=11&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=12&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=avl_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=13&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            <tr>
                <th>production</th>
                <td></td>
                <td><input type="text" value="{format-number(@prd_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=14&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=15&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=16&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=17&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=18&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=19&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=20&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=21&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=22&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=23&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=24&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=25&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=prd_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=26&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            <tr>
                <th style="text-align:left">capacity</th>
                <td colspan="14"></td>
            </tr>
            
            <tr>
                <td></td>
                <th>electricity</th>
                <td><input type="text" value="{format-number(@cap_ele_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=27&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=28&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=29&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=30&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=31&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=32&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=33&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=34&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=35&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=36&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=37&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=38&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_ele_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=39&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            
            

            <tr>
                <th>generation</th>
                <td colspan="13"></td>
            </tr>
            
 
            <tr>
                <td></td>
                <th>electricity</th>
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
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=gen_ele_hyd',disp);"/></td>
            </tr>


            <tr>
                <th>capacity</th>
                <td colspan="13"></td>
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
                <td></td>
                <td><input type="text" value="{format-number(@cap_base_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_base_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=76&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td></td>
                <td></td>
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
                <td></td>
                <td><input type="text" value="{format-number(@cap_cool_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_cool_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=89&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td></td>
                <td></td>
            </tr>
            
          
            <tr>
                <td></td>
                <th>heat industrial</th>
                <td><input type="text" value="{format-number(@cap_hind_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=92&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=93&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=94&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=95&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=96&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=97&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=98&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=99&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=100&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=101&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=102&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=103&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hind_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=104&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            
            <tr>
                <td></td>
                <th>heat residential</th>
                <td><input type="text" value="{format-number(@cap_hres_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=105&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=106&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=107&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=108&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=109&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=110&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=111&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=112&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=113&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=114&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=115&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=116&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_hres_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=117&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            <tr>
                <td></td>
                <th>transport road</th>
                <td><input type="text" value="{format-number(@cap_road_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=131&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=132&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=133&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=134&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=135&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=136&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=137&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=138&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=139&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=140&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=141&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=142&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_road_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_road_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=143&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            <tr>
                <td></td>
                <th>transport rail</th>
                <td><input type="text" value="{format-number(@cap_rail_pet,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_pet',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=118&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_gas,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_gas',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=119&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_nuc,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_nuc',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=120&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_riv,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_riv',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=121&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_res,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_res',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=122&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_pmp,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_pmp',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=123&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_sol,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_sol',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=124&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_wnd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_wnd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=125&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_bio,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_bio',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=126&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_wst,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_wst',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=127&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_ele,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_ele',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=128&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_hds,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_hds',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=129&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_rail_hyd,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=cap_rail_hyd',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=130&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
            </tr>
            
            
            <tr>
                <th>consumption</th>
                <td colspan="14"></td>
                <th>supply</th>
                <th>demand</th>
                <th>surplus</th>
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
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_base_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_base_ele',disp);"/></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_base, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_base',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_base,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_base',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=228&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_base, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_base',disp);"/>
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
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_cool_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_cool_ele',disp);"/></td>
                <td></td>
                <td></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_cool, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_cool',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_cool,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_cool',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=229&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_cool, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_cool',disp);"/>
                </td>
            </tr>
            
            <tr>
                <td></td>
                <th>heat industrial</th>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hind_hyd',disp);"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_hind, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_hind',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_hind,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_hind',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=230&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_hind, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_hind',disp);"/>
                </td>
            </tr>
            
            <tr>
                <td></td>
                <th>heat residential</th>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_hres_hyd',disp);"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_hres, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_hres',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_hres,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_hres',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=231&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_hres, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_hres',disp);"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <th>transport road</th>
                <td><input type="text" readonly="true" value="{format-number(@con_road_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_road_hyd',disp);"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_road, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_road',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_road,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_road',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=233&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_road, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_road',disp);"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <th>transport rail</th>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=con_rail_hyd',disp);"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sup_rail, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sup_rail',disp);"/>
                </td>
                <td><input type="text" value="{format-number(@dem_rail,'0.00')}" onfocus="this.old_value=this.value;fn_get('col.php?mth=disp&amp;col_name=dem_rail',disp);" onchange="window.location.href='evt.php?mth=upsert&amp;col_id=232&amp;n={@n}&amp;t={@t}&amp;v1='+(this.value-this.old_value);" class="input1"/></td>
                <td>
                    <input type="text" readonly="true" value="{format-number(@sur_rail, '###,##0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=sur_rail',disp);"/>
                </td>
            </tr>
            
            <tr>
                <th>balance</th>
                <td colspan="14"></td>
            </tr>
            
            <tr>
                <th></th>
                <th>surplus</th>
                <td><input type="text" readonly="true" value="{format-number(@bal_pet,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_pet',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_gas,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_gas',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_nuc,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_nuc',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_riv,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_riv',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_res,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_res',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_pmp,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_pmp',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_sol,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_sol',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_wnd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_wnd',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_bio,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_bio',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_wst,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_wst',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_ele,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_ele',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hds,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hds',disp);"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hyd,'0.00')}" class="input1" onfocus="fn_get('col.php?mth=disp&amp;col_name=bal_hyd',disp);"/></td>
            </tr>
            
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>