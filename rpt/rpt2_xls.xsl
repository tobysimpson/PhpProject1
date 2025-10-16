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
                            <Data ss:Type="String">prm_id</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">scn_id</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">path</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">unit</Data>
                        </Cell>
                        <xsl:for-each select="tbl[1]/row[1]/@*[substring-before(name(.),'_') = 'col']">
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="substring-after(name(.),'_')"/>
                                </Data>
                            </Cell>
                        </xsl:for-each>
                    </Row>
                    <xsl:for-each select="tbl[1]/row">
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
                                <Data ss:Type="String">
                                    <xsl:value-of select="@path"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@unit"/>
                                </Data>
                            </Cell>
                            <xsl:for-each select="@*[substring-before(name(.),'_') = 'col']">
                                <Cell>
                                    <xsl:if test="number(.) = .">
                                        <Data ss:Type="Number">
                                            <xsl:value-of select="."/>
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