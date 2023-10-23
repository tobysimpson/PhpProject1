<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <table>
            <tr>
                <th>res_id</th>
                <th>res_name</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="row/@res_id"/>
                </td>
                <td>
                    <xsl:value-of select="row/@res_name"/>
                </td>
            </tr>
        </table>
        <hr/>
        <table>
            <tr>
                <td>
                    <a href="#0" onclick="fn_get('grp.php?mth=prm&amp;res_id={row/@res_id}',div1)">params</a>
                </td>
            </tr>
        </table>
        <hr/>
        <div id="div1"></div>
    </xsl:template>
    
</xsl:stylesheet>