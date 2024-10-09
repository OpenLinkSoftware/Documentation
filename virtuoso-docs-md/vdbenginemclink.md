<div>

<div>

<div>

<div>

### 8.2.3. Linking Oracle tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.13. Start**

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

    **Figure 8.14. Conductor**

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

    **Figure 8.15. Databases**

    <div>

    <div>

    ![Databases](images/ui/lora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "ora10ma" Oracle DSN.

    <div>

    <div>

    **Figure 8.16. Connect**

    <div>

    <div>

    ![Connect](images/ui/lora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.17. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/lora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "HR" catalog.

    <div>

    <div>

    **Figure 8.18. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/lora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "HR" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.19. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/lora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Ensure a primary key is assigned to all table that are to be used in
    the EDM generation phase.

    <div>

    <div>

    **Figure 8.20. Primary Key**

    <div>

    <div>

    ![Primary Key](images/ui/lora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.21. "Link" button**

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

    **Figure 8.22. Completion**

    <div>

    <div>

    ![Completion](images/ui/lora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data . We
    shall use the "HR.ora10ma.COUNTRIES" table to demonstrate this.

    <div>

    <div>

    **Figure 8.23. Querying**

    <div>

    <div>

    ![Querying](images/ui/lora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.24. Execute**

    <div>

    <div>

    ![Execute](images/ui/lora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "HR" catalog name.

    <div>

    <div>

    **Figure 8.25. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/lora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
