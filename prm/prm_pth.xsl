<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <tr>
                <th>id</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>path</th>
            </tr>
            <xsl:apply-templates select="row"/>

        </table>

        
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@leaf"/>
            </td>
            <td style="text-align:left;">
                <a href="prm.php?mth=brw&amp;id={@id0}">
                    <xsl:value-of select="@name0"/>
                </a>
                
                <xsl:if test="string-length(@id1) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id1}">
                        <xsl:value-of select="@name1"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id2) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id2}">
                        <xsl:value-of select="@name2"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id3) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id3}">
                        <xsl:value-of select="@name3"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id4) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id4}">
                        <xsl:value-of select="@name4"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id5) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id5}">
                        <xsl:value-of select="@name5"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id6) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id6}">
                        <xsl:value-of select="@name6"/>
                    </a>
                </xsl:if>
                <xsl:if test="string-length(@id7) > 0">
                    <xsl:text> / </xsl:text>
                    <a href="prm.php?mth=brw&amp;id={@id7}">
                        <xsl:value-of select="@name7"/>
                    </a>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>