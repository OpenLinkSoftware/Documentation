<div>

<div>

<div>

<div>

### 8.13.3. Linking Microsoft SQL Server tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.648. Start**

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

    **Figure 8.649. Conductor**

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

    **Figure 8.650. Databases**

    <div>

    <div>

    ![Databases](images/ui/slora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "sql2k5ma" Microsoft SQL Server
    DSN.

    <div>

    <div>

    **Figure 8.651. Connect**

    <div>

    <div>

    ![Connect](images/ui/slora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.652. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/slora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "Northwind" catalog.

    <div>

    <div>

    **Figure 8.653. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/slora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "Northwind" using the "Set
    All" button.

    <div>

    <div>

    **Figure 8.654. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/slora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "NWIND"

    <div>

    <div>

    **Figure 8.655. catalog names**

    <div>

    <div>

    ![catalog names](images/ui/slora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.656. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/slora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.657. Completion**

    <div>

    <div>

    ![Completion](images/ui/slora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point, you can test the remotely linked tables by clicking
    on the link that accompanies each table, e.g. NWIND.NWIND.Customer.
    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div>

    <div>

    **Figure 8.658. Querying**

    <div>

    <div>

    ![Querying](images/ui/slora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div>

    <div>

    **Figure 8.659. Execute**

    <div>

    <div>

    ![Execute](images/ui/slora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "Northwind" catalog name.

    <div>

    <div>

    **Figure 8.660. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/slora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
