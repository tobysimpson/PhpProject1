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
            <form action="evt.php?mth=update" method="post">
               <tr>
                    <th>evt_id</th>
                    <td>
                        <input type="text" name="evt_id" value="{@evt_id}" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <th>time</th>
                    <td>
                        <input type="text" name="t" value="{@t}"/>
                    </td>
                </tr>
                <tr>
                    <th>value</th>
                    <td>
                        <input type="text" name="v1" value="{@v1}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit"/>
                    </td>
                    <td></td>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>