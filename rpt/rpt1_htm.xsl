<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:key name="prm" match="root/tbl[4]/row" use="@prm_id"/>
    <xsl:key name="yr" match="root/tbl[4]/row" use="@yr"/>

    <xsl:template match="root">
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>path</th>
                <th>unit</th>
                <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                    <th>
                        <xsl:value-of select="@yr"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[4]/row[generate-id() = generate-id(key('prm',@prm_id)[1])]">
                <xsl:variable name="prm_id" select= "@prm_id"/>
                <tr>
                    <td>
                        <xsl:value-of select="@prm_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn_id"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="//root/tbl[3]/row[@prm_id = $prm_id]/@path"/>
                    </td>
                    <td style="text-align:left;">
                        <xsl:value-of select="//root/tbl[3]/row[@prm_id = $prm_id]/@unit"/>
                    </td>
                    <xsl:for-each select="//root/tbl[4]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                        <xsl:variable name="yr" select= "@yr"/>
                        <td style="text-align:right;">
                            <!--<xsl:value-of select="$prm_id"/>,<xsl:value-of select="$yr"/>-->
                            <xsl:value-of select="//root/tbl[4]/row[@prm_id = $prm_id and @yr = $yr]/@u"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>