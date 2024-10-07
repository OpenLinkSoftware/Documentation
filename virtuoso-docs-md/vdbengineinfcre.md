<div id="vdbengineinfcre" class="section">

<div class="titlepage">

<div>

<div>

### 8.5.4. Creating EDM in Visual Studio 2008

</div>

</div>

</div>

The following steps can be used to create an Entity Data Model (EDM) for
the Informix stores_demo database:

<div class="orderedlist">

1.  Launch the Visual Studio 2008 SP1 IDE.

    <div class="figure-float">

    <div id="einf1" class="figure">

    **Figure 8.227. Visual Studio 2008 SP1 IDE**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="epro2_06" class="figure">

    **Figure 8.228. Web Application**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <span class="emphasis">*stores_demo*</span>

    , and click

    <span class="emphasis">*OK*</span>

    .

    <div class="figure-float">

    <div id="einf2" class="figure">

    **Figure 8.229. name for the project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![name for the project](images/ui/einf2.png)

    </div>

    </div>

    </div>

      

    </div>

6.  This will create a new project called

    <span class="emphasis">*stores_demo*</span>

    .

    <div class="figure-float">

    <div id="einf3" class="figure">

    **Figure 8.230. create a new project**

    <div class="figure-contents">

    <div class="mediaobject">

    ![create a new project](images/ui/einf3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select the Project -\> Add New Item menu option.

    <div class="figure-float">

    <div id="einf4" class="figure">

    **Figure 8.231. New Item**

    <div class="figure-contents">

    <div class="mediaobject">

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

    e and click

    <span class="emphasis">*Add*</span>

    to start the creation of the ADO.Net Entity Data Model.

    <div class="figure-float">

    <div id="einf5" class="figure">

    **Figure 8.232. Add New Item**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add New Item](images/ui/einf5.png)

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

    <div class="figure-float">

    <div id="eora6_03" class="figure">

    **Figure 8.233. Choose Model Contents**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="einf7" class="figure">

    **Figure 8.234. Entity Data Model Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="einf8" class="figure">

    **Figure 8.235. Choose Data Source**

    <div class="figure-contents">

    <div class="mediaobject">

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

    <div class="figure-float">

    <div id="einf9" class="figure">

    **Figure 8.236. Connection Properties**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Connection Properties](images/ui/dora10.png)

    </div>

    </div>

    </div>

      

    </div>

13. Select the

    <span class="emphasis">*Select Database From List*</span>

    radio button and choose the

    <span class="emphasis">*stores_demo*</span>

    database from the drop down list.

    <div class="figure-float">

    <div id="einf10" class="figure">

    **Figure 8.237. Add connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Add connection](images/ui/einf10.png)

    </div>

    </div>

    </div>

      

    </div>

14. Press the

    <span class="emphasis">*Test Connection*</span>

    dialog to verify that the database is accessible.

    <div class="figure-float">

    <div id="einf11" class="figure">

    **Figure 8.238. Test Connection**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Test Connection](images/ui/dora12.png)

    </div>

    </div>

    </div>

      

    </div>

15. Set the

    <span class="emphasis">*entity connect string*</span>

    name to

    <span class="emphasis">*stores_demoEntities* </span>

    (note this name as it is required in the section on creating and
    ADO.Net Data Service) and click

    <span class="emphasis">*Next*</span>

    .

    <div class="figure-float">

    <div id="einf12" class="figure">

    **Figure 8.239. entity connect string**

    <div class="figure-contents">

    <div class="mediaobject">

    ![entity connect string](images/ui/einf12.png)

    </div>

    </div>

    </div>

      

    </div>

16. In the

    <span class="emphasis">*Choose your Database Objects*</span>

    page tick the

    <span class="emphasis">*Tables*</span>

    check box to select all tables in the stores_demo catalog for
    addition to the Entity Data Model. Set the

    <span class="emphasis">*Model Namespace*</span>

    to

    <span class="emphasis">*stores_demoModel*</span>

    and click

    <span class="emphasis">*Finish*</span>

    .

    <div class="figure-float">

    <div id="einf13" class="figure">

    **Figure 8.240. Database Objects**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Database Objects](images/ui/einf13.png)

    </div>

    </div>

    </div>

      

    </div>

17. The

    <span class="emphasis">*Model1.edmx*</span>

    EDM will be created with the tables and relationships displayed in
    the Visual Studio IDE

    <div class="figure-float">

    <div id="einf14" class="figure">

    **Figure 8.241. Virtuoso.edmx**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Virtuoso.edmx](images/ui/einf14.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

Creation for the Entity Data Model for the Informix stores_demo database
is now complete.

</div>
