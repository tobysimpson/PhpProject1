<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <xsl:include href="layout.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>
    
    
    <xsl:template match="root">
        <table class="table2">
            <form action="usr.php?mth=update" method="post">
               <tr>
                    <th>usr_id</th>
                    <td>
                        <input type="text" name="usr_id" readonly="true">
                            <xsl:attribute name="value">
                                <xsl:value-of select="row/@usr_id"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <th>usr_name</th>
                    <td>
                        <input type="text" name="usr_name" length="20">
                            <xsl:attribute name="value">
                                <xsl:value-of select="row/@usr_name"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
<!--                <tr>
                    <td>usr_val1</td>
                    <td>
                        <input type="text" name="usr_val1">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@usr_val1"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td>usr_val2</td>
                    <td>
                        <input type="text" name="usr_val2">
                            <xsl:attribute name="value">
                                <xsl:value-of select="@usr_val2"/>
                            </xsl:attribute>
                        </input>
                    </td>
                </tr>-->
                <tr>
                    <td>
                        
                    </td>
                    <td><input type="submit"/></td>
                </tr>
            </form>
        </table>
    </xsl:template>
</xsl:stylesheet>