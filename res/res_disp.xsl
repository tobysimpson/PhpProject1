<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <xsl:call-template name="res_head"/>
        <hr/>
        <xsl:call-template name="grp_nav"/>
    </xsl:template>
    
    
    <xsl:template name="res_head">
        <table>
            <tr>
                <th>res_id</th>
                <th>res_name</th>
            </tr>
            <tr>
                <td>
                    <xsl:value-of select="tbl[1]/row/@res_id"/>
                </td>
                <td>
                    <xsl:value-of select="tbl[1]/row/@res_name"/>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    
    <xsl:template name="grp_nav">
        <table>
            <tr>
                <xsl:for-each select="tbl[2]/row">
                    <td>
                        <a href="#0" onclick="console.log({//tbl[1]/row/@res_id},{@grp_id});">
                            <xsl:value-of select="@grp_name"/>
                        </a>
                    </td>
                </xsl:for-each>
            </tr>
        </table>
    </xsl:template>
    

    
</xsl:stylesheet>