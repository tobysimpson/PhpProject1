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
        <p>Scientific format with many decimals will preserve numerical precision</p>
        
        <p/>

        
        <form action="rpt.php?mth=ins" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile"></input>
            <input type="submit" value="upload" name="submit"></input>
        </form>


    </xsl:template>
</xsl:stylesheet>