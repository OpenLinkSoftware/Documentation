<div>

<div>

<div>

<div>

### 8.3.3. Linking Progress tables into Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.67. Start**

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

    **Figure 8.68. Conductor**

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

    **Figure 8.69. Databases**

    <div>

    <div>

    ![Databases](images/ui/lpro3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "prs10ma" Oracle DSN.

    <div>

    <div>

    **Figure 8.70. Connect**

    <div>

    <div>

    ![Connect](images/ui/lpro4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.71. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/lpro5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "isports" catalog.

    <div>

    <div>

    **Figure 8.72. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/lpro6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "isports" using the "Set
    All" button.

    <div>

    <div>

    **Figure 8.73. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/lpro7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "isports".

    <div>

    <div>

    **Figure 8.74. Catalog names**

    <div>

    <div>

    ![Catalog names](images/ui/lpro8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.75. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/lpro9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.76. Completion**

    <div>

    <div>

    ![Completion](images/ui/lpro10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point you can test the remotely linked tables by clicking on
    the link that accompanies each table. e.g. isports.prs101c.Customer.

    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div>

    <div>

    **Figure 8.77. Querying**

    <div>

    <div>

    ![Querying](images/ui/lpro11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div>

    <div>

    **Figure 8.78. Execute**

    <div>

    <div>

    ![Execute](images/ui/lpro12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "isports" catalog name.

    <div>

    <div>

    **Figure 8.79. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/lpro13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
