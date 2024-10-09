<div>

<div>

<div>

<div>

### 8.3.4. Creating EDM in Visual Studio 2008

</div>

</div>

</div>

The following steps can be used to create an Entity Data Model (EDM) for
the Progress isports database:

<div>

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div>

    <div>

    **Figure 8.80. Visual Studio 2008 SP1 IDE**

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

    **Figure 8.81. Web Application**

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

    <span class="emphasis">*Web*</span>

    and select

    <span class="emphasis">*ASP.NET Web Application*</span>

    from the right-hand panel.

5.  Choose a name for the project, for example

    <span class="emphasis">*isports*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div>

    <div>

    **Figure 8.82. Name for the project**

    <div>

    <div>

    ![Name for the project](images/ui/epro3.png)

    </div>

    </div>

    </div>

      

    </div>

6.  This will create a new project called

    <span class="emphasis">*isports*</span>

    .

    <div>

    <div>

    **Figure 8.83. create a new project**

    <div>

    <div>

    ![create a new project](images/ui/epro4.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select the Project -\> Add New Item menu option.

    <div>

    <div>

    **Figure 8.84. New Item**

    <div>

    <div>

    ![New Item](images/ui/einf4.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The

    <span class="emphasis">*Add New Item*</span>

    dialog will appear. Choose the

    <span class="emphasis">*ADO.NET Entity Data Model*</span>

    template. Give it the name

    <span class="emphasis">*Model1.edmx*</span>

    and click

    <span class="emphasis">*Add*</span>

    to start the creation of the ADO.Net Entity Data Model.

    <div>

    <div>

    **Figure 8.85. Add New Item**

    <div>

    <div>

    ![Add New Item](images/ui/epro6.png)

    </div>

    </div>

    </div>

      

    </div>

9.  In the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    dialog

    <span class="emphasis">*Choose Model Contents*</span>

    page select the

    <span class="emphasis">*Generate from Database*</span>

    model type and click

    <span class="emphasis">*Next*</span>

    .

    <div>

    <div>

    **Figure 8.86. Choose Model Contents**

    <div>

    <div>

    ![Choose Model Contents](images/ui/eora6.png)

    </div>

    </div>

    </div>

      

    </div>

10. In the

    <span class="emphasis">*Entity Data Model Wizard*</span>

    dialog

    <span class="emphasis">*Choose your Data Connection*</span>

    page, select the

    <span class="emphasis">*New Connection button*</span>

    <div>

    <div>

    **Figure 8.87. Entity Data Model Wizard**

    <div>

    <div>

    ![Entity Data Model Wizard](images/ui/dora8.png)

    </div>

    </div>

    </div>

      

    </div>

11. In the

    <span class="emphasis">*Choose Data Source*</span>

    dialog, select the OpenLink

    <span class="emphasis">*Virtuoso Data Source*</span>

    from the list and click

    <span class="emphasis">*Continue*</span>

    .

    <div>

    <div>

    **Figure 8.88. Choose Data Source**

    <div>

    <div>

    ![Choose Data Source](images/ui/dora9.png)

    </div>

    </div>

    </div>

      

    </div>

12. In the

    <span class="emphasis">*Add Connection*</span>

    dialog, specify the

    <span class="emphasis">*hostname, portno, username and
    password*</span>

    for the target Virtuoso Server and check the Save Password check
    box.

    <div>

    <div>

    **Figure 8.89. Connection Properties**

    <div>

    <div>

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

13. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*isports*</span>

    database from the drop down list.

    <div>

    <div>

    **Figure 8.90. Add connection**

    <div>

    <div>

    ![Add connection](images/ui/epro11.png)

    </div>

    </div>

    </div>

      

    </div>

14. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div>

    <div>

    **Figure 8.91. Test Connection**

    <div>

    <div>

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

15. Set the

    <span class="emphasis">*entity connect string*</span>

    name to

    <span class="emphasis">*isportsEntities*</span>

    (note this name as it is required in the section on creating and
    ADO.Net Data Service) and click

    <span class="emphasis">*Next*</span>

    .

    <div>

    <div>

    **Figure 8.92. entity connect string**

    <div>

    <div>

    ![entity connect string](images/ui/epro13.png)

    </div>

    </div>

    </div>

      

    </div>

16. In the

    <span class="emphasis">*Choose your Database Objects*</span>

    page select the

    <span class="emphasis">*Tables*</span>

    check box to select all tables in the isports catalog for addition
    to the Entity Data Model. Set the

    <span class="emphasis">*Model Namespace*</span>

    to

    <span class="emphasis">*isportsModel*</span>

    and click

    <span class="emphasis">*Finish*</span>

    .

    <div>

    <div>

    **Figure 8.93. Database Objects**

    <div>

    <div>

    ![Database Objects](images/ui/epro14.png)

    </div>

    </div>

    </div>

      

    </div>

17. The

    <span class="emphasis">*Model1.edmx*</span>

    EDM will be created with the tables and relationships displayed in
    the Visual Studio IDE.

    <div>

    <div>

    **Figure 8.94. Virtuoso.edmx**

    <div>

    <div>

    ![Virtuoso.edmx](images/ui/epro15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

Creation for the Entity Data Model for the Progress isports database is
now complete.

</div>
