<div>

<div>

<div>

<div>

### 8.10.3. Linking ODBC to JDBC Bridge tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.492. Start**

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

    **Figure 8.493. Conductor**

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

    **Figure 8.494. Databases**

    <div>

    <div>

    ![Databases](images/ui/jbora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "jdbcma" ODBC to JDBC Bridge
    DSN.

    <div>

    <div>

    **Figure 8.495. Connect**

    <div>

    <div>

    ![Connect](images/ui/jbora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.496. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/jbora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "JDBC" catalog.

    <div>

    <div>

    **Figure 8.497. Select tables**

    <div>

    <div>

    ![Select tables](images/ui/jbora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select all the "JDBC" Catalog tables to be linked into the database
    and select "Link" button.

    <div>

    <div>

    **Figure 8.498. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/jbora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Change the Catalog for each table to be "JDBC" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.499. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/jbora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.500. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/jbora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.501. Completion**

    <div>

    <div>

    ![Completion](images/ui/jbora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data. We shall
    use the "JDBC.jdbcma.Artist" table to demonstrate this.

    <div>

    <div>

    **Figure 8.502. Completion**

    <div>

    <div>

    ![Completion](images/ui/jbora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.503. Completion**

    <div>

    <div>

    ![Completion](images/ui/jbora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "JDBC" catalog name.

    <div>

    <div>

    **Figure 8.504. view tables**

    <div>

    <div>

    ![view tables](images/ui/jbora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
