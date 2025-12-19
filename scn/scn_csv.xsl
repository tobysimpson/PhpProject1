<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    

    <xsl:template match="root">
        <xsl:text>scn_id,</xsl:text>
        <xsl:text>sps_id,</xsl:text>
        <xsl:text>sps_code,</xsl:text>
        <xsl:text>shk_id,</xsl:text>
        <xsl:text>shk_name,</xsl:text>
        <xsl:text>shk_code,</xsl:text>
        <xsl:text>shk_lvl,</xsl:text>
        <xsl:text>scn_code</xsl:text>
        <xsl:text>&#xD;&#xA;</xsl:text>
        <xsl:for-each select="tbl[1]/row">
            <xsl:value-of select="@scn_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@sps_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@sps_code"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@shk_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@shk_name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@shk_code"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@shk_lvl"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@scn_code"/>
            <xsl:if test="position() != last()">
                <xsl:text>&#xD;&#xA;</xsl:text>     
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>