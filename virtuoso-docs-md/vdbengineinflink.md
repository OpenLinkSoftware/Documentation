<div id="vdbengineinflink" class="section">

<div class="titlepage">

<div>

<div>

### 8.5.3. Linking Informix tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="infinf1" class="figure">

    **Figure 8.214. Start**

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

    <div id="infinf2" class="figure">

    **Figure 8.215. Conductor**

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

    <div id="infinf3" class="figure">

    **Figure 8.216. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/infinf3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "inf10ma" Informix DSN.

    <div class="figure-float">

    <div id="infinf4" class="figure">

    **Figure 8.217. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/infinf4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="infinf5" class="figure">

    **Figure 8.218. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/infinf5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "stores_demo" catalog.

    <div class="figure-float">

    <div id="infinf6" class="figure">

    **Figure 8.219. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/infinf6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "stores_demo" using the "Set
    All" button.

    <div class="figure-float">

    <div id="infinf7" class="figure">

    **Figure 8.220. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/infinf7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "stores_demo".

    <div class="figure-float">

    <div id="infinf8" class="figure">

    **Figure 8.221. catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![catalog names](images/ui/infinf8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="infinf9" class="figure">

    **Figure 8.222. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/infinf9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="infinf10" class="figure">

    **Figure 8.223. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/infinf10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point you can test the remotely linked tables by clicking on
    the link that accompanies each table. e.g.
    stores_demo.inf10ma.customer.

    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div class="figure-float">

    <div id="infinf11" class="figure">

    **Figure 8.224. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/infinf11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div class="figure-float">

    <div id="infinf12" class="figure">

    **Figure 8.225. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/infinf12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "stores_demo" catalog name.

    <div class="figure-float">

    <div id="infinf13" class="figure">

    **Figure 8.226. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/infinf13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
