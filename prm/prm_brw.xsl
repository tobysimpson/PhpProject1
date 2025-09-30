<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root">
 

        <table class="table1">
            <tr>
                
                <th>id</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>name</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <xsl:sort select="@lvl" data-type="number" order="ascending"/>
                <tr>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@lvl"/>
                    </td>
                    <td>
                        <xsl:value-of select="@leaf"/>
                    </td>
                
                    <td style="text-align:left;" >
                        <a href="prm.php?mth=brw&amp;id={@id}">
                            <xsl:value-of select="@name"/>
                        </a>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        <p/>

        <table class="table1">
            <tr>
                <th>id</th>
                <th>lvl</th>
                <th>leaf</th>
                <th>name</th>
                <th>unit</th>
                <!--<th>ts</th>-->
            </tr>
            <xsl:for-each select="tbl[2]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@lvl"/>
                    </td>
                    <td>
                        <xsl:value-of select="@leaf"/>
                    </td>
                    <td style="text-align:left;" >
                        <a href="prm.php?mth=brw&amp;id={@id}">
                            <xsl:value-of select="@name"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@unit"/>
                    </td>
                    <!--                    <td>
                        <xsl:value-of select="@ts"/>
                    </td>-->
                </tr>
            </xsl:for-each>
        </table>
        
        
        <p/>
        
        <table class="table1">
            <tr>
                <th>id</th>
                <th>ts</th>
                <th>scn</th>
                <th>yr</th>
                <th>n</th>
            </tr>
            <xsl:for-each select="tbl[3]/row">
                <tr>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                    <td>
                        <a href="upl.php?mth=prm&amp;id={@id}&amp;ts={@ts}">
                            <xsl:value-of select="@ts"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@scn"/>
                    </td>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                    <td>
                        <xsl:value-of select="@n"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        
        
        
    </xsl:template>
</xsl:stylesheet>