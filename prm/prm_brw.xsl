<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">

        <xsl:for-each select="tbl[1]/row">
            <a href="prm.php?mth=brw&amp;id={@id}">
                <xsl:value-of select="@name"/>
            </a>
            <xsl:if test="not(position() = last())">
                <xsl:text> / </xsl:text>
            </xsl:if>
        </xsl:for-each>
        
        <p/>
        <table class="table1">
            <tr>
                <th>id</th>
                <th>name</th>
                <th>unit</th>
            </tr>
            <xsl:for-each select="tbl[2]/row">
<!--                <xsl:sort select="@pos" data-type="number" />-->
                <xsl:variable name="id0" select="@id"/>
                <tr>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                    <td style="text-align:left;" >
                        <a href="prm.php?mth=brw&amp;id={@id}">
                            <xsl:value-of select="@name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>