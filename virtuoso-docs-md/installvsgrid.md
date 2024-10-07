<div id="installvsgrid" class="section">

<div class="titlepage">

<div>

<div>

## 2.6. Virtuoso ADO.Net Data Grid Form Application

</div>

</div>

</div>

This section details the steps required to create a simple Visual Studio
2008 Windows Form application with associated DataGridView control for
displaying data in selected tables from a Virtuoso database.

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="insg1" class="figure">

    **Figure 2.75. Visual Studio**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Visual Studio](images/ui/insg1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Create a Web Application project by going to the File menu in Visual
    Studio and choosing New Project.

3.  When the New Project window appears, choose either Visual Basic or
    Visual C# as the programming language.

4.  Within the language category, click on Windows and select Windows
    Form Application from the right-hand panel.

5.  Choose a name for the project, for example VirtuosoDataGridApp, and
    click OK.

    <div class="figure-float">

    <div id="insg5" class="figure">

    **Figure 2.76. name for the project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![name for the project](images/ui/insg5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  From the Data, menu select the Show Data Sources menu item to
    display a list of available Data sources.

    <div class="figure-float">

    <div id="insg6" class="figure">

    **Figure 2.77. Show Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Show Data Sources](images/ui/insg6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click on the Add New Data Source link to add a new data source.

    <div class="figure-float">

    <div id="insg7" class="figure">

    **Figure 2.78. Add New Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Data Source](images/ui/insg7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  In the Data Source Configuration Wizard dialog Choose Data Source
    Type page, select the Database data source type and click Next.

    <div class="figure-float">

    <div id="insg8" class="figure">

    **Figure 2.79. Data Source Configuration Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration Wizard](images/ui/insg8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  In the Data Source Configuration Wizard dialog Choose your Data
    Connection page, select the New Connection button.

    <div class="figure-float">

    <div id="insg9" class="figure">

    **Figure 2.80. Data Connection page**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Connection page](images/ui/insg9.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the Choose Data Source dialog, select OpenLink Virtuoso Data
    Source from the list and click Continue.

    <div class="figure-float">

    <div id="insg10" class="figure">

    **Figure 2.81. OpenLink Virtuoso Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

    ![OpenLink Virtuoso Data Source](images/ui/insg10.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the Add Connection dialog, specify the hostname, portno,
    username, and password for the target Virtuoso Server and check the
    Save Password check box.

    <div class="figure-float">

    <div id="insg11" class="figure">

    **Figure 2.82. Add Connection dialog**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add Connection dialog](images/ui/insg11.png)

    </div>

    </div>

    </div>

      

    </div>

12. Select the Select Database From List radio button and choose School
    from the drop down list of available databases.

    <div class="figure-float">

    <div id="insg12" class="figure">

    **Figure 2.83. Select Database From List**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Select Database From List](images/ui/insg12.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click the Test Connection button to verify the connection is
    successful and then click OK to add the connection.

    <div class="figure-float">

    <div id="insg13" class="figure">

    **Figure 2.84. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/insg13.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the Yes, include sensitive data in the connect string radio
    button and click Next to continue.

    <div class="figure-float">

    <div id="insg14" class="figure">

    **Figure 2.85. connect string**

    <div class="figure-contents">

    <div class="mediaobject">

    ![connect string](images/ui/insg14.png)

    </div>

    </div>

    </div>

      

    </div>

15. In the Choose your Database Objects dialog select the table and
    columns to be queried, the shippers table is used in this example.

    <div class="figure-float">

    <div id="insg15" class="figure">

    **Figure 2.86. Choose your Database Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Choose your Database Objects](images/ui/insg15.png)

    </div>

    </div>

    </div>

      

    </div>

16. A DataSet for the shippers database object is created

    <div class="figure-float">

    <div id="insg16" class="figure">

    **Figure 2.87. shippers database**

    <div class="figure-contents">

    <div class="mediaobject">

    ![shippers database](images/ui/insg16.png)

    </div>

    </div>

    </div>

      

    </div>

17. From the drop down list box next to the Shippers table ensure the
    DataGridView item is selected

    <div class="figure-float">

    <div id="insg17" class="figure">

    **Figure 2.88. DataGridView**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGridView](images/ui/insg17.png)

    </div>

    </div>

    </div>

      

    </div>

18. Drag the Shippers DataSet item onto the Form to create a scrollable
    and editable association of the Shippers table object with the Data
    Grid View automatically.

    <div class="figure-float">

    <div id="insg18" class="figure">

    **Figure 2.89. Drag**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Drag](images/ui/insg18.png)

    </div>

    </div>

    </div>

      

    </div>

19. From the Debug Menu select the Start Debugging menu item to run the
    application.

    <div class="figure-float">

    <div id="insg19" class="figure">

    **Figure 2.90. Debug**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Debug](images/ui/insg19.png)

    </div>

    </div>

    </div>

      

    </div>

20. The data in the Shippers table will be displayed in the DataGrid
    application created.

    <div class="figure-float">

    <div id="insg20" class="figure">

    **Figure 2.91. DataGrid**

    <div class="figure-contents">

    <div class="mediaobject">

    ![DataGrid](images/ui/insg20.png)

    </div>

    </div>

    </div>

      

    </div>

21. A new row can be inserted (updated or deleted) as indicated for the
    new DHL record inserted below and the save button clicked to save
    the change to the database.

    <div class="figure-float">

    <div id="insg21" class="figure">

    **Figure 2.92. new row**

    <div class="figure-contents">

    <div class="mediaobject">

    ![new row](images/ui/insg21.png)

    </div>

    </div>

    </div>

      

    </div>

22. The Virtuoso Interactive SQL tab of the Conductor can be used to run
    the query select \* from Demo..Shippers.

    <div class="figure-float">

    <div id="insg22" class="figure">

    **Figure 2.93. Interactive SQL tab**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Interactive SQL tab](images/ui/insg22.png)

    </div>

    </div>

    </div>

      

    </div>

23. To verify the change has been successfully made in the database.

    <div class="figure-float">

    <div id="insg23" class="figure">

    **Figure 2.94. verify**

    <div class="figure-contents">

    <div class="mediaobject">

    ![verify](images/ui/insg23.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>
