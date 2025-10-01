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
                <th>prm_id</th>
                <th>scn</th>
                <th>yr</th>
                <th>u</th>
            </tr>
            <tr>
                <td>INT</td>
                <td>INT</td>
                <td>INT</td>
                <td>DOUBLE</td>
            </tr>
            <tr>
                <td>Parameter ID</td>
                <td>Scenario as integer 1-4</td>
                <td>Year - as an integer</td>
                <td>Value - floating point decimal</td>
            </tr>
        </table>
        
        <p>Please submit *.csv files in Latin1 encoding (not utf-8)</p>
        <p>No headers please, just values</p>
        <p>Scientific format with many decimals will preserve numerical precision</p>
        
        <form action="upl.php?mth=ins" method="post" enctype="multipart/form-data">
            <input type="file" name="fileToUpload" prm_id="fileToUpload"></input>
            <input type="submit" value="Upload" name="submit"></input>
        </form>

        <p/>
        
        <table class="table1">
            <tr>
                <th>ts</th>
                <th>rows</th>
                <th>prm_ids</th>
                <th>scns</th>
                <th>yrs</th>
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
                        <xsl:value-of select="@prm_id"/>
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