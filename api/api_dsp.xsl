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
                                        <input type="text" name="res_id" value="1"/>
                                    </td>
                                    <th>res_name</th>
                                    <td>
                                        <input type="text" name="res_name" value="res1"/>
                                    </td>
                                    <th>res_del</th>
                                    <td>
                                        <input type="text" name="res_del" value="0"/>
                                    </td>
                                    <td>
                                        <input type="submit"/>
                                    </td>
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
            <tr>
                <td>rpt_cat1</td>
                <td>
                    <a href="https://toby.euler.usi.ch/rpt.php?mth=cat1&amp;res_id=1&amp;cat_id=2&amp;xsl=0">https://toby.euler.usi.ch/rpt.php?mth=cat1&amp;res_id=1&amp;cat_id=2&amp;xsl=0</a>
                </td>
            </tr>
            <tr>
                <td>rpt_sum2</td>
                <td>
                    <a href="https://toby.euler.usi.ch/rpt.php?mth=sum2&amp;res_id=1&amp;xsl=0">https://toby.euler.usi.ch/rpt.php?mth=sum2&amp;res_id=1&amp;xsl=0</a>
                </td>
            </tr>
            <tr>
                <td>rpt_rnk1</td>
                <td>
                    <a href="https://toby.euler.usi.ch/rpt.php?mth=rnk1&amp;res_id=1&amp;xsl=0">https://toby.euler.usi.ch/rpt.php?mth=rnk1&amp;res_id=1&amp;xsl=0</a>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>