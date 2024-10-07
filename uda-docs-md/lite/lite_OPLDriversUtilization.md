<div id="lite_OPLDriversUtilization" class="section">

<div class="titlepage">

<div>

<div>

## 8.4. OpenLink JDBC Driver (Single-Tier Edition) for JDBC Utilization

</div>

</div>

</div>

OpenLink Drivers for JDBC are available in three different JDBC Driver
formats.

<div class="itemizedlist">

- **JDBC Type 1. ** Driver for JDBC is implemented as a bridge to ODBC
  Drivers, thereby implementing the JDBC Driver classes through native
  methods, this is due to the fact that ODBC is a 'C' language based
  data access application programming interface. Thus, this driver
  format is inherently part Java and part Native, implying that it is
  inherently platform specific rather than independent.

- **JDBC Type 2. ** Driver for JDBC is implemented as a bridge to Native
  Database Call Level Interfaces, thereby implementing the JDBC Driver
  classes through native methods, this is due to the fact that Native
  Database Call Interfaces are either C/C++ language based data access
  application programming interfaces. Thus, this driver format is
  inherently part Java and part Native, implying that it is inherently
  platform specific rather than independent

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                         |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                   |
|                              | JDBC Lite can be JDBC Types 1 or 2 only because you have to address platform specific database vender software beneath. |

</div>

JDBC Applets, Applications, Bean Components, and Servlets communicate
with JDBC drivers through JDBC Uniform Resource Locators (URLs). Theses
URLs are service request and binding formats implemented slightly
differently for each OpenLink Driver for JDBC format. The general JDBC
URL format is:

jdbc:\<jdbc-subprotocol\>:\[jdbc implementation specific URL
attributes\]

The "sub-protocol" component of the URL above identifies each JDBC
implementation and typically identifies the JDBC driver vendor, the
actual URL attributes are vendor specific. Each OpenLink Driver for JDBC
type has a different JDBC URL format, the sections that follow depict
and provides examples of these formats.

<div id="lite_JDBCType1" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.1. OpenLink Driver for JDBC Type 1

</div>

</div>

</div>

URL Format variation 1

This driver format connects you to ODBC Data Source Names (DSNs) via
JDBC. The URL format is as follows:

``` programlisting
jdbc:openlink://ODBC[/DSN][/UID][/PWD][/READONLY]
```

URL Attributes

/DSN - ODBC Data Source Name

/UID - Username

/PWD - Password

/READONLY - Determines session mode, read-write or read-only.

Example:

If you were attempting to connect to an ODBC DSN on your machine named
"Customers Database" in read-only mode then you would enter the
following JDBC URL:

jdbc:openlink://ODBC/DSN=CustomerDatabase/UID=test/PWD=test/READONLY=Y

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                          |
|                              | In the case of OpenLink ODBC DSNs you do not have to provide values for the /UID and /PWD attributes since these can be controlled and configured on the database or application server using the OpenLink Session Rules Book. |

</div>

URL Format variation 2

This is an alternative connect string format, that is compatable with
the Sun JDBC to ODBC Type 1 bridge:

``` programlisting
jdbc:odbc:<dsn>;UID=<uid>;PWD=<pwd>
```

URL Attributes

\<dsn\> - ODBC Data Source Name

\<uid\> - Username

\<pwd\> - Password

</div>

<div id="lite_JDBCType2" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.2. OpenLink Driver for JDBC Type 2

</div>

</div>

</div>

URL Format

This driver format connects you to UDBC Data Source Names (DSNs) via
JDBC. The URL format is as follows:

``` programlisting
jdbc:openlink://UDBC[/DSN][/UID][/PWD][/READONLY]
```

URL Attributes

/DSN - ODBC Data Source Name

/UID - Username

/PWD - Password

/READONLY - Determines session mode, read-write or read-only.

Example:

If you were attempting to connect to an UDBC DSN on your machine named
"Customers Database" in read-only mode then you would enter the
following JDBC URL:

jdbc:openlink://UDBC/DSN=CustomerDatabase/UID=test/PWD=test/READONLY=Y

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                          |
|                              | In the case of OpenLink ODBC DSNs you do not have to provide values for the /UID and /PWD attributes since these can be controlled and configured on the database or application server using the OpenLink Session Rules Book. |

</div>

</div>

<div id="lite_JDBCType3" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.3. OpenLink Driver for JDBC Type 3

</div>

</div>

</div>

URL Format

This driver format connects you to remote database directly via the
OpenLink Database drivers. The URL format is as follows:

``` programlisting
    jdbc:openlink://<Hostname>:[portnumber] [/DSN] [/UID] [/PWD] [/READONLY] [/FBS]
            [/JDBCAGENT] [/SVT] [/DATABASE] [/OPTIONS] [/DRIVER]
```

URL Attributes

Hostname - Network Alias or IP address of server machine running an
OpenLink Request Broker instance

Port Number - Port number that identifies location of OpenLink JDBC
Agent Service, the default value is 5000

/DSN - ODBC Data Source Name

/UID - Username

/PWD - Password

/READONLY - Determines session mode, read-write or read-only

/FBS - Sets number of JDBC resultset rows that get packed into a single
network packet

/JDBCAGENT - Determines JDBC Agent type used rather than default (JDBC
Agents exist for ODBC and UDBC)

/SVT - Determines OpenLink Database Agent type (Oracle, Informix,
Sybase, Progress, Ingres, SQL Sever, Sybase etc.)

/DATABASE - Actual database name within a particular database
environment

/OPTIONS - Values used to connect to OpenLink Database Agents to remote
database servers using database vendors networking

/DRIVER - Used when making a DSN-Less connection to a remote ODBC Driver

</div>

<div id="lite_examples" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.4. Examples

</div>

</div>

</div>

<div id="lite_connremoteodbc" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote Database

</div>

</div>

</div>

If you were attempting to connect to a remote Database Server Type
"SQLServer 2000", hosted on a database server machine with the network
alias "pluto", with an OpenLink JDBC server listening at port 5001
(rather than default of 5000), and you wanted this session to be in
read-only mode then you would enter the following JDBC URL:

``` programlisting
jdbc:openlink://pluto:5001/SVT=SQLServer 2000/UID=test/PWD=test/
        READONLY=YES/FBS=55
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="orderedlist">
<ol type="1">
<li><p>In the case of OpenLink ODBC DSNs you do not have to provide
values for the /UID and /PWD attributes since these can be controlled
and configured on the database or application server using the OpenLink
Session Rules Book</p></li>
<li><p>"/FBS" ensures that each iteration of a JDBC Resultset fetch loop
returns 55 records or less until all records have been retrieved from a
remote database server</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="lite_connremoteudbc" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote UDBC DSN

</div>

</div>

</div>

If you were attempting to connect to a remote UDBC DSN named "Customers
Database", hosted on a database server machine with the network alias
"pluto", with an OpenLink JDBC server listening at port 5001 (rather
than default of 5000), and you wanted this session to be in read-only
mode then you would enter the following JDBC URL:

``` programlisting
jdbc:openlink://pluto:5001/DSN=CustomerDatabase/UID=test/PWD=test/
        READONLY=Y/JDBCAGENT=judbc/FBS=55
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="orderedlist">
<ol type="1">
<li><p>In the case of OpenLink ODBC DSNs you do not have to provide
values for the /UID and /PWD attributes since these can be controlled
and configured on the database or application server using the OpenLink
Session Rules Book</p></li>
<li><p>If "pluto" is a Linux or UNIX machine then the "/JDBCAGENT"
attribute defaults to "judbc" when left out of the JDBC URL. Likewise if
"pluto" is a Windows 95/98/NT/2000 machine the "/JDBCAGENT" attribute
defaults to "jodbc"</p></li>
<li><p>"/FBS" ensures that each iteration of a JDBC Resultset fetch loop
returns 55 records or less until all records have been retrieved from a
remote database server</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="lite_dsnlessconnection" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Databases Using DSN-Less Connections

</div>

</div>

</div>

You do not have to create ODBC or UDBC DSNs in order to use your
OpenLink Drivers for JDBC when using the type 3 format. Instead you can
specify the OpenLink Database Type and Database Name attributes as part
of your JDBC URL.

To connect to a remote Microsoft SQL Server database without going via
an ODBC DSN you would construct the following URL:

``` programlisting
jdbc:openlink://saturn:5001/SVT=SQLServer6/DATABASE=pubs/UID=sa/
        PWD=/FBS=55/READONLY=Y
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Notes:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Notes:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="orderedlist">
<ol type="1">
<li><p>In the case of OpenLink ODBC DSNs you do not have to provide
values for the /UID and /PWD attributes since these can be controlled
and configured on the database or application server using the OpenLink
Session Rules Book</p></li>
<li><p>As "saturn" is a Windows 95/98/NT/2000 machine the "/JDBCAGENT"
attribute defaults to "jodbc"</p></li>
<li><p>This feature applies to both OpenLink JDBC Agent types: JODBC
Agent and JUDBC Agent</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="lite_dsnlessodbcdriverconn" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Database via ODBC Driver Without A DSN (DSN-Less Connection)

</div>

</div>

</div>

This JDBC URL format is currently only supported by the OpenLink JDBC
Agent for ODBC DSNs (JODBC Agent). DSN-Less connections require you to
determine the ODBC connect string attributes for the ODBC Driver that
you are using. For OpenLink ODBC Drivers these values are:

<div id="id48298" class="table">

**Table 8.2. Connect String Attributes**

<div class="table-contents">

| Attribute       | Description                                                                                                                                                                                                                                              |
|:----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ServerType      | Database Type                                                                                                                                                                                                                                            |
| Host            | Machine hosting the Database Agent serving an OpenLink ODBC Driver                                                                                                                                                                                       |
| Username        | Valid Database Username                                                                                                                                                                                                                                  |
| Password        | Valid Password for Username                                                                                                                                                                                                                              |
| FetchBufferSize | Number of resultset records fetched during each ODBC fetch loop                                                                                                                                                                                          |
| Database        | Actual database name within database server environment                                                                                                                                                                                                  |
| NoLoginBox      | Disables OpenLink ODBC Drivers attempt to present dialog when ODBC Driver determines an incomplete ODBC connect string (collection of ODBC attributes passed at connect time) good examples being missing or blank "Username" and "Password" attributes. |

</div>

</div>

  

If you were connecting a remote Oracle database on a machine called
"pluto" and you wanted this session to be read-only, your URL formal
would be as follows:

``` programlisting
jdbc:openlink://pluto/DRIVER={OpenLink Generic 32 Bit Driver}/Database=ORCL/Username=test/
            PWD=test/ReadOnly=Yes/FBS=55/ServerType=Oracle 8/Host=pluto
```

</div>

<div id="lite_ConnectingToRemoteDBonSepServer" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote Databases On Separate Server Machine (OpenLink 3-Tier Architecture)

</div>

</div>

</div>

You may choose to install your OpenLink Drivers for JDBC on an
Application Server and then install your OpenLink Data Access Server
components (Request Broker and Database Agents) on your dedicated
database server machine. In such a scenario you will be connecting to
your remote database engine using OpenLink Database Independent as
opposed to your Database vendor's database specific networking
middleware.

If you were connecting from your Application Server called "pluto" to a
dedicated Database Server machine named "ora_server", hosting an Oracle
database identified as "ORCL" you would construct the following JDBC
URL:

jdbc:openlink://pluto/SVT=Oracle 6/UID=test/PWD=test/HOST=ora_server

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Notes:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Notes:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="orderedlist">
<ol type="1">
<li><p>This feature applies to both OpenLink JDBC Agent types: JODBC
Agent and JUDBC Agent</p></li>
<li><p>You could also have used the "/DSN" attribute to point to an ODBC
or UDBC DSN which has been configured to connect to the Database Server
machine, this simply reduces the size of your JDBC URL, but imposes the
use of DSNs upon you.</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="lite_ConnectingToRemoteDBUsingDBComs" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote Databases On Separate Server Machine Using Database Vendors Networking (Mixed 3-Tier Architecture)

</div>

</div>

</div>

Organizational standards or individual preference may present you with a
scenario in which you have two server machines in use, one acting as an
Application Server hosting your OpenLink Drivers for JDBC and OpenLink
Data Access Server components (Request Broker & Database Agents), and
the other acting as a dedicated Database Server. You may not have the
necessary authority to install the OpenLink Data Access Server
components on the Database Server, or you simply prefer to use your
database vendors networking software which is already configured on your
Application Server. This scenario can be described as a "Mixed 3-Tier"
architecture, this is because you are going to use your OpenLink
Database Agents atop database vendor provided networking rather than
connecting to an OpenLink Database Agent using OpenLink Database
independent networking.

If you were connecting to a remote Oracle database somewhere on your
network from our application server called "pluto" using an ODBC DSN
called "Customers" you would construct the following JDBC URL assuming a
Net8 or SQL\*Net "tnsname" or server alias called "ora_pluto":

``` programlisting
jdbc:openlink://pluto/SVT=Oracle 8/UID=test/PWD=test/OPTIONS=ora_pluto
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Notes:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Notes:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="orderedlist">
<ol type="1">
<li><p>The "/OPTIONS" JDBC URL attribute provides the entry or bind
point for connecting OpenLink Database agents to Database vendors
networking products. This applies to all supported OpenLink databases,
see the OpenLink Database Agents configuration guide for additional
information relating to the database specific formats of values passed
to the "/OPTIONS" JDBC URL attribute</p></li>
<li><p>This feature applies to both OpenLink JDBC Agent types: JODBC
Agent and JUDBC Agent</p></li>
<li><p>You could also have used the "/DSN" attribute to point to an ODBC
or UDBC DSN which has been configured to connect to the Database Server
machine, this simply reduces the size of your JDBC URL, but imposes the
use of DSNs upon you.</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>
