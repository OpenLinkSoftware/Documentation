<div>

<div>

<div>

<div>

### 8.7.3. Linking Sybase tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.325. Start**

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

    **Figure 8.326. Conductor**

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

    **Figure 8.327. Databases**

    <div>

    <div>

    ![Databases](images/ui/sora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "syb15ma" Sybase DSN.

    <div>

    <div>

    **Figure 8.328. Connect**

    <div>

    <div>

    ![Connect](images/ui/sora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.329. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/sora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "pubs2" catalog.

    <div>

    <div>

    **Figure 8.330. Select tables**

    <div>

    <div>

    ![Select tables](images/ui/sora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "P2" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.331. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/sora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "P2".

    <div>

    <div>

    **Figure 8.332. catalog names**

    <div>

    <div>

    ![catalog names](images/ui/sora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.333. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/sora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.334. Completion**

    <div>

    <div>

    ![Completion](images/ui/sora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "P2" catalog name.

    <div>

    <div>

    **Figure 8.335. view tables**

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
