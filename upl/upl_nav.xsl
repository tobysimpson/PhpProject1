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
        <p>Please do not put commas in the text fields.</p>
        <p>Scientific format with many decimals will preserve numerical precision.</p>        
        <table>
            <tr>
                <th>rpt1</th>
                <td>
                    The standard format with series on rows and years in column headings.
                    <p/>
                    
                    <table class="table1">
                        <tr>
                            <th>prm_id</th>
                            <th>scn_id</th>
                            <th>path</th>
                            <th>unit</th>
                            <th>INT</th>
                            <th>INT</th>
                            <th>INT</th>
                            <th>etc.</th>
                        </tr> 
                        <tr>
                            <td>INT</td>
                            <td>INT</td>
                            <td>TXT</td>
                            <td>TXT</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>etc.</td>
                        </tr>
                    </table>
                    <p/>
                    Values for parameter (prm_id) and scenario (scn_id) should correspond with the values on the database.
                    <p/>
                    The values for path and unit are optional as they are not stored.
                    <p/>
                    <form action="upl.php?mth=rpt1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            <tr>
                <th>raw1</th>
                <td>
                    <p>De-normalised data as per the storage format.</p>
                    <p>Please submit *.csv files</p>
                    <!--<p>No headers please, just values</p>-->
                    <p>Scientific format with many decimals will preserve numerical precision</p>
        
                    <table class="table1">
                        <tr>
                            <th>prm_id</th>
                            <th>scn_id</th>
                            <th>yr</th>
                            <th>u</th>
                        </tr>
                        <tr>
                            <td>INT</td>
                            <td>INT</td>
                            <td>INT</td>
                            <td>DOUBLE</td>
                        </tr>
                    </table>
        
                    <p/>

        
                    <form action="raw.php?mth=upl" method="post" enctype="multipart/form-data">
                        <input type="file" name="upload_file" prm_id="fileToUpload"></input>
                        <input type="submit" value="Upload" name="submit"></input>
                    </form>
                    
                </td>
            </tr>
            <tr>
                <th>prem1</th>
                <td>
                    Premise model output.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>sector</th>
                            <th>variable</th>
                            <th>year</th>
                            <th>region</th>
                            <th>model</th>
                            <th>scenario</th>
                            <th>impact</th>
                            <th>location</th>
                            <th>value</th>
                            <th>unit</th>
                        </tr> 
                        <tr>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>INT</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>DOUBLE</td>
                            <td>VARCHAR</td>
                        </tr>
                    </table>
                    <p/>

                    <form action="upl.php?mth=prem1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            <tr>
                <th>gem1</th>
                <td>
                    GEM-E3 model output as report.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>text</th>
                            <th>year/value</th>
                            <th>etc.</th>

                        </tr> 
                        <tr>
                            <td>VARCHAR</td>
                            <td>INT/DOUBLE</td>
                            <td>INT/DOUBLE</td>
                        </tr>
                    </table>
                    <p/>
                    The files should be *.csv named as per the scn_code values in the scenario tables: <a href="scn.php?mth=lst">here</a>.
                    <p/>
                    For example SPS1_bas0.csv, SPS3_hot3.csv, etc.
                    <p/>
                    <form action="upl.php?mth=gem1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            <tr>
                <th>flex1</th>
                <td>
                    Flexeco grid indicators.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>Scenario Key</th>
                            <th>Pathway	Shock</th>
                            <th>Intensity</th>
                            <th>Prior model</th>
                            <th>Year</th>
                            <th>Grid loading indicator (violations per hour)</th>
                            <th>Grid loading indicator (violations per hour per line)</th>
                        </tr> 
                        <tr>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>INT</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=flex1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            <tr>
                <th>flex2</th>
                <td>
                    Flexeco grid indicators.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>Scenario Key</th>
                            <th>Pathway	Shock</th>
                            <th>Intensity</th>
                            <th>Prior model</th>
                            <th>Year</th>
                            <th>Electricity (violations per hour)</th>
                            <th>Electricity (violations per hour per line)</th>
                            <th>Gas (violations per hour)</th>
                            <th>Gas (violations per hour per line)</th>
                        </tr> 
                        <tr>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>INT</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=flex2" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            <tr>
                <th>stem1</th>
                <td>
                    stem1
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>prm_id</th>
                            <th>scn_id</th>
                            <th>name</th>
                            <th>unit</th>
                            <th>2020</th>
                            <th>2022</th>
                            <th>2025</th>
                            <th>2030</th>
                            <th>2035</th>
                            <th>2040</th>
                            <th>2050</th>
                        </tr> 
                        <tr>
                            <td>INT</td>
                            <td>INT</td>
                            <td>TEXT</td>
                            <td>TEXT</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=stem1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
           
            
            
            <tr>
                <th>cli1</th>
                <td>
                    STEM cli1 test.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>txt1</th>
                            <th>txt2</th>
                            <th>yr_2020</th>
                            <th>yr_2022</th>
                            <th>yr_2025</th>
                            <th>yr_2030</th>
                            <th>yr_2040</th>
                            <th>yr_2050</th>
                           
                        </tr> 
                        <tr>
                            <td>VARCHAR</td>
                            <td>VARCHAR</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>

                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=cli1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            
            <tr>
                <th>xpn1</th>
                <td>
                    Expanse Gini index, prm_id = 23360, but you can submit others once defined.
                    <p/>
                 
                    <table class="table1">
                        <tr>
                            <th>sps_code</th>
                            <th>shk_code</th>
                            <th>shk_lvl</th>
                            <th>prm_id</th>
                            <th>yr</th>
                            <th>u</th>

                        </tr> 
                        <tr>
                            <td>VARCHAR(4)</td>
                            <td>VARCHAR(3)</td>
                            <td>INT</td>
                            <td>INT</td>
                            <td>INT</td>
                            <td>DOUBLE</td>


                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=xpn1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            
            <tr>
                <th>ipw1</th>
                <td>
                    Bern - Aadaptation Need Indicator and sub-indices.
                    <p/>
                    semi-colon separated (;) not comma separated!
                    <p/>
            
                    <table class="table1">
                        <tr>
                            <th>scn_id</th>
                            <th>sps_code</th>
                            <th>prm_id</th>
                            <th>path</th>
                            <th>u</th>
                        </tr> 
                        <tr>
                            <td>INT</td>
                            <td>VARCHAR(4)</td>
                            <td>INT</td>
                            <td>VARCHAR(150)</td>
                            <td>DOUBLE</td>
                        </tr>
                    </table>
                    <p/>
                    <p>Please submit *.csv file in Latin1 encoding (not utf-8)</p>
                    <p/>
                    <form action="upl.php?mth=ipw1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
            <tr>
                <th>mc1</th>
                <td>
                    MCDA parameters - only mc_id = 3 for testing
                    <p/>
                    <table class="table1">
                        <tr>
                            <th>mc_id</th>
                            <th>prm_id</th>
                            <th>prm_name</th>
                            <th>mc_grp</th>
                            <th>mc_code</th>
                            <th>mc_sgn</th>
                            <th>mc_pref</th>
                            <th>mc_w0</th>
                            <th>mc_w1</th>
                            <th>mc_p</th>
                            <th>mc_q</th>
                            <th>prm_src</th>
                            <th>prm_desc</th>
                        </tr> 
                        <tr>
                            <td>INT</td>
                            <td>INT</td>
                            <td>VARCHAR(100)</td>
                            <td>ENUM('Socio-Political', 'Environment', 'Economy', 'Resilience')</td>
                            <td>VARCHAR(4)</td>
                            <td>DOUBLE</td>
                            <td>INT</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>DOUBLE</td>
                            <td>VARCHAR(45)</td>
                            <td>VARCHAR(200)</td>
                        </tr>
                    </table>
                    <p/>
                    <form action="upl.php?mth=mc1" method="post" enctype="multipart/form-data">
                        <input type="file" name="upfile"></input>
                        <input type="submit" value="upload" name="submit"></input>
                    </form>
                </td>
            </tr>
            
        </table>
    </xsl:template>
</xsl:stylesheet>