<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/row">
        <form action="item.php?mth=upd" method="post">
            <table class="table2">
            
                <tr>
                    <td>item_id</td>
                    <td>
                        <input type="text" name="item_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>item_name</td>
                    <td>
                        <input type="text" name="item_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>item_val1</td>
                    <td>
                        <input type="text" name="item_val1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_val1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>item_val2</td>
                    <td>
                        <input type="text" name="item_val2">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_val2"/>
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
            </table>
        </form>

    </xsl:template>
</xsl:stylesheet>