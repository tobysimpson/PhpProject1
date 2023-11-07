<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="root">
        
        <table class="table1">
            <tr>
                <th>res_id</th>
                
                <th>cat_id</th>
                <th>obj_id</th>
                <th>fld_id</th>
                
                <!--                <th>cat_code</th>
                <th>obj_code</th>
                <th>fld_code</th>-->

                <th>prm_id</th>
                <th>prm_code</th>
                
                <th>cat_name</th>
                <th>obj_name</th>
                <th>fld_name</th>

                <th>prm_def</th>
                <th>prm_tick</th>
                <th>prm_cal</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@res_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@cat_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@obj_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@fld_id"/>
                    </td>
                    <!--                    <td >
                            <xsl:value-of select="@cat_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@obj_code"/>
                        </td>
                        <td>
                            <xsl:value-of select="@fld_code"/>
                        </td>
                    -->
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td style="text-align:left;">
                        <a href="#0" onclick="fn_get('prm.php?mth=plot&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div3);">
                            <xsl:value-of select="@prm_code"/>
                        </a>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@cat_name"/>
                    </td>
                    <td  style="text-align:left;">
                        <xsl:value-of select="@obj_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@fld_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_def, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@prm_tick, '0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_cal"/>
                    </td>
                    <td>
                        <a href="#0" onclick="fn_get('prm.php?mth=rst&amp;res_id={@res_id}&amp;prm_id={@prm_id}',div3);">reset</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        <hr/>
        <div id="div3"></div>

    </xsl:template>
</xsl:stylesheet>