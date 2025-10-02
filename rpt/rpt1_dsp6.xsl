<?xml version="1.0" encoding="UTF-8"?>
<!--<?mso-application progid="Excel.Sheet"?>-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:key name="prm" match="root/tbl[1]/row" use="@prm_id"/>
    <xsl:key name="yr" match="root/tbl[1]/row" use="@yr"/>
    
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
                            <Data ss:Type="String">scn_name</Data>
                        </Cell>
                        <Cell>
                            <Data ss:Type="String">path</Data>
                        </Cell>
                        <xsl:for-each select="//root/tbl[1]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@yr"/>
                                </Data>
                            </Cell>
                        </xsl:for-each>
                    </Row>
                    <xsl:for-each select="tbl[1]/row[generate-id() = generate-id(key('prm',@prm_id)[1])]">
                        <xsl:variable name="prm_id" select= "@prm_id"/>
                        <Row>
                            <Cell>
                                <Data ss:Type="Number">
                                    <xsl:value-of select="$prm_id"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@scn_name"/>
                                </Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">
                                    <xsl:value-of select="@path"/>
                                </Data>
                            </Cell>
                            <xsl:for-each select="//root/tbl[1]/row[generate-id() = generate-id(key('yr',@yr)[1])]">
                                <xsl:variable name="yr" select= "@yr"/>
                                <Cell>
                                    <Data ss:Type="Number">
                                        <xsl:value-of select="//root/tbl[1]/row[@prm_id = $prm_id and @yr = $yr]/@u"/>
                                    </Data>
                                </Cell>
                            </xsl:for-each>
                        </Row>
                    </xsl:for-each> 
                </Table>
            </Worksheet>
        </Workbook>
    </xsl:template>
</xsl:stylesheet>