<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="layout.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
        
        
    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>pda_id</th>
                <th>pda_created</th>
                <th>pda_updated</th>
                <th>pdt_id</th>
                <th>pdt_name</th>
                <th>usr_id</th>
                <th>usr_name</th>
                <th>pda_name</th>
                <th>pda_p1</th>
                <th>pda_p2</th>
                <th>pda_p3</th>
                <th>pda_p4</th>
                <th></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@pda_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@pda_created,0,11)"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@pda_updated,0,11)"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pdt_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@pdt_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@usr_name"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@pda_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p1, '###,##0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p2, '###,##0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p3, '###,##0.000')"/>
                    </td>
                    <td>
                        <xsl:value-of select="format-number(@pda_p4, '###,##0.000')"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>pda.php?mth=edit&amp;pda_id=</xsl:text>
                                <xsl:value-of select="@pda_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>