<div>

<div>

<div>

<div>

### 8.5.3. Linking Informix tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.214. Start**

    <div>

    <div>

    ![Start](images/ui/lora1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Select the "Conductor" link in the Left Frame and Login as the "dba"
    user.

    <div>

    <div>

    **Figure 8.215. Conductor**

    <div>

    <div>

    ![Conductor](images/ui/lora2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the "Databases" -\> "External Data Source" -\> "Data Sources"
    tab menu items

    <div>

    <div>

    **Figure 8.216. Databases**

    <div>

    <div>

    ![Databases](images/ui/infinf3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "inf10ma" Informix DSN.

    <div>

    <div>

    **Figure 8.217. Connect**

    <div>

    <div>

    ![Connect](images/ui/infinf4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.218. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/infinf5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "stores_demo" catalog.

    <div>

    <div>

    **Figure 8.219. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/infinf6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "stores_demo" using the "Set
    All" button.

    <div>

    <div>

    **Figure 8.220. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/infinf7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "stores_demo".

    <div>

    <div>

    **Figure 8.221. catalog names**

    <div>

    <div>

    ![catalog names](images/ui/infinf8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.222. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/infinf9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.223. Completion**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.224. Querying**

    <div>

    <div>

    ![Querying](images/ui/infinf11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div>

    <div>

    **Figure 8.225. Execute**

    <div>

    <div>

    ![Execute](images/ui/infinf12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "stores_demo" catalog name.

    <div>

    <div>

    **Figure 8.226. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/infinf13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
