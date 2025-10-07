<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                >
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="test" NaN=""/>
 
    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>path</th>
                <th>unit</th>
                <xsl:for-each select="//root/tbl[1]/row[1]/@*[substring-before(name(.),'_') = 'col']">
                    <th>
                        <xsl:value-of select="substring-after(name(.),'_')"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="translate(@path,',',' ')"/>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                    <xsl:for-each select="@*[substring-before(name(.),'_') = 'col']">
                        <td style="text-align:right;">
                            <xsl:value-of select="format-number(.,'#,##0.00000','test')"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>