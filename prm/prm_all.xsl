<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]">
        <table class="table1">

            <tr>
                <th colspan="6">name</th>
                <th>unit</th>
                <th>id</th>
            </tr>

            <!-- lvl0 -->
            <xsl:for-each select="row[@pid='']">
                <xsl:sort select="@pos" data-type="number" />
                <xsl:variable name="id0" select="@id"/>
                <tr>

                    <td style="text-align:left;" colspan="6">
                        <xsl:value-of select="@name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                </tr>
                
                <!-- lvl1 -->
                <xsl:for-each select="//root/tbl[2]/row[@pid=$id0]">
                    <xsl:sort select="@pos" data-type="number" />
                    <xsl:variable name="id1" select="@id"/>
                    <tr>
                        <td style="width:20px;"></td>
                        
                        
                        <td style="text-align:left;"  colspan="5">
                            <xsl:value-of select="@name"/>
                        </td>
                        <td>
                            <xsl:value-of select="@unit"/>
                        </td>
                        <td>
                            <xsl:value-of select="@id"/>
                        </td>
                    </tr>
                    
                    <!-- lvl2 -->
                    <xsl:for-each select="//root/tbl[3]/row[@pid=$id1]">
                        <xsl:sort select="@pos" data-type="number" />
                        <xsl:variable name="id2" select="@id"/>
                        <tr>
                            <td style="width:20px;"></td>
                            <td style="width:20px;"></td>
                        
                            
                        
                            <td style="text-align:left;"  colspan="4">
                                <xsl:value-of select="@name"/>
                            </td>
                            <td>
                                <xsl:value-of select="@unit"/>
                            </td>
                            <td>
                                <xsl:value-of select="@id"/>
                            </td>
                        </tr>
                        
                        
                        <!-- lvl3 -->
                        <xsl:for-each select="//root/tbl[4]/row[@pid=$id2]">
                            <xsl:sort select="@pos" data-type="number" />
                            <xsl:variable name="id3" select="@id"/>
                            <tr>
                                <td style="width:20px;"></td>
                                <td style="width:20px;"></td>
                                <td style="width:20px;"></td>
                                
                        
                                <td style="text-align:left;"  colspan="3">
                                    <xsl:value-of select="@name"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@unit"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>
                            </tr>
                            
                            
                            <!-- lvl4 -->
                            <xsl:for-each select="//root/tbl[5]/row[@pid=$id3]">
                                <xsl:sort select="@pos" data-type="number" />
                                <xsl:variable name="id4" select="@id"/>
                                <tr>
                                    <td style="width:20px;"></td>
                                    <td style="width:20px;"></td>
                                    <td style="width:20px;"></td>
                                    <td style="width:20px;"></td>
                                
                        
                                    <td style="text-align:left;"  colspan="2">
                                        <xsl:value-of select="@name"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@unit"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@id"/>
                                    </td>
                                </tr>
                                
                                
                                <!-- lvl5 -->
                                <xsl:for-each select="//root/tbl[6]/row[@pid=$id4]">
                                    <xsl:sort select="@pos" data-type="number" />
                                    <xsl:variable name="id5" select="@id"/>
                                    <tr>
                                        <td style="width:20px;"></td>
                                        <td style="width:20px;"></td>
                                        <td style="width:20px;"></td>
                                        <td style="width:20px;"></td>
                                        <td style="width:20px;"></td>
                        
                                        <td style="text-align:left;"  colspan="1">
                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@unit"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="@id"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>