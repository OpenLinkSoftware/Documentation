<div>

<div>

<div>

<div>

### 8.6.3. Linking DB2 tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.273. Start**

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

    **Figure 8.274. Conductor**

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

    **Figure 8.275. Databases**

    <div>

    <div>

    ![Databases](images/ui/bora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "db2v8ma" DB2 DSN.

    <div>

    <div>

    **Figure 8.276. Connect**

    <div>

    <div>

    ![Connect](images/ui/bora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.277. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/bora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select the tables that you would like to link.

    <div>

    <div>

    **Figure 8.278. Select tables**

    <div>

    <div>

    ![Select tables](images/ui/bora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "SAMPLE" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.279. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/bora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "SAMPLE".

    <div>

    <div>

    **Figure 8.280. catalog names**

    <div>

    <div>

    ![catalog names](images/ui/bora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.281. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/bora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.282. Completion**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.283. view tables**

    <div>

    <div>

    ![view tables](images/ui/bora13.png)

    </div>

    </div>

    </div>

      

    </div>

12. Click the Execute button to run the query and retrieve the results
    from the remote table.

    <div>

    <div>

    **Figure 8.284. Execute**

    <div>

    <div>

    ![Execute](images/ui/bora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso SQL Schema
    Objects under the SAMPLE catalog name.

    <div>

    <div>

    **Figure 8.285. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/bora11.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
