<div id="vdbengineprlnk" class="section">

<div class="titlepage">

<div>

<div>

### 8.3.3. Linking Progress tables into Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="lpro1" class="figure">

    **Figure 8.67. Start**

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

    <div id="lpro2" class="figure">

    **Figure 8.68. Conductor**

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

    <div id="lpro3" class="figure">

    **Figure 8.69. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/lpro3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "prs10ma" Oracle DSN.

    <div class="figure-float">

    <div id="lpro4" class="figure">

    **Figure 8.70. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/lpro4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="lpro5" class="figure">

    **Figure 8.71. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/lpro5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "isports" catalog.

    <div class="figure-float">

    <div id="lpro6" class="figure">

    **Figure 8.72. Select all tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select all tables](images/ui/lpro6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "isports" using the "Set
    All" button.

    <div class="figure-float">

    <div id="lpro7" class="figure">

    **Figure 8.73. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/lpro7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "isports".

    <div class="figure-float">

    <div id="lpro8" class="figure">

    **Figure 8.74. Catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog names](images/ui/lpro8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="lpro9" class="figure">

    **Figure 8.75. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/lpro9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="lpro10" class="figure">

    **Figure 8.76. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/lpro10.png)

    </div>

    </div>

    </div>

      

    </div>

11. At this point you can test the remotely linked tables by clicking on
    the link that accompanies each table. e.g. isports.prs101c.Customer.

    This will display the Interactive ISQL interface which will have
    been already populated with a suitable SQL statement.

    <div class="figure-float">

    <div id="lpro11" class="figure">

    **Figure 8.77. Querying**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Querying](images/ui/lpro11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select Execute to see data from the remotely linked table.

    <div class="figure-float">

    <div id="lpro12" class="figure">

    **Figure 8.78. Execute**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Execute](images/ui/lpro12.png)

    </div>

    </div>

    </div>

      

    </div>

13. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "isports" catalog name.

    <div class="figure-float">

    <div id="lpro13" class="figure">

    **Figure 8.79. SQL Schema Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![SQL Schema Objects](images/ui/lpro13.png)

    </div>

    </div>

    </div>

      

    </div>

    The Link process is now complete enabling the tables to be queried
    as if part of the Virtuoso Schema.

</div>

</div>
