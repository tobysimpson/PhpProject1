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
                <th>itm_id</th>
                <th>itm_act</th>
                <th>itm_date</th>
                <th>itm_name</th>
                <th>itm_val1</th>
                <th>itm_val2</th>
                <th colspan="2"/>
            </tr>
            <xsl:apply-templates select="row"/>
            <tr>
                <td>        
                    <form action="itm.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                        <input type="submit" value="new"/>
                    </form>
                </td>
            </tr>
        </table>
        
        
        <p/>
        
        <form action="itm.php?mth=upl" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile" id="upfile"></input>
            <input type="submit" value="Upload" name="submit"></input>
        </form>
        
        
    </xsl:template>
    
    
    <xsl:template match="tbl[1]/row">
        <tr>
            <td>
                <xsl:value-of select="@itm_id"/>
            </td>
            <td>
                <xsl:value-of select="@itm_act"/>
            </td>
            <td>
                <xsl:value-of select="@itm_date"/>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@itm_name"/>
            </td>
            <td>
                <xsl:value-of select="@itm_val1"/>
            </td>
            <td style="text-align:right">
                <xsl:value-of select="@itm_val2"/>
            </td>
            <td>
                <a href="itm.php?mth=edt&amp;itm_id={@itm_id}">edit</a>
            </td>
            <td>
                <a href="itm.php?mth=tst&amp;itm_id={@itm_id}">test</a>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>