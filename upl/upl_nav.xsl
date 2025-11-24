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
        </table>
  



    </xsl:template>
</xsl:stylesheet>