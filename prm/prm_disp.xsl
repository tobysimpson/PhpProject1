<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>cat_id</th>
                <th>cat_ord</th>
                <th>cat_code</th>
                <th>cat_name</th>
                <th>obj_id</th>
                <th>obj_ord</th>
                <th>obj_code</th>
                <th>obj_name</th>
                <th>fld_id</th>
                <th>fld_ord</th>
                <th>fld_code</th>
                <th>fld_name</th>

                <th>prm_id</th>
                <th>prm_code</th>
                <th>prm_name</th>

                <th>prm_def</th>
                <th>prm_tick</th>
                <th>prm_cal</th>
      
            </tr>
            <xsl:for-each select="row">
                <tr>

                    
                    <td>
                        <xsl:value-of select="@cat_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@cat_ord"/>
                    </td>
                    <td >
                        <xsl:value-of select="@cat_code"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@cat_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@obj_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@obj_ord"/>
                    </td>
                    <td>
                        <xsl:value-of select="@obj_code"/>
                    </td>
                    <td  style="text-align:left;">
                        <xsl:value-of select="@obj_name"/>
                    </td>
                    
                    <td>
                        <xsl:value-of select="@fld_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@fld_ord"/>
                    </td>
                    <td>
                        <xsl:value-of select="@fld_code"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@fld_name"/>
                    </td>

                    
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>

                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_code"/>
                    </td>
                    <td  style="text-align:left;">
                        <xsl:value-of select="@prm_name"/>
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
<!--                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_fn1"/>
                    </td>-->
                    <!--                    <td>
                        <a href="prm.php?mth=edit&amp;prm_id={@prm_id}">
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>-->
                </tr>
            </xsl:for-each> 
        </table>
        
      
    </xsl:template>
</xsl:stylesheet>