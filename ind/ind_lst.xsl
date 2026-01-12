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
                <th>ind_id</th>
                <th>ind_grp</th>
                <th>ind_code</th>
                <th>ind_name</th>
                <th>ind_unit</th>
                <th>prm_id</th>
                <th>ind_owner</th>
                <th>ind_pref</th>
                <th>ind_sca</th>
                <th>ind_w</th>
            </tr>
            <xsl:for-each select="//root/tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@ind_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ind_grp"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_code"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ind_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@ind_unit"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_owner"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_pref"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_sca"/>
                    </td>
                    <td>
                        <xsl:value-of select="@ind_w"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>

 