<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:php="http://php.net/xsl">
    
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:variable name="w" select="800"/>
    <xsl:variable name="h" select="600"/>
    

    <xsl:template match="root">
        <svg viewBox="0 0 {$w} {$h}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <style>* { font-size: 10pt; font-family: sans-serif; font-weight: 300; }</style> 
            
            <rect width="{$w}" height="{$h}" x="0" y="0" stroke="#DDDDDD" fill="none" />
            
            <g id="title">
                <text x="10" y="10" alignment-baseline="top">
                    <xsl:text>hello</xsl:text>
                </text>
            </g>

            <g id="plot" transform="translate(0,0)">
                <circle cx="1" cy="1" r="2" stroke="red" fill="none"/>   
            </g>

        </svg>
    </xsl:template>
</xsl:stylesheet>
