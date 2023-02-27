<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:template match="/root">
        <table>
            <tr>
                <th>usr_id</th>
                <th>usr_created</th>
                <th>usr_updated</th>
                <th>remote_addr</th>
                <th>remote_port</th>
                <th>hostname</th>
                <th></th>
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
                    <td>
                        <xsl:value-of select="@remote_addr"/>
                    </td>
                    <td>
                        <xsl:value-of select="@remote_port"/>
                    </td>
                    <td>
                        <xsl:value-of select="@hostname"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>usr_qry.php?usr_id=</xsl:text>
                                <xsl:value-of select="@usr_id"/>
                            </xsl:attribute>
                            <xsl:text>qry</xsl:text>
                        </a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>