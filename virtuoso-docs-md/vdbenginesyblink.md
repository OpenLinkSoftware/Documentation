<div id="vdbenginesyblink" class="section">

<div class="titlepage">

<div>

<div>

### 8.7.3. Linking Sybase tables into OpenLink Virtuoso

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the Virtuoso Web User Interface

    <div class="figure-float">

    <div id="sora1" class="figure">

    **Figure 8.325. Start**

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

    <div id="sora2" class="figure">

    **Figure 8.326. Conductor**

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

    <div id="sora3" class="figure">

    **Figure 8.327. Databases**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Databases](images/ui/sora3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the "Connect" button for the "syb15ma" Sybase DSN.

    <div class="figure-float">

    <div id="sora4" class="figure">

    **Figure 8.328. Connect**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connect](images/ui/sora4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  On successful connection Select the "Link Objects" button to obtain
    a list of available tables

    <div class="figure-float">

    <div id="sora5" class="figure">

    **Figure 8.329. Link Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Link Objects](images/ui/sora5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select all the tables that are part of the "pubs2" catalog.

    <div class="figure-float">

    <div id="sora6" class="figure">

    **Figure 8.330. Select tables**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select tables](images/ui/sora6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Change the Catalog for each table to be "P2" using the "Set All"
    button.

    <div class="figure-float">

    <div id="sora7" class="figure">

    **Figure 8.331. Catalog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Catalog](images/ui/sora7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  All the catalog names are changed to be "P2".

    <div class="figure-float">

    <div id="sora8" class="figure">

    **Figure 8.332. catalog names**

    <div class="figure-contents">

    <div class="mediaobject">

    ![catalog names](images/ui/sora8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the "Link" button to link the selected tables into Virtuoso

    <div class="figure-float">

    <div id="sora9" class="figure">

    **Figure 8.333. "Link" button**

    <div class="figure-contents">

    <div class="mediaobject">

    !["Link" button](images/ui/sora9.png)

    </div>

    </div>

    </div>

      

    </div>

10. On completion of the Link process the tables will be displayed in
    the "External Linked Objects" tab.

    <div class="figure-float">

    <div id="sora10" class="figure">

    **Figure 8.334. Completion**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Completion](images/ui/sora10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The tables can also be viewed as part of the Virtuoso "SQL Schema
    Objects" under the "P2" catalog name.

    <div class="figure-float">

    <div id="sora11" class="figure">

    **Figure 8.335. view tables**

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
