<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">
        <table class="table1" style="table-layout:fixed;">
            <colgroup>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <col width="20px"/>
                <xsl:for-each select="//tbl[5]/row">
                    <col width="100px"/>
                </xsl:for-each>
            </colgroup>
            <tr>
                <td/>
                <td/>
                <td/>
                <td/>
                <xsl:for-each select="//root/tbl[5]/row">
                    <th>
                        <xsl:value-of select="@prm_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="//root/tbl[2]/row">
                <xsl:variable name="sps_code" select="@sps_code"/>
                <xsl:for-each select="//root/tbl[3]/row">
                    <xsl:variable name="yr" select="@yr"/>
                    <xsl:for-each select="//root/tbl[4]/row[@sps_code = $sps_code]">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <tr>
                            <th>
                                <xsl:value-of select="$sps_code"/>
                            </th>
                            <th>
                                <xsl:value-of select="$yr"/>
                            </th>
                            <th>
                                <xsl:value-of select="@shk_code"/>
                            </th>
                            <th>
                                <xsl:value-of select="@shk_lvl"/>
                            </th>
                            <xsl:variable name="rows" select="//root/tbl[6]/row[@scn_id = $scn_id and @yr = $yr]"/>
                            <xsl:for-each select="//root/tbl[5]/row">
                                <xsl:variable name="prm_id" select="@prm_id"/>
                                <td>
                                    <xsl:value-of select="$rows[@prm_id = $prm_id]/@u"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>


