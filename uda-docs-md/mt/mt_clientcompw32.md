<div id="mt_clientcompw32" class="section">

<div class="titlepage">

<div>

<div>

## 3.1. Generic Client for Windows

</div>

</div>

</div>

<span id="mt_clientcompinstallclientcompw32cci"></span>

<div id="mt_cci" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.1. Installation (32-bit)

</div>

</div>

</div>

<div class="orderedlist">

1.  After downloading the OpenLink Data Access Driver Suite client
    components from our Website, Unzip the contents of the ZIP format
    archive into a temporary installation directory on your client
    machine.

2.  Run the setup.exe installer program from the temporary installation
    directory and then follow the on screen prompts.

3.  After installation you will be able to safely remove the files in
    the temporary directory.

</div>

</div>

<div id="mt64bitinstsect" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.2. Installation (64-bit)

</div>

</div>

</div>

The OpenLink Multi-Tier Generic ODBC client is distributed in a single
windows msi file. Simply run the required installer wao3zzzz.msi or
wio3zzzz.msi for Opteron (AMD64) and Itanium (IA64) respectively, which
will display the following Welcome message:

<div class="figure-float">

<div id="mt_win64instmt1" class="figure">

**Figure 3.1. win64instmt1.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt1.gif](images/win64instmt1.gif)

</div>

</div>

</div>

  

</div>

The next screen will display the License Agreement for use with the
OpenLink Multi-Tier Driver product. Please read this. If you agree, then
select the accept checkbox and continue:

<div class="figure-float">

<div id="mt_win64instmt2" class="figure">

**Figure 3.2. win64instmt2.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt2.gif](images/win64instmt2.gif)

</div>

</div>

</div>

  

</div>

Chooses the type of installation to perform, noting that typical and
complete will immediately install the default or complete components
respectively, otherwise select the custom option which also the
compenents to be installed to be chosen:

<div class="figure-float">

<div id="mt_win64instmt3" class="figure">

**Figure 3.3. win64instmt3.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt3.gif](images/win64instmt3.gif)

</div>

</div>

</div>

  

</div>

Assuming you chosen the custom installation option you will then be
promptied with the option to change the installation directory if
required:

<div class="figure-float">

<div id="mt_win64instmt4" class="figure">

**Figure 3.4. win64instmt4.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt4.gif](images/win64instmt4.gif)

</div>

</div>

</div>

  

</div>

Next you have presented with the option to choose which components are
to be installed:

<div class="figure-float">

<div id="mt_win64instmt5" class="figure">

**Figure 3.5. win64instmt5.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt5.gif](images/win64instmt5.gif)

</div>

</div>

</div>

  

</div>

A final confirmation screen is displayed for review prior to performing
the installation:

<div class="figure-float">

<div id="mt_win64instmt6" class="figure">

**Figure 3.6. win64instmt6.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt6.gif](images/win64instmt6.gif)

</div>

</div>

</div>

  

</div>

The installer status bar is then displayed indicating the progress and
status of the the installation:

<div class="figure-float">

<div id="mt_win64instmt7" class="figure">

**Figure 3.7. win64instmt7.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt7.gif](images/win64instmt7.gif)

</div>

</div>

</div>

  

</div>

If the installation is successful a final dialog with be displayed
indicating this:

<div class="figure-float">

<div id="mt_win64instmt8" class="figure">

**Figure 3.8. win64instmt8.gif**

<div class="figure-contents">

<div class="mediaobject">

![win64instmt8.gif](images/win64instmt8.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_dsnconfigw" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.3. Data Source Configuration

</div>

</div>

</div>

Once you have completed the installation process, proceed to create a
new ODBC Data Source Name (DSN) using the ODBC Driver Manager.

The ODBC Driver Manager is in the Windows Control panel. Windows 2000
and Windows XP have it within Administrative tools. The figure below
depicts ODBC v3.5 Driver Manager displaying a list of installed ODBC
Drivers.

<div class="figure-float">

<div id="mt_odbccl2" class="figure">

**Figure 3.9. Data Source Configuration**

<div class="figure-contents">

<div class="mediaobject">

![Data Source Configuration](images/odbccl2.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_Confudsn" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.4. ODBC System & User Data Sources

</div>

</div>

</div>

ODBC Driver Manager can create User, System, and File DSNs. Here are the
steps for creating a User or System DSN:

<div class="orderedlist">

1.  Decide whether the DSN should be a USER DSN so that it is available
    for all users, or a USER DSN is required for access by the current
    user only.

    In the ODBC Driver Manager pick the SYSTEM or USER tab. In this
    example the SYSTEM tab is chosen, and the current System DSNs are
    shown:

    <div class="figure-float">

    <div id="mt_odbccl3" class="figure">

    **Figure 3.10. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/odbccl3.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Pick the ODBC Driver to be used to create your ODBC DSN, in the case
    of the OpenLink Universal Data Access Driver Suite 5.0, this would
    be the Driver identified below as "OpenLink Generic ODBC Driver".

    <div class="figure-float">

    <div id="mt_odbccl4" class="figure">

    **Figure 3.11. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/odbccl4.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  The ODBC Driver manager now launches the selected driver code so
    that the DSN may be configured. In this example it will present the
    OpenLink ODBC Data Source Configuration dialog (depicted below).

    <div class="figure-float">

    <div id="mt_dsn05" class="figure">

    **Figure 3.12. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn05.gif)

    </div>

    </div>

    </div>

      

    </div>

    Configure the fields of the ODBC "System" or "User" DSN
    Configuration dialog in the manner explained below:

    **Name. ** (Datasource) The name of the ODBC DSN, this is how you
    will interact with the OpenLink ODBC Driver from within ODBC
    compliant applications once your ODBC DSN has been created.

    **Description. ** Additional information that further describes the
    ODBC DSN that you are creating.

    **Server. ** Selected Zero Configuration service name or
    `<hostname or IP address>:<port>` of running Broker.

    The easiest way to complete this field is to select a machine from
    the drop-down list-box. This list of servers is automatically
    generated by the Zero Configuration service, so you only need to
    chose which machine you wish to reach.

    Alternatively, enter the hostname or IP address that identifies a
    Server Machine running OpenLink Server Components, that speak the
    OpenLink Data Access Protocol. Follow this with a colon and the
    TCP/IP Port number of the Broker to contact. This corresponds to the
    Listen parameter on the target Broker.

    This example shall now assume the selection of a server from a
    picklist.

    <div class="figure-float">

    <div id="mt_odbccl5" class="figure">

    **Figure 3.13. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/odbccl5.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  Now select the database and configuration details:

    #### Domain

    This is how you pick the Database Engine Type that your ODBC DSN is
    to be associated with e.g. Informix 7, Oracle 7, Progress 7 etc.

    The default offered from the Zero Configuration is typically
    accepted. An alternative compatable Domain may be chosen for a
    specific customisation.

    **Database. ** This is how an actual database name within the
    Provider Type Domain is identified, for instance "stores7" indicates
    an "Informix 7" database called "stores7". This option corresponds
    to the Database parameter in the preference files.

    **Connection Options. ** This is where you place any database
    specific database connection options. This field in a majority of
    cases should be left blank by default.

    #### Connect now..

    When this tick box is checked, a test connection is made to verify
    the Data Source connection.

    If there is no check then the Login ID and Password fields are
    ignored, and no test is performed.

    **Login ID. ** The default database UserID to use when logging on to
    a remote database engine (identified by the Domain above).

    **Password. ** The Password for the login of the above UserID.

    <div class="figure-float">

    <div id="mt_dsn06" class="figure">

    **Figure 3.14. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn06.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  When a test connection fails, the error message is now displayed:

    <div class="figure-float">

    <div id="mt_dsn07" class="figure">

    **Figure 3.15. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn07.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Now define additonal connection parameters:

    **Read-only connection. ** Specify whether the connection is to be
    "Read-only". Make sure the checkbox is unchecked to request a
    "Read/Write" connection.

    **Defer fetching of long data. ** Check this box to defer the
    fetching of long data.

    **Disable interactive login. ** Suppress the ODBC "Username" and
    "Password" login dialog box when interacting with your ODBC DSN from
    within an ODBC compliant application.

    **Row Buffer Size. ** This attribute specifies the number of records
    to be transported over the network in a single network hop. Values
    can range from 1 to 99.

    <div class="figure-float">

    <div id="mt_dsn08" class="figure">

    **Figure 3.16. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn08.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  The list of parameters for the DSN are now shown. The Test Data
    Source button will trigger a test of the DSN using the existing
    login parameters.

    <div class="figure-float">

    <div id="mt_dsn08b" class="figure">

    **Figure 3.17. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn08b.gif)

    </div>

    </div>

    </div>

      

    </div>

8.  If a test is requested, the results are shown:

    <div class="figure-float">

    <div id="mt_dsn08c" class="figure">

    **Figure 3.18. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn08c.gif)

    </div>

    </div>

    </div>

      

    </div>

    Press the Finish button to save the DSN.

9.  This completes the DSN configuration. It will be listed in the ODBC
    Driver Manager.

    <div class="figure-float">

    <div id="mt_dsn09" class="figure">

    **Figure 3.19. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn09.gif)

    </div>

    </div>

    </div>

      

    </div>

</div>

<div id="mt_manualdsn" class="section">

<div class="titlepage">

<div>

<div>

#### Manual Selection of Server

</div>

</div>

</div>

The previous example used a server that was picked from the list
constructed by the zero configuration. The server you wish to use might
not be in this list if it is not a local machine that can be discovered.
In this case it is necessary to complete the server field manually with
the host name or IP number, and the port number.

<div class="orderedlist">

1.  Complete the fields for Data Source Name and Description as before.
    In the server field, enter the TCPIP address and port of the server
    machine.

    <div class="figure-float">

    <div id="mt_dsn10" class="figure">

    **Figure 3.20. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn10.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  The connection parameter page will load without any fields
    completed.

    <div class="figure-float">

    <div id="mt_dsn11" class="figure">

    **Figure 3.21. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn11.gif)

    </div>

    </div>

    </div>

      

    </div>

    Complete the fields for database connection.

    <div class="figure-float">

    <div id="mt_dsn12" class="figure">

    **Figure 3.22. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn12.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Complete the fields for additional connection parameters.

    <div class="figure-float">

    <div id="mt_dsn13" class="figure">

    **Figure 3.23. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn13.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  This completes the DSN configuration. It will be listed in the ODBC
    Driver Manager.

</div>

</div>

</div>

<div id="mt_Creatfdsn" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.5. Creating a File Data Source

</div>

</div>

</div>

This format of ODBC DSN enables the creation of centralized ODBC DSNs on
a designated NT or Windows 95 Server machine, thereby reducing the
administrative overhead of ODBC DSN configuration for every single
machine within your infrastructure.

The steps for creating an ODBC File DSN are as follows:

<div class="orderedlist">

1.  Select the File DSN Tab from the ODBC Driver Manger. Press the Add
    button.

    <div class="figure-float">

    <div id="mt_filedsn01" class="figure">

    **Figure 3.24. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/filedsn01.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Pick the ODBC Driver to be used to create your ODBC DSN, in the case
    of the OpenLink Universal Data Access Driver Suite 5.0, this would
    be the Driver identified below as "OpenLink Generic ODBC Driver".

    <div class="figure-float">

    <div id="mt_odbccl4_01" class="figure">

    **Figure 3.25. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/odbccl4.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Enter a name that describes your File DSN (e.g. "Sales by Region" as
    depicted below) for future use when interacting with it from ODBC
    compliant application and environments. At present to get full
    compatability within the Admin Assistant, you must end your dsn name
    with the extension ".dsn". So for this example the DSN name would be
    "Sales by Region.dsn".

    <div class="figure-float">

    <div id="mt_odbccl6" class="figure">

    **Figure 3.26. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/odbccl6.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  Verify the displayed paramters are correct, and confirm by hitting
    Finish button.

    <div class="figure-float">

    <div id="mt_odbccl7" class="figure">

    **Figure 3.27. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/odbccl7.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter a Description and define the location of the server either by
    selection, or enter it manually.

    Note the name is not defined here as the filename defines the DSN.

    <div class="figure-float">

    <div id="mt_odbccl8" class="figure">

    **Figure 3.28. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/odbccl8.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Complete the fields of the ODBC File DSN. Enter Domain, Database,
    Server. See above for details of each.

    The File DSN must be verified immediately, so the Login ID and
    password are required. The Next button will be disabled until login
    details are provided.

    <div class="figure-float">

    <div id="mt_odbccl9" class="figure">

    **Figure 3.29. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/odbccl9.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  Complete the fields for additional connection parameters.

    <div class="figure-float">

    <div id="mt_dsn13_01" class="figure">

    **Figure 3.30. Data Source Configuration**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Configuration](images/dsn13.gif)

    </div>

    </div>

    </div>

      

    </div>

8.  This concludes the File DSN generation. The DSN will appear in the
    list under the File DSN Tab of the ODBC Driver Manger.

    <div class="figure-float">

    <div id="mt_filedsn04" class="figure">

    **Figure 3.31. File Data Sources**

    <div class="figure-contents">

    <div class="mediaobject">

    ![File Data Sources](images/filedsn04.gif)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="mt_Advanced_Settings" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.6. Advanced Settings

</div>

</div>

</div>

The settings in this section have default values which are recommended
in most situations.

If you run a complex query through the database it may take a long time
before any data is actually returned. In this situation you may need to
increase the ReceiveTimeout value, described below, only to cater for
it. 2 Minutes (default) is usually more than adequate.

#### 32bit Client Advanced Settings.

Client global configuration information is contained in the sub section
OPENLINK.INI of the registry. Windows 32bit platforms use the registry
to store all configuration information. To edit or view to registry, run
the regedit program. To view the OpenLink settings expand the following
section:

``` screen
HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\OPENLINK.INI
```

Important values that you may need to change are listed in the table
below. The default values are recommended in most cases:

<div id="id1876" class="table">

**Table 3.1. **

<div class="table-contents">

| Sub Section    |
|----------------|
| Communications |
|                |
|                |
|                |
| ServerTypes    |
|                |

</div>

</div>

  

</div>

</div>
