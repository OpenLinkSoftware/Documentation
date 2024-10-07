<div id="vdbenginepsqllink" class="section">

<div class="titlepage">

<div>

<div>

### 8.9.3. Linking PostgreSQL tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="pslora1" class="figure">

    **Figure 8.445. Start**

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

    <div id="pslora2" class="figure">

    **Figure 8.446. Conductor**

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

    <div id="pslora3" class="figure">

    **Figure 8.447. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/pslora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "pg7ma" PostgreSQL DSN.

    <div class="figure-float">

    <div id="pslora4" class="figure">

    **Figure 8.448. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/pslora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="pslora5" class="figure">

    **Figure 8.449. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/pslora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that you would like to link.

    <div class="figure-float">

    <div id="pslora6" class="figure">

    **Figure 8.450. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/pslora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "Northwind" using the "Set
    All" button.

    <div class="figure-float">

    <div id="pslora7" class="figure">

    **Figure 8.451. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/pslora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "Northwind".

    <div class="figure-float">

    <div id="pslora8" class="figure">

    **Figure 8.452. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/pslora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="pslora9" class="figure">

    **Figure 8.453. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/lora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="pslora10" class="figure">

    **Figure 8.454. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/pslora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data . We
    shall use the "Northwind.pg7ma.Customers" table to demonstrate this.

    <div class="figure-float">

    <div id="pslora11" class="figure">

    **Figure 8.455. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/pslora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="pslora12" class="figure">

    **Figure 8.456. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/pslora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "Northwind" catalog name.

    <div class="figure-float">

    <div id="pslora13" class="figure">

    **Figure 8.457. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/pslora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
