<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>mc_id</th>
                <th>mc_name</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@mc_name"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        <p/>
        <table class="table1">
            <tr>
                <th>scn_id</th>
                <xsl:for-each select="//root/tbl[3]/row">
                    <th>
                        <xsl:value-of select="@yr"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <xsl:variable name="scn_id" select="@scn_id"/>
                <tr>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <xsl:for-each select="//root/tbl[3]/row">
                        <td>
                            <a href="mc.php?mth=prf1&amp;mc_id={@mc_id}&amp;scn_id={$scn_id}&amp;yr={@yr}">
                                <img width="100%" src="mc.php?mth=prf1&amp;mc_id={@mc_id}&amp;scn_id={$scn_id}&amp;yr={@yr}"/>
                            </a>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>


