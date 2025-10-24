<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="html" encoding="utf-8"/>-->
    <xsl:output method="text" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*" />
    
    <xsl:template match="root">
        <!-- head -->
        <xsl:value-of select="tbl[1]/row[1]/@rpt_id"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="tbl[1]/row[1]/@scn_id"/>
        <xsl:text>,</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:for-each select="//root/tbl[1]/row">
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
        <!-- head -->
        <xsl:text>,</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:for-each select="//root/tbl[1]/row">
            <xsl:value-of select="@stc_io_name"/>
            <xsl:choose>
                <xsl:when test="position() = last()">
                    <xsl:text>&#xD;&#xA;</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>,</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- head -->        
        <xsl:text>,</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:for-each select="//root/tbl[1]/row">
            <xsl:value-of select="@stc_reg_name"/>
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
        <xsl:for-each select="tbl[2]/row">
            <xsl:value-of select="@stc_qtr_name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@stc_wkd_name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@stc_day_name"/>
            <xsl:text>,</xsl:text>
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
