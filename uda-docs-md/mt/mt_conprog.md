<div id="mt_conprog" class="section">

<div class="titlepage">

<div>

<div>

## 8.6. Progress Troubleshooting & Advanced Configuration

</div>

</div>

</div>

**Assumptions. ** It assumed at this point that you have successfully
installed OpenLink's client and server components on one or more
computers within your I.T. infrastructure.

**Conceptual Overview. ** Understanding the fundamental concepts that
drive the OpenLink Data Access Drivers for Progress is central to you
exploiting the deliberate simplicity of our product architecture. A
failure to grasp these concepts will certainly make the last sentence an
absolute contradiction in terms.

<div id="mt_conprogudacomps" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.1. OpenLink Data Access Components

</div>

</div>

</div>

Your OpenLink Data Access Driver Suite (Multi-Tier Edition) consists of
the following components, subdivided by prime function:

<div class="itemizedlist">

- Client Components (OpenLink Database Agent Service Consumers)

  <div class="itemizedlist">

  - Generic ODBC Driver (the file "oplodb32.dll" under windows or OS/2,
    "oplodbc.sl" or "oplodbc.so" under UNIX)

  - Generic Driver for JDBC™ (the files "opljdbc.zip" or "opljdbc.jar")

  - Generic UDBC Driver (the end product of statically linking the file
    libudbc.o or dynamically linking the file "libudbc.so" or
    libudbc.sl" under UNIX)

  </div>

- Server Components (OpenLink Database Agent Service Providers)

  <div class="itemizedlist">

  - OpenLink Request Broker (the file "oplrqb" or "oplrqb.exe" depending
    on operating system)

  - OpenLink Database Agents (the files "pro63e_sv" or "pro73c_sv" or
    "pro82a_sv" depending on major and minor Progress Database Server
    version and sub-version number)

  </div>

</div>

The prime function of your OpenLink Components does not determine their
physical location within your I.T. infrastructure, this is driven
instead by the logical structure and nature of your database
connectivity requirements.

</div>

<div id="mt_conproghowtoprog" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.2. How OpenLink's Data Access Drivers Connect To Your Progress Database

</div>

</div>

</div>

A process diagram is provided below to assist with the understanding of
how the various OpenLink components work in concert, with the sole
objective of providing you with Secure, High-Performance, and Highly
Configurable access to Progress Database Engines.

<div class="figure-float">

<div id="mt_conprog1" class="figure">

**Figure 8.43. Progress Connection Conceptual Diagram**

<div class="figure-contents">

<div class="mediaobject">

|                                                 |
|-------------------------------------------------|
| <img src="images/conprog1.gif" width="596"      
 alt="Progress Connection Conceptual Diagram" />  |

</div>

</div>

</div>

  

</div>

The steps explained:

<div class="orderedlist">

1.  An ODBC/JDBC/UDBC Application uses the relevant data access
    standards Driver binding mechanism to locate and associate itself
    with the relevant OpenLink Driver.

2.  The chosen OpenLink Driver then uses its in-built Database
    Independent Communications layer to broadcast an OpenLink Database
    Agent service request to the OpenLink Request Broker.

3.  The OpenLink Request Broker analyzes the request in step 3 and then
    determines from the information obtained from the OpenLink Sessions
    Rules Book (the file oplrqb.ini), if an OpenLink Database Agent for
    Progress is available. If the OpenLink Request Broker determines
    that a Progress Database Agent does not exist, it will indicate it
    findings via an error condition and resultant error message viewable
    via your ODBC/JDBC/UDBC application.

4.  The OpenLink Request Broker initializes a new OpenLink Database
    Agent For Progress instance or associates the new Progress Database
    session request with an existing OpenLink Database Agent For
    Progress instance.

5.  OpenLink Database Agent For Progress instance uses your chosen Inter
    Process Communications (IPC) mechanism to initialize a session with
    a Progress Database Server that supports the chosen IPC mechanism.
    The default mechanism chosen by the OpenLink Database Agent For
    Progress is shared memory. You can opt to use TCP sockets by doing
    one of the following (as long as you have started a TCP sockets
    based Database Server for your Progress Database Engine by using the
    command:

    ``` programlisting
    proserve &lt;dbname&gt; -S &lt;service name&gt; -N TCP H localhost):
    ```

    Place the Progress Database Connection Parameters
    `- S <service name> -N TCP –H localhost ` into the "Options" field
    of the OpenLink ODBC Data Source Configuration Utility, should you
    be using OpenLink ODBC Drivers.

    Place the Progress Database Connection Parameters
    `- S <service name> -N TCP –H localhost ` as "/OPTIONS" JDBC URL
    attribute values, should you be using OpenLink Drivers for
    JDBC™.Place the Progress Database Connection Parameters
    `- S <service name> -N TCP –H localhost` as "OPTIONS" connect string
    values, should you be using OpenLink UDBC or OpenLink’s Unix based
    ODBC Drivers.

    The OpenLink Session Rules Book (oplrqb.ini) allows you to control
    this behavior centrally, alleviating yourself from the cost of
    maintaining numerous client based connection parameters. This is
    done by placing the Progress Database Connection Parameters
    `- S <service name> -N TCP –H localhost` as "ConnectOptions"
    section-key values within the Progress Database Agent configuration
    ("\[generic_prox\]") section of the Session Rules Book.

6.  At this point your Progress Database Session is established

7.  ODBC/JDBC/UDBC Driver binding and database session establishment is
    completed, and the ODBC/JDBC/UDBC Driver Manager is no longer
    required while the Progress Database Session remains open.

8.  The OpenLink Request Broker like the Driver Managers in step 7 is no
    longer required (until session closure) while data is being
    exchanged directly between ODBC/JDBC/UDBC applications, the OpenLink
    Database Agents for Progress, and your Progress Database Engine.

</div>

</div>

<div id="mt_conprogtrblesht" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.3. Initial Connection Problems

</div>

</div>

</div>

The OpenLink Database Agent for Progress is a Hybrid of OpenLink &
Progress ESQL/C components, indicating that the actual OpenLink Database
Agent for Progress is for all intents and purposes a Progress ESQL/C
client.

The files "proxxx_sv" or "proxx_sv.exe" are your OpenLink Database Agent
for Progress executables (note: xxx represents Progress major and minor
release numbers e.g. Progress 7.3C would be represented as pro73c_sv).
These files are always situated in the "bin" sub-directory of your
OpenLink installation directory.

When you attempt to make an ODBC/JDBC/UDBC connection to your Progress
Database Engine(s), and you encounter a problem, one of the following
error conditions would typically be presented to you via your
ODBC/JDBC/UDBC application:

<div class="itemizedlist">

- "There is no server this database you are attempting to connect with",
  even though you know there is a server running for that database.

</div>

<div class="itemizedlist">

- "Shared memory of a particular version was expected, but shared memory
  of another version has been found"

</div>

The conditions above arise due to the fact that the OpenLink Database
Agent for Progress not being built using Progress ESQL/C libraries that
do not match your Progress Database Server to the exact minor release.
This is to say that although the OpenLink Database Agent for Progress
may have been built using ESQL/C libraries for Progress 7.3A, you will
still have a version incompatibility problem of this nature should you
attempt to connect this ESQL/C client to a Progress 7.3C Database Server
process.

This error condition arises as a result of the fact that the OpenLink
Database Agent for Progress defaults to using Shared Memory for its
Inter Process Communications (IPC) , and that Shared Memory is very
version sensitive nature albeit the fastest IPC mechanism .

There are two possible ways to work around this situation when it
arises.

<div class="orderedlist">

1.  Change the default IPC mechanism of the OpenLink Database Agent for
    Progress, from Shared Memory to TCP sockets, as TCP sockets based
    IPC is version sensitive.

2.  Rebuild/Relink your OpenLink Database Agent for Progress, achieved
    by running an OpenLink provided link script that produces a new
    OpenLink Database Agent for Progress executable with an exact Shared
    Memory match for your Progress Database Server.

</div>

</div>

<div id="mt_conprogsocketspro" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.4. Making OpenLink Database Agent Use a Sockets Based IPC

</div>

</div>

</div>

Pre-Configuration Check List:

<div class="itemizedlist">

- Progress Database Server installation must be licensed to use Progress
  Client Networking.

- TCP networking must be installed, configured and up and running on the
  Progress Database Server machine. (The command: ping localhost will
  quickly determine if TCP is configured correctly on your server
  machine).

- You need to create an entry in the "services" file (situated in the
  UNIX "/etc" directory) for one or more Progress TCP Sockets based
  Database Servers. The "services" file is standard TCP configuration
  file that is used to match Service Names to the TCP port number from
  which their services can be accessed. The entries in this file follow
  the format shown below:

  <div id="id10041" class="decimalstyle">

  **Table 8.19. **

  <div class="decimalstyle-contents">

  | Service Name | Port/Protocol | Comment                             |
  |--------------|---------------|-------------------------------------|
  | netwall      | 533/udp       | \# -for emergency broadcasts        |
  | uucp         | 540/tcp       | \# uucp daemon                      |
  | remotefs     | 556/tcp       | \# Brunhoff remote filesystem       |
  | pppmsg       | 911/tcp       | \# PPP daemon                       |
  | listen       | 1025/tcp      | \# listener RFS remote_file_sharing |
  | nterm        | 1026/tcp      | \# remote_login network_terminal    |

  </div>

  </div>

    

</div>

You need to choose the name of a service and a port number that is not
currently used by a tcp service (in the case illustrated above, for
example, number 1026 is already being used).

Thus, if you chose to use the name <span class="emphasis">*"pro8srv"*
</span>for your Progress TCP Sockets based Database Server’s Service
Name. And you chose to make its services available at TCP port \# 9001
(and you have checked the file to make sure it is not being used) you
would add the following entry (note that the third entry is simply a
comment as it is preceded with a "#"):

``` programlisting
pro8srv 9001/tcp # for Progress database sales 
```

<div id="mt_conprogsockets" class="section">

<div class="titlepage">

<div>

<div>

#### Configuration Steps

</div>

</div>

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                          |
|                              | (Assuming a Progress Database named "sales.db" using as TCP Service "pro8srv") |

</div>

<div class="itemizedlist">

- <span class="emphasis">*Progress Server Components*</span>

  <div class="itemizedlist">

  - Assuming the database file "<span class="emphasis">*sales.db"*
    </span>is situated in directory
    "<span class="emphasis">*/usr/data"*</span>. Start your Progress TCP
    Sockets based Database Server process using the command:

    ``` programlisting
    >proserve /usr/data/sales.db -S pro8srv N TCP H localhost 
    ```

  </div>

- <span class="emphasis">*OpenLink Server Components (Database Agent for
  Progress)*</span>

  <div class="itemizedlist">

  - The OpenLink Session Rules Book (oplrqb.ini) allows you to control
    all OpenLink Data Access clients (ODBC/JDBC/UDBC) centrally,
    alleviating yourself from the time cost of maintaining numerous
    client based connection parameters.

    This is done by placing the Progress Database Connection Parameters
    `-S <service name> -N TCP –H localhost` as "ConnectOptions"
    section-key values within the Progress Database Agent configuration
    ( "\[generic_prox\]" ) section of the Session Rules Book e.g.:

    ``` programlisting
    [generic_pro8]
    Program = pro8_sv
    ServerOptions = -q d mdy TB 30 TM 30 e 25
    Database = /usr/data/sales.db
    ConnectOptions = -S pro8srv N TCP H localhost
    ```

  </div>

- <span class="emphasis">*OpenLink Client Components (Drivers for
  ODBC/JDBC™/UDBC)*</span>

  You only have to resort to the steps below if circumstances within
  your organization demand client side configuration, otherwise the
  server based approach using the OpenLink Session Rules Book
  (oprqb.ini) is much more effective and convenient.

  <div class="itemizedlist">

  - <span class="emphasis">*OpenLink ODBC Drivers*</span> - Place the
    Progress Database Connection Parameters:
    `-S pro8srv –N TCP –H localhost` into the "Options" field of the
    OpenLink ODBC Data Source Configuration Utility

  - <span class="emphasis">*OpenLink Drivers for JDBC*</span>™ - Use the
    Progress Database Connection Parameters:
    `-S pro8srv –N TCP –H localhost` as "/OPTIONS" OpenLink JDBC URL
    attribute values e.g.:

    ``` programlisting
    jdbc:openlink://dbservermachine/DSN=dsn_progress/OPTIONS=-S pro8srv N TCP H localhost
    ```

  - <span class="emphasis">*OpenLink UNIX based ODBC or UDBC
    Drivers*</span> - Use the Progress Database Connection Parameters:
    `-S pro8srv –N TCP –H localhost` as "OPTIONS" connect string values
    e.g.:

    ``` programlisting
    DSN=dsn_progress;OPTIONS=-S pro8srv N TCP H localhost
    ```

  </div>

</div>

</div>

<div id="mt_conprogrebuildlink" class="section">

<div class="titlepage">

<div>

<div>

#### REBUILDING/RELINKING Your OpenLink Database Agent For Progress

</div>

</div>

</div>

As explained earlier an OpenLink Database Agent for Progress is a
combination of OpenLink specific libraries (data access and network
server modules) and Progress specific libraries provided situated in the
"probuild" sub-directory under your Progress installations \$DLC
directory.

Should you desire the superior performance that Shared Memory has over
TCP sockets, then rebuilding/relinking your OpenLink Database Agent for
Progress provides an alternative solution to Shared Memory
incompatibility problems that may be impeding your ability to establish
an OpenLink session with your Progress Database Server.

<span class="emphasis">*Activity Prerequisites* </span>

<div class="itemizedlist">

- You must have a ‘C’ library linker installed and running on your
  machine (part of your operating systems ‘C’ compiler kit)

- You must have a "probuild" sub-directory situated under the \$DLC
  (progress installation directory) directory.

- You must have a "lib" sub-directory situated under your OpenLink
  Server Components installation directory, and it must contain the
  following components:

  <div class="itemizedlist">

  - A link script file named "mkdlcX" (where X represents your Progress
    installation’s major release number e.g. for Progress 7.3C this
    would be lddlc7).

  - A link script named "ldproX" (where X represents your Progress
    installation’s major release number e.g. for Progress 7.3C this
    would be ldpro7).

  - An OpenLink specific link library file named "pro7_sv.o"

  </div>

</div>

<span class="emphasis">*Rebuild/Relink Steps*</span>

<div class="orderedlist">

1.  Create a UNIX environment variable named "
    <span class="emphasis">*DLC"* </span> and set its value your
    Progress installation directory. You do not need to do this as this
    environment variable is already set, the output from the command:
    echo \$DLC will enable you determine if this has been set.

2.  Create a UNIX environment variable named
    "<span class="emphasis">*PROLOAD"* </span>and set its value to
    <span class="emphasis">*\$DLC/probuild* </span>From the UNIX command
    line prompt this is achieved by typing in the following:

    ``` programlisting
    PROLOAD=$DLC/probuild ; export PROLOAD
    ```

3.  Change directory to the ‘lib’ sub-directory under your OpenLink
    Server Components installation directory

4.  Run the script " <span class="emphasis">*mkdlcX",* </span> the aim
    here being the production of a file named
    <span class="emphasis">*'dlcX.o'*</span> (where X represents your
    Progress installations major release number)

5.  If you receive an error messages from <span class="emphasis">*step
    4*</span> stating that one or more Progress libraries cannot be
    found, please edit <span class="emphasis">*mkdlcX*</span> and remove
    any references to the file(s) identified in the error message.

6.  Run the script ' <span class="emphasis">*ldproX*</span> ' . This
    will produce a new OpenLink Database Agent for Progress version X
    (proX_sv), and place the new executable file in the "bin"
    sub-directory of your OpenLink installation directory (the directory
    immediately adjacent to the "lib" directory from where you performed
    steps 1 – 5).

</div>

</div>

</div>

<div id="mt_conprogDistributedDatabases" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.5. Distributed Databases, Array Fields, Database Triggers

</div>

</div>

</div>

Our ODBC Drivers facillate the support of the above through the use of a
custom "Data Dictionary File", this file is built by running the
OpenLink provided Progress Program File
"<span class="emphasis">*setup.p*</span>" situated in the "bin"
sub-directory below the OpenLink base installation directory.

Once the script has been run, modify the OpenLink "Session Rules Book"
using the gudilines displayed when the "
<span class="emphasis">*setup.p*</span>" program completes.

Note: To make use of Progress Database Triggers please ensure that the
Logical Database name to which your Triggers have been compiled matches
the value that you provide to the "-ld" parameter when setting your
Progress Database Connect options during the execution of "setup.p" .

<span class="emphasis">*Example:* </span>

If you have compiled your triggers against a database physically
identified as "/usr/progress/demo.db" but logically identified as
"mydemo" your "setup.p" Database Connection String would be:

/usr/progress/demo -ld mydemo

</div>

<div id="mt_conprogusingoplodbc" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.6. Using OpenLink ODBC, Progress & Microsoft Access

</div>

</div>

</div>

<span class="emphasis">*The Mysterious "Admin" Account & Disabling the
JET Scrollable Cursor (Dynaset) Facility*</span>

Please ensure that you have the following OpenLink Settings enabled :

<span class="emphasis">*Client*</span>

<div class="itemizedlist">

- OpenLink ODBC DSN "no login dialog box" check box is checked

- OPENLINK.INI settings
  `\Local Machine\Software\ODBC\OPENLINK.INI\Communications` ShowErrors
  Key is also set to "No" , this ensures that OpenLink Specific error
  messages aren't shown.

</div>

<span class="emphasis">*Server*</span>

<div class="itemizedlist">

- Ensure the following Mapping Rule exists as the first line of the
  \[Mapping Rules\] section of yor "Session Rules Book" :

</div>

``` programlisting
[Mapping Rules]
;*:*:blank:*:*:*:rw = reject You should specify a username and password
*:*:Admin:*:*:*:rw = reject User Admin Account Does Not Exist In Your Progress Database
```

The above alleviates the need to depend of JetTryAuth or TryJetAuth.

</div>

<div id="mt_conprogjetsetngs" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.7. Key Microsoft Access Jet Engines Setting That Can Affect Your OpenLink ODBC Experience

</div>

</div>

</div>

The following sections describe Windows registry settings settings for
the Microsoft Jet database engine for connection to an ODBC database.
These registry settings must be added by the user or by your
application; the ODBC Driver Setup program does not write default values
to the location:

``` programlisting
\HKEY_LOCAL_MACHINE\Software\Microsoft\Access\7.0\Jet\3.5\Engines\ODBC
```

Initialization Settings for Jet-connected ODBC Databases, found at:

``` programlisting
\HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\Access\Jet\3.5\Engines\ODBC
```

folder contains initialization settings for the Microsoft Jet database
engine. Before you can add any of the following values to the registry,
you must create the ODBC folder under the Jet\3.5\Engines folder.

To create the new folder, open the Jet\3.5\Engines folder in the
Registry Editor and click Add Key on the Edit menu. In the Key Name:
edit box, type ODBC and click OK. The Registry Editor creates a new
folder below the Jet\3.5\Engines folder.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                             |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                       |
|                              | If you are using Windows NT, the Add Key dialog box also contains an edit box for the registry key class; you can leave this setting blank. |

</div>

Typical settings for the entries in the Jet\3.5\Engines\ODBC folder are
shown in the following example.

``` programlisting
LoginTimeout=20
QueryTimeout=60
ConnectionTimeout=600
AsyncRetryInterval=500
AttachCaseSensitive=0
AttachableObjects=&#39;TABLE&#39;,&#39;VIEW&#39;,&#39;SYSTEM TABLE&#39;,&#39;ALIAS&#39;,&#39;SYNONYM&#39;
SnapshotOnly=0
TraceSQLMode=0
TraceODBCAPI=0
DisableAsync=0
JetTryAuth=1
PreparedInsert=0
PreparedUpdate=0
FastRequery=0
```

The Jet database engine uses the ODBC entries as follows:

**LoginTimeout. ** The number of seconds a login attempt can continue
before timing out. The default is 20 (values are of type REG_DWORD).

**QueryTimeout. ** The number of seconds a query can run (total
processing time) before timing out. The default is 60 (values are of
type REG_DWORD).

**ConnectionTimeout. ** The number of seconds a cached connection can
remain idle before timing out. The default is 600 (values are of type
REG_DWORD).

**AsyncRetryInterval. ** The number of milliseconds between polls to
determine if the server is done processing a query. This entry is used
for asynchronous processing only. The default is 500 (values are of type
REG_DWORD).

**AttachCaseSensitive. ** An indicator of whether to match table names
exactly when linking. Values are 0 (link the first table matching the
specified name, regardless of case) and 1 (link a table only if the name
matches exactly). The default is 0 (values are of type REG_DWORD).

**AttachableObjects. ** A list of server object types to which linking
will be allowed. The default is: 'TABLE', 'VIEW', 'SYSTEM TABLE',
'ALIAS', 'SYNONYM' (values are of type REG_SZ).

**SnapshotOnly. ** An indicator of whether Recordset objects are forced
to be of snapshot type. Values are 0 (allow dynasets) and 1 (force
snapshots only). The default is 0 (values are of type REG_DWORD).

**TraceSQLMode. ** An indicator of whether the Jet database engine will
trace SQL statements sent to an ODBC data source in SQLOUT.txt. Values
are 0 (no) and 1 (yes). The default is 0 (values are of type REG_DWORD).
This entry is interchangeable with SQLTraceMode.

**TraceODBCAPI . ** An indicator of whether to trace ODBC API calls in
ODBCAPI.txt. Values are 0 (no) and 1 (yes). The default is 0 (values are
of type REG_DWORD).

**DisableAsync. ** An indicator of whether to force synchronous query
execution. Values are 0 (use asynchronous query execution if possible)
and 1 (force synchronous query execution). The default is 1 (values are
of type REG_DWORD).

**JetTryAuth. ** An indicator of whether to try using the Microsoft
Access user name and password to log in to the server before prompting.
Values are 0 (no) and 1 (yes). The default is 1 (values are of type
REG_DWORD).

**PreparedInsert. ** An indicator of whether to use a prepared INSERT
statement that inserts data in all columns. Values are 0 (use a custom
INSERT statement that inserts only non-Null values) and 1 (use a
prepared INSERT statement). The default is 0 (values are of type
REG_DWORD).Using prepared INSERT statements can cause Nulls to overwrite
server defaults and can cause triggers to execute on columns that
weren't inserted explicitly.

**PreparedUpdate. ** An indicator of whether to use a prepared UPDATE
statement that updates data in all columns. Values are 0 (use a custom
UPDATE statement that sets only columns that have changed) and 1 (use a
prepared UPDATE statement). The default is 0 (values are of type
REG_DWORD).Using prepared UPDATE statements can cause triggers to
execute on unchanged columns.

**FastRequery. ** An indicator of whether to use a prepared SELECT
statement for parameterized queries. Values are 0 (no) and 1 (yes). The
default is 0 (values are of type REG_DWORD).

</div>

</div>
