<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>


    <xsl:template match="root"> 
        
<!--        <script>
            <xsl:text>setTimeout(function(){window.location.replace('met.php?mth=step&amp;res_id=</xsl:text>
            <xsl:value-of select="@res_id"/>
            <xsl:text>')}, 5000);</xsl:text>
        </script>-->
        
        <a href="res.php?mth=step&amp;res_id={@res_id}">res_step</a>
        <xsl:text> </xsl:text>
        <a href="met.php?mth=init&amp;res_id={@res_id}">met_init</a>
        <xsl:text> </xsl:text>
        <a href="met.php?mth=step&amp;res_id={@res_id}">met_step</a>
        <p/>
        

        <table>
            <tr>
                <td id="met">
                    <table>
                        <tr>
                            <td>
                                <!--<img src="met.php?mth=tmp_plot&amp;res_id={row/@res_id}"/>-->
                                <object type="image/svg+xml" data="met.php?mth=tmp_plot&amp;res_id={@res_id}" style="width:600; height:300;"/>
                            </td>
                            <td>
                                <!--<img src="met.php?mth=wnd_plot&amp;res_id={row/@res_id}"/>-->
                                <object type="image/svg+xml" data="met.php?mth=wnd_plot&amp;res_id={@res_id}" style="width:600; height:300;"/>
                            </td>
                            <td>
                                <!--<img src="met.php?mth=wnd_plot&amp;res_id={row/@res_id}"/>-->
                                <object type="image/svg+xml" data="met.php?mth=cld_plot&amp;res_id={@res_id}" style="width:600; height:300;"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        


        <table>            
            <tr>
                <td id="prd">
                    <table class="table1">
                        <tr>
                            <th>res_id</th>
                            <th>prd_id</th>
                            <th>dem_id</th>
                            <th>prd_name</th>
                            <th>dem_desc</th>
                            <th colspan="1"></th>
                        </tr>
                        <xsl:for-each select="root[@name='met_dem']/row">
                            <tr>
                                <td>
                                    <xsl:value-of select="@res_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@prd_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@dem_id"/>
                                </td>
                                <td style="text-align:left;">
                                    <xsl:value-of select="@prd_name"/>
                                </td>
                                
                                <td style="text-align:left;">
                                    <xsl:value-of select="@dem_desc"/>
                                </td>
                                <td>
                                    <!--<img style="width:auto; height:80;" src="met.php?mth=dem_plot&amp;dem_id={@dem_id}"/>-->
                                    <object type="image/svg+xml" data="met.php?mth=dem_plot&amp;dem_id={@dem_id}" style="width:500; height:200;"/>
                                </td>
                            </tr>
                        </xsl:for-each> 
                    </table>
                </td>
            </tr>
        </table>
       
       
       
        <table>            
            <tr>
                <td id="prd">
                    <table class="table1">
                        <tr>
                            <th>res_id</th>
                            <th>prd_id</th>
                            <th>prd_name</th>
                            <th colspan="1"></th>
                        </tr>
                        <xsl:for-each select="root[@name='prd_info']/row">
                            <tr>
                                <td>
                                    <xsl:value-of select="@res_id"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@prd_id"/>
                                </td>
                                <td style="text-align:left;">
                                    <xsl:value-of select="@prd_name"/>
                                </td>
                                <td>
                                    <!--<img style="width:auto; height:80;" src="prd.php?mth=hist&amp;prd_id={@prd_id}"/>-->
                                    <object type="image/svg+xml" data="met.php?mth=dem_agg&amp;prd_id={@prd_id}" style="width:500; height:200;"/>
                                </td>
                                <td>
                                    <!--<img style="width:auto; height:80;" src="prd.php?mth=hist&amp;prd_id={@prd_id}"/>-->
                                    <object type="image/svg+xml" data="prd.php?mth=hist&amp;prd_id={@prd_id}" style="width:500; height:200;"/>
                                </td>
                            </tr>
                        </xsl:for-each> 
                    </table>
                </td>
            </tr>
        </table>
        
    </xsl:template>
  
</xsl:stylesheet>