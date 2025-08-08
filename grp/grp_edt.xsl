<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root/tbl[1]/row">
        <form action="grp.php?mth=upd" method="post">
            <table class="table2">
                <tr>
                    <th>grp_id</th>
                    <td>
                        <input type="text" name="grp_id" readonly="true" value="{@grp_id}"/>
                    </td>
                </tr>
                <tr>
                    <th>grp_pos</th>
                    <td>
                        <input type="text" name="grp_pos" value="{@grp_pos}"/>
                    </td>
                </tr>
                
                <tr>
                    <th>grp_name</th>
                    <td>
                        <input type="text" name="grp_name" length="25" value="{@grp_name}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <th>grp_desc</th>
                    <td>
                        <input type="text" name="grp_desc" length="45" value="{@grp_desc}"/>
                    </td>
                </tr>
         
                <tr>
                    <th>grp_act</th>
                    <td>
                        <input type="radio" name="grp_act" id="r1" value="1">
                            <xsl:if test="@grp_act = 1">
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </input>
                        <label for="r1">active</label>
                        <xsl:text>  </xsl:text>
                        <input type="radio" name="grp_act" id="r2" value="0">  
                            <xsl:if test="@grp_act = 0">
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