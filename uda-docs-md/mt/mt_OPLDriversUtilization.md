<div id="mt_OPLDriversUtilization" class="section">

<div class="titlepage">

<div>

<div>

## 11.8. OpenLink Drivers for JDBC Utilization

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

- **JDBC Type 3. ** Driver for JDBC is implemented in Java sitting atop
  a database independent networking layer bridge also implemented in
  Java. Thus, the entire driver is Pure Java and thereby operating
  system independent.

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

<div id="mt_JDBCType1" class="section">

<div class="titlepage">

<div>

<div>

### 11.8.1. OpenLink Driver for JDBC Type 1

</div>

</div>

</div>

This driver format connects you to ODBC Data Source Names (DSNs) via
JDBC. The URL format is as follows:

``` programlisting
jdbc:openlink://ODBC[/DSN][/UID][/PWD][/READONLY]
```

**URL Format. **

|                                                               |
|---------------------------------------------------------------|
| /DSN - ODBC Data Source Name                                  |
| /UID - Username                                               |
| /PWD - Password                                               |
| /READONLY - Determines session mode, read-write or read-only. |

**Example. ** If you were attempting to connect to an ODBC DSN on your
machine named "CustomerDatabase" in read-only mode then you would enter
the following JDBC URL:

``` programlisting
jdbc:openlink://ODBC/DSN=CustomerDatabase/UID=test/PWD=test/READONLY=Y
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                          |
|                              | In the case of OpenLink ODBC DSNs you do not have to provide values for the /UID and /PWD attributes since these can be controlled and configured on the database or application server using the OpenLink Session Rules Book. |

</div>

</div>

<div id="mt_JDBCType3" class="section">

<div class="titlepage">

<div>

<div>

### 11.8.2. OpenLink Driver for JDBC Type 3

</div>

</div>

</div>

URL Format

This driver format connects you to remote database using remote ODBC
DSNs. It also supports direct DSN-Less connections to remote databases.
The URL format is as follows:

``` programlisting
jdbc:openlink://<Hostname>:[portnumber] [/UID] [/PWD] [/READONLY] [/SVT]
      [/APPLICATION] [/FBS|FETCHBUFFERSIZE] [/ENCRYPTED] [/CHARSET] [/UNICODE]
      [/DLF] [/DATABASE] [/OPTIONS] [/DRIVER]
```

**URL Attributes. **

|                                                                                                                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Hostname - Network Alias or IP address of server machine running an OpenLink Request Broker instance                                                                                     |
| Port Number - Port number that identifies location of OpenLink JDBC Agent Service, the default value is 5000                                                                             |
| /UID - Username                                                                                                                                                                          |
| /PWD - Password                                                                                                                                                                          |
| /READONLY - Determines session mode, read-write or read-only                                                                                                                             |
| /SVT - Determines OpenLink Database Agent type (Oracle, Informix, Sybase, Progress, Ingres, SQL Sever, Sybase etc.)                                                                      |
| /APPLICATION - Set the Application name with which connections have to be obtained.                                                                                                      |
| /FBS - (also FETCHBUFFERSIZE) Sets the Fetch Buffer Size, which is the number of JDBC resultset rows that get packed into a single network packet                                        |
| /ENCRYPTED - Set the Encrypted flag for outgoing packets with which connections have to be obtained. The encryption isn't used by default. The value may be '1', '0', 'Y', 'N', 'y', 'n' |
| /CHARSET - Set the charset of remote database with which connections have to be obtained. The default value is get from System.getProperty("file.encoding")                              |
| /UNICODE - Set the Unicode attribute with which connections have to be obtained. The unicode connection isn't used by default. The value may be '1', '0', 'Y', 'N', 'y', 'n'             |
| /DLF - Set the DeferLongFetch attribute with which connections have to be obtained. The defer Long etch isn't used by default. The value may be '1', '0', 'Y', 'N', 'y', 'n'             |
| /DATABASE - Actual database name within a particular database environment                                                                                                                |
| /OPTIONS - Values used to connect to OpenLink Database Agents to remote database servers using database vendors networking                                                               |
| /DRIVER - IS the Driver name in {}, used when making a DSN-Less connection to a remote ODBC Driver                                                                                       |

</div>

<div id="mt_examples" class="section">

<div class="titlepage">

<div>

<div>

### 11.8.3. Examples

</div>

</div>

</div>

<div id="mt_connremoteodbc" class="section">

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

<div id="mt_dsnlessconnection" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting directly via your OpenLink Database agent

</div>

</div>

</div>

As your OpenLink Database Agent now has built-in support for JDBC, you
can make a direct connection to the database using the Type-3 format by
specifying the OpenLink Database Type and Database Name attributes as
part of your JDBC URL. This is the recommended connection method for a
JDBC Type-3 connection whenever possible.

To connect to a remote Microsoft SQL Server 6 or 7 database using this
format you would construct the following URL:

``` programlisting
jdbc:openlink://saturn:5001/SVT=SQLServer 6/DATABASE=pubs/UID=sa/
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
<li><p>You do not necessarily have to provide values for the /UID and
/PWD attributes since these can be controlled and configured on the
database or application server using the OpenLink Session Rules
Book</p></li>
<li><p>Since we are using the direct Database Agent connection type, no
JDBC agent reference will be needed in the URL string.</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="mt_dsnlessodbcdriverconn" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Database via ODBC Driver Without A DSN (DSN-Less Connection)

</div>

</div>

</div>

DSN-Less connections require you to determine the ODBC connect string
attributes for the ODBC Driver that you are using. For OpenLink ODBC
Drivers these values are:

<div id="id11736" class="table">

**Table 11.14. Connect String Attributes**

<div class="table-contents">

| Attribute       | Description                                                                                                                                                                                                                                              |
|:----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Driver          | Full driver name as defined in the ODBC control panel                                                                                                                                                                                                    |
| ServerType      | Database Agent Type                                                                                                                                                                                                                                      |
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
jdbc:openlink://pluto/DRIVER={OpenLink Generic ODBC Driver}/Database=ORCL/Username=test/
            PWD=test/ReadOnly=Yes/FBS=55/ServerType=Oracle 8/Host=pluto
```

</div>

<div id="mt_ConnectingToRemoteDBonSepServer" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote Databases on a Separate Server Machine (OpenLink 3-Tier Architecture)

</div>

</div>

</div>

You may choose to install your OpenLink Drivers for JDBC on an
Application Server and then install your OpenLink Data Access Server
components (Request Broker and Database Agents) on your dedicated
database server machine. In such a scenario, you will be connecting to
your remote database engine using OpenLink Database Independent
networking as opposed to your Database vendor's database specific
networking middleware. Please note that you would need the OpenLink
server components installed on both the application server and the
database server in this scenario.

If you were connecting from an Application Server called "pluto" to a
dedicated Database Server machine named "ora_server", hosting an Oracle
8i database identified as "ORCL" you would construct the following JDBC
URL:

``` programlisting
jdbc:openlink://pluto/SVT=JDBC/HOST=ora_server/DATABASE=ORCL/UID=test/PWD=test
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
<li><p>This URL string assumes that you have already configured the
Generic JDBC client to point to the "Oracle 8.1.x" Server Type. This is
done via the Admin Assistant, under "Database Agent
Administration".</p></li>
<li><p>You could also have used the "/DSN" attribute to point to an ODBC
DSN which has been configured to connect to the Database Server machine.
This requires you to have configured an ODBC DSN on your Application
Server machine, but it removes the necessity to embed connection
attributes such as Database name and Username/Password in your URL
string.</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="mt_ConnectingToRemoteDBUsingDBComs" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting To Remote Databases On Separate Server Machine Using Database Vendor's Networking (Mixed 3-Tier Architecture)

</div>

</div>

</div>

Organizational standards or individual preference may present you with a
scenario in which you have two server machines in use: one acting as an
Application Server hosting your OpenLink Drivers for JDBC and OpenLink
Data Access Server components (Request Broker & Database Agents), and
the other acting as a dedicated Database Server. You may not have the
necessary authority to install the OpenLink Data Access Server
components on the Database Server, or you simply prefer to use your
database vendor's networking software which is already configured on
your Application Server. This scenario can be described as a "Mixed
3-Tier" architecture, as you are going to use your OpenLink Database
Agents atop database-vendor-provided networking, rather than connecting
to an OpenLink Database Agent using OpenLink Database-independent
networking. (Thus, no OpenLink server components would need to be
installed on your Application Server.)

If you were connecting to a remote Oracle 8i database somewhere on your
network from an application server called "pluto", you would construct
the following JDBC URL (assuming an existing TNS alias / Net\*8 server
alias, called "ora_pluto"):

``` programlisting
jdbc:openlink://pluto/SVT=Oracle 8.1.x/UID=test/PWD=test/OPTIONS=ora_pluto
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
point for connecting OpenLink Database agents to a Database vendor's
networking products. This applies to all supported OpenLink databases.
See the OpenLink Database Agents configuration guide for additional
information relating to the database-specific formats of values passed
to the "/OPTIONS" JDBC URL attribute.</p></li>
<li><p>You could also have used the "/DSN" attribute to point to an ODBC
DSN which has been configured to connect to the Database Server machine,
this simply reduces the size of your JDBC URL, but imposes the use of
DSNs upon you.</p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>
