<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="root">
        <!-- head -->
        <xsl:text>prm_id,</xsl:text>
        <xsl:text>scn_id,</xsl:text>
        <xsl:text>path,</xsl:text>
        <xsl:text>unit,</xsl:text>
        <xsl:for-each select="//root/tbl[1]/row[1]/@*[substring-before(name(.),'_') = 'col']">
            <xsl:value-of select="substring-after(name(.),'_')"/>
            <xsl:choose>
                <xsl:when test="position() = last()">
                    <xsl:text>&#xD;&#xA;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>,</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
       
        <!-- body -->
        <xsl:for-each select="tbl[1]/row">
            <xsl:value-of select="@prm_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@scn_id"/>
            <xsl:text>,"</xsl:text>
            <xsl:value-of select="@path"/>
            <xsl:text>","</xsl:text>
            <xsl:value-of select="@unit"/>
            <xsl:text>",</xsl:text>
            <xsl:for-each select="@*[substring-before(name(.),'_') = 'col']">
                <xsl:value-of select="."/>
                <xsl:if test="not(position() = last())">
                    <xsl:text>,</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="not(position() = last())">
                <xsl:text>&#xD;&#xA;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
    
 