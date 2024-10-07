<div id="eesysbasewin" class="sect1">

<div class="titlepage">

<div>

<div>

## 11.2. OpenLink ODBC Driver for Sybase (Express Editon) for Windows

</div>

</div>

</div>

<div id="eesybasewininst" class="sect2">

<div class="titlepage">

<div>

<div>

### 11.2.1. Installation

</div>

</div>

</div>

The OpenLink ODBCDriver for Sybase (Express Edition is a distributed as
a Windows MSI installer. Simply double click on the installer
'ntl6esql.msi' to commence the installation:

<div id="id40067" class="figure">

**Figure 11.26. EEWinsybinst01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst01.png](images/EEWinsybinst01.png)

</div>

</div>

</div>

  

Installer Welcome Dialog for the OpenLink ODBCDriver for SQLServer
(Express Edition):

<div id="id40074" class="figure">

**Figure 11.27. EEWinsybinst02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst02.png](images/EEWinsybinst02.png)

</div>

</div>

</div>

  

Please read the software license agreement and accept before continuing
your installation:

<div id="id40081" class="figure">

**Figure 11.28. EEWinsybinst03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst03.png](images/EEWinsybinst03.png)

</div>

</div>

</div>

  

Before installation you will be prompted for a license file. If a
license file already exists on the machine then select the 'use
exisiting file' option. A trial (try) or full (buy) license can be
obtain by selecting the 'try and buy' option which loads our online try
and buy web page:

<div id="id40088" class="figure">

**Figure 11.29. EEWinsybinst04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst04.png](images/EEWinsybinst04.png)

</div>

</div>

</div>

  

To obtain the trial license you must be a registered user on the
OpenLinkWeb site and login with the username (e-mail address) and
password for that user. Click on the 'Shop' link to visit our online
shop cart to purchases a full license if required:

Click on the 'download license' button to obtain the license file
immediately and save to your desktop. Alternatively an auto e-mail will
be sent to the registered users e-mail address with a link to their
OpenLinkData Space ( ODS) where all trial and full license files will be
stored in the Briefcase for download at a later date.

<div id="id40096" class="figure">

**Figure 11.30. EEWinsybinst05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst05.png](images/EEWinsybinst05.png)

</div>

</div>

</div>

  

Select the license file to be used for the installation:

<div id="id40103" class="figure">

**Figure 11.31. EEWinsybinst06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst06.png](images/EEWinsybinst06.png)

</div>

</div>

</div>

  

Choose to perform a custom, typical or complete installation of the
driver:

<div id="id40110" class="figure">

**Figure 11.32. EEWinsybinst07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst07.png](images/EEWinsybinst07.png)

</div>

</div>

</div>

  

Select the features to be installed:

<div id="id40117" class="figure">

**Figure 11.33. EEWinsybinst09.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst09.png](images/EEWinsybinst09.png)

</div>

</div>

</div>

  

Click the install button to begin the installation of components:

<div id="id40124" class="figure">

**Figure 11.34. EEWinsybinst10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst10.png](images/EEWinsybinst10.png)

</div>

</div>

</div>

  

Installation in progress:

<div id="id40131" class="figure">

**Figure 11.35. EEWinsybinst11.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst11.png](images/EEWinsybinst11.png)

</div>

</div>

</div>

  

The Software installation is complete and ready for use:

<div id="id40138" class="figure">

**Figure 11.36. EEWinsybinst12.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybinst12.png](images/EEWinsybinst12.png)

</div>

</div>

</div>

  

</div>

<div id="eesybasewinconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 11.2.2. Configuration

</div>

</div>

</div>

To configure an ODBCDSN, run the ODBCAdministrator located in the
Administrative Tools section of the Control Panel:

<div id="id40147" class="figure">

**Figure 11.37. EEWinsybconf01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf01.png](images/EEWinsybconf01.png)

</div>

</div>

</div>

  

Click on the drivers Tab to confirm the OpenLinkSQLServer ODBCDriver
\[Express Edition\]\[6.0\] has been successfully installed

<div id="id40154" class="figure">

**Figure 11.38. EEWinsybconf02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf02.png](images/EEWinsybconf02.png)

</div>

</div>

</div>

  

From either the User or System DSN tabs click on the Add button and
select the OpenLinkSQLServer ODBCDriver \[Express Edition\]\[6.0\] from
the list presented to create an ODBCDSN :

<div id="id40161" class="figure">

**Figure 11.39. EEWinsybconf03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf03.png](images/EEWinsybconf03.png)

</div>

</div>

</div>

  

In the Data Source tab, select a suitable DSN name and optional
description for the Data Source to be created:

<div id="id40168" class="figure">

**Figure 11.40. EEWinsybconf04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf04.png](images/EEWinsybconf04.png)

</div>

</div>

</div>

  

The Connection Tab request the minimum paramters required to make a
connection to the target database:

<div id="id40175" class="figure">

**Figure 11.41. EEWinsybconf05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf05.png](images/EEWinsybconf05.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Server Type*</span> : This paramter should be
  set to Sybase which can be selected from th drop down list box

</div>

<div class="itemizedlist">

- <span class="emphasis">*Host*</span> : This is the fully qualified
  hostname, or IP address, of the machine hosting the DBMS you wish to
  access, e.g., dbms-server.example.com, or 192.168.155.123. Any
  hostname which will be resolved by your local DNS is acceptable.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Port*</span> : This is the port that SQL
  Server is listening on

</div>

<div class="itemizedlist">

- <span class="emphasis">*Database*</span> : This is the SQL Server
  database that you want to connect to

</div>

<div class="itemizedlist">

- <span class="emphasis">*Login ID*</span> : This is a valid user on for
  the SQL Server Database

</div>

<div class="itemizedlist">

- <span class="emphasis">*Password*</span> : Enter valid password and
  click next to verify that all settings are correct or uncheck check
  box to delay this to a later stage.

</div>

The advanced button displays additional optional parameters that can be
configured:

<div id="id40206" class="figure">

**Figure 11.42. EEWinsybconf06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf06.png](images/EEWinsybconf06.png)

</div>

</div>

</div>

  

<div id="id40211" class="table">

**Table 11.2. **

<div class="table-contents">

|                                                               |
|---------------------------------------------------------------|
| <span class="emphasis">*Tds*</span>                           |
| <span class="emphasis">*Cachemetadata*</span>                 |
| <span class="emphasis">*Charset*</span>                       |
| <span class="emphasis">*Language*</span>                      |
| <span class="emphasis">*Domain*</span>                        |
| <span class="emphasis">*Instance*</span>                      |
| <span class="emphasis">*AppName*</span>                       |
| <span class="emphasis">*ProgName*</span>                      |
| <span class="emphasis">*Wsid*</span>                          |
| <span class="emphasis">*MacAddress*</span>                    |
| <span class="emphasis">*SendStringParametersAsUnicode*</span> |
| <span class="emphasis">*LastUpdateCount*</span>               |
| <span class="emphasis">*PrepareSQL*</span>                    |
| <span class="emphasis">*PacketSize*</span>                    |
| <span class="emphasis">*TcpNoDelay*</span>                    |
| <span class="emphasis">*LobBuffer*</span>                     |
| <span class="emphasis">*MaxStatements*</span>                 |
| <span class="emphasis">*LoginTimeout*</span>                  |
| <span class="emphasis">*SocketTimeout*</span>                 |
| <span class="emphasis">*NamedPipe*</span>                     |
| <span class="emphasis">*Ssl*</span>                           |
| <span class="emphasis">*BatchSize*</span>                     |
| <span class="emphasis">*UseCursors*</span>                    |
| <span class="emphasis">*BufferMaxMemory*</span>               |
| <span class="emphasis">*BufferMinPackets*</span>              |
| <span class="emphasis">*UseLOBs*</span>                       |

</div>

</div>

  

As indiacted above the paramters of the options and preferences tabs are
not required for a basic connection.

<div id="id40321" class="figure">

**Figure 11.43. EEWinsybconf07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf07.png](images/EEWinsybconf07.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Row Buffer Size*</span> - This attribute
  specifies the number of records to be transported over the network in
  a single network hop. Values can range from 1 to 99.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Hide Login Dialog*</span> - Suppress the ODBC
  "Username" and "Password" login dialog box when interacting with your
  ODBC DSN from within an ODBC compliant application.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Read Only connection*</span> - Specify whether
  the connection is to be "Read-only". Make sure the checkbox is
  unchecked to request a "Read/Write" connection.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Drop Catalog from Meta calls*</span> - Enable
  this option to have the catalog name not appear for tables, views and
  procedures when requesting database meta-data.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Drop Schema from Meta calls*</span> - Enable
  this option to have the schema-name not appear for tables, views and
  procedures when requesting database meta-data.

</div>

<div class="itemizedlist">

- <span class="emphasis">*SQLStatistics disabled*</span> - Check this
  box to have SQLStatistics() return an empty resultset. Use this if the
  underlying database does not support retrieving statistics about a
  table (e.g. what indexes there are on it).

</div>

<div class="itemizedlist">

- <span class="emphasis">*No support of quoted identifier*</span> - If
  it is set, the call SQLGetInfo for 'SQL_IDENTIFIER_QUOTE_CHAR' will
  return the space (" "). It can be used if DBMS doesn't support quoted
  SQL like select \* from "account"

</div>

<div class="itemizedlist">

- <span class="emphasis">*No support of search string escape*</span> -
  If it is set, the call SQLGetInfo for 'SQL_LIKE_ESCAPE_CLAUSE' will
  return the space (" "). It can be used if DBMS doesn't support SQL
  escape patterns

</div>

<div class="itemizedlist">

- <span class="emphasis">*Patch of NULL size of SQL_CHAR*</span> - If
  set this option overrides the size of SQL_CHAR column type returned by
  the database with the value set in the text box (in bytes). With the
  default value of 0 the driver uses the size returned by the database.

</div>

<div class="itemizedlist">

- <span class="emphasis">*SQL_DBMS Name*</span> - Manually override the
  SQLGetInfo(SQL_DBMS_NAME) response returned by the driver. This is
  know to be required for products like Microsoft InfoPath for which the
  return the value should be "SQL Server".

</div>

<div id="id40367" class="figure">

**Figure 11.44. EEWinsybconf08.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf08.png](images/EEWinsybconf08.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Initialization SQL*</span> - Lets you specify
  a file containing SQL statements that will be run against the database
  upon connection, automatically.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Cursor Sensitivity*</span> - Enables or
  disables the row version cache used with dynamic cursors. When dynamic
  cursor sensitivity is set high, the Cursor Library calculates
  checksums for each row in the current rowset and compares these with
  the checksums (if any) already stored in the row version cache for the
  same rows when fetched previously. If the checksums differ for a row,
  the row has been updated since it was last fetched and the row status
  flag is set to SQL_ROW_UPDATED. The row version cache is then updated
  with the latest checksums for the rowset. From the user's point of
  view, the only visible difference between the two sensitivity settings
  is that a row status flag can never be set to SQL_ROW_UPDATED when the
  cursor sensitivity is low. (The row status is instead displayed as
  SQL_ROW_SUCCESS.) In all other respects, performance aside, the two
  settings are the same - deleted rows don't appear in the rowset,
  updates to the row since the row was last fetched are reflected in the
  row data, and inserted rows appear in the rowset if their keys fall
  within the span of the rowset. If your application does not need to
  detect the row status SQL_ROW_UPDATED, you should leave the 'High
  Cursor Sensitivity' checkbox unchecked, as performance is improved.
  The calculation and comparison of checksums for each row fetched
  carries an overhead. If this option is enabled, the table oplrvc must
  have been created beforehand using the appropriate script for the
  target database.

</div>

<div class="itemizedlist">

- <span class="emphasis">*MaxRows Override*</span> - Allows you to
  define a limit on the maximum number of rows to returned from a query.
  The default value of 0 means no limit.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Defer fetching of long data*</span> - Defer
  fetching of LONG (BINARY, BLOB etc.) data unless explicitly requested
  in query. This provides significant performance increase when fields
  in query does not include LONG data fields.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Multiple Active Statements Emulation*</span> -
  Enables use of Multiple Active statements in an ODBC application even
  if the underlying database does not allow this, as it is emulated in
  the driver.

</div>

<div id="id40393" class="figure">

**Figure 11.45. EEWinsybconf09.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf09.png](images/EEWinsybconf09.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Disable AutoCommit*</span> - Change the
  default commit behaviour of the OpenLink Lite Driver. The default mode
  is AutoCommit mode (box unchecked).

</div>

<div class="itemizedlist">

- <span class="emphasis">*Disable Rowset Size Limit*</span> - Disable
  the limitation enforced by the cursor library. The limitation is
  enforced by default to prevent the Driver claiming all available
  memory in the event that a resultset is generated from an erroneous
  query is very large. The limit is normally never reached.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Multiple Active Statements Emulation*</span> -
  Enables use of Multiple Active statements in an ODBC application even
  if the underlying database does not allow this, as it is emulated in
  the driver.

</div>

Click on the <span class="emphasis">*Test Data Source*</span>button to
verfiy successful connection can be made to the database.

<div id="id40413" class="figure">

**Figure 11.46. EEWinsybconf10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWinsybconf10.png](images/EEWinsybconf10.png)

</div>

</div>

</div>

  

</div>

</div>
