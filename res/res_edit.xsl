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
                    <td>res_id</td>
                    <td>
                        <input type="text" name="res_id" value="{@res_id}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td>res_name</td>
                    <td>
                       <input type="text" name="res_name" value="{@res_name}"/>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit"/></td>
                    <td/>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>