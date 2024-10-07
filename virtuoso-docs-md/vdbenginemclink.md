<div id="vdbenginemclink" class="section">

<div class="titlepage">

<div>

<div>

### 8.2.3. Linking Oracle tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="lora1" class="figure">

    **Figure 8.13. Start**

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

    <div id="lora2" class="figure">

    **Figure 8.14. Conductor**

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

    <div id="lora3" class="figure">

    **Figure 8.15. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/lora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "ora10ma" Oracle DSN.

    <div class="figure-float">

    <div id="lora4" class="figure">

    **Figure 8.16. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/lora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="lora5" class="figure">

    **Figure 8.17. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/lora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "HR" catalog.

    <div class="figure-float">

    <div id="lora6" class="figure">

    **Figure 8.18. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/lora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "HR" using the "Set All"
    button.

    <div class="figure-float">

    <div id="lora7" class="figure">

    **Figure 8.19. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/lora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Ensure a primary key is assigned to all table that are to be used in
    the EDM generation phase.

    <div class="figure-float">

    <div id="lora8" class="figure">

    **Figure 8.20. Primary Key**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Primary Key](images/ui/lora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="lora9" class="figure">

    **Figure 8.21. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/lora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="lora10" class="figure">

    **Figure 8.22. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="lora11" class="figure">

    **Figure 8.23. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/lora11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Then click the "Execute" button to run the query and retrieve the
    results from the remote table.

    <div class="figure-float">

    <div id="lora12" class="figure">

    **Figure 8.24. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/lora12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "HR" catalog name.

    <div class="figure-float">

    <div id="lora13" class="figure">

    **Figure 8.25. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/lora13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
