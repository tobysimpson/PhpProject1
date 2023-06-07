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
                <th>prd_id</th>
                <th>prd_name</th>
                <th colspan="6"></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name"/>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=sd1',disp1);">sup_def</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=su1',disp1);">sup_usr</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=dd1',disp1);">dem_def</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=du1',disp1);">dem_usr</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=ed1',disp1);">exp_def</a>
                    </td>
                    <td>
                        <a href="#" onclick="fn_get('prd.php?mth=eu1',disp1);">exp_usr</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        
        
        <div id="disp1"></div>

    </xsl:template>
</xsl:stylesheet>