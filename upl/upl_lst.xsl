<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    


    <xsl:template match="root">
        
        <form action="upl.php?mth=ins" method="post" enctype="multipart/form-data">
            <input type="file" name="fileToUpload" id="fileToUpload"></input>
            <input type="submit" value="Upload" name="submit"></input>
        </form>

        <p/>
        
        <table class="table1">
            <tr>
                <th>ts</th>
                <th>n</th>
                <th>id</th>
                <th>scn</th>
                <th>yr</th>
            </tr>
            <xsl:for-each select="tbl[1]/row">
                <tr>
                    <td>
                        <a href="upl.php?mth=dsp&amp;ts={@ts}">
                            <xsl:value-of select="@ts"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="@n"/>
                    </td>
                    <td>
                        <xsl:value-of select="@id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@scn"/>
                    </td>
                    <td>
                        <xsl:value-of select="@yr"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
        

        
        
        
    </xsl:template>
</xsl:stylesheet>