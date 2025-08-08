<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/tbl[1]/row">
        <form action="tbl.php?mth=upd" method="post">
            <table class="table2">
                <tr>
                    <th>tbl_id</th>
                    <td>
                        <input type="text" name="tbl_id" readonly="true" value="{@tbl_id}"/>
                    </td>
                </tr>
                <tr>
                    <th>tbl_pos</th>
                    <td>
                        <input type="text" name="tbl_pos"  value="{@tbl_pos}"/>
                    </td>
                </tr>
                <tr>
                    <th>grp_id</th>
                    <td>
                        <xsl:variable name="grp_id" select="@grp_id"/>
                        <select name="grp_id">
                            <xsl:for-each select="//root/tbl[2]/row">
                                <option value="{@grp_id}">
                                    <xsl:if test="@grp_id = $grp_id">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="@grp_name"/>
                                </option>
                            </xsl:for-each>
                        </select>
                    </td>
                </tr>

                <tr>
                    <th>tbl_name</th>
                    <td>
                        <input type="text" name="tbl_name" length="25" value="{@tbl_name}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <th>tbl_desc</th>
                    <td>
                        <input type="text" name="tbl_desc" length="45" value="{@tbl_desc}"/>
                    </td>
                </tr>
                <tr>
                    <th>tbl_act</th>
                    <td>
                        <input type="radio" name="tbl_act" id="r1" value="1">
                            <xsl:if test="@tbl_act = 1">
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </input>
                        <label for="r1">active</label>
                        <xsl:text>  </xsl:text>
                        <input type="radio" name="tbl_act" id="r2" value="0">  
                            <xsl:if test="@tbl_act = 0">
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