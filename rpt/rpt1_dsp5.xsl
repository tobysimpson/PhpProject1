<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    

    <xsl:template match="root">
        <xsl:for-each select="tbl[1]/row">
            <xsl:value-of select="@rpt_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@scn_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@prm_id"/>
            <xsl:text>,"</xsl:text>
            <xsl:value-of select="@path"/>
            <xsl:text>",</xsl:text>
            <xsl:value-of select="@yr"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@u"/>
            <xsl:if test="position() != last()">
                <xsl:text>&#xD;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>