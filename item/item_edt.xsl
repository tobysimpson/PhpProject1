<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/tbl[1]/row">
        <form action="item.php?mth=upd" method="post">
            <table class="table2">
            
                <tr>
                    <th>item_id</th>
                    <td>
                        <input type="text" name="item_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>item_name</th>
                    <td>
                        <input type="text" name="item_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
<!--                <tr>
                    <th>item_val1</th>
                    <td>
                        <input type="text" name="item_val1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@item_val1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>-->
                <tr>
                    <th>item_val1</th>
                    <td>
                        <xsl:variable name="item_val1" select="@item_val1"/>
                        <select name="item_val1">
                            <xsl:for-each select="//root/tbl[2]/row">
                                <option value="{@item_id}">
                                    <xsl:if test="@item_id = $item_val1">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="@item_name"/>
                                </option>
                            </xsl:for-each>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>item_val2</th>
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