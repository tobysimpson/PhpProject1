<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/root">
        
        <h1>
            <xsl:value-of select="@name"/>
        </h1>
        <table class="table1">
            <tr>
                <xsl:for-each select="row[1]/@*">
                    <th>
                        <xsl:value-of select="name(.)" />
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <xsl:for-each select="@*">
                        <td>
                            <xsl:value-of select="." />
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
        
        
        
        <!--        <table class="table1">
            <tr>
                <th>prc_id</th>
                <th>prc_name</th>
                <th>prc_v1</th>
                <th>prc_v2</th>
                <th colspan="2"></th>
            </tr>
            <xsl:for-each select="root[@name='prc_info']/row">
                <tr>
                    <td>
                        <xsl:value-of select="@prc_id"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@prc_name"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="@prc_v1"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="@prc_v2"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>-->
        
        
    </xsl:template>
</xsl:stylesheet>