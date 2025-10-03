<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    
    <xsl:key name="prm" match="root/tbl[4]/row" use="@prm_id"/>
    <xsl:key name="yr" match="root/tbl[4]/row" use="@yr"/>

    <xsl:template match="root">
        
        <xsl:text>prm_id,</xsl:text>
        <xsl:text>scn_id,</xsl:text>
        <xsl:text>path,</xsl:text>
        <xsl:text>unit,</xsl:text>
        <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
            <xsl:value-of select="@yr"/>
            <xsl:choose>
                <xsl:when test="position() = last()">
                    <xsl:text>&#xD;&#xA;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>,</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
            
        <xsl:for-each select="tbl[4]/row[generate-id() = generate-id(key('prm',@prm_id)[1])]">
            <xsl:variable name="prm_id" select= "@prm_id"/>
            <xsl:value-of select="@prm_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@scn_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="//root/tbl[3]/row[@prm_id = $prm_id]/@path"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="//root/tbl[3]/row[@prm_id = $prm_id]/@unit"/>
            <xsl:text>,</xsl:text>
            <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                <xsl:variable name="yr" select= "@yr"/>
                <xsl:value-of select="//root/tbl[4]/row[@prm_id = $prm_id and @yr = $yr]/@u"/>
                <xsl:choose>
                    <xsl:when test="position() = last()">
                        <xsl:text>&#xD;&#xA;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>,</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>