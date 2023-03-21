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
            <form action="pda.php?mth=update" method="post">
                <tr>
                    <th>pda_id</th>
                    <td>
                        <input type="text" name="pda_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
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
                    <th>pda_name</th>
                    <td>
                        <input type="text" name="pda_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pda_p1</th>
                    <td>
                        <input type="text" name="pda_p1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_p1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pda_p2</th>
                    <td>
                        <input type="text" name="pda_p2">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_p2"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pda_p3</th>
                    <td>
                        <input type="text" name="pda_p3">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_p3"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>pda_p4</th>
                    <td>
                        <input type="text" name="pda_p4">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@pda_p4"/>
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