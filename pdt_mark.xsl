<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:include href="layout.xsl"/>
    
 
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
        
    <xsl:template match="root">
        <xsl:value-of select="count(row)"/>
        
        <xsl:for-each select="row">
            <div><h2><xsl:value-of select="@pda_id1"/> vs. <xsl:value-of select="@pda_id2"/></h2></div>
            <table border="1">
                <tr><td><xsl:value-of select="format-number(@a11,'0.0000')"/></td><td><xsl:value-of select="format-number(@a12,'0.0000')"/></td><td><xsl:value-of select="format-number(@a13,'0.0000')"/></td><td><xsl:value-of select="format-number(@a14,'0.0000')"/></td></tr>
                <tr><td><xsl:value-of select="format-number(@a21,'0.0000')"/></td><td><xsl:value-of select="format-number(@a22,'0.0000')"/></td><td><xsl:value-of select="format-number(@a23,'0.0000')"/></td><td><xsl:value-of select="format-number(@a24,'0.0000')"/></td></tr>
                <tr><td><xsl:value-of select="format-number(@a31,'0.0000')"/></td><td><xsl:value-of select="format-number(@a32,'0.0000')"/></td><td><xsl:value-of select="format-number(@a33,'0.0000')"/></td><td><xsl:value-of select="format-number(@a34,'0.0000')"/></td></tr>
                <tr><td><xsl:value-of select="format-number(@a41,'0.0000')"/></td><td><xsl:value-of select="format-number(@a42,'0.0000')"/></td><td><xsl:value-of select="format-number(@a43,'0.0000')"/></td><td><xsl:value-of select="format-number(@a44,'0.0000')"/></td></tr>
            </table>
            <p/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>