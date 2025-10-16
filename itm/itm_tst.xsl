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
                <th>itm_id</th>
                <th>itm_act</th>
                <th>itm_date</th>
                <th>itm_name</th>
                <th>itm_val1</th>
                <th>itm_val2</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@itm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_act"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_date"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@itm_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_val1"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="@itm_val2"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        <p/>
    
        <table class="table1">
            <tr>
                <th>itm_id</th>
                <th>itm_act</th>
                <th>itm_date</th>
                <th>itm_name</th>
                <th>itm_val1</th>
                <th>itm_val2</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@itm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_act"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_date"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@itm_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@itm_val1"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="@itm_val2"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>