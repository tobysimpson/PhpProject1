<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:variable name="w" select="10"/>

    <xsl:template match="root/tbl[1]">
        <table class="table1">
            <colgroup>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
                <col width="25px"/>
            </colgroup>
            <tr>
                <th colspan="{$w+1}"></th>
                <!--<th>prm_id</th>-->
                <th>lvl</th>
                <th>leaf</th>
            </tr>
            <xsl:apply-templates select="row"/>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <xsl:choose>
                <xsl:when test="@lvl=0">
                    
                </xsl:when>
                <xsl:when test="@lvl=1">
                    <td/>
                </xsl:when>
                <xsl:when test="@lvl=2">
                    <td/>
                    <td/>
                </xsl:when>
                <xsl:when test="@lvl=3">
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>
                <xsl:when test="@lvl=4">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>
                <xsl:when test="@lvl=5">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>                
                <xsl:when test="@lvl=6">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>                
                <xsl:when test="@lvl=7">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>                
                <xsl:when test="@lvl=8">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>                
                <xsl:when test="@lvl=9">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>                
                <xsl:when test="@lvl=10">
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                </xsl:when>
            </xsl:choose>
            <td>
                <a href="prm.php?mth=brw&amp;prm_id={@prm_id}">
                    <xsl:value-of select="@prm_id"/>
                </a>
            </td>
            <td colspan="{$w - @lvl}" style="text-align:left;white-space: nowrap;">
                <!--<a href="prm.php?mth=brw&amp;prm_id={@prm_id0}">-->
                    <xsl:value-of select="@name"/>
                <!--</a>-->
            </td>
<!--            <td>
                <xsl:value-of select="@prm_id"/>
            </td>-->
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@leaf"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>