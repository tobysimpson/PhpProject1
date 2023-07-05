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
                <th>usr_id</th>
                <th>usr_created</th>
                <th>usr_updated</th>
                <th>usr_name</th>
                <!--                <th>remote_addr</th>
                <th>remote_port</th>
                <th>hostname</th>-->
                <!--<th colspan="2"></th>-->
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@usr_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_created"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_updated"/>
                    </td>
                    <!--                    <td>
                        <xsl:value-of select="substring(@usr_created,0,11)"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@usr_updated,0,11)"/>
                    </td>-->
                    <td style="text-align:left">
                        <xsl:value-of select="@usr_name"/>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>