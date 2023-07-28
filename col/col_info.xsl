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
                <th>col_id</th>
                <!--<th>grp_id</th>-->
                <th>grp_ord</th>
                <th>col_ord</th>
                <th>col_name</th>
<!--                <th>prd_id1</th>
                <th>prd_id2</th>-->
                <!--<th>dem_id</th>-->
                <th>col_evt</th>
                <th>grp_code</th>
                <th>prd_code1</th>
                <th>prd_code2</th>
                <th>dem_code</th>
                <th>grp_name</th>
                <th>prd_name1</th>
                <th>prd_name2</th>
                <th>dem_name</th>
                <th>col_note</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>-->
                    <td>
                        <xsl:value-of select="@grp_ord"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_ord"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_name"/>
                    </td>
<!--                    <td>
                        <xsl:value-of select="@prd_id1"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_id2"/>
                    </td>-->
<!--                    <td>
                        <xsl:value-of select="@dem_id"/>
                    </td>-->
                    <td>
                        <xsl:value-of select="@col_evt"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_code1"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_code2"/>
                    </td>
                    <td>
                        <xsl:value-of select="@dem_code"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@grp_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name1"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prd_name2"/>
                    </td>
                    
                    <td style="text-align:left;">
                        <xsl:value-of select="@dem_name"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@col_note"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
        

    </xsl:template>
</xsl:stylesheet>