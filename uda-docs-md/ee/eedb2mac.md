<div id="eedb2mac" class="sect1">

<div class="titlepage">

<div>

<div>

## 3.1. OpenLink ODBC Driver for DB2 (Express Edition) for Mac OS X

</div>

</div>

</div>

<div id="eedb2macinstall" class="sect2">

<div class="titlepage">

<div>

<div>

### 3.1.1. Installation Guide

</div>

</div>

</div>

The OpenLink ODBC Driver for DB2 (Express Edition) is distributed as a
Disk image (DMG) file. Simply double click on the disk image
'mul6edb2.dmg' to extract the installer mpkg file:

<div id="id34728" class="figure">

**Figure 3.1. InstallerA_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![InstallerA_DB2.png](images/InstallerA_DB2.png)

</div>

</div>

</div>

  

Double click on the mpkg file to run the installer and following the on
screen instruction as indicated below to complete the installation:

<div id="id34734" class="figure">

**Figure 3.2. InstallerB_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![InstallerB_DB2.png](images/InstallerB_DB2.png)

</div>

</div>

</div>

  

Installer Welcome Dialog for the OpenLink ODBC Driver for DB2 (Express
Edition):

<div id="id34740" class="figure">

**Figure 3.3. Installer1_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer1_DB2.png](images/Installer1_DB2.png)

</div>

</div>

</div>

  

Please review the readme file for installation requirements and known
issues:

<div id="id34746" class="figure">

**Figure 3.4. Installer2_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer2_DB2.png](images/Installer2_DB2.png)

</div>

</div>

</div>

  

Please read the software license agreement before continuing your
installation:

<div id="id34752" class="figure">

**Figure 3.5. Installer3_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer3_DB2.png](images/Installer3_DB2.png)

</div>

</div>

</div>

  

Select destination volume for driver installation:

<div id="id34758" class="figure">

**Figure 3.6. Installer5_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer5_DB2.png](images/Installer5_DB2.png)

</div>

</div>

</div>

  

Choose to perform a custom or default installation of the driver:

<div id="id34764" class="figure">

**Figure 3.7. Installer6_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer6_DB2.png](images/Installer6_DB2.png)

</div>

</div>

</div>

  

If you chose the custom option select which of the components below are
to be installed:

<div id="id34770" class="figure">

**Figure 3.8. InstallerC_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![InstallerC_DB2.png](images/InstallerC_DB2.png)

</div>

</div>

</div>

  

The software must be installed as a user with administrative privileges
on the machine:

<div id="id34776" class="figure">

**Figure 3.9. Installer7_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer7_DB2.png](images/Installer7_DB2.png)

</div>

</div>

</div>

  

After the driver has been installed you will be prompted for a license
file. If a license file already exists on the machine then select the
'use exisiting file' option. A trial (try) or full (buy) license can be
obtain by selecting the 'try and buy' option which loads our online try
and buy web page:

<div id="id34782" class="figure">

**Figure 3.10. Installer8_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer8_DB2.png](images/Installer8_DB2.png)

</div>

</div>

</div>

  

To obtain the trial license you must be a registered user on the
OpenLink Web site and login with the username (e-mail address) and
password for that user. Click on the 'Shop' link to visit our online
shop cart to purchases a full license if required:

<div id="id34788" class="figure">

**Figure 3.11. InstallerD_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![InstallerD_DB2.png](images/InstallerD_DB2.png)

</div>

</div>

</div>

  

Click on the 'download license' button to obtain the license file
immediately and save to your desktop. Alternatively an auto e-mail will
be sent to the registered users e-mail address with a link to their
OpenLink Data Space (ODS) where all trial and full license files will be
stored in the Briefcase for download at a later date.

<div id="id34794" class="figure">

**Figure 3.12. InstallerE_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![InstallerE_DB2.png](images/InstallerE_DB2.png)

</div>

</div>

</div>

  

Select the license file to be used for the installation:

<div id="id34800" class="figure">

**Figure 3.13. Installer10_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer10_DB2.png](images/Installer10_DB2.png)

</div>

</div>

</div>

  

Installation is complete:

<div id="id34806" class="figure">

**Figure 3.14. Installer11_DB2.png**

<div class="figure-contents">

<div class="mediaobject">

![Installer11_DB2.png](images/Installer11_DB2.png)

</div>

</div>

</div>

  

</div>

<div id="eedb2macconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 3.1.2. Configuration

</div>

</div>

</div>

To configure an ODBC DSN, run the OpenLink iODBC Administrator located
in the /Applications/iODBC folder:

<div id="id34814" class="figure">

**Figure 3.15. DSN0_AdminStart.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN0_AdminStart.png](images/DSN0_AdminStart.png)

</div>

</div>

</div>

  

Click on the add button to Choose the ODBC Driver the DSN should be
created for:

<div id="id34820" class="figure">

**Figure 3.16. DSN1_AdminStart.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN1_AdminStart.png](images/DSN1_AdminStart.png)

</div>

</div>

</div>

  

Choose the OpenLink DB2 Driver (Express Edition) v6.0 from the list of
available drivers:

<div id="id34826" class="figure">

**Figure 3.17. DSN3_SelectDB2Driver.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN3_SelectDB2Driver.png](images/DSN3_SelectDB2Driver.png)

</div>

</div>

</div>

  

In the Data Source tab, select a suitable DSN name and optional
description for the Data Source to be created:

<div id="id34832" class="figure">

**Figure 3.18. DSN5_DB2Name.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN5_DB2Name.png](images/DSN5_DB2Name.png)

</div>

</div>

</div>

  

The Connection Tab request the minimum paramters required to make a
connection to the target database:

<div id="id34838" class="figure">

**Figure 3.19. DSN7_DB2Host.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN7_DB2Host.png](images/DSN7_DB2Host.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- Host - the hostname of the server on which the DB2 database is running

- Port - the TCP port on which DB2 listens

- Database - a valid DB2 database alias

- Username - the username of a valid DB2 user

- Advanced - Additional optional configuration paramters:

</div>

<div id="id34854" class="table">

**Table 3.1. **

<div class="table-contents">

|                                                              |
|--------------------------------------------------------------|
| <span class="emphasis">*FullyMaterializeLobData*</span>      |
| <span class="emphasis">*ResultSetHoldability*</span>         |
| <span class="emphasis">*CliSchema*</span>                    |
| <span class="emphasis">*CurrentSchema*</span>                |
| <span class="emphasis">*CurrentSQLID*</span>                 |
| <span class="emphasis">*CurrentFunctionPath*</span>          |
| <span class="emphasis">*CurrentLockTimeout*</span>           |
| <span class="emphasis">*JdbcCollection*</span>               |
| <span class="emphasis">*CurrentPackageSet*</span>            |
| <span class="emphasis">*CurrentPackagePath*</span>           |
| <span class="emphasis">*SecurityMechanism*</span>            |
| <span class="emphasis">*KerberosServerPrincipal*</span>      |
| <span class="emphasis">*DeferPrepares*</span>                |
| <span class="emphasis">*ClientUser*</span>                   |
| <span class="emphasis">*ClientWorkstation*</span>            |
| <span class="emphasis">*ClientApplicationInformation*</span> |
| <span class="emphasis">*ClientAccountingInformation*</span>  |

</div>

</div>

  

As indiacted above the paramters of the options and preferences tabs are
not required for a basic connection:

<div id="id34927" class="figure">

**Figure 3.20. DSN10_DB2Options.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN10_DB2Options.png](images/DSN10_DB2Options.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Row Buffer Size*</span> - This attribute
  specifies the number of records to be transported over the network in
  a single network hop. Values can range from 1 to 99.

- <span class="emphasis">*Hide Login Dialog*</span> - Suppress the ODBC
  "Username" and "Password" login dialog box when interacting with your
  ODBC DSN from within an ODBC compliant application.

- <span class="emphasis">*Read Only connection*</span> - Specify whether
  the connection is to be "Read-only". Make sure the checkbox is
  unchecked to request a "Read/Write" connection.

- <span class="emphasis">*Drop Catalog from Meta calls*</span> - Enable
  this option to have the catalog name not appear for tables, views and
  procedures when requesting database meta-data.

- <span class="emphasis">*Drop Schema from Meta calls*</span> - Enable
  this option to have the schema-name not appear for tables, views and
  procedures when requesting database meta-data.

- <span class="emphasis">*SQLStatistics disabled*</span> - Check this
  box to have SQLStatistics() return an empty resultset. Use this if the
  underlying database does not support retrieving statistics about a
  table (e.g. what indexes there are on it).

- <span class="emphasis">*No support of quoted identifier*</span> - If
  it is set, the call SQLGetInfo <a
  href="/bin/edit/Main/SQLGetInfo?topicparent=Main.UdaEeInstallConfigDB2"
  class="ulink"
  target="_top">/bin/edit/Main/SQLGetInfo?topicparent=Main.UdaEeInstallConfigDB2</a>
  for 'SQL_IDENTIFIER_QUOTE_CHAR' will return the space (" "). It can be
  used if DBMS doesn't support quoted SQL like select \* from "account"

- <span class="emphasis">*No support of search string escape*</span> -
  If it is set, the call SQLGetInfo

  for 'SQL_LIKE_ESCAPE_CLAUSE' will return the space (" "). It can be
  used if DBMS doesn't support SQL escape patterns

- <span class="emphasis">*Patch of NULL size of SQL_CHAR*</span> - If
  set this option overrides the size of SQL_CHAR column type returned by
  the database with the value set in the text box (in bytes). With the
  default value of 0 the driver uses the size returned by the database.

- <span class="emphasis">*SQL_DBMS Name*</span> - Manually override the
  SQLGetInfo (SQL_DBMS_NAME) response returned by the driver. This is
  know to be required for products like Microsoft InfoPath for which the
  return the value should be "SQL Server".

</div>

<div id="id34965" class="figure">

**Figure 3.21. DSN11_DB2Preferences.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN11_DB2Preferences.png](images/DSN11_DB2Preferences.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Initialization SQL*</span> - Lets you specify
  a file containing SQL statements that will be run against the database
  upon connection, automatically.

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

- <span class="emphasis">*MaxRows Override*</span> - Allows you to
  define a limit on the maximum number of rows to returned from a query.
  The default value of 0 means no limit.

- <span class="emphasis">*Disable AutoCommit*</span> - Change the
  default commit behaviour of the OpenLink Lite Driver. The default mode
  is AutoCommit mode (box unchecked).

- <span class="emphasis">*Disable Rowset Size Limit*</span> - Disable
  the limitation enforced by the cursor library. The limitation is
  enforced by default to prevent the Driver claiming all available
  memory in the event that a resultset is generated from an erroneous
  query is very large. The limit is normally never reached.

- <span class="emphasis">*Defer fetching of long data*</span> - Defer
  fetching of LONG (BINARY, BLOB etc.) data unless explicitly requested
  in query. This provides significant performance increase when fields
  in query does not include LONG data fields.

- <span class="emphasis">*Multiple Active Statements Emulation*</span> -
  Enables use of Multiple Active statements in an ODBC application even
  if the underlying database does not allow this, as it is emulated in
  the driver.

</div>

Click on the 'Test Data Source' button to make a connection to the
database to verify connectivity:

<div id="id34993" class="figure">

**Figure 3.22. DSN12_DB2Test.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN12_DB2Test.png](images/DSN12_DB2Test.png)

</div>

</div>

</div>

  

Enter a vaild username and pasword for the database:

<div id="id34999" class="figure">

**Figure 3.23. DSN13_DB2Login.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN13_DB2Login.png](images/DSN13_DB2Login.png)

</div>

</div>

</div>

  

A successful connection to the database has been made:

<div id="id35005" class="figure">

**Figure 3.24. DSN14_DB2Success.png**

<div class="figure-contents">

<div class="mediaobject">

![DSN14_DB2Success.png](images/DSN14_DB2Success.png)

</div>

</div>

</div>

  

</div>

</div>
