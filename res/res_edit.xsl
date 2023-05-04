<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/row">
        <table class="table2">
            <form action="res.php?mth=update" method="post">
                <tr>
                    <th>res_id</th>
                    <td>
                        <input type="text" name="res_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>res_name</th>
                    <td>
                        <input type="text" name="res_name" length="20" value="{@res_name}"/>
                    </td>
                </tr>
                <tr>
                    <th>res_n1</th>
                    <td>
                        <input type="text" name="res_n1" value="{@res_n1}"/>
                    </td>
                </tr>
                <tr>
                    <th>tmp_base</th>
                    <td>
                        <input type="text" name="tmp_base" value="{@tmp_base}"/>
                    </td>
                </tr>
                <tr>
                    <th>tmp_trend</th>
                    <td>
                        <input type="text" name="tmp_trend" value="{@tmp_trend}"/>
                    </td>
                </tr>
                <tr>
                    <th>tmp_osc</th>
                    <td>
                        <input type="text" name="tmp_osc" value="{@tmp_osc}"/>
                    </td>
                </tr>
                <tr>
                    <th>tmp_phase</th>
                    <td>
                        <input type="text" name="tmp_phase" value="{@tmp_phase}"/>
                    </td>
                </tr>
                <tr>
                    <th>tmp_noise</th>
                    <td>
                        <input type="text" name="tmp_noise" value="{@tmp_noise}"/>
                    </td>
                </tr>
                <tr>
                    <th>wnd_base</th>
                    <td>
                        <input type="text" name="wnd_base" value="{@wnd_base}"/>
                    </td>
                </tr>
                <tr>
                    <th>wnd_trend</th>
                    <td>
                        <input type="text" name="wnd_trend" value="{@wnd_trend}"/>
                    </td>
                </tr>
                <tr>
                    <th>wnd_osc</th>
                    <td>
                        <input type="text" name="wnd_osc" value="{@wnd_osc}"/>
                    </td>
                </tr>
                <tr>
                    <th>wnd_phase</th>
                    <td>
                        <input type="text" name="wnd_phase" value="{@wnd_phase}"/>
                    </td>
                </tr>
                <tr>
                    <th>wnd_noise</th>
                    <td>
                        <input type="text" name="wnd_noise" value="{@wnd_noise}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <input type="submit"/>
                    </td>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>