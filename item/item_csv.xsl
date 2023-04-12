<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8"  omit-xml-declaration="yes"/>
    <xsl:template match="/root">
        <xsl:text>item_id,</xsl:text>
        <xsl:text>item_created,</xsl:text>
        <xsl:text>item_updated,</xsl:text>
        <xsl:text>item_name,</xsl:text>
        <xsl:text>item_val1,</xsl:text>
        <xsl:text>item_val2</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="row">
            <xsl:value-of select="@item_id"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@item_created"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@item_updated"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@item_name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@item_val1"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@item_val2"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>       
</xsl:stylesheet>