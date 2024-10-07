<div id="vdbenginefirebdlink" class="section">

<div class="titlepage">

<div>

<div>

### 8.12.3. Linking Firebird tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="lora1_01" class="figure">

    **Figure 8.592. Start**

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

    <div id="lora2_01" class="figure">

    **Figure 8.593. Conductor**

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

    <div id="fblora3" class="figure">

    **Figure 8.594. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/fblora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "fire" Firebird DSN.

    <div class="figure-float">

    <div id="fblora4" class="figure">

    **Figure 8.595. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/fblora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="fblora5" class="figure">

    **Figure 8.596. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/fblora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "employee" catalog.

    <div class="figure-float">

    <div id="fblora6" class="figure">

    **Figure 8.597. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/fblora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "employee" using the "Set
    All" button.

    <div class="figure-float">

    <div id="fblora7" class="figure">

    **Figure 8.598. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/fblora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "employee".

    <div class="figure-float">

    <div id="fblora8" class="figure">

    **Figure 8.599. catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![catalog names](images/ui/fblora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="lora9_01" class="figure">

    **Figure 8.600. "Link" button**

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

    <div id="fblora10" class="figure">

    **Figure 8.601. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/fblora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point you can test the remotely linked tables by clicking on
    the link that accompanies each table. e.g. employee.fire.COUNTRY.

    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div class="figure-float">

    <div id="fblora11" class="figure">

    **Figure 8.602. remotely linked tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![remotely linked tables](images/ui/fblora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div class="figure-float">

    <div id="fblora12" class="figure">

    **Figure 8.603. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/fblora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "employee" catalog name.

    <div class="figure-float">

    <div id="fblora13" class="figure">

    **Figure 8.604. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/fblora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
