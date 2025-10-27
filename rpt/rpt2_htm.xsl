<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="test" NaN=""/>
    

    <xsl:template match="root">
        <table class="table1">
            <tr>
                
                <th>
                    <xsl:value-of select="tbl[1]/row[1]/@rpt_id"/>
                </th>
                <th>
                    <xsl:value-of select="tbl[1]/row[1]/@scn_id"/>
                </th>
                <td/>
                <xsl:for-each select="//root/tbl[1]/row">
                    <th>
                        <xsl:value-of select="@yr"/>
                    </th>
                </xsl:for-each>
            </tr>
            <tr>
                <td/>
                <td/>
                <td/>
                <xsl:for-each select="//root/tbl[1]/row">
                    <th>
                        <xsl:value-of select="@stc_io_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <tr>
                <td/>
                <td/>
                <td/>
                <xsl:for-each select="//root/tbl[1]/row">
                    <th>
                        <xsl:value-of select="@stc_reg_name"/>
                    </th>
                </xsl:for-each>
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@stc_qtr_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@stc_wkd_name"/>
                    </td>
                    <td>
                        <xsl:value-of select="@stc_day_name"/>
                    </td>
                    <xsl:for-each select="@*[substring-before(name(.),'_') = 'col']">
                        <td style="text-align:right;">
                            <xsl:value-of select="format-number(.,'#,##0.00000','test')"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
