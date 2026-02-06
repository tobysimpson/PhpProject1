<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="root">
        <xsl:variable name="scn_id" select="tbl[1]/row/@scn_id"/>
        <!-- head -->
        <xsl:text>prm_id,</xsl:text>
        <xsl:text>scn_id,</xsl:text>
        <xsl:text>name,</xsl:text>
        <xsl:text>unit</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
        <!-- body -->
        <xsl:for-each select="tbl[2]/row">
            <xsl:value-of select="@prm_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="$scn_id"/>
            <xsl:text>,"</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>","</xsl:text>
            <xsl:value-of select="@unit"/>
            <xsl:text>"</xsl:text>
            <xsl:if test="not(position() = last())">
                <xsl:text>&#xD;&#xA;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
    
 