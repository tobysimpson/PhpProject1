<?xml version="1.0" encoding="UTF-8"?>
<!--<?mso-application progid="Excel.Sheet"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="root">
        <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:o="urn:schemas-microsoft-com:office:office"
                  xmlns:x="urn:schemas-microsoft-com:office:excel"
                  xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
                  xmlns:html="http://www.w3.org/TR/REC-html40">
            
            <xsl:for-each select="tbl[3]/row">
                <xsl:variable name="yr" select="@yr"/>
                <Worksheet ss:Name="{$yr}">
                    <Table>
                        <Row>
                            <Cell>
                                <Data ss:Type="String">prm_id</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">scn_id</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">yr</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">ts</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">u</Data>
                            </Cell>
                        </Row>
                        <xsl:for-each select="//root/tbl[5]/row[@yr = $yr]">
                            <Row>
                                <Cell>
                                    <Data ss:Type="Number">
                                        <xsl:value-of select="@prm_id"/>
                                    </Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="Number">
                                        <xsl:value-of select="@scn_id"/>
                                    </Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="Number">
                                        <xsl:value-of select="@yr"/>
                                    </Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="String">
                                        <xsl:value-of select="@ts"/>
                                    </Data>
                                </Cell>
                                <Cell>
                                    <Data ss:Type="Number">
                                        <xsl:value-of select="@u"/>
                                    </Data>
                                </Cell>
                            </Row>
                        </xsl:for-each>
                    </Table>
                </Worksheet>
            </xsl:for-each>
        </Workbook>
    </xsl:template>
</xsl:stylesheet>