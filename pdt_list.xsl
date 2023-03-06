<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="layout.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:template match="root">
        <form action="pdt.php?mth=insert" method="post">
            <input type="submit" value="add new"/>
        </form>
        <table class="table1">
            <tr>
                <th>pdt_id</th>
                <th>usr_id</th>
                <th>pdt_created</th>
                <th>pdt_updated</th>
                <th>pdt_name</th>
                <th></th>
                <th></th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@pdt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pdt_created"/>
                    </td>
                    <td>
                        <xsl:value-of select="@pdt_updated"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@pdt_name"/>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>pdt.php?mth=edit&amp;pdt_id=</xsl:text>
                                <xsl:value-of select="@pdt_id"/>
                            </xsl:attribute>
                            <xsl:text>edit</xsl:text>
                        </a>
                    </td>
                    <td>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>pdt.php?mth=pda&amp;pdt_id=</xsl:text>
                                <xsl:value-of select="@pdt_id"/>
                            </xsl:attribute>
                            <xsl:text>agents</xsl:text>
                        </a>
                    </td>
                    <form action="pda.php?mth=insert" method="post">
                        <td>
                            <input type="hidden" name="pdt_id">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="@pdt_id"/>
                                </xsl:attribute>
                            </input>
                            <input type="submit" value="add agent"/>
                        </td>
                    </form>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>