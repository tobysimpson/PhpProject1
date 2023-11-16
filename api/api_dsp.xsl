<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    <xsl:include href="../nav.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="page"/> 
    </xsl:template>

    <xsl:template match="root">
        
        <table class="table2">
            <tr>
                <th>desc</th>
                <th>url</th>
                
            </tr>
            <tr>
                <td>home</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php">https://toby.euler.usi.ch/api.php</a>
                </td>
                
            </tr>
            <tr>
                <td>res_lst</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=res_lst">https://toby.euler.usi.ch/api.php?mth=res_lst</a>
                </td>
                
            </tr>
            <tr>
                <td>res_dsp</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=res_dsp&amp;res_id=1">https://toby.euler.usi.ch/api.php?mth=res_dsp&amp;res_id=1</a>
                </td>
                
            </tr>
            <tr>
                <td>res_ins</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=res_ins">https://toby.euler.usi.ch/api.php?mth=res_ins</a>
                </td>
            </tr>
            <tr>
                <td>res_upd</td>
                <td>
                    <form action="api.php?mth=res_upd" method="post">
                        <table class="table2">
                            <tbody>
                                <tr>
                                    <th>res_id</th>
                                    <td>
                                        <input type="text" name="res_id" value="1" readonly=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>res_name</th>
                                    <td>
                                        <input type="text" name="res_name" value="res1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>res_dt</th>
                                    <td>
                                        <input type="text" name="res_dt" value="0.0625"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>res_nt</th>
                                    <td>
                                        <input type="text" name="res_nt" value="96"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>res_mod</th>
                                    <td>
                                        <input type="text" name="res_mod" value="8"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="submit"/>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>prm_dsp</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=prm_dsp&amp;res_id=1&amp;prm_id=101">https://toby.euler.usi.ch/api.php?mth=prm_dsp&amp;res_id=1&amp;prm_id=101</a>
                </td>
            </tr>
            <tr>
                <td>prm_ups</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=prm_ups&amp;res_id=1&amp;prm_id=98&amp;p=1&amp;u=2">https://toby.euler.usi.ch/api.php?mth=prm_ups&amp;res_id=1&amp;prm_id=98&amp;p=1&amp;u=2</a>
                </td>
            </tr>
            <tr>
                <td>prm_clr</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=prm_clr&amp;res_id=1&amp;prm_id=98&amp;p=1">https://toby.euler.usi.ch/api.php?mth=prm_clr&amp;res_id=1&amp;prm_id=98&amp;p=1</a>
                </td>
            </tr>
            <tr>
                <td>prm_rst</td>
                <td>
                    <a href="https://toby.euler.usi.ch/api.php?mth=prm_rst&amp;res_id=1&amp;prm_id=98">https://toby.euler.usi.ch/api.php?mth=prm_rst&amp;res_id=1&amp;prm_id=98</a>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>