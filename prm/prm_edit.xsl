<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root/row">
        <form action="prm.php?mth=upd" method="post">
            <table class="table2">
                <tr>
                    <td>prm_id</td>
                    <td>
                        <input type="text" name="prm_id" readonly="true" value="{@prm_id}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_name</td>
                    <td>
                        <input type="text" name="prm_name" readonly="true" value="{@prm_name}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_desc</td>
                    <td>
                        <input type="text" name="prm_desc" value="{@prm_desc}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_def</td>
                    <td>
                        <input type="text" name="prm_def" value="{format-number(@prm_def, '0.000')}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_tick</td>
                    <td>
                        <input type="text" name="prm_tick" value="{format-number(@prm_tick, '0.000')}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_cal</td>
                    <td>
                        <input type="text" name="prm_cal" value="{@prm_cal}"/>
                    </td>
                </tr>
                <tr>
                    <td>prm_note</td>
                    <td>
                        <input type="text" name="prm_note" value="{@prm_note}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <input type="submit"/>
                    </td>
                </tr>
            </table>
        </form>
    </xsl:template>
</xsl:stylesheet>