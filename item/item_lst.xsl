<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    

    <xsl:template match="root/tbl[1]">
        
        hello
        
        <table class="table1">
            <tr>
                <th>item_id</th>
                <th>item_act</th>
                <th>item_date</th>
                <th>item_name</th>
                <th>item_val1</th>
                <th>item_val2</th>
                <th/>
            </tr>
            <xsl:apply-templates select="row"/>
            <tr>
                <td>        
                    <form action="item.php?mth=ins" method="post" style="margin:0px; padding:0px; display:inline;">
                        <input type="submit" value="new"/>
                    </form>
                </td>
            </tr>
        </table>
    </xsl:template>
    
    
    <xsl:template match="row">
        <tr>
            <td>
                <xsl:value-of select="@item_id"/>
            </td>
            <td>
                <xsl:value-of select="@item_act"/>
            </td>
            <td>
                <xsl:value-of select="@item_date"/>
            </td>
            <td style="text-align:left">
                <xsl:value-of select="@item_name"/>
            </td>
            <td>
                <xsl:value-of select="@item_val1"/>
            </td>
            <td style="text-align:right">
                <xsl:value-of select="@item_val2"/>
            </td>
            <td>
                <a href="item.php?mth=edt&amp;item_id={@item_id}">edit</a>
            </td>
        </tr>
    </xsl:template>
    
    
    
</xsl:stylesheet>