<div id="vdbengineodtjdlink" class="section">

<div class="titlepage">

<div>

<div>

### 8.10.3. Linking ODBC to JDBC Bridge tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="jbora1" class="figure">

    **Figure 8.492. Start**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start](images/ui/lora1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Select the "Conductor" link in the Left Frame and Login as the "dba"
    user.

    <div class="figure-float">

    <div id="jbora2" class="figure">

    **Figure 8.493. Conductor**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor](images/ui/lora2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the "Databases" -\> "External Data Source" -\> "Data Sources"
    tab menu items

    <div class="figure-float">

    <div id="jbora3" class="figure">

    **Figure 8.494. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/jbora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "jdbcma" ODBC to JDBC Bridge
    DSN.

    <div class="figure-float">

    <div id="jbora4" class="figure">

    **Figure 8.495. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/jbora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="jbora5" class="figure">

    **Figure 8.496. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/jbora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "JDBC" catalog.

    <div class="figure-float">

    <div id="jbora6" class="figure">

    **Figure 8.497. Select tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select tables](images/ui/jbora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select all the "JDBC" Catalog tables to be linked into the database
    and select "Link" button.

    <div class="figure-float">

    <div id="jbora7" class="figure">

    **Figure 8.498. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/jbora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Change the Catalog for each table to be "JDBC" using the "Set All"
    button.

    <div class="figure-float">

    <div id="jbora8" class="figure">

    **Figure 8.499. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/jbora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="jbora9" class="figure">

    **Figure 8.500. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/jbora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="jbora10" class="figure">

    **Figure 8.501. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/jbora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data. We shall
    use the "JDBC.jdbcma.Artist" table to demonstrate this.

    <div class="figure-float">

    <div id="jbora11" class="figure">

    **Figure 8.502. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/jbora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="jbora12" class="figure">

    **Figure 8.503. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/jbora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "JDBC" catalog name.

    <div class="figure-float">

    <div id="jbora13" class="figure">

    **Figure 8.504. view tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![view tables](images/ui/jbora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
