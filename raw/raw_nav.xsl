<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    


    <xsl:template match="root">
        
        
        <p>Please submit *.csv files in Latin1 encoding (not utf-8)</p>
        <p>No headers please, just values</p>
        <p>Scientific format with many decimals will preserve numerical precision</p>
        
        <table class="table1">
            <tr>
                <th>prm_id</th>
                <th>scn_id</th>
                <th>yr</th>
                <th>u</th>
            </tr>
            <tr>
                <td>INT</td>
                <td>INT</td>
                <td>INT</td>
                <td>DOUBLE</td>
            </tr>
        </table>
        
        <p/>

        
        <form action="raw.php?mth=upl" method="post" enctype="multipart/form-data">
            <input type="file" name="upload_file" prm_id="fileToUpload"></input>
            <input type="submit" value="Upload" name="submit"></input>
        </form>

        
        
    </xsl:template>
</xsl:stylesheet>