<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <xsl:apply-templates/> 
    </xsl:template>


    <xsl:template match="tbl">
        
        <table class="table1">
            <tr>
                <th>grp_id</th>
                <th>prc_id</th>
                <th>prd_id</th>
                
                <th>hst_code</th>

                <th>grp_name</th>
                <th>prc_name</th>
                <th>prd_name</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td style="text-align:left">
                        <!--<a href="#0" onclick="fn_get('hst.php?mth=cat1&amp;res_id=1&amp;cat_id=10&amp;xsl=1',div1);">-->
                        <a href="hst.php?mth=plt&amp;prc_id={@prc_id}&amp;prd_id={@prd_id}&amp;xsl=1">
                            <xsl:value-of select="@grp_code"/>
                            <xsl:text>_</xsl:text>
                            <xsl:value-of select="@prc_code"/>
                            <xsl:text>_</xsl:text>
                            <xsl:value-of select="@prd_code"/>
                        </a>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@grp_name"/>
                    </td> 
                    <td style="text-align:left">
                        <xsl:value-of select="@prc_name"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@prd_name"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>

        <div id="div1"></div>

    </xsl:template>
</xsl:stylesheet>