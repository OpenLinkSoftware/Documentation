<div id="vdbengineinglink" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.3. Linking Ingres tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="iora1" class="figure">

    **Figure 8.146. Start**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Start](images/ui/lora1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Select the "Conductor" link in the Left Frame and Login as the "dba"
    user.

    <div class="figure-float">

    <div id="iora2" class="figure">

    **Figure 8.147. Conductor**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor](images/ui/lora2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the "Databases" -\> "External Data Source" -\> "Data Sources"
    tab menu items

    <div class="figure-float">

    <div id="iora3" class="figure">

    **Figure 8.148. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/iora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "Ing10ma" Ingres DSN.

    <div class="figure-float">

    <div id="iora4" class="figure">

    **Figure 8.149. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/iora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="iora5" class="figure">

    **Figure 8.150. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/iora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "TUT" catalog and press
    the "Link" button to commence the linking process

    <div class="figure-float">

    <div id="iora6" class="figure">

    **Figure 8.151. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/iora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "TUT" using the "Set All"
    button.

    <div class="figure-float">

    <div id="iora7" class="figure">

    **Figure 8.152. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/iora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "TUT".

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="iora8" class="figure">

    **Figure 8.153. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/iora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="iora9" class="figure">

    **Figure 8.154. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="iora10" class="figure">

    **Figure 8.155. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/iora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="iora11" class="figure">

    **Figure 8.156. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/iora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "TUT" catalog name.

    <div class="figure-float">

    <div id="iora12" class="figure">

    **Figure 8.157. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/iora12.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
