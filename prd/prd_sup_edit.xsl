<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/row">
        <table class="table2">
            <form action="prd.php?mth=prd_sup_update" method="post">

                <tr>
                    <th>prd_id</th>
                    <td>
                        <input type="text" name="prd_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@prd_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>prc_id</th>
                    <td>
                        <input type="text" name="prc_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@prc_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>v1</th>
                    <td>
                        <input type="text" name="v1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@v1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>v2</th>
                    <td>
                        <input type="text" name="v2">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@v2"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td><input type="submit"/></td>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>