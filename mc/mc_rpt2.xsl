<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <td colspan="4"></td>
                <xsl:for-each select="//root/tbl[2]/row">
                    <xsl:variable name="scn" select="."/>
                    <th colspan="{count(//root/tbl[3]/row)}">
                        <xsl:value-of select="$scn/@scn_code"/> 
                    </th>
                </xsl:for-each>
            </tr>
            <tr>
                <th>mc_id</th>
                <th>prm_id</th>
                <th>prm_src</th>
                <th>prm_name</th>
                <xsl:for-each select="//root/tbl[2]/row">
                    <xsl:variable name="scn" select="."/>
                    <xsl:for-each select="//root/tbl[3]/row">
                        <th>
                            <xsl:value-of select="@yr"/> 
                        </th>
                    </xsl:for-each>

                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <xsl:variable name="prm" select="."/>
                <tr>
                    <td>
                        <xsl:value-of select="@mc_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@prm_src"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="@prm_name"/>
                    </td>
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="scn" select="."/>
                        
                        <xsl:for-each select="//root/tbl[3]/row">
                            <xsl:variable name="yr" select="."/>
                            <td>
                                <xsl:value-of select="//root/tbl[4]/row[@prm_id = $prm/@prm_id and @scn_id = $scn/@scn_id and @yr = $yr/@yr]/@u"/> 
                            </td>
                        </xsl:for-each>
                        
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>