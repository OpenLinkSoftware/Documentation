<div id="eedb2win" class="sect1">

<div class="titlepage">

<div>

<div>

## 3.2. OpenLink ODBC Driver for DB2 (Express Edition) for Windows

</div>

</div>

</div>

<div id="eedb2wininst" class="sect2">

<div class="titlepage">

<div>

<div>

### 3.2.1. Installation

</div>

</div>

</div>

The OpenLink ODBCDriver for DB2 (Express Edition) is distributed as a
Windows MSI installer. Simply double click the installer 'ntl6edb2.msi'
to commence the installation:

<div id="id35016" class="figure">

**Figure 3.25. EEWindb2inst00.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst00.png](images/EEWindb2inst00.png)

</div>

</div>

</div>

  

Installer Welcome Dialog for the OpenLink ODBCDriver for DB2 (Express
Edition):

<div id="id35023" class="figure">

**Figure 3.26. EEWindb2inst01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst01.png](images/EEWindb2inst01.png)

</div>

</div>

</div>

  

Please read the software license agreement and accept before continuing
your installation:

<div id="id35030" class="figure">

**Figure 3.27. EEWindb2inst02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst02.png](images/EEWindb2inst02.png)

</div>

</div>

</div>

  

Before installation, you will be prompted for a license file. If a
license file already exists on the machine, then select the 'use
exisiting file' option. A trial (try) or full (buy) license can be
obtained by selecting the 'try and buy' option which loads OpenLink's
online try and buy web page:

<div id="id35037" class="figure">

**Figure 3.28. EEWindb2inst03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst03.png](images/EEWindb2inst03.png)

</div>

</div>

</div>

  

To obtain the trial license, you must be a registered user on the
OpenLinkWeb site and login with the username (e-mail address) and
password for that user name. Click on the 'Shop' link to visit
OpenLink's online shop cart to purchase a full license, if required.

Click on the 'download license' button to immediately obtain the license
file and save it to your desktop. Alternatively, an auto-generated
e-mail will be sent to your registered user e-mail address with a link
to your OpenLinkData Space ( ODS), which contains all trial and full
licenses in the Briefcase for download at a later date.

<div id="id35045" class="figure">

**Figure 3.29. EEWindb2inst04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst04.png](images/EEWindb2inst04.png)

</div>

</div>

</div>

  

Select the license file to be used for the installation:

<div id="id35052" class="figure">

**Figure 3.30. EEWindb2inst05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst05.png](images/EEWindb2inst05.png)

</div>

</div>

</div>

  

Choose to perform a custom, typical or complete installation of the
driver:

<div id="id35059" class="figure">

**Figure 3.31. EEWindb2inst06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst06.png](images/EEWindb2inst06.png)

</div>

</div>

</div>

  

Select the features to be installed:

<div id="id35066" class="figure">

**Figure 3.32. EEWindb2inst07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst07.png](images/EEWindb2inst07.png)

</div>

</div>

</div>

  

Click the install button to begin installation of the components:

<div id="id35073" class="figure">

**Figure 3.33. EEWindb2inst12.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst12.png](images/EEWindb2inst12.png)

</div>

</div>

</div>

  

Installation in progress:

<div id="id35080" class="figure">

**Figure 3.34. EEWindb2inst11.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst11.png](images/EEWindb2inst11.png)

</div>

</div>

</div>

  

The software installation is complete and ready for use:

<div id="id35087" class="figure">

**Figure 3.35. EEWindb2inst10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2inst10.png](images/EEWindb2inst10.png)

</div>

</div>

</div>

  

</div>

<div id="eedb2winconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 3.2.2. Configuration

</div>

</div>

</div>

To configure an ODBCDSN, run the ODBCAdministrator located in the
Administrative Tools section of the Control Panel:

<div id="id35096" class="figure">

**Figure 3.36. EEWindb2conf01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf01.png](images/EEWindb2conf01.png)

</div>

</div>

</div>

  

Click on the Drivers tab to confirm the OpenLinkDB2 ODBCDriver \[Express
Edition\]\[6.0\] has been successfully installed:

<div id="id35103" class="figure">

**Figure 3.37. EEWindb2conf02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf02.png](images/EEWindb2conf02.png)

</div>

</div>

</div>

  

From either the User or System DSN tabs, click on the Add button and
select the OpenLinkDB2 ODBCDriver \[Express Edition\]\[6.0\] from the
list presented:

<div id="id35110" class="figure">

**Figure 3.38. EEWindb2conf03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf03.png](images/EEWindb2conf03.png)

</div>

</div>

</div>

  

In the Data Source tab, select a suitable DSN name and optional
description for the Data Source to be created:

<div id="id35117" class="figure">

**Figure 3.39. EEWindb2conf04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf04.png](images/EEWindb2conf04.png)

</div>

</div>

</div>

  

The Connection tab requests the minimum parameters required to make a
connection to the target database:

<div id="id35124" class="figure">

**Figure 3.40. EEWindb2conf05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf05.png](images/EEWindb2conf05.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Host*</span> : This is the fully qualified
  hostname or IP address of the machine hosting the DBMS you wish to
  access, e.g., dbms-server.example.com, or 192.168.155.123. Any
  hostname which will be resolved by your local DNS is acceptable.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Port*</span> : This is the port on which DB2
  is listening

</div>

<div class="itemizedlist">

- <span class="emphasis">*Database*</span> : This is the name of a valid
  DB2 database alias to which you want to connect

</div>

<div class="itemizedlist">

- <span class="emphasis">*Login ID*</span> : This is a valid user for
  the DB2 database

</div>

<div class="itemizedlist">

- <span class="emphasis">*Password*</span> : This is a valid password
  for the DB2 database

</div>

Click next to verify that all settings are correct or uncheck the check
box to delay testing to a later stage.

The advanced button displays additional optional parameters that can be
configured:

<div id="id35152" class="figure">

**Figure 3.41. EEWindb2conf06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf06.png](images/EEWindb2conf06.png)

</div>

</div>

</div>

  

<div id="id35157" class="table">

**Table 3.2. **

<div class="table-contents">

|                              |
|------------------------------|
| FullyMaterializeLobData      |
| ResultSetHoldability         |
| CLiSchema                    |
| CurrentSchema                |
| CurrentSQLID                 |
| CurrentFunctionPath          |
| CurrentLockTimeout           |
| JdbcCollection               |
| CurrentPackageSet            |
| CurrentPackagePath           |
| SecurityMechanism            |
| KerberosServerPrincipal      |
| DeferPrepares                |
| ClientUser                   |
| ClientWorkstation            |
| ClientApplicationInformation |
| ClientAccountingInformation  |

</div>

</div>

  

As indicated above, the parameters on the options and preferences tabs
are not required for a basic connection.

<div id="id35214" class="figure">

**Figure 3.42. EEWindb2conf07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf07.png](images/EEWindb2conf07.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Drop Catalog name from DatabaseMetaData
  calls*</span> - Enable this option to have the catalog name not appear
  for tables, views, and procedures when requesting database meta-data.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Drop Schema name from DatabaseMetaData
  calls*</span> - Enable this option to have the schema-name not appear
  for tables, views, and procedures when requesting database meta-data.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Return an empty ResultSet for
  SQLStatistics*</span> - Check this box to have SQLStatistics() return
  an empty resultset. Use this if the underlying database does not
  support retrieving statistics about a table, e.g., what indexes there
  are on it.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Disable support of quoted identifier*</span> -
  If it is set, the call SQLGetInfo for 'SQL_IDENTIFIER_QUOTE_CHAR' will
  return the space (" "). It can be used if the DBMS does not support
  quoted SQL, e.g., select \* from "account."

</div>

<div class="itemizedlist">

- <span class="emphasis">*Disable support of search pattern
  escape*</span> - If it is set, the call SQLGetInfo for
  'SQL_LIKE_ESCAPE_CLAUSE' will return the space (" "). It can be used
  if the DBMS does not support SQL escape patterns.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Patch of NULL size of SQL_CHAR*</span> - If
  set, this option overrides the size of SQL_CHAR column type returned
  by the database with the value set in the text box (in bytes). With
  the default value of 0, the driver uses the size returned by the
  database.

</div>

<div id="id35244" class="figure">

**Figure 3.43. EEWindb2conf08.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf08.png](images/EEWindb2conf08.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Read Only connection*</span> - Specify whether
  the connection is to be "Read-only". Make sure the checkbox is
  unchecked to request a "Read/Write" connection

</div>

<div class="itemizedlist">

- <span class="emphasis">*Disable Interactive Login*</span> - Suppress
  the ODBC "Username" and "Password" login dialog box when interacting
  with your ODBC DSN from within an ODBC compliant application.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Row Buffer Size*</span> - This attribute
  specifies the number of records to be transported over the network in
  a single network hop. Values can range from 1 to 99.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Max rows override*</span> - Allows you to
  define a limit on the maximum number of rows to be returned from a
  query. The default value of 0 means no limit.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Initial SQL*</span> - Lets you specify a file
  containing SQL statements that will be automatically run against the
  database upon connection.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Dynamic Cursor Sensitivity*</span> - Enables
  or disables the row version cache used with dynamic cursors. When
  dynamic cursor sensitivity is set high, the Cursor Library calculates
  checksums for each row in the current rowset and compares these with
  the checksums (if any) already stored in the row version cache for the
  same rows when fetched previously. If the checksums differ for a row,
  the row has been updated since it was last fetched, and the row status
  flag is set to SQL_ROW_UPDATED. The row version cache is then updated
  with the latest checksums for the rowset. From the user's point of
  view, the only visible difference between the two sensitivity settings
  is that a row status flag can never be set to SQL_ROW_UPDATED, when
  the cursor sensitivity is low. (The row status is instead displayed as
  SQL_ROW_SUCCESS.) In all other respects, performance aside, the two
  settings are the same - deleted rows do not appear in the rowset,
  updates to the row since the row was last fetched are reflected in the
  row data, and inserted rows appear in the rowset if their keys fall
  within the span of the rowset. If your application does not need to
  detect the row status SQL_ROW_UPDATED, you should leave the 'High
  Cursor Sensitivity' checkbox unchecked, as performance is improved.
  The calculation and comparison of checksums for each row fetched
  carries an overhead. If this option is enabled, the table oplrvc must
  have been created beforehand using the appropriate OpenLink script for
  the target database.

</div>

\* <span class="emphasis">*Enable logging to the log file:*</span>-
Specifies the full path to a text file. If the associated checkbox is
checked, and a file is passed, the driver will log auto-generate a
clientside ODBCtrace.

<div id="id35276" class="figure">

**Figure 3.44. EEWindb2conf09.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf09.png](images/EEWindb2conf09.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Disable AutoCommit*</span> - Change the
  default commit behaviour of the OpenLink Driver. The default mode is
  AutoCommit (box unchecked).

</div>

<div class="itemizedlist">

- <span class="emphasis">*Disable Rowset Size Limit*</span> - Disable
  the limitation enforced by the cursor library. The limitation is
  enforced by default to prevent the Driver claiming all available
  memory in the event that a resultset generated from an erroneous query
  is very large. The limit is normally never reached.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Multiple Active Statements Emulation*</span> -
  Enables use of Multiple Active statements in an ODBC application even
  if the underlying database does not allow this, as it is emulated in
  the driver.

</div>

<div class="itemizedlist">

- <span class="emphasis">*SQL_DBMS Name*</span> - Manually override the
  SQLGetInfo(SQL_DBMS_NAME) response returned by the driver. This is
  required for products like Microsoft InfoPath for which the return
  value must be "SQL Server".

</div>

Click on the <span class="emphasis">*Test Data Source*</span>button to
verify that a successful connection can be made to the database.

<div id="id35300" class="figure">

**Figure 3.45. EEWindb2conf10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWindb2conf10.png](images/EEWindb2conf10.png)

</div>

</div>

</div>

  

</div>

</div>
