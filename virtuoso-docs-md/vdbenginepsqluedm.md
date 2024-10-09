<div>

<div>

<div>

<div>

### 8.9.5. Using EDM to create Entity Framework based applications

</div>

</div>

</div>

Now that a Microsoft Entity Data Model has been created for the
PostgreSQL database, Entity Framework applications can be created to
make use of it.

<div>

<div>

<div>

<div>

#### Visual Studio Windows DataGrid Form Application

</div>

</div>

</div>

This section details the steps required to create a simple Visual Studio
2008 Windows Form application, with associated DataGridView control for
displaying data in selected tables from the target database.

<div>

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div>

    <div>

    **Figure 8.473. Visual Studio 2008 SP1 IDE**

    <div>

    <div>

    ![Visual Studio 2008 SP1 IDE](images/ui/dora1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Create a

    <span class="emphasis">*Web Application*</span>

    project by going to the

    <span class="emphasis">*File*</span>

    menu in Visual Studio and choosing

    <span class="emphasis">*New Project*</span>

    .

    <div>

    <div>

    **Figure 8.474. Web Application**

    <div>

    <div>

    ![Web Application](images/ui/epro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  When the New Project window appears, choose either

    <span class="emphasis">*Visual Basic*</span>

    or

    <span class="emphasis">*Visual C#*</span>

    as your programming language.

4.  Within the language category, click on

    <span class="emphasis">*Windows*</span>

    and select

    <span class="emphasis">*Windows Form Application*</span>

    from the right-hand panel.

5.  Choose a name for the project, for example

    <span class="emphasis">*VirtWindowsFormApplication*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div>

    <div>

    **Figure 8.475. Web Application**

    <div>

    <div>

    ![Web Application](images/ui/dora2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  In the

    <span class="emphasis">*Toolbox*</span>

    , expand

    <span class="emphasis">*Data Controls*</span>

    , and drag the

    <span class="emphasis">*DataGridView*</span>

    control onto the form.

    <div>

    <div>

    **Figure 8.476. Toolbox**

    <div>

    <div>

    ![Toolbox](images/ui/dora3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click on the little

    <span class="emphasis">*arrow*</span>

    in the top right of the

    <span class="emphasis">*DataGridView*</span>

    control. This loads the

    <span class="emphasis">*DataGridView Task*</span>

    menu.

    <div>

    <div>

    **Figure 8.477. DataGridView Task**

    <div>

    <div>

    ![DataGridView Task](images/ui/dora4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click on the

    <span class="emphasis">*Choose Data Source*</span>

    list box.

    <div>

    <div>

    **Figure 8.478. Choose Data Source**

    <div>

    <div>

    ![Choose Data Source](images/ui/dora5.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click on the

    <span class="emphasis">*Add Project Data Source*</span>

    link to connect to a data source.

    <div>

    <div>

    **Figure 8.479. Add Project Data Source**

    <div>

    <div>

    ![Add Project Data Source](images/ui/dora6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the

    <span class="emphasis">*Data Source Configuration Wizard*</span>

    dialog

    <span class="emphasis">*Choose Data Source Type*</span>

    page select the

    <span class="emphasis">*Database*</span>

    data source type and click

    <span class="emphasis">*Next*</span>

    .

    <div>

    <div>

    **Figure 8.480. Data Source Type**

    <div>

    <div>

    ![Data Source Type](images/ui/dora7.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the

    <span class="emphasis">*Data Source Configuration Wizard*</span>

    dialog

    <span class="emphasis">*Choose your Data Connection*</span>

    page, select the

    <span class="emphasis">*New Connection*</span>

    button

    <div>

    <div>

    **Figure 8.481. Data Source Configuration Wizard**

    <div>

    <div>

    ![Data Source Configuration Wizard](images/ui/dora8.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the

    <span class="emphasis">*Choose Data Source*</span>

    dialog, select the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    from the list and click

    <span class="emphasis">*Continue*</span>

    .

    <div>

    <div>

    **Figure 8.482. Data Source**

    <div>

    <div>

    ![Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

13. In the

    <span class="emphasis">*Add Connection*</span>

    dialog, specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and check the Save Password check
    box.

    <div>

    <div>

    **Figure 8.483. Connection Properties**

    <div>

    <div>

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*Northwind*</span>

    database from the drop down list.

    <div>

    <div>

    **Figure 8.484. Add connection**

    <div>

    <div>

    ![Add connection](images/ui/psdora11.png)

    </div>

    </div>

    </div>

      

    </div>

15. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div>

    <div>

    **Figure 8.485. Test Connection**

    <div>

    <div>

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

16. Leave the default connect string

    <span class="emphasis">*NorthwindConnectionString*</span>

    and click

    <span class="emphasis">*Next*</span>

    <div>

    <div>

    **Figure 8.486. NorthwindConnectionString**

    <div>

    <div>

    ![NorthwindConnectionString](images/ui/psdora13.png)

    </div>

    </div>

    </div>

      

    </div>

17. From the list of available tables returned for the Northwind
    database, select the

    <span class="emphasis">*Shippers*</span>

    table to be associated with the

    <span class="emphasis">*DataGridView*</span>

    control.

    <div>

    <div>

    **Figure 8.487. Northwind database**

    <div>

    <div>

    ![Northwind database](images/ui/psdora14.png)

    </div>

    </div>

    </div>

      

    </div>

18. The columns names of the select table will be displayed in the
    DataGridView.

    <div>

    <div>

    **Figure 8.488. DataGridView**

    <div>

    <div>

    ![DataGridView](images/ui/psdora15.png)

    </div>

    </div>

    </div>

      

    </div>

19. Resize the Form and DataGridView to allow all columns to be visible,
    if possible.

    <div>

    <div>

    **Figure 8.489. Resize the Form and DataGridView**

    <div>

    <div>

    ![Resize the Form and DataGridView](images/ui/psdora16.png)

    </div>

    </div>

    </div>

      

    </div>

20. To test the application, simply hit

    <span class="emphasis">*Ctrl+F5*</span>

    within Visual Studio or select

    <span class="emphasis">*Start Debugging*</span>

    from the

    <span class="emphasis">*Debug*</span>

    menu.

    <div>

    <div>

    **Figure 8.490. Start Debugging**

    <div>

    <div>

    ![Start Debugging](images/ui/dora17.png)

    </div>

    </div>

    </div>

      

    </div>

21. The data from the

    <span class="emphasis">*Shippers*</span>

    table will be displayed in the

    <span class="emphasis">*DataGrid*</span>

    .

    <div>

    <div>

    **Figure 8.491. DataGrid**

    <div>

    <div>

    ![DataGrid](images/ui/psdora18.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

The task is now complete.

</div>

</div>
