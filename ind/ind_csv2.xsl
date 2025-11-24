<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    
    
    <xsl:template match="root">
        <xsl:text>scn_code,</xsl:text>
        <xsl:for-each select="//root/tbl[1]/row">
            <xsl:value-of select="@ind_name"/>
            <xsl:choose>
                <xsl:when test="position() = last()">
                    <xsl:text>&#xD;&#xA;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>,</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
 
        <xsl:for-each select="tbl[2]/row">
            <xsl:variable name="scn_id" select="@scn_id"/>
            <xsl:value-of select="@scn_code"/>
            <xsl:text>,</xsl:text>
            <xsl:for-each select="//root/tbl[1]/row">
                <xsl:variable name="prm_id" select="@prm_id"/>
                <xsl:value-of select="//root/tbl[3]/row[@scn_id = $scn_id and @prm_id = $prm_id]/@u"/>
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
    
 