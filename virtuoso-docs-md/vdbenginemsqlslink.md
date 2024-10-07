<div id="vdbenginemsqlslink" class="section">

<div class="titlepage">

<div>

<div>

### 8.13.3. Linking Microsoft SQL Server tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="lora1_02" class="figure">

    **Figure 8.648. Start**

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

    <div id="lora2_02" class="figure">

    **Figure 8.649. Conductor**

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

    <div id="slora3" class="figure">

    **Figure 8.650. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/slora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "sql2k5ma" Microsoft SQL Server
    DSN.

    <div class="figure-float">

    <div id="slora4" class="figure">

    **Figure 8.651. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/slora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="slora5" class="figure">

    **Figure 8.652. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/slora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "Northwind" catalog.

    <div class="figure-float">

    <div id="slora6" class="figure">

    **Figure 8.653. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/slora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "Northwind" using the "Set
    All" button.

    <div class="figure-float">

    <div id="slora7" class="figure">

    **Figure 8.654. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/slora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "NWIND"

    <div class="figure-float">

    <div id="slora8" class="figure">

    **Figure 8.655. catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![catalog names](images/ui/slora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="slora9" class="figure">

    **Figure 8.656. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/slora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="slora10" class="figure">

    **Figure 8.657. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/slora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point, you can test the remotely linked tables by clicking
    on the link that accompanies each table, e.g. NWIND.NWIND.Customer.
    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div class="figure-float">

    <div id="slora11" class="figure">

    **Figure 8.658. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/slora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div class="figure-float">

    <div id="slora12" class="figure">

    **Figure 8.659. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/slora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "Northwind" catalog name.

    <div class="figure-float">

    <div id="slora13" class="figure">

    **Figure 8.660. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/slora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
