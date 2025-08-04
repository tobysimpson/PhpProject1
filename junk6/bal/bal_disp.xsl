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
                    <input id="res_id" value="{@res_id}" type="text" readonly="true" class="input1"/>
                </td>
                <td>
                    <a href="bal.php?mth=disp&amp;res_id={@res_id}&amp;n={@n - 52}">&lt;&lt;</a>
                    <xsl:text>  </xsl:text>
                    <a href="bal.php?mth=disp&amp;res_id={@res_id}&amp;n={@n - 1}">&lt;</a>
                </td>
                <td>
                    <!--<xsl:value-of select="@n"/>-->
                    <input id="n" type="text" value="{@n}" class="input1" onchange="window.location.href='bal.php?mth=disp&amp;res_id={@res_id}&amp;n='+this.value;"/>
                </td>
                <td>
                    <a href="bal.php?mth=disp&amp;res_id={@res_id}&amp;n={@n+1}">&gt;</a>
                    <xsl:text>  </xsl:text>
                    <a href="bal.php?mth=disp&amp;res_id={@res_id}&amp;n={@n+52}">&gt;&gt;</a>
                </td>
                <td>
                    <a href="#" onclick="fn_get('bal.php?mth=sum&amp;res_id={@res_id}',disp);">summary</a>
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
                <td><input type="text" value="{format-number(@avl_pet,'0.00')}" onfocus="fn_focus(this);" col_id="1" col_name="avl_pet" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_gas,'0.00')}" onfocus="fn_focus(this);" col_id="2" col_name="avl_gas" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="3" col_name="avl_nuc" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_riv,'0.00')}" onfocus="fn_focus(this);" col_id="4" col_name="avl_riv" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_res,'0.00')}" onfocus="fn_focus(this);" col_id="5" col_name="avl_res" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_pmp,'0.00')}" onfocus="fn_focus(this);" col_id="6" col_name="avl_pmp" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_sol,'0.00')}" onfocus="fn_focus(this);" col_id="7" col_name="avl_sol" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wnd,'0.00')}" onfocus="fn_focus(this);" col_id="8" col_name="avl_wnd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_bio,'0.00')}" onfocus="fn_focus(this);" col_id="9" col_name="avl_bio" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_wst,'0.00')}" onfocus="fn_focus(this);" col_id="10" col_name="avl_wst" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@avl_geo,'0.00')}" onfocus="fn_focus(this);" col_id="11" col_name="avl_geo" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>production</td>
                <td><input type="text" value="{format-number(@prd_pet,'0.00')}" onfocus="fn_focus(this);" col_id="15" col_name="prd_pet" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_gas,'0.00')}" onfocus="fn_focus(this);" col_id="16" col_name="prd_gas" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="17" col_name="prd_nuc" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@prd_bio,'0.00')}" onfocus="fn_focus(this);" col_id="23" col_name="prd_bio" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@prd_wst,'0.00')}" onfocus="fn_focus(this);" col_id="24" col_name="prd_wst" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th colspan="15">capacity</th>
            </tr>
            <tr>
                <td>electricity</td>
                <td><input type="text" value="{format-number(@cap_ele_pet,'0.00')}" onfocus="fn_focus(this);" col_id="29" col_name="cap_ele_pet" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_gas,'0.00')}" onfocus="fn_focus(this);" col_id="30" col_name="cap_ele_gas" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="31" col_name="cap_ele_nuc" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_riv,'0.00')}" onfocus="fn_focus(this);" col_id="32" col_name="cap_ele_riv" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_res,'0.00')}" onfocus="fn_focus(this);" col_id="33" col_name="cap_ele_res" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_pmp,'0.00')}" onfocus="fn_focus(this);" col_id="34" col_name="cap_ele_pmp" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_sol,'0.00')}" onfocus="fn_focus(this);" col_id="35" col_name="cap_ele_sol" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wnd,'0.00')}" onfocus="fn_focus(this);" col_id="36" col_name="cap_ele_wnd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_bio,'0.00')}" onfocus="fn_focus(this);" col_id="37" col_name="cap_ele_bio" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_wst,'0.00')}" onfocus="fn_focus(this);" col_id="38" col_name="cap_ele_wst" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_ele_geo,'0.00')}" onfocus="fn_focus(this);" col_id="39" col_name="cap_ele_geo" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <th colspan="15">generation</th>
            </tr>
            
            <tr>
                <td>auction</td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_pet,'0.00')}" onfocus="fn_focus(this);" col_id="277" col_name="mkt_ele_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_gas,'0.00')}" onfocus="fn_focus(this);" col_id="278" col_name="mkt_ele_gas" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="279" col_name="mkt_ele_nuc" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_riv,'0.00')}" onfocus="fn_focus(this);" col_id="280" col_name="mkt_ele_riv" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_res,'0.00')}" onfocus="fn_focus(this);" col_id="281" col_name="mkt_ele_res" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_pmp,'0.00')}" onfocus="fn_focus(this);" col_id="282" col_name="mkt_ele_pmp" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_sol,'0.00')}" onfocus="fn_focus(this);" col_id="283" col_name="mkt_ele_sol" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_wnd,'0.00')}" onfocus="fn_focus(this);" col_id="284" col_name="mkt_ele_wnd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_bio,'0.00')}" onfocus="fn_focus(this);" col_id="285" col_name="mkt_ele_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_wst,'0.00')}" onfocus="fn_focus(this);" col_id="286" col_name="mkt_ele_wst" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele_geo,'0.00')}" onfocus="fn_focus(this);" col_id="287" col_name="mkt_ele_geo" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@mkt_ele,'0.00')}" onfocus="fn_focus(this);" col_name="mkt_ele" class="input1"/></td>
                <td></td>
                <td></td>
            </tr>
           
 
            <tr>
                <td>delivered</td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_pet,'0.00')}" onfocus="fn_focus(this);" col_id="43" col_name="gen_ele_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_gas,'0.00')}" onfocus="fn_focus(this);" col_id="44" col_name="gen_ele_gas" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="45" col_name="gen_ele_nuc" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_riv,'0.00')}" onfocus="fn_focus(this);" col_id="46" col_name="gen_ele_riv" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_res,'0.00')}" onfocus="fn_focus(this);" col_id="47" col_name="gen_ele_res" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_pmp,'0.00')}" onfocus="fn_focus(this);" col_id="48" col_name="gen_ele_pmp" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_sol,'0.00')}" onfocus="fn_focus(this);" col_id="49" col_name="gen_ele_sol" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_wnd,'0.00')}" onfocus="fn_focus(this);" col_id="50" col_name="gen_ele_wnd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_bio,'0.00')}" onfocus="fn_focus(this);" col_id="51" col_name="gen_ele_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_wst,'0.00')}" onfocus="fn_focus(this);" col_id="52" col_name="gen_ele_wst" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele_geo,'0.00')}" onfocus="fn_focus(this);" col_id="53" col_name="gen_ele_geo" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@gen_ele,'0.00')}" onfocus="fn_focus(this);" col_name="gen_ele" class="input1"/></td>
                <td></td>
                <td></td>
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
                <td><input type="text" value="{format-number(@cap_base_ele,'0.00')}" onfocus="fn_focus(this);" col_id="68" col_name="cap_base_ele" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_base,'0.00')}" onfocus="fn_focus(this);" col_id="271" col_name="cap_base" class="input1"/></td>
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
                <td><input type="text" value="{format-number(@cap_cool_ele,'0.00')}" onfocus="fn_focus(this);" col_id="82" col_name="cap_cool_ele" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_cool,'0.00')}" onfocus="fn_focus(this);" col_id="272" col_name="cap_cool" class="input1"/></td>
            </tr>
            
          
            <tr>
                <td>heat industrial</td>
                <td><input type="text" value="{format-number(@cap_hind_pet,'0.00')}" onfocus="fn_focus(this);" col_id="85" col_name="cap_hind_pet" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_gas,'0.00')}" onfocus="fn_focus(this);" col_id="86" col_name="cap_hind_gas" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_hind_bio,'0.00')}" onfocus="fn_focus(this);" col_id="93" col_name="cap_hind_bio" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_wst,'0.00')}" onfocus="fn_focus(this);" col_id="94" col_name="cap_hind_wst" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_geo,'0.00')}" onfocus="fn_focus(this);" col_id="95" col_name="cap_hind_geo" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_ele,'0.00')}" onfocus="fn_focus(this);" col_id="96" col_name="cap_hind_ele" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hds,'0.00')}" onfocus="fn_focus(this);" col_id="97" col_name="cap_hind_hds" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hind_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="98" col_name="cap_hind_hyd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_hind,'0.00')}" onfocus="fn_focus(this);" col_id="273" col_name="cap_hind" class="input1"/></td>
            </tr>
            
            <tr>
                <td>heat residential</td>
                <td><input type="text" value="{format-number(@cap_hres_pet,'0.00')}" onfocus="fn_focus(this);" col_id="99" col_name="cap_hres_pet" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_gas,'0.00')}" onfocus="fn_focus(this);" col_id="100" col_name="cap_hres_gas" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_hres_bio,'0.00')}" onfocus="fn_focus(this);" col_id="107" col_name="cap_hres_bio" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_wst,'0.00')}" onfocus="fn_focus(this);" col_id="108" col_name="cap_hres_wst" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_geo,'0.00')}" onfocus="fn_focus(this);" col_id="109" col_name="cap_hres_geo" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_ele,'0.00')}" onfocus="fn_focus(this);" col_id="110" col_name="cap_hres_ele" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hds,'0.00')}" onfocus="fn_focus(this);" col_id="111" col_name="cap_hres_hds" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" value="{format-number(@cap_hres_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="112" col_name="cap_hres_hyd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_hres,'0.00')}" onfocus="fn_focus(this);" col_id="274" col_name="cap_hres" class="input1"/></td>
            </tr>
            <tr>
                <td>transport road</td>
                <td><input type="text" value="{format-number(@cap_road_pet,'0.00')}" onfocus="fn_focus(this);" col_id="113" col_name="cap_road_pet" onchange="fn_change(this)" class="input1"/></td>
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
                <td><input type="text" value="{format-number(@cap_road_ele,'0.00')}" onfocus="fn_focus(this);" col_id="124" col_name="cap_road_ele" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_road_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="126" col_name="cap_road_hyd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_road,'0.00')}" onfocus="fn_focus(this);" col_id="275" col_name="cap_road" class="input1"/></td>
            </tr>
            <tr>
                <td>transport rail</td>
                <td><input type="text" value="{format-number(@cap_rail_pet,'0.00')}" onfocus="fn_focus(this);" col_id="127" col_name="cap_rail_pet" onchange="fn_change(this)" class="input1"/></td>
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
                <td><input type="text" value="{format-number(@cap_rail_ele,'0.00')}" onfocus="fn_focus(this);" col_id="138" col_name="cap_rail_ele" onchange="fn_change(this)" class="input1"/></td>
                <td></td>
                <td><input type="text" value="{format-number(@cap_rail_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="140" col_name="cap_rail_hyd" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@cap_rail,'0.00')}" onfocus="fn_focus(this);" col_id="276" col_name="cap_rail" class="input1"/></td>
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
                <td><input type="text" readonly="true" value="{format-number(@con_base_ele,'0.00')}" onfocus="fn_focus(this);" col_id="152" col_name="con_base_ele" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_base,'0.00')}" onfocus="fn_focus(this);" col_id="225" col_name="sup_base" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_base,'0.00')}" onfocus="fn_focus(this);" col_id="231" col_name="dem_base" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_base,'0.00')}" onfocus="fn_focus(this);" col_id="237" col_name="bal_base" class="input1"/></td>
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
                <td><input type="text" readonly="true" value="{format-number(@con_cool_ele,'0.00')}" onfocus="fn_focus(this);" col_id="166" col_name="con_cool_ele" class="input1"/></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_cool,'0.00')}" onfocus="fn_focus(this);" col_id="226" col_name="sup_cool" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_cool,'0.00')}" onfocus="fn_focus(this);" col_id="232" col_name="dem_cool" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_cool,'0.00')}" onfocus="fn_focus(this);" col_id="238" col_name="bal_cool" class="input1"/></td>
            </tr>
            
            <tr>
                <td>heat industrial</td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_pet,'0.00')}" onfocus="fn_focus(this);" col_id="169" col_name="con_hind_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_gas,'0.00')}" onfocus="fn_focus(this);" col_id="170" col_name="con_hind_gas" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_bio,'0.00')}" onfocus="fn_focus(this);" col_id="177" col_name="con_hind_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_wst,'0.00')}" onfocus="fn_focus(this);" col_id="178" col_name="con_hind_wst" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_geo,'0.00')}" onfocus="fn_focus(this);" col_id="179" col_name="con_hind_geo" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_ele,'0.00')}" onfocus="fn_focus(this);" col_id="180" col_name="con_hind_ele" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hds,'0.00')}" onfocus="fn_focus(this);" col_id="181" col_name="con_hind_hds" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hind_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="182" col_name="con_hind_hyd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_hind,'0.00')}" onfocus="fn_focus(this);" col_id="227" col_name="sup_hind" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_hind,'0.00')}" onfocus="fn_focus(this);" col_id="233" col_name="dem_hind" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hind,'0.00')}" onfocus="fn_focus(this);" col_id="239" col_name="bal_hind" class="input1"/></td>
            </tr>
            
            <tr>
                <td>heat residential</td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_pet,'0.00')}" onfocus="fn_focus(this);" col_id="183" col_name="con_hres_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_gas,'0.00')}" onfocus="fn_focus(this);" col_id="184" col_name="con_hres_gas" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_bio,'0.00')}" onfocus="fn_focus(this);" col_id="191" col_name="con_hres_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_wst,'0.00')}" onfocus="fn_focus(this);" col_id="192" col_name="con_hres_wst" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_geo,'0.00')}" onfocus="fn_focus(this);" col_id="193" col_name="con_hres_geo" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_ele,'0.00')}" onfocus="fn_focus(this);" col_id="194" col_name="con_hres_ele" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hds,'0.00')}" onfocus="fn_focus(this);" col_id="195" col_name="con_hres_hds" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hres_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="196" col_name="con_hres_hyd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_hres,'0.00')}" onfocus="fn_focus(this);" col_id="228" col_name="sup_hres" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_hres,'0.00')}" onfocus="fn_focus(this);" col_id="234" col_name="dem_hres" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hres,'0.00')}" onfocus="fn_focus(this);" col_id="240" col_name="bal_hres" class="input1"/></td>
            </tr>
            <tr>
                <td>transport road</td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_pet,'0.00')}" onfocus="fn_focus(this);" col_id="197" col_name="con_road_pet" class="input1"/></td>
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
                <td><input type="text" readonly="true" value="{format-number(@con_road_ele,'0.00')}" onfocus="fn_focus(this);" col_id="208" col_name="con_road_ele" class="input1"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_road_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="210" col_name="con_road_hyd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_road,'0.00')}" onfocus="fn_focus(this);" col_id="229" col_name="sup_road" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_road,'0.00')}" onfocus="fn_focus(this);" col_id="235" col_name="dem_road" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_road,'0.00')}" onfocus="fn_focus(this);" col_id="241" col_name="bal_road" class="input1"/></td>
            </tr>

            <tr>
                <td>transport rail</td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_pet,'0.00')}" onfocus="fn_focus(this);" col_id="211" col_name="con_rail_pet" class="input1"/></td>
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
                <td><input type="text" readonly="true" value="{format-number(@con_rail_ele,'0.00')}" onfocus="fn_focus(this);" col_id="222" col_name="con_rail_ele" class="input1"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_rail_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="224" col_name="con_rail_hyd" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@sup_rail,'0.00')}" onfocus="fn_focus(this);" col_id="230" col_name="sup_rail" class="input1"/></td>
                <td><input type="text" value="{format-number(@dem_rail,'0.00')}" onfocus="fn_focus(this);" col_id="236" col_name="dem_rail" onchange="fn_change(this)" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_rail,'0.00')}" onfocus="fn_focus(this);" col_id="242" col_name="bal_rail" class="input1"/></td>
            </tr>
            
            <tr>
                <td>subtotal</td>
                <td><input type="text" readonly="true" value="{format-number(@con_pet,'0.00')}" onfocus="fn_focus(this);" col_id="257" col_name="con_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_gas,'0.00')}" onfocus="fn_focus(this);" col_id="258" col_name="con_gas" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_bio,'0.00')}" onfocus="fn_focus(this);" col_id="512" col_name="con_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_wst,'0.00')}" onfocus="fn_focus(this);" col_id="513" col_name="con_wst" class="input1"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@con_ele,'0.00')}" onfocus="fn_focus(this);" col_id="268" col_name="con_ele" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hds,'0.00')}" onfocus="fn_focus(this);" col_id="269" col_name="con_hds" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@con_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="270" col_name="con_hyd" class="input1"/></td>
            </tr>
            
            <tr>
                <th colspan="15">balance</th>
            </tr>
            
            <tr>
                <td>export</td>
                <td><input type="text" readonly="true" value="{format-number(@bal_pet,'0.00')}" onfocus="fn_focus(this);" col_id="243" col_name="bal_pet" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_gas,'0.00')}" onfocus="fn_focus(this);" col_id="244" col_name="bal_gas" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_nuc,'0.00')}" onfocus="fn_focus(this);" col_id="245" col_name="bal_nuc" class="input1"/></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_bio,'0.00')}" onfocus="fn_focus(this);" col_id="514" col_name="bal_bio" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_wst,'0.00')}" onfocus="fn_focus(this);" col_id="515" col_name="bal_wst" class="input1"/></td>
                <td></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_ele,'0.00')}" onfocus="fn_focus(this);" col_id="254" col_name="bal_ele" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hds,'0.00')}" onfocus="fn_focus(this);" col_id="255" col_name="bal_hds" class="input1"/></td>
                <td><input type="text" readonly="true" value="{format-number(@bal_hyd,'0.00')}" onfocus="fn_focus(this);" col_id="256" col_name="bal_hyd" class="input1"/></td>
            </tr>
            
        </table>
        
        <div id="disp"></div>
        
    </xsl:template>
</xsl:stylesheet>