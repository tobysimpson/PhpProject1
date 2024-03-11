<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/tbl">
        <table>
            <tr>
                <th>grp_id</th>
                <th>grp_code</th>
                <th>grp_name</th>
                <th>prc_id</th>
                <th>prc_code</th>
                <th>prc_name</th>
                <th>prd_id</th>
                <th>prd_code</th>
                <th>prd_name</th>
                <th>hst_code</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@grp_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@grp_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prc_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prc_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_code"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prd_name"/>
                    </td>
                    <td>
                        <a href="hst.php?mth=plt&amp;prc_id={@prc_id}&amp;prd_id={@prd_id}&amp;xsl=1">
                            <xsl:value-of select="@hst_code"/>
                        </a>
                    </td>
                    <!--                    <td>
                        <a href="hst.php?mth=plt&amp;prc_id={$prc/@prc_id}&amp;prd_id={$prd/@prd_id}&amp;xsl=1">plot</a>
                    </td>-->
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
   
</xsl:stylesheet>