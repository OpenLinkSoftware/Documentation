<div id="vdbengineodbcodlink" class="section">

<div class="titlepage">

<div>

<div>

### 8.11.2. Linking ODBC to ODBC Bridge tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="obora1" class="figure">

    **Figure 8.546. Start**

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

    <div id="obora2" class="figure">

    **Figure 8.547. Conductor**

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

    <div id="obora3" class="figure">

    **Figure 8.548. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/obora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "odbcma" ODBC to ODBC Bridge
    DSN.

    <div class="figure-float">

    <div id="obora4" class="figure">

    **Figure 8.549. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/obora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="obora5" class="figure">

    **Figure 8.550. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/obora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "Northwind" catalog.

    <div class="figure-float">

    <div id="obora6" class="figure">

    **Figure 8.551. Select tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select tables](images/ui/obora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "NWIND" using the "Set All"
    button.

    <div class="figure-float">

    <div id="obora7" class="figure">

    **Figure 8.552. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/obora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "NWIND".

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="obora8" class="figure">

    **Figure 8.553. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/obora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="obora9" class="figure">

    **Figure 8.554. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/obora9.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data. We shall
    use the "NWIND.odbcma.Customers" table to demonstrate this.

    <div class="figure-float">

    <div id="obora10" class="figure">

    **Figure 8.555. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/obora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="obora11" class="figure">

    **Figure 8.556. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/obora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "NWIND" catalog name.

    <div class="figure-float">

    <div id="obora12" class="figure">

    **Figure 8.557. view tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![view tables](images/ui/obora12.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
