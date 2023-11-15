<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <!--    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>-->
    
    
    <xsl:template match="root/row">
        <form action="res.php?mth=update" method="post">
            <table class="table2">
            
                <tr>
                    <th>res_id</th>
                    <td>
                        <input type="text" name="res_id" value="{@res_id}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <th>res_name</th>
                    <td>
                        <input type="text" name="res_name" value="{@res_name}"/>
                    </td>
                </tr>
                <tr>
                    <th>res_dt</th>
                    <td>
                        <input type="text" name="res_dt" value="{@res_dt}"/>
                    </td>
                </tr>
                <tr>
                    <th>res_nt</th>
                    <td>
                        <input type="text" name="res_nt" value="{@res_nt}"/>
                    </td>
                </tr>
                <tr>
                    <th>res_tick</th>
                    <td>
                        <input type="text" name="res_tick" value="{format-number(@res_tick, '0.000')}"/>
                    </td>
                </tr>
                <tr>
                    <th>res_mod</th>
                    <td>
                        <input type="text" name="res_mod" value="{@res_mod}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit"/>
                    </td>
                    <td/>
                </tr>
            </table>
        </form>

    </xsl:template>
</xsl:stylesheet>