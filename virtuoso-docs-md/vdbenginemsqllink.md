<div>

<div>

<div>

<div>

### 8.8.3. Linking MySQL tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.392. Start**

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

    **Figure 8.393. Conductor**

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

    **Figure 8.394. Databases**

    <div>

    <div>

    ![Databases](images/ui/msora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "mysqlma" MySQL DSN.

    <div>

    <div>

    **Figure 8.395. Connect**

    <div>

    <div>

    ![Connect](images/ui/msora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.396. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/msora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "mysql" catalog.

    <div>

    <div>

    **Figure 8.397. Select tables**

    <div>

    <div>

    ![Select tables](images/ui/msora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Ensure a primary key is assigned to all table that are to be used in
    the EDM generation phase.

    <div>

    <div>

    **Figure 8.398. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/msora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Change the Catalog for each table to be "mysql" using the "Set All"
    button.

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.399. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/msora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.400. Completion**

    <div>

    <div>

    ![Completion](images/ui/msora9.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data . We
    shall use the "mysql.mysqlma.artist" table to demonstrate this.

    <div>

    <div>

    **Figure 8.401. Completion**

    <div>

    <div>

    ![Completion](images/ui/msora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.402. Completion**

    <div>

    <div>

    ![Completion](images/ui/msora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "mysql" catalog name.

    <div>

    <div>

    **Figure 8.403. view tables**

    <div>

    <div>

    ![view tables](images/ui/sora11.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
