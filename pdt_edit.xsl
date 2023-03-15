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
                    <th>pdt_id</th>
                    <td>
                        <input type="text" name="pdt_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>usr_id</th>
                    <td>
                        <input type="text" name="usr_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@usr_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_name</th>
                    <td>
                        <input type="text" name="pdt_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_r1</th>
                    <td>
                        <input type="text" name="pdt_r1" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_r1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_r2</th>
                    <td>
                        <input type="text" name="pdt_r2" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_r2"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_r3</th>
                    <td>
                        <input type="text" name="pdt_r3" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_r3"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_r4</th>
                    <td>
                        <input type="text" name="pdt_r4" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_r4"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pdt_iter</th>
                    <td>
                        <input type="text" name="pdt_iter" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pdt_iter"/>
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