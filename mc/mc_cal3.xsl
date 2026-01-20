<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    <xsl:decimal-format name="fmt1" decimal-separator="." grouping-separator="," NaN=""/>

    <xsl:template match="root">
        <table>
            <xsl:for-each select="//root/tbl[3]/row">
                <xsl:variable name="yr" select="@yr"/>
                <tr>
                    <td>
                        <xsl:value-of select="$yr"/>
                    </td>
                </tr>
                

                <xsl:for-each select="//root/tbl[1]/row">
                    <xsl:variable name="prm_id" select="@prm_id"/>
    
                    <xsl:for-each select="//root/tbl[2]/row">
                        <xsl:variable name="scn_id1" select="@scn_id"/>
                        
                        <xsl:for-each select="//root/tbl[2]/row">
                            <xsl:variable name="scn_id2" select="@scn_id"/>
                        
                            
                            <!--<xsl:value-of select="format-number(//root/tbl[4]/row[@scn_id1 = $scn_id1 and @scn_id2 = $scn_id2 and @prm_id = $prm_id and @yr = $yr]/@u, '#,##0.0000', 'fmt1')"/>-->
                        
                        </xsl:for-each>
               
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>