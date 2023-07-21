<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:include href="../nav.xsl"/>
    <xsl:include href="../util.xsl"/>

    <xsl:template match="/">
        <xsl:call-template name="page"/>
    </xsl:template>


    <xsl:template match="root">

        <xsl:variable name="nodes" select="row/@item_val1" />


        <xsl:variable name="min">
            <xsl:call-template name="min0">
                <xsl:with-param name="nodes" select="$nodes" />
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:variable name="max">
            <xsl:call-template name="max">
                <xsl:with-param name="nodes" select="$nodes" />
            </xsl:call-template>
        </xsl:variable>

        <div>
             <xsl:value-of select="$min"/>, <xsl:value-of select="$max"/> hello
        </div>


        <!--        <table class="table1">
            <tr>
                <th>item_id</th>
                <th>item_created</th>
                <th>item_updated</th>
                <th>item_name</th>
                <th>item_val1</th>
                <th>item_val2</th>
            </tr>
            <xsl:for-each select="row">
                <tr>
                    <td>
                        <xsl:value-of select="@item_id"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@item_created,0,11)"/>
                    </td>
                    <td>
                        <xsl:value-of select="substring(@item_updated,0,11)"/>
                    </td>
                    <td style="text-align:left">
                        <xsl:value-of select="@item_name"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val1, '###,##0.0000')"/>
                    </td>
                    <td style="text-align:right">
                        <xsl:value-of select="format-number(@item_val2, '###,##0.0000')"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>-->

    </xsl:template>
</xsl:stylesheet>