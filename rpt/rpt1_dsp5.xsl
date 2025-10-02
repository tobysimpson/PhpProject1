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
                            <Data ss:Type="String">rpt_id</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">scn_id</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">prm_id</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">path</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">yr</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">u</Data>
                        </Cell>
                    </Row>
                    <xsl:for-each select="tbl[1]/row">
                        <Row>
                            <Cell>
                                <Data ss:Type="Number">
                                    <xsl:value-of select="@rpt_id"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="Number">
                                    <xsl:value-of select="@scn_id"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="Number">
                                    <xsl:value-of select="@prm_id"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@path"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="Number">
                                    <xsl:value-of select="@yr"/>
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
        </Workbook>
    </xsl:template>
</xsl:stylesheet>