<div>

<div>

<div>

<div>

### 8.4.3. Linking Ingres tables into OpenLink Virtuoso

</div>

</div>

</div>

<div>

1.  Start the Virtuoso Web User Interface

    <div>

    <div>

    **Figure 8.146. Start**

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

    **Figure 8.147. Conductor**

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

    **Figure 8.148. Databases**

    <div>

    <div>

    ![Databases](images/ui/iora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "Ing10ma" Ingres DSN.

    <div>

    <div>

    **Figure 8.149. Connect**

    <div>

    <div>

    ![Connect](images/ui/iora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div>

    <div>

    **Figure 8.150. Link Objects**

    <div>

    <div>

    ![Link Objects](images/ui/iora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "TUT" catalog and press
    the "Link" button to commence the linking process

    <div>

    <div>

    **Figure 8.151. Select all tables**

    <div>

    <div>

    ![Select all tables](images/ui/iora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "TUT" using the "Set All"
    button.

    <div>

    <div>

    **Figure 8.152. Catalog**

    <div>

    <div>

    ![Catalog](images/ui/iora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "TUT".

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div>

    <div>

    **Figure 8.153. "Link" button**

    <div>

    <div>

    !["Link" button](images/ui/iora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div>

    <div>

    **Figure 8.154. Completion**

    <div>

    <div>

    ![Completion](images/ui/iora9.png)

    </div>

    </div>

    </div>

      

    </div>

11. The linked tables can be queried by clicking on the hyperlink in the
    "Local Name" column of the "External Linked Objects" tab above,
    which loads the Virtuoso "Interactive SQL" interface with the
    required SQL "Select" for retrieving the remote table data. We shall
    use the "TUT.ingma.book_list" table to demonstrate this.

    <div>

    <div>

    **Figure 8.155. Querying**

    <div>

    <div>

    ![Querying](images/ui/iora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div>

    <div>

    **Figure 8.156. Execute**

    <div>

    <div>

    ![Execute](images/ui/iora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "TUT" catalog name.

    <div>

    <div>

    **Figure 8.157. SQL Schema Objects**

    <div>

    <div>

    ![SQL Schema Objects](images/ui/iora12.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
