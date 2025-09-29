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
                <th>id</th>
                <th>lvl</th>
                <th>ts</th>
                <th>path</th>
             
            </tr>
            <xsl:apply-templates select="row"/>
            <!--            <tr>
                <td>        
                    <form action="itm.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                        <input type="submit" value="new"/>
                    </form>
                </td>
            </tr>-->
        </table>
        
        
        <!--<p/>-->
        
        <!--        <form action="itm.php?mth=upl" method="post" enctype="multipart/form-data">
            <input type="file" name="fileToUpload" id="fileToUpload"></input>
            <input type="submit" value="Upload" name="submit"></input>
        </form>
        -->
        
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@id"/>
            </td>
            <td>
                <xsl:value-of select="@lvl"/>
            </td>
            <td>
                <xsl:value-of select="@ts"/>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@path"/>
            </td>

            <!--            <td>
                <a href="itm.php?mth=edt&amp;itm_id={@itm_id}">edit</a>
            </td>-->
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>