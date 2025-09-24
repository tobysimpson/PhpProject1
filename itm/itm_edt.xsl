<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/tbl[1]/row">
        <form action="itm.php?mth=upd" method="post">
            <table class="table2">
                <tr>
                    <th>itm_id</th>
                    <td>
                        <input type="text" name="itm_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@itm_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>itm_name</th>
                    <td>
                        <input type="text" name="itm_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@itm_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>itm_val1</th>
                    <td>
                        <xsl:variable name="itm_val1" select="@itm_val1"/>
                        <select name="itm_val1">
                            <xsl:for-each select="//root/tbl[2]/row">
                                <option value="{@itm_id}">
                                    <xsl:if test="@itm_id = $itm_val1">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="@itm_name"/>
                                </option>
                            </xsl:for-each>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>itm_val2</th>
                    <td>
                        <input type="text" name="itm_val2" value="{@itm_val2}"/>
                    </td>
                </tr>
                <tr>
                    <th>itm_act</th>
                    <td>
                        <input type="radio" name="itm_act" id="r1" value="1">
                            <xsl:if test="@itm_act = 1">
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </input>
                        <label for="r1">active</label>
                        <xsl:text>  </xsl:text>
                        <input type="radio" name="itm_act" id="r2" value="0">  
                            <xsl:if test="@itm_act = 0">
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </input>
                        <label for="r2">inactive</label>
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