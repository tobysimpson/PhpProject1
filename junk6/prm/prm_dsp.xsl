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
        
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="cat_id" select="@cat_id"/>
   
                <tr>
                    <th colspan="11" style="text-align:left;" >
                        <hr/>
                        <!--<xsl:value-of select="@cat_name"/> -->
                    </th>
                </tr> 

                <tr>
                    <th>cat_grp</th>
                    <th>prm_id</th>
                    <th>prm_code</th>
                    <th>cat_name</th>
                    <th>obj_name</th>
                    <th>dem_name</th>
                    <th>fld_name</th>
                    <th>prm_def</th>
                    <!--<th>prm_tick</th>-->
                    <th>prm_cal</th>
                    <th></th>
                </tr>
                
                
                <xsl:for-each select="//root/tbl[2]/row[@cat_id = $cat_id]">
                    <tr>
                        <td>
                            <xsl:value-of select="@cat_grp"/>
                        </td>
                        <td>
                            <xsl:value-of select="@prm_id"/>
                        </td>
                        <td style="text-align:left;">
                            <xsl:value-of select="@prm_code"/>
                        </td>
                        <td style="text-align:left;">
                            <xsl:value-of select="@cat_name"/>
                        </td>
            
                        <td style="text-align:left;">
                            <xsl:value-of select="@obj_name"/>
                        </td>
        
                        <td style="text-align:left;">
                            <xsl:value-of select="@dem_name"/>
                        </td>
                        
                        <td style="text-align:left;">
                            <xsl:value-of select="@fld_name"/>
                        </td>
                        <td>
                            <xsl:value-of select="format-number(@prm_def, '0.000')"/>
                        </td>
<!--                        <td>
                            <xsl:value-of select="format-number(@prm_tick, '0.000')"/>
                        </td>-->
                        <td>
                            <xsl:value-of select="@prm_cal"/>
                        </td>
                        <td>
                            <a href="prm.php?mth=edit&amp;prm_id={@prm_id}">edit</a>
                        </td>
                    </tr>
                </xsl:for-each> 
            </xsl:for-each>
        </table>           
    </xsl:template>
</xsl:stylesheet>