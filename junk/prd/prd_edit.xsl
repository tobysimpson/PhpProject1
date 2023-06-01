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
            <form action="res.php?mth=update" method="post">
               <tr>
                    <th>res_id</th>
                    <td>
                        <input type="text" name="res_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@res_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>res_name</th>
                    <td>
                        <input type="text" name="res_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@res_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>res_n1</th>
                    <td>
                        <input type="text" name="res_n1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@res_n1"/>
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