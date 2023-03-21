<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : item_xls.xsl
    Created on : 21 March 2023, 10:23
    Author     : toby
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
</xsl:stylesheet>
