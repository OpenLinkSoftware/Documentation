<div>

<div>

<div>

<div>

### 8.9.3. Linking PostgreSQL tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.445. Start**

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

    **Figure 8.446. Conductor**

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

    **Figure 8.447. Databases**

    <div>

    <div>

    ![Databases](images/ui/pslora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "pg7ma" PostgreSQL DSN.

    <div>

    <div>

    **Figure 8.448. Connect**

    <div>

    <div>

    ![Connect](images/ui/pslora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.449. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/pslora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that you would like to link.

    <div>

    <div>

    **Figure 8.450. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/pslora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "Northwind" using the "Set
    All" button.

    <div>

    <div>

    **Figure 8.451. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/pslora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "Northwind".

    <div>

    <div>

    **Figure 8.452. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/pslora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.453. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/lora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.454. Completion**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.455. Querying**

    <div>

    <div>

    ![Querying](images/ui/pslora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.456. Execute**

    <div>

    <div>

    ![Execute](images/ui/pslora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "Northwind" catalog name.

    <div>

    <div>

    **Figure 8.457. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/pslora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
