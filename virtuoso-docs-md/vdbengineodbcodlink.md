<div>

<div>

<div>

<div>

### 8.11.2. Linking ODBC to ODBC Bridge tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.546. Start**

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

    **Figure 8.547. Conductor**

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

    **Figure 8.548. Databases**

    <div>

    <div>

    ![Databases](images/ui/obora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "odbcma" ODBC to ODBC Bridge
    DSN.

    <div>

    <div>

    **Figure 8.549. Connect**

    <div>

    <div>

    ![Connect](images/ui/obora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.550. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/obora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "Northwind" catalog.

    <div>

    <div>

    **Figure 8.551. Select tables**

    <div>

    <div>

    ![Select tables](images/ui/obora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "NWIND" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.552. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/obora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "NWIND".

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.553. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/obora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.554. Completion**

    <div>

    <div>

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

    <div>

    <div>

    **Figure 8.555. Completion**

    <div>

    <div>

    ![Completion](images/ui/obora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.556. Completion**

    <div>

    <div>

    ![Completion](images/ui/obora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "NWIND" catalog name.

    <div>

    <div>

    **Figure 8.557. view tables**

    <div>

    <div>

    ![view tables](images/ui/obora12.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
