<div id="mt_macinstall" class="section">

<div class="titlepage">

<div>

<div>

## 3.2. Generic Client For Macintosh OS 8.6+

</div>

</div>

</div>

There are several ODBC Driver Managers distributed for the Classic
Macintosh OS. OpenLink Software distributes iODBC, an Open Source,
Cross-Platform, LGPL and BSDI licensed, ODBC 3.5-compliant Driver
Manager maintained by OpenLink. Additional information regarding iODBC
can be obtained from <a href="http://www.iodbc.org/" class="ulink"
target="_top">http://www.iodbc.org</a>.

The iODBC Driver Manager requires Mac OS 9 or later; the OpenLink
Generic Client Driver for ODBC may be used on System 7 through Mac OS 9,
with any ODBC 2.x- or 3.x-compliant Driver Manager.

The OpenLink ODBC Client Components for Macintosh Classic comprise the
following:

<div id="id1933" class="table">

**Table 3.2. **

<div class="table-contents">

| Component                |
|--------------------------|
| iODBC Driver Manager     |
| Generic ODBC Driver      |
| Sample ODBC Applications |

</div>

</div>

  

<div id="mt_maccci" class="section">

<div class="titlepage">

<div>

<div>

### 3.2.1. Installation

</div>

</div>

</div>

After downloading the OpenLink Data Access Driver Suite client
components from our Website, uncompress the contents of the Stuffit
format archive into a temporary location on your client machine. The
Desktop is often best.

<div class="figure-float">

<div id="mt_MacOSClass01jpg" class="figure">

**Figure 3.32. MacOSClass01.jpg**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass01.jpg](images/MacOSClass01.jpg)

</div>

</div>

</div>

  

</div>

Double click the 'OpenLink MacOS ODBC Client 5.0' icon to launch the
installer. Click OK at the splash screen.

<div class="figure-float">

<div id="mt_MacOSClass02gif" class="figure">

**Figure 3.33. MacOSClass02.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass02.gif](images/MacOSClass02.gif)

</div>

</div>

</div>

  

</div>

Check the contents of the 'Read Me'. Then click Continue.

<div class="figure-float">

<div id="mt_MacOSClass03gif" class="figure">

**Figure 3.34. MacOSClass03.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass03.gif](images/MacOSClass03.gif)

</div>

</div>

</div>

  

</div>

Read and Agree to the Software License.

<div class="figure-float">

<div id="mt_MacOSClass04gif" class="figure">

**Figure 3.35. MacOSClass04.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass04.gif](images/MacOSClass04.gif)

</div>

</div>

</div>

  

</div>

There are two types of installation. The Easy Install option is best for
most users, and will install the iODBC Driver Manager, if no other
Driver Manager is present.

<div class="figure-float">

<div id="mt_MacOSClass05gif" class="figure">

**Figure 3.36. MacOSClass05.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass05.gif](images/MacOSClass05.gif)

</div>

</div>

</div>

  

</div>

If you need to replace an older Driver Manager (Merant, Visigenic,
Intersolv), select the Custom Install, and check off all appropriate
components. The iODBC Driver Manager will only run on PowerPC machines,
under Mac OS 9 or later. If you're installing on an older Mac, running
Mac OS 8.1 or earlier, you can use Custom Install to get the 68K
components you'll need.

<div class="figure-float">

<div id="mt_MacOSClass06gif" class="figure">

**Figure 3.37. MacOSClass06.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass06.gif](images/MacOSClass06.gif)

</div>

</div>

</div>

  

</div>

Press the Install button to start the installation. You will be prompted
to select a location for Sample Applications and other files.

<div class="figure-float">

<div id="mt_MacOSClass07gif" class="figure">

**Figure 3.38. MacOSClass07.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass07.gif](images/MacOSClass07.gif)

</div>

</div>

</div>

  

</div>

You Macintosh will need to be restarted after installation has
completed. You will be given the opportunity to save any open documents.

<div class="figure-float">

<div id="mt_MacOSClass08gif" class="figure">

**Figure 3.39. MacOSClass08.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass08.gif](images/MacOSClass08.gif)

</div>

</div>

</div>

  

</div>

Installation will proceed.

<div class="figure-float">

<div id="mt_MacOSClass09gif" class="figure">

**Figure 3.40. MacOSClass09.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass09.gif](images/MacOSClass09.gif)

</div>

</div>

</div>

  

</div>

After installation you may safely delete the files in the temporary
location ('OpenLink MacOS ODBC Client 4.1', 'OplMacClient-4.1.sit',
mmoczzzz.hqx).

<div class="figure-float">

<div id="mt_MacOSClass10jpg" class="figure">

**Figure 3.41. MacOSClass10.jpg**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass10.jpg](images/MacOSClass10.jpg)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_macdsn" class="section">

<div class="titlepage">

<div>

<div>

### 3.2.2. Data Source Configuration

</div>

</div>

</div>

Once you have completed the installation process, proceed to create a
new ODBC DSN using the OpenLink ODBC Administrator (formerly ODBC Setup
PPC) control panel.

The OpenLink ODBC Administrator for Mac Classic currently supports the
creation of User and File DSNs.

If in Multiple Users mode, a User DSN is only available to the user who
creates the data source. Its parameters are stored in that user's
settings file: `Preferences/ODBC Preferences PPC`.

If in Single User mode, a User DSN is only available to the whole system
so that any user, including the system itself, will be able to use that
data source. Its parameters are stored in the System settings file:
`System Folder/Preferences/ODBC Preferences PPC`.

A File DSN is a special 'mobile' data source that stores the data source
information associated with the Driver in a file, which may then be
copied and shared among different users and ODBC application host
machines.

File DSNs are usually created when the same DSN needs to be used by many
different users, from many different workstations. File DSNs may be
passed from Macintosh to Macintosh, or User to User in Multiple Users
mode, and will be usable by anyone with the same ODBC Drivers installed.
By default, File DSNs are found in:
`System Folder/Preferences/ODBC File Data Sources.`

Most often, a User DSN will be appropriate for use on a Macintosh
running the Classic Mac OS.

<div id="mt_configusermacdsn" class="section">

<div class="titlepage">

<div>

<div>

#### User Data Source Names

</div>

</div>

</div>

To create a new User DSN, open the ODBC Setup PPC control panel. Hit the
Add button.

<div class="figure-float">

<div id="mt_MacOSClass11gif" class="figure">

**Figure 3.42. MacOSClass11.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass11.gif](images/MacOSClass11.gif)

</div>

</div>

</div>

  

</div>

Pick the ODBC Driver to be used to create your ODBC DSN, in the case of
the OpenLink Universal Data Access Driver Suite 5.0, this would be the
Driver identified below as "OpenLink Generic ODBC PPC".

<div class="figure-float">

<div id="mt_MacOSClass12gif" class="figure">

**Figure 3.43. MacOSClass12.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass12.gif](images/MacOSClass12.gif)

</div>

</div>

</div>

  

</div>

Once you have selected the "OpenLink Generic 32 Bit Driver v5.0", you
will be presented with the OpenLink ODBC Data Source Configuration
dialog (depicted below).

<div class="figure-float">

<div id="mt_MacOSClass13gif" class="figure">

**Figure 3.44. MacOSClass13.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass13.gif](images/MacOSClass13.gif)

</div>

</div>

</div>

  

</div>

The Datasource settings are only important to your Client machine; the
OpenLink Server, Database, and Optional Server settings should be
provided by your Database Administrator, or whoever is handling the
Server-side components of the OpenLink Universal Data Access Suite.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                      |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                |
|                              | The connections will not succeed until Server-side components are installed and properly configured. |

</div>

Explanations of each field follows:

**Datasource Name. ** The name of the ODBC DSN. This is how you will
interact with the OpenLink ODBC Driver from within ODBC compliant
applications once your ODBC DSN has been created.

**Comment. ** Additional information that further describes the ODBC DSN
that you are creating. This is generally visible whenever a list of DSNs
is generated. This option corresponds to the Description parameter in
the preference files.

**Domain. ** This is how you pick the Database Engine Type (also called
a DBMS, or DataBase Management System) that your ODBC DSN is to be
associated with, e.g. Informix 7, Oracle 9, Progress 8.3B, etc. This
option corresponds to the ServerType parameter in the preference files.

**Protocol. ** Select the network transport protocol used to connect
your ODBC DSN with a remote database engine. This will be TCP/IP in most
installations. This option corresponds to the Protocol parameter in the
preference files.

**Hostname. ** Enter the hostname or IP address that identifies a Server
Machine running OpenLink Server Components, that speak the OpenLink Data
Access Protocol. This option corresponds to the Host parameter in the
preference files.

**Port. ** Enter the TCP port number of the Broker to contact. This
corresponds to the Listen parameter on the target Broker. This option
corresponds to the Port parameter in the preference files.

**Database Name. ** This is how an actual database name within the
Provider Type Domain is identified, for instance "stores7" indicates an
"Informix 7" database called "stores7". This option corresponds to the
Database parameter in the preference files.

**Username. ** The default database UserID to be used when logging on to
a remote database engine (identified by the Provider Type above).
Generally left blank on shared machines. This option corresponds to the
User parameter in the preference files.

**Server Name. ** This is where you place any database specific database
connection options. This field in a majority of cases should be left
blank by default. Your Database Administrator (DBA) should give you any
special settings. This option corresponds to the Options parameter in
the preference files.

**Read-only connection. ** Forces the connection is to be "Read-only".
Make sure the checkbox is unchecked to request a "Read/Write"
connection. This option corresponds to the ReadOnly parameter in the
preference files.

**No Login Dialog Box. ** Suppress the ODBC "Username" and "Password"
login dialog box when interacting with your ODBC DSN from within an ODBC
compliant application. This should be unchecked if the database requires
this information. This option corresponds to the NoLoginBox parameter in
the preference files.

**Defer fetching of long data. ** Check this box to defer the fetching
of long data. See the Release Notes section for more details. This
option corresponds to the DeferLongFetch parameter in the preference
files.

**Row Buffer Size. ** This attribute specifies the number of records to
be transported over the network in a single network hop. Values can
range from 1 to 999. Smaller values are generally appropriate when each
row contains large records; larger values are generally appropriate for
smaller record sizes. Adjusting this value up and down can improve or
degrade performance substantially, both for your own connection and for
other users of the same Database, so check with your DBA before changing
it from the default (30). This option corresponds to the FetchBufferSize
parameter in the preference files.

Click OK, and you'll see your new DSN in the list.

<div class="figure-float">

<div id="mt_MacOSClass14gif" class="figure">

**Figure 3.45. MacOSClass14.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass14.gif](images/MacOSClass14.gif)

</div>

</div>

</div>

  

</div>

Now, to verify that your settings are correct and all is functional,
select the new DSN, and click Test. You'll be presented with the
following dialog.

<div class="figure-float">

<div id="mt_MacOSClass15gif" class="figure">

**Figure 3.46. MacOSClass15.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass15.gif](images/MacOSClass15.gif)

</div>

</div>

</div>

  

</div>

Input the correct password for the username shown. You can connect as
another user, if you wish, by simply typing a different username in the
field. To verify that your settings have all "stuck", you can click the
Database tab:

<div class="figure-float">

<div id="mt_MacOSClass16gif" class="figure">

**Figure 3.47. MacOSClass16.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass16.gif](images/MacOSClass16.gif)

</div>

</div>

</div>

  

</div>

The "About" tab shows you basic information about the Driver on which
the DSN is based.

<div class="figure-float">

<div id="mt_MacOSClass17gif" class="figure">

**Figure 3.48. MacOSClass17.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass17.gif](images/MacOSClass17.gif)

</div>

</div>

</div>

  

</div>

When you click OK, your Mac will think for a moment, while it makes a
connection to the remote Data Source. If all is well, you will be
presented with this Success message:

<div class="figure-float">

<div id="mt_MacOSClass18gif" class="figure">

**Figure 3.49. MacOSClass18.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass18.gif](images/MacOSClass18.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_configfilemacdsn" class="section">

<div class="titlepage">

<div>

<div>

#### Configuring File Data Sources

</div>

</div>

</div>

To create a new File DSN, open the ODBC Setup PPC control panel. Click
on the File DSN tab, and follow the steps below:

Click the Add button.

<div class="figure-float">

<div id="mt_MacOSClass19gif" class="figure">

**Figure 3.50. MacOSClass19.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass19.gif](images/MacOSClass19.gif)

</div>

</div>

</div>

  

</div>

Pick the ODBC Driver to be used to create your ODBC DSN. As with the
User DSN, this would be the Driver identified below as "OpenLink Generic
ODBC PPC". Input a name for the File DSN, and any description. Click
"Finish" or "OK".

<div class="figure-float">

<div id="mt_MacOSClass20gif" class="figure">

**Figure 3.51. MacOSClass20.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass20.gif](images/MacOSClass20.gif)

</div>

</div>

</div>

  

</div>

File DSNs are configured through the login screens, as if you were
connecting through a User DSN. Starting with the Identity tab, input the
appropriate Username and Password. (The Password will not be saved in
the DSN, as this would present a significant security risk.)

<div class="figure-float">

<div id="mt_MacOSClass21gif" class="figure">

**Figure 3.52. MacOSClass21.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass21.gif](images/MacOSClass21.gif)

</div>

</div>

</div>

  

</div>

The OpenLink Server, Database, and Optional Server settings seen in the
User DSN configuration screen are combined into the Database tab. Again,
these should be provided by your Database Administrator, or whoever is
handling the Server-side components of the OpenLink Universal Data
Access Suite.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                      |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                |
|                              | The connections will not succeed until Server-side components are installed and properly configured. |

</div>

<div class="figure-float">

<div id="mt_MacOSClass16gif_01" class="figure">

**Figure 3.53. MacOSClass16.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass16.gif](images/MacOSClass16.gif)

</div>

</div>

</div>

  

</div>

Explanations of each field in the Database tab follows:

**Domain. ** This is how you pick the Database Engine Type (also called
a DBMS, or DataBase Management System) that your ODBC DSN is to be
associated with, e.g. Informix 7, Oracle 9, Progress 8.3B, etc. This
option corresponds to the ServerType parameter in the preference files.

**Name. ** This is how an actual database name within the Provider Type
Domain is identified, for instance "stores7" indicates an "Informix 7"
database called "stores7". This option corresponds to the Database
parameter in the preference files.

**Server. ** This is where you place any database specific database
connection options. This field in a majority of cases should be left
blank by default. Your Database Administrator (DBA) should give you any
special settings. This option corresponds to the Options parameter in
the preference files.

**Hostname. ** Enter the hostname or IP address that identifies a Server
Machine running OpenLink Server Components, that speak the OpenLink Data
Access Protocol. This option corresponds to the Host parameter in the
preference files.

**Protocol. ** Select the network transport protocol used to connect
your ODBC DSN with a remote database engine. This will be TCP/IP in most
installations. This option corresponds to the Protocol parameter in the
preference files.

**Port. ** Enter the TCP port number of the Broker to contact. This
corresponds to the Listen parameter on the target Broker. This option
corresponds to the Port parameter in the preference files.

**Defer fetching of long data. ** Check this box to defer the fetching
of long data. See the Release Notes section for more details. This
option corresponds to the DeferLongFetch parameter in the preference
files.

**Read-only connection. ** Forces the connection is to be "Read-only".
Make sure the checkbox is unchecked to request a "Read/Write"
connection. This option corresponds to the ReadOnly parameter in the
preference files.

**Row Buffer Size. ** This attribute specifies the number of records to
be transported over the network in a single network hop. Values can
range from 1 to 999. Smaller values are generally appropriate when each
row contains large records; larger values are generally appropriate for
smaller record sizes. Adjusting this value up and down can improve or
degrade performance substantially, both for your own connection and for
other users of the same Database, so check with your DBA before changing
it from the default (30). This option corresponds to the FetchBufferSize
parameter in the preference files.

The About tab, here, refers to the Driver you've selected for this DSN.

<div class="figure-float">

<div id="mt_MacOSClass17gif_01" class="figure">

**Figure 3.54. MacOSClass17.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass17.gif](images/MacOSClass17.gif)

</div>

</div>

</div>

  

</div>

Click OK when all settings are correct, and you will see the new DSN
available in the File DSN list. Sharing this DSN with other users and
machines may be accomplished by going to the 'ODBC File Data Sources'
folder, found in the 'Preferences' folder, within your System Folder.
Other Macintosh Classic OpenLink clients may use the file by placing it
in the same location on their machine.

<div class="figure-float">

<div id="mt_MacOSClass22gif" class="figure">

**Figure 3.55. MacOSClass22.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass22.gif](images/MacOSClass22.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="mt_tracemacdsn" class="section">

<div class="titlepage">

<div>

<div>

### 3.2.3. Tracing Data Sources

</div>

</div>

</div>

From the Tracing Tab of the iODBC Data Source Administrator, the level
of Tracing can be configured.

<div class="figure-float">

<div id="mt_MacTracegif" class="figure">

**Figure 3.56. MacTrace.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacTrace.gif](images/MacTrace.gif)

</div>

</div>

</div>

  

</div>

**When to trace. ** Use this option to turn tracing off or on. For a
One-time only trace, the trace is made for the duration of the next
connection. Click the Apply button to make your selection active. This
option corresponds to the Trace and TraceAutoStop parameters in the
preference files.

**Custom trace library. ** Use the Select Library button to browse the
machine for a library file that contains the code to intercept the trace
output. This field should generally be left blank. When setting this
parameter, you may use the Browse button to locate the library, or
specify it manually. If specified manually, note that the location must
be specified as it would be in a Terminal session. You may use ~/ as a
shortcut to your user Home directory. This option corresponds to the
TraceDLL parameter in the preference files.

**Log file path. ** Specify the complete location of the file to which
you wish to write the trace. You may use the Browse button to locate or
create the file, or specify it manually. If specified manually, note
that the location must be specified as it would be in a Terminal
session. You may use ~/ as a shortcut to your user Home directory. This
option corresponds to the TraceFile parameter in the preference files.

<div id="mt_mactraceparams" class="section">

<div class="titlepage">

<div>

<div>

#### Trace Parameters in ODBC.INI

</div>

</div>

</div>

When the ODBC tracing parameters are changed, they are saved in the
\[ODBC\] section of the ODBC.preference or odbc.ini file, whichever is
active on your system.

The following example is for a one time trace to sql.log file on the
active user's desktop.

``` programlisting
[ODBC]
Trace         = 1
TraceAutoStop = 1
TraceDLL      =
TraceFile     = ~/Desktop/sql.log
```

Once the tracing of a connection is complete, the Trace and
TraceAutoStop parameters will both be set to 0.

</div>

</div>

<div id="mt_testmacdsn" class="section">

<div class="titlepage">

<div>

<div>

### 3.2.4. Testing Data Sources

</div>

</div>

</div>

<div id="mt_macodbctest" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC SDK C++ Sample

</div>

</div>

</div>

Use the 'ODBC SDK 2.0 C++ Sample PPC' application to test a DSN:

<div class="figure-float">

<div id="mt_MacOSClass23gif" class="figure">

**Figure 3.57. MacOSClass23.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass23.gif](images/MacOSClass23.gif)

</div>

</div>

</div>

  

</div>

From the Environment menu, select "Open Connection...".

<div class="figure-float">

<div id="mt_MacOSClass24gif" class="figure">

**Figure 3.58. MacOSClass24.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass24.gif](images/MacOSClass24.gif)

</div>

</div>

</div>

  

</div>

Choose a User DSN, or press the File DSN tab, and select a File DSN.

<div class="figure-float">

<div id="mt_MacOSClass25gif" class="figure">

**Figure 3.59. MacOSClass25.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass25.gif](images/MacOSClass25.gif)

</div>

</div>

</div>

  

</div>

With a DSN highlighted, press OK. Input Username and Password as
appropriate, and click OK.

<div class="figure-float">

<div id="mt_MacOSClass15gif_01" class="figure">

**Figure 3.60. MacOSClass15.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass15.gif](images/MacOSClass15.gif)

</div>

</div>

</div>

  

</div>

From the SQL menu select Execute SQL...

<div class="figure-float">

<div id="mt_MacOSClass26gif" class="figure">

**Figure 3.61. MacOSClass26.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass26.gif](images/MacOSClass26.gif)

</div>

</div>

</div>

  

</div>

Enter an SQL query in the dialog.

<div class="figure-float">

<div id="mt_MacOSClass27gif" class="figure">

**Figure 3.62. MacOSClass27.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass27.gif](images/MacOSClass27.gif)

</div>

</div>

</div>

  

</div>

With success, the results will be shown.

<div class="figure-float">

<div id="mt_MacOSClass28gif" class="figure">

**Figure 3.63. MacOSClass28.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass28.gif](images/MacOSClass28.gif)

</div>

</div>

</div>

  

</div>

When you QUIT the application, you will see a warning message about your
DSN connection. Please note you will continue to consume one licensed
connection until the application is terminated.

<div class="figure-float">

<div id="mt_MacOSClass29gif" class="figure">

**Figure 3.64. MacOSClass29.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass29.gif](images/MacOSClass29.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="mt_testmacdsniodbc" class="section">

<div class="titlepage">

<div>

<div>

#### iODBC Test PPC

</div>

</div>

</div>

Use the 'iODBC Test PPC' application to test a DSN:

<div class="figure-float">

<div id="mt_MacOSClass30gif" class="figure">

**Figure 3.65. MacOSClass30.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass30.gif](images/MacOSClass30.gif)

</div>

</div>

</div>

  

</div>

Type a question mark ('?') and hit \<return\> to get a list of available
User DSNs.

<div class="figure-float">

<div id="mt_MacOSClass31gif" class="figure">

**Figure 3.66. MacOSClass31.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass31.gif](images/MacOSClass31.gif)

</div>

</div>

</div>

  

</div>

Type a connect string, using one of the listed User DSNs, following the
format DSN=\<DSN\>;UID=\<username\>;PWD=\<password\>. You may leave the
UID and/or PWD parameters out of your string; if you do, you will be
presented with the usual log-in dialog:

<div class="figure-float">

<div id="mt_MacOSClass32gif" class="figure">

**Figure 3.67. MacOSClass32.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass32.gif](images/MacOSClass32.gif)

</div>

</div>

</div>

  

</div>

If you do not wish to type so much, need to add a DSN, or wish to
connect to a File DSN, type anything else, and hit the \<return\> key.
You will be presented with the DSN Chooser dialog, in which you may do
select an existing User or File DSN, or create a new DSN of either type.
Instructions on creation may be found earlier in this chapter.

<div class="figure-float">

<div id="mt_MacOSClass33gif" class="figure">

**Figure 3.68. MacOSClass33.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass33.gif](images/MacOSClass33.gif)

</div>

</div>

</div>

  

</div>

When the 'SQL\>' prompt comes up, you can enter any SQL statement,
including UPDATE, INSERT, DELETE, or SELECT, followed by \<return\>.

<div class="figure-float">

<div id="mt_MacOSClass34gif" class="figure">

**Figure 3.69. MacOSClass34.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass34.gif](images/MacOSClass34.gif)

</div>

</div>

</div>

  

</div>

Results are returned in plain text, to your query window.

<div class="figure-float">

<div id="mt_MacOSClass35gif" class="figure">

**Figure 3.70. MacOSClass35.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass35.gif](images/MacOSClass35.gif)

</div>

</div>

</div>

  

</div>

Type 'exit\<return\>' to close your DSN connection. The prompt 'Again
(y/n) ?' is asking whether you wish to connect to another DSN. Respond
y(es) or n(o) and hit \<return\>. Yes brings you back to the 'Enter ODBC
string' prompt; no returns 'Have a nice day.'

When you QUIT the application, you will be prompted to save the output
text. Default is "Don't save".

<div class="figure-float">

<div id="mt_MacOSClass38gif" class="figure">

**Figure 3.71. MacOSClass38.gif**

<div class="figure-contents">

<div class="mediaobject">

![MacOSClass38.gif](images/MacOSClass38.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

</div>
