<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/tbl[1]/row">
        <form action="col.php?mth=upd" method="post">
            <table class="table2">
                <tr>
                    <th>col_id</th>
                    <td>
                        <input type="text" name="col_id" readonly="true" value="{@col_id}"/>
                    </td>
                </tr>
                <tr>
                    <th>tbl_id</th>
                    <td>
                        <input type="text" name="tbl_id" readonly="true" value="{@tbl_id}"/>
                    </td>
                </tr>
                <tr>
                    <th>col_pos</th>
                    <td>
                        <input type="text" name="col_pos" value="{@col_pos}"/>
                    </td>
                </tr>
                <!--                <tr>
                    <th>tbl_id</th>
                    <td>
                        <xsl:variable name="tbl_id" select="@tbl_id"/>
                        <select name="tbl_id">
                            <xsl:for-each select="//root/tbl[2]/row">
                                <option value="{@tbl_id}">
                                    <xsl:if test="@tbl_id = $tbl_id">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="@tbl_name"/>
                                </option>
                            </xsl:for-each>
                        </select>
                    </td>
                </tr>-->
                <tr>
                    <th>col_name</th>
                    <td>
                        <input type="text" name="col_name" value="{@col_name}" length="25" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <th>col_desc</th>
                    <td>
                        <input type="text" name="col_desc" value="{@col_desc}" length="45"/>
                    </td>
                </tr>
                <tr>

                    <th>col_unt</th>
                    <td>
                        <input type="text" name="col_unt" value="{@col_unt}" length="45"/>
                    </td>
                </tr>
                <tr>
                    <th>col_typ</th>
                    <td>
                        <select name="col_typ">
                            <option value="1">
                                <xsl:if test="@col_typ = 1">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:text>INT</xsl:text>
                            </option>
                            <option value="2">
                                <xsl:if test="@col_typ = 2">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:text>FLOAT</xsl:text>
                            </option>
                            <option value="3">
                                <xsl:if test="@col_typ = 3">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:text>DATETIME</xsl:text>
                            </option>
                            <option value="4">
                                <xsl:if test="@col_typ = 4">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:text>VARCHAR</xsl:text>
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>col_len</th>
                    <td>
                        <input type="text" name="col_len" value="{@col_len}"/>
                    </td>
                </tr>
                <tr>
                    <th>col_dec</th>
                    <td>
                        <input type="text" name="col_dec" value="{@col_dec}"/>
                    </td>
                </tr>
            
                <tr>
                    <th>col_unq</th>
                    <td>
                        <input type="text" name="col_unq" value="{@col_unq}"/>
                    </td>
                </tr>
                <tr>
                    <th>col_txt</th>
                    <td>
                        <textarea name="col_txt" value="{@col_txt}" rows="10" cols="50">
                            <xsl:value-of select="@col_txt"/>
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <th>col_act</th>
                    <td>
                        <input type="radio" name="col_act" id="r1" value="1">
                            <xsl:if test="@col_act = 1">
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </input>
                        <label for="r1">active</label>
                        <xsl:text>  </xsl:text>
                        <input type="radio" name="col_act" id="r2" value="0">  
                            <xsl:if test="@col_act = 0">
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