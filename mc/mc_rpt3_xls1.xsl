<?xml version="1.0" encoding="UTF-8"?>
<!--<?mso-application progid="Excel.Sheet"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="root">
        <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:o="urn:schemas-microsoft-com:office:office"
                  xmlns:x="urn:schemas-microsoft-com:office:excel"
                  xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:html="http://www.w3.org/TR/REC-html40">
            
            <xsl:for-each select="//tbl[2]/row">
                <xsl:variable name="sps_code" select="@sps_code"/>
                <xsl:for-each select="//tbl[3]/row">
                    <xsl:variable name="yr" select="@yr"/>
                    <Worksheet ss:Name="{$sps_code}_{$yr}">
                        <Table>
                            <Row>
                                <Cell>
                                    <Data ss:Type="String"></Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="String"></Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="String"></Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="String"></Data>
                                </Cell>
                                <xsl:for-each select="//tbl[5]/row">
                                    <Cell>
                                        <Data ss:Type="String">
                                            <xsl:value-of select="@prm_name"/>
                                        </Data>
                                    </Cell>
                                </xsl:for-each>
                            </Row>
                            <xsl:for-each select="//root/tbl[4]/row[@sps_code = $sps_code]">
                                <xsl:variable name="scn_id" select="@scn_id"/>
                                <Row>
                                    <Cell>
                                        <Data ss:Type="String">
                                            <xsl:value-of select="$sps_code"/>
                                        </Data>
                                    </Cell>
                                    <Cell>
                                        <Data ss:Type="String">
                                            <xsl:value-of select="$yr"/>
                                        </Data>
                                    </Cell>
                                    <Cell>
                                        <Data ss:Type="String">
                                            <xsl:value-of select="@shk_code"/>
                                        </Data>
                                    </Cell>
                                    <Cell>
                                        <Data ss:Type="String">
                                            <xsl:value-of select="@shk_lvl"/>
                                        </Data>
                                    </Cell>
                                    <xsl:variable name="rows" select="//root/tbl[6]/row[@scn_id = $scn_id and @yr = $yr]"/>
                                    <xsl:for-each select="//root/tbl[5]/row">
                                        <xsl:variable name="prm_id" select="@prm_id"/>
                                        <Cell>
                                            <Data ss:Type="Number">
                                                <xsl:value-of select="$rows[@prm_id = $prm_id]/@u"/>
                                            </Data>
                                        </Cell>
                                    </xsl:for-each>
                                </Row>
                            </xsl:for-each>
                        </Table>
                    </Worksheet>
                </xsl:for-each>
            </xsl:for-each>
        </Workbook>
    </xsl:template>
    <xsl:template match="root2">
        <table class="table1" style="table-layout:fixed;">
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