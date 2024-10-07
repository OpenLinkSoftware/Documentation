<div id="vdbenginedb2link" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.3. Linking DB2 tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="bora1" class="figure">

    **Figure 8.273. Start**

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

    <div id="bora2" class="figure">

    **Figure 8.274. Conductor**

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

    <div id="bora3" class="figure">

    **Figure 8.275. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/bora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "db2v8ma" DB2 DSN.

    <div class="figure-float">

    <div id="bora4" class="figure">

    **Figure 8.276. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/bora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="bora5" class="figure">

    **Figure 8.277. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/bora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select the tables that you would like to link.

    <div class="figure-float">

    <div id="bora6" class="figure">

    **Figure 8.278. Select tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select tables](images/ui/bora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "SAMPLE" using the "Set All"
    button.

    <div class="figure-float">

    <div id="bora7" class="figure">

    **Figure 8.279. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/bora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "SAMPLE".

    <div class="figure-float">

    <div id="bora8" class="figure">

    **Figure 8.280. catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![catalog names](images/ui/bora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="bora9" class="figure">

    **Figure 8.281. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/bora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="bora10" class="figure">

    **Figure 8.282. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/bora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    Local Name column of the External Linked Objects tab above. This
    loads the Virtuoso Interactive SQL interface with the required SQL
    Select for retrieving the remote table data . We shall use the
    SAMPLE.db2v8ma.EMPLOYEE table to demonstrate this.

    <div class="figure-float">

    <div id="bora11" class="figure">

    **Figure 8.283. view tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![view tables](images/ui/bora13.png)

    </div>

    </div>

    </div>

      

    </div>

12. Click the Execute button to run the query and retrieve the results
    from the remote table.

    <div class="figure-float">

    <div id="bora12" class="figure">

    **Figure 8.284. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/bora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso SQL Schema
    Objects under the SAMPLE catalog name.

    <div class="figure-float">

    <div id="bora13" class="figure">

    **Figure 8.285. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/bora11.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
