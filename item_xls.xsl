<xsl:stylesheet version="1.0" 
xmlns="urn:schemas-microsoft-com:office:spreadsheet" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:user="urn:my-scripts" 
xmlns:o="urn:schemas-microsoft-com:office:office" 
xmlns:x="urn:schemas-microsoft-com:office:excel" 
xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">

        <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
        <xsl:template match="/">
            <xsl:processing-instruction name="mso-application">progid="Excel.Sheet"</xsl:processing-instruction>
            <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" 
            xmlns:o="urn:schemas-microsoft-com:office:office" 
            xmlns:x="urn:schemas-microsoft-com:office:excel" 
            xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" 
            xmlns:html="http://www.w3.org/TR/REC-html40">
                <Worksheet ss:Name="Sheet1">
                    <Table x:FullColumns="1" x:FullRows="1" ss:DefaultRowHeight="15">
                        <Row>
                            <Cell>
                                <Data ss:Type="String">a</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">b</Data>
                            </Cell>
                        </Row>
                        <Row>
                            <Cell>
                                <Data ss:Type="String">c</Data>
                            </Cell>
                            <Cell>
                                <Data ss:Type="String">d</Data>
                            </Cell>
                        </Row>
                    </Table>
                </Worksheet>
            </Workbook>
        </xsl:template>
</xsl:stylesheet>

<!--<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="/">
        <xsl:processing-instruction name="mso-application">progid="Excel.Sheet"</xsl:processing-instruction>
        <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
            <Styles>
                <Style ss:ID="header" ss:Name="Normal">
                    <Font ss:FontName="Verdana" ss:Bold="1" />
                </Style>
            </Styles>
            <Worksheet ss:Name="item_info">
                <Table>
                    <Row ss:Index="1">
                        <Cell ss:Index="1" ss:StyleID="header">
                            <Data ss:Type="String">item_id</Data>
                        </Cell>
                        <Cell ss:Index="2" ss:StyleID="header">
                            <Data ss:Type="String">item_created</Data>
                        </Cell>
                        <Cell ss:Index="3" ss:StyleID="header">
                            <Data ss:Type="String">item_updated</Data>
                        </Cell>
                        <Cell ss:Index="4" ss:StyleID="header">
                            <Data ss:Type="String">item_name</Data>
                        </Cell>
                        <Cell ss:Index="5" ss:StyleID="header">
                            <Data ss:Type="String">item_val1</Data>
                        </Cell>
                        <Cell ss:Index="6" ss:StyleID="header">
                            <Data ss:Type="String">item_val2</Data>
                        </Cell>
                    </Row>
                    <xsl:for-each select="root/row">
                        <Row ss:Index="{position() + 1}">
                            <Cell ss:Index="1">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_id"/>
                                </Data>
                            </Cell>
                            <Cell ss:Index="2">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_created"/>
                                </Data>
                            </Cell>
                            <Cell ss:Index="3">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_updated"/>
                                </Data>
                            </Cell>
                            <Cell ss:Index="4">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_name"/>
                                </Data>
                            </Cell>
                            <Cell ss:Index="5">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_val1"/>
                                </Data>
                            </Cell>
                            <Cell ss:Index="6">
                                <Data ss:Type="String">
                                    <xsl:value-of select="@item_val2"/>
                                </Data>
                            </Cell>
                        </Row>   
                    </xsl:for-each>
                </Table>
            </Worksheet>
        </Workbook>
    </xsl:template>
</xsl:stylesheet>-->
