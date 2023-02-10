<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : xsl1.xsl
    Created on : 1 February 2023, 12:16
    Author     : toby
    Description: attributes to table
-->

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/root">
        <html>
            <head>
                <link rel="stylesheet" href="styles.css"/>
                <title></title>
            </head>
            <body>
                <table>
                    <tr>
                        <xsl:for-each select="row[1]">
                            <xsl:for-each select="@*">
                                <th>
                                    <xsl:value-of select="name()" />
                                </th>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="row">
                        <tr>
                            <xsl:for-each select="@*">
                                <td>
                                    <xsl:value-of select="." />
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each> 
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>