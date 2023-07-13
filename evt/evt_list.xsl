<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        <form action="evt.php?mth=insert" method="post">
            <input type="hidden" name="col_id" value="{@col_id}" readonly="true"/>
            <input type="submit" value="insert"/>
        </form>
        <table class="table1">
            <tr>
                <th>evt_id</th>
                <th>usr_id</th>
                <th>col_id</th>
                <th>period</th>
                <th>value</th>
                <th></th>
            </tr>
            <xsl:for-each select="row">
                <tr>                    
                    <td>
                        <xsl:value-of select="@evt_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@usr_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="@col_id"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="@n"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@v1, '0.000')"/>
                    </td>
                    <td>
                        <a href="evt.php?mth=edit&amp;evt_id={@evt_id}">edit</a>
                    </td>
                </tr>
            </xsl:for-each> 
        </table>
    </xsl:template>
</xsl:stylesheet>