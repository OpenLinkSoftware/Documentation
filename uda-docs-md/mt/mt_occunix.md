<div id="mt_occunix" class="section">

<div class="titlepage">

<div>

<div>

## 3.4. Generic Client for UNIX

</div>

</div>

</div>

ODBC Driver Manager exists in various forms under UNIX, but the
definitive Driver Manager for UNIX is known as the "iODBC Driver
Manager". Additional information regarding iODBC can be obtained from:
<a href="http://www.iodbc.org/" class="ulink"
target="_top">www.iodbc.org</a>.

The OpenLink ODBC Client Components for UNIX comprise the following :

<div class="itemizedlist">

- iODBC Driver Manager - A shared library that links ODBC applications
  to ODBC Drivers

- Generic ODBC Driver - A shared library (the file "oplodbc.so" or
  "oplodbc.sl") that provides database connectivity and data access
  services to ODBC-based clients (these can be applications written and
  compiled using the iODBC SDK)

- Sample ODBC Application - A simple program that can be used to verify
  your ODBC installation and working environment.

</div>

<div id="mt_uocintro" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.1. Installation

</div>

</div>

</div>

The OpenLink ODBC Client Components for UNIX are contained within a
compressed TAR archive file in the format "XXoczzzz.taz", where the "XX"
represents a two-letter platform-specific code.

In addition, the optional ODBC Data Source Administrator and JDBC
Samples are contained in an archive of format "XXl5adzz.taz"
(availability varies by platform).

Note: The ODBC Data Source Administrator offered for configuring the
Client Component is a stripped down version of the OpenLink Admin
Assistant used for configuring the server components.

These files are automatically presented to you via the OpenLink Software
Download wizard when you enter UNIX as your client operating system.

The steps that follow describe the installation process:

<div class="orderedlist">

1.  Move the "install.sh" and all downloaded \*.taz" files to an
    installation directory of your choice

2.  Type in one of the following commands to extract the contents of the
    compressed TAR archive files:

    ``` programlisting
    sh install.sh
    ```

    or

    ``` programlisting
    install.sh
    ```

    or

    ``` programlisting
    ./install.sh
    ```

3.  Setup your operating environment by executing the command:

    ``` programlisting
    . openlink.sh
    ```

    you can also place the following entry in your ".profile" file:

    ``` programlisting
    . openlink.sh
    ```

4.  Proceed to the configuration stage of this process.

</div>

<span id="mt_clientcompinstalloccunixsetodbc"></span>
<span id="mt_setodbc"></span> <span id="mt_unixsetodbc"></span>

</div>

<div id="mt_unixconfiguration" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.2. Configuration

</div>

</div>

</div>

The main configuration activity involves setting up logical references
to the actual backend database engines that you wish to access via your
UNIX based ODBC Driver. These local references are called Universal Data
Source Names (UDSNs) and they are responsible for linking ODBC clients
with actual OpenLink Data Access Drivers.

The OpenLink Admin Assistant is a Server Based HTML utility that enables
you to manage UDSNs via your Web Browser. This utility provides wizards
and a forms based user interface for performing it's tasks.

During the installation for Unix, the install.sh script will generate a
file called bin/iodbc-admin-httpd.sh. This is a shell script used to
start and stop the HTTP based iODBC Administrator. The usage is as
follows:

``` programlisting
$ sh iodbc-admin-httpd.sh start  # Starts the HTTP based iODBC Administrator
$ sh iodbc-admin-httpd.sh stop   # Tries to stop the HTTP based iODBC Administrator
$ sh iodbc-admin-httpd.sh status # Shows if the program is running
```

In the sections that follow, a step by guide and illustrative screen
shots are used to demonstrate both approaches to setting up ODBC DSNs.

In the examples below lets presume that we are trying to create a UNIX
based ODBC DSN on our machine called "opllinux" that will connect us to
a Microsoft SQL Database on a Windows 95/98/NT Server. The critical
database connection and network information for this setup (aka
connection attributes) are as follows:

Network Alias of a Windows 95/98/NT/2000 Server machine (typically your
application server) running OpenLink Server Components: "ntappserver"

Network Alias of a Windows 95/98/NT/2000 Server machine running
Microsoft SQL Server: "pluto"

Microsoft SQL Server Database Name: "pubs"

<div id="mt_WizardBasedDSNs" class="section">

<div class="titlepage">

<div>

<div>

#### Wizard Based Data Source Management

</div>

</div>

</div>

<div class="orderedlist">

1.  Start up the web-based Admin Assistant available for use, if not
    already started:

    ``` programlisting
    bash$ sh iodbc-admin-httpd.sh start 
    ```

2.  Open up your Internet Browser and then enter the following URL:
    http://localhost:8000/ (note the OpenLink Web Assistant listens at
    port 8000 by default, this value is set at installation time).

3.  Expand the menu by clicking on the "Client Components
    Administration", then "Data Source Name Configuration", and "Edit
    Data Sources by Wizard".

    <div class="figure-float">

    <div id="mt_image16" class="figure">

    **Figure 3.100. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image16.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  Click on the "Edit ODBC Data Sources" hyperlink, this takes you into
    the actual ODBC Data Source configuration wizard.

    <div class="figure-float">

    <div id="mt_dsn01" class="figure">

    **Figure 3.101. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/dsn01.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the "Add" button to commence the process of creating a new
    ODBC DSN, the wizard presents you with a list of ODBC Drivers
    installed on your system, select the driver identified as "OpenLink
    Generic ODBC Driver" and then click on the "Create DSN" button.

    <div class="figure-float">

    <div id="mt_image17" class="figure">

    **Figure 3.102. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/image17.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Enter values into the "Name", "Description" and "Server" fields as
    follows:

    **Name. ** Enter values that uniquely identify the DSN being
    created, our example uses the name "SQL Server on NT" to indicate
    that this DSN will be connecting you to a SQL Server database on an
    NT server.

    **Description. ** Enter values that provide additional information
    that helps in describing the purpose of the DSN that you are
    creating.

    **Server. ** Enter the hostname or IP address that identifies a
    Server Machine running OpenLink Server Components, that speak the
    OpenLink Data Access Protocol. Follow this with a semicolon and a
    TCPIP Port number of the Broker to contact if the default of 5000 is
    not used. This field corresponds to the Listen parameter on the
    target Broker.

    Once completed click on the "Next" button.

    <div class="figure-float">

    <div id="mt_image18" class="figure">

    **Figure 3.103. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/image18.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  Now select the database and configuration details:

    ##### Domain

    This is how you pick the Database Engine Type that your ODBC DSN is
    to be associated with e.g. Informix 7, Oracle 7, Progress 7 etc.

    The default offered from the Zero Configuration is typically
    accepted. An alternative compatable Domain may be chosen for a
    specific customisation.

    ##### Database

    This is how an actual database name within the Provider Type Domain
    is identified, for instance "stores7" indicates an "Informix 7"
    database called "stores7". This option corresponds to the Database
    parameter in the preference files.

    In this case our example uses the database "pubs"

    **Connection Options. ** This is where you place any database
    specific database connection options. This field in a majority of
    cases should be left blank by default. In this case enter valid SQL
    Server database server connection values (where "-s pluto" represent
    an actual SQL Server instance currently available on your network).

    ##### Connect now..

    When this tick box is checked, a test connection is made to verify
    the Data Source connection.

    If there is no check then the Login ID and Password fields are
    ignored, and no test is performed.

    **Login ID. ** The default database UserID to use when logging on to
    a remote database engine (identified by the Domain above).

    **Password. ** The Password for the login of the above UserID.

    <div class="figure-float">

    <div id="mt_image19" class="figure">

    **Figure 3.104. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/image19.gif)

    </div>

    </div>

    </div>

      

    </div>

    Click on the "Next" button.

8.  Now define additonal connection parameters:

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

    <div id="mt_image20" class="figure">

    **Figure 3.105. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/image20.gif)

    </div>

    </div>

    </div>

      

    </div>

9.  The list of parameters for the DSN are now shown. The Test Data
    Source button will trigger a test of the DSN using the existing
    login parameters.

    <div class="figure-float">

    <div id="mt_image21" class="figure">

    **Figure 3.106. Data Source Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Wizard](images/image21.gif)

    </div>

    </div>

    </div>

      

    </div>

10. You have now completed entering all the values that make up your new
    ODBC DSN, these values are collectively known as your ODBC DSN
    Attributes. Click on the "Finish" button in order to store these
    values permanently on your hard disk.

11. Click on the "exit" button to exit the ODBC DSN configuration wizard

</div>

</div>

<div id="mt_FormBasedDSNs" class="section">

<div class="titlepage">

<div>

<div>

#### Form Based Data Source Management

</div>

</div>

</div>

The OpenLink Admin assistant also allows the more experience OpenLink
ODBC user to manage ODBC DSNs via a forms based interface. Like the
wizard based approach this is done entirely from within your browser. In
the sections that follow, a step by guide and illustrative screen shots
are used to demonstrate the process of creating the same ODBC DSN
created in the prior section using the Wizard approach.

<div class="orderedlist">

1.  Start up the web-based Admin Assistant available for use, if not
    already started:

    ``` programlisting
    bash$ sh iodbc-admin-httpd.sh start 
    ```

2.  Enter the following URL into your Web Browser (if the Admin
    Assistant isn't already initialized): http://localhost:8000 You will
    be presented with a screen similar to the one below. Notice that the
    "Client Component Administration", "Data Source Names Configuration"
    and "Edit Data Sources By Form" hyperlinks have been expanded.

    Click on the "Edit ODBC Data Sources" hyperlink to commence the
    process of creating a new ODBC DSN.

    <div class="figure-float">

    <div id="mt_image25" class="figure">

    **Figure 3.107. Data Source Forms**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Forms](images/image25.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  On the right side of the Admin Assistant pane is your start page for
    configuring ODBC DSNs using the Forms approach. This page presents
    to you a list of currently configured ODBC DSNs on the machine.
    Click the "Add" hyperlink in the Action Column

    <div class="figure-float">

    <div id="mt_image26" class="figure">

    **Figure 3.108. Data Source Forms**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Forms](images/image26.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  You are now presented with a table listing that comprises ODBC
    Drivers installed on your system, move on to the row that identifies
    the ODBC Driver that you will be creating your DSN for, then click
    on the "New" hyperlink.

    <div class="figure-float">

    <div id="mt_image27" class="figure">

    **Figure 3.109. Data Source Forms**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Forms](images/image27.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Enter values into the fields presented on the ODBC DSN form as
    follows:

    **Name. ** enter values that uniquely identify the DSN being
    created, our example uses the name "SQL Server on NT" to indicate
    that this DSN will be connecting you to a SQL Server database on an
    NT server.

    **Comment. ** enter values that provide additional information that
    helps in describing the purpose of the DSN that you are creating.

    **UserName. ** enter a valid username for the database that you are
    connecting to, you can leave this blank and be prompted for values
    at actual database connect time.

    **Database Name. ** enter the name of an actual SQL Server database,
    in this case our example uses the database "pubs"

    **Read-only connection. ** check this box if you require a read only
    session.

    **No Login Dialog Box. ** check this box if you do not to be
    prompted by your ODBC Driver for username and password dialog box at
    connect time.

    **Defer fetching of long data. ** Check this box to defer the
    fetching of long data. See the Release Notes section for more
    details.

    **Database Server. ** enter database server connection values for
    the database that your are connecting to, in this case enter valid
    SQL Server database server connection values (where "-s pluto"
    represent an actual SQL Server instance currently available on your
    network).

    **Server Type. ** enter a value that identifies the type of OpenLink
    Agent that will serve your ODBC client.

    **Protocol. ** Chose the type of network connection to be used from
    TCP/IP, SPX/IPX and DECnet. Note some operating systems do not
    support all the choices. In most cases uses TCP/IP.

    **Hostname. ** enter a value that identifies the server machine
    running your OpenLink Server Components.

    **Port. ** Enter the TCP port number of the Broker to contact. This
    corresponds to the Listen parameter on the target Broker.

    **Row Buffer Size. ** enter a value that represents the number of
    records that you would like your ODBC driver to retrieve during each
    network hop. A network hop represents the number of times your
    OpenLink ODBC send a message across the network to retrieve records
    from your remote database server. The feature can be used to improve
    ODBC record retrieval performance.

    Note: The screen shot below is a snapshot of the ODBC DSN for, click
    on the right-hand scroll bar to see all the fields described above.

    <div class="figure-float">

    <div id="mt_image28" class="figure">

    **Figure 3.110. Data Source Forms**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Data Source Forms](images/image28.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Click on the "Add" button at the foot of the page to complete the
    creation of your new ODBC DSN.

7.  The DSN may then be tested, or you can return to the DSN list.

</div>

</div>

<div id="mt_ODBCDriverSettings" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Driver Session Settings

</div>

</div>

</div>

A number of configuration session parameters are available to
adminstrators of OpenLink ODBC Drivers, these parameters can be managed
via the Web Browser based Admin Assistant or by manually editing the
file "udbc.ini" situated in the "bin" sub-directory of your OpenLink
installation directory. These parameter enable you tailor the behaviour
of your ODBC Drivers for UNIX in line with the requirements of your ODBC
based solutions and any general infrastructural requirements that you
may have.

The list of configurable session parameters and their descriptions are
as follows:

<div id="id2895" class="table">

**Table 3.4. **

<div class="table-contents">

| Parameter      |
|----------------|
| BrokerTimeout  |
| ReceiveTimeout |
| RetryTimeout   |
| SendSize       |
| ReceiveSize    |
| DebugFile      |

</div>

</div>

  

</div>

</div>

<div id="mt_Sample_App" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.3. Sample Application

</div>

</div>

</div>

OpenLink also provides a sample ODBC based dynamic SQL application that
enables you verify usability of your ODBC installation. The sample
application is situated within the "samples" sub-directory below your
OpenLink installation directory. The ODBC sample application is called
"odbctest".

The following steps guide you through the process of successfully
utilising this sample application. This exercise presumes that we are
connecting to a DSN called "SQL Server on NT", which connects us to a
remote SQL Server Database hosted on a machine called "pluto" via the
OpenLink Server components on an Windows 95/98/NT/2000 application
server called "ntappserver".

<div class="orderedlist">

1.  Ensure that your OpenLink Request Broker is up and running on the
    machine "ntappserver" (you can quickly confirm this by opening up
    your browser and entering the following URL: http://ntappserver:8000
    )

2.  At your UNIX command prompt type in the following command:

    ``` programlisting
    odbctest
    ```

3.  Enter a full or partial ODBC connect string at the ODBC applications
    command prompt, some examples are listed below:

    <div class="itemizedlist">

    - for a list of DSNs on your system enter "?"

    - to connect to the DSN called "SQL Server on NT" type (this is a
      partial connect string): DSN=SQL Server On NT

    - to enter a username and a blank password combination along with
      the DSN type (this is a partial connect string only because we
      have a seperate server hosting the OpenLink Server and Microsoft
      SQL Server components): DSN=SQL Server on NT;UID=sa;PWD=

    - to enter a directive that instructs the OpenLink Server components
      to connect to the remote SQL Server hosted on the machine called
      "pluto", type the following (this is a full connect string for
      this particular scenario): DSN=SQL Server on
      NT;UID=sa;PWD=;OPTIONS=-s pluto

    </div>

4.  If the previous step is successful you are now ready to execute SQL
    interactively against your remote database, to do this enter the
    following SQL command:

    ``` programlisting
    select * from authors
    ```

5.  To quit this application type in "exit" at the SQL command line
    prompt.

</div>

<span id="mt_SettingUpUDSNs"></span>

</div>

<div id="mt_clientcompinstallClient_Comp_Installucconf" class="section">

<div class="titlepage">

<div>

<div>

### 3.4.4. UDBC Data Source Configuration

</div>

</div>

</div>

UDBC shares its API with ODBC, and is provided for platforms that do not
have a suitable ODBC driver manager - it is for legacy unix systems
which did not support dynamic library functions. As such, it is
deprecated, and documented here only for completeness.

UDBC, like ODBC, is based on the notion of logical references to
database backends through the use of Data Source Names. Under UDBC,
these are described as Universal Data Source Names (UDSNs) due to the
cross data access standard nature of these Data Source Names (they are
usable by OpenLink Drivers for ODBC and JDBC).

The OpenLink Universal Data Access Driver Suite includes an HTTP based
utility called the OpenLink Admin Assistant that enables you create,
configure, and manage UDSNs via a Web Browser. Since this is HTTP based,
you can even do this remotely, security measures exist avoid unwanted
tampering. The Admin Assistant provides a wizards and HTML forms based
user interfaces.

You identify your UDSN file to UDBC Drivers via the Environment Variable
"UDBCINI". Your OpenLink UDBC SDK installation process will place a
sample of this file in the 'doc' installation subdirectory. The OpenLink
shell script ("openlink.sh") will look for the runtime copy of this file
in the 'bin' directory of your installation, and export it to the
\$UDBCINI environment variable. Manually, the UDBCINI environment
variable is set using the command:

``` programlisting
UDBCINI=/usr/openlink/bin/udbc.ini ; export UDBCINI
```

The above presumes that your OpenLink installation's base directory is:
/usr/openlink. Use an appropriate directory in its place.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>The UDBC Client
Components SDK chapter.</p>
<p>Configuring UDBC data sources using: Wizards Based Assistant or Forms
Based Assistant</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
