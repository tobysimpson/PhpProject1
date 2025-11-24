<?xml version="1.0" encoding="UTF-8"?>
<!--<?mso-application progid="Excel.Sheet"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="root">
        <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:o="urn:schemas-microsoft-com:office:office"
                  xmlns:x="urn:schemas-microsoft-com:office:excel"
                  xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:html="http://www.w3.org/TR/REC-html40">
            <Worksheet ss:Name="Table1">
                <Table>
                    <Row>
                        <Cell>
                            <Data ss:Type="String">scn_code</Data>
                        </Cell>

                        <xsl:for-each select="//root/tbl[1]/row">
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@ind_name"/>
                                </Data>
                            </Cell>
                        </xsl:for-each>
                    </Row>
                    <xsl:for-each select="tbl[2]/row">
                        <xsl:variable name="scn_id" select="@scn_id"/>
                        <Row>
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@scn_code"/>
                                </Data>
                            </Cell>
                            
                            <xsl:for-each select="//root/tbl[1]/row">
                                <xsl:variable name="prm_id" select="@prm_id"/>
                                <xsl:variable name="u" select="//root/tbl[3]/row[@scn_id = $scn_id and @prm_id = $prm_id]/@u"/>
                                <Cell>
                                    <xsl:if test="number($u) = $u">
                                        <Data ss:Type="Number">
                                            <xsl:value-of select="$u"/>
                                        </Data>
                                    </xsl:if>
                                </Cell>
                            </xsl:for-each>
                        </Row>
                    </xsl:for-each>
                </Table>
            </Worksheet>
        </Workbook>
    </xsl:template>
</xsl:stylesheet>