<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="layout.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>    
    
    <xsl:template match="root/row">
        <table class="table2">
            <form action="pdt.php?mth=update" method="post">
                <tr>
                    <td>pdt_id</td>
                    <td>
                        <input type="text" name="pdt_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>usr_id</td>
                    <td>
                        <input type="text" name="usr_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@usr_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>pdt_name</td>
                    <td>
                        <input type="text" name="pdt_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <input type="submit"/>
                    </td>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>