<div id="vdbenginemsqllink" class="section">

<div class="titlepage">

<div>

<div>

### 8.8.3. Linking MySQL tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="msora1" class="figure">

    **Figure 8.392. Start**

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

    <div id="msora2" class="figure">

    **Figure 8.393. Conductor**

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

    <div id="msora3" class="figure">

    **Figure 8.394. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/msora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "mysqlma" MySQL DSN.

    <div class="figure-float">

    <div id="msora4" class="figure">

    **Figure 8.395. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/msora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="msora5" class="figure">

    **Figure 8.396. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/msora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "mysql" catalog.

    <div class="figure-float">

    <div id="msora6" class="figure">

    **Figure 8.397. Select tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select tables](images/ui/msora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Ensure a primary key is assigned to all table that are to be used in
    the EDM generation phase.

    <div class="figure-float">

    <div id="msora7" class="figure">

    **Figure 8.398. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/msora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Change the Catalog for each table to be "mysql" using the "Set All"
    button.

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="msora8" class="figure">

    **Figure 8.399. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/msora8.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="msora9" class="figure">

    **Figure 8.400. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="msora10" class="figure">

    **Figure 8.401. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/msora10.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="msora11" class="figure">

    **Figure 8.402. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/msora11.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "mysql" catalog name.

    <div class="figure-float">

    <div id="sora11_01" class="figure">

    **Figure 8.403. view tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![view tables](images/ui/sora11.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
