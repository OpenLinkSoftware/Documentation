<div id="eeinformixwin" class="sect1">

<div class="titlepage">

<div>

<div>

## 5.2. OpenLink ODBC Driver for Informix (Express Edition) for Windows

</div>

</div>

</div>

<div id="eeinformixwininst" class="sect2">

<div class="titlepage">

<div>

<div>

### 5.2.1. Installation

</div>

</div>

</div>

The OpenLink ODBCDriver for Informix (Express Edition) is a distributed
as a Windows MSI installer. Simply double click on the installer
'ntl6einf.msi' to commence the installation:

<div id="id36304" class="figure">

**Figure 5.25. EEWininfinst01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst01.png](images/EEWininfinst01.png)

</div>

</div>

</div>

  

Installer Welcome Dialog for the OpenLink ODBCDriver for Informix
(Express Edition):

<div id="id36311" class="figure">

**Figure 5.26. EEWininfinst02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst02.png](images/EEWininfinst02.png)

</div>

</div>

</div>

  

Please read the software license agreement and accept before continuing
your installation:

<div id="id36318" class="figure">

**Figure 5.27. EEWininfinst03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst03.png](images/EEWininfinst03.png)

</div>

</div>

</div>

  

Before installation you will be prompted for a license file. If a
license file already exists on the machine then select the 'use existing
file' option. A trial (try) or full (buy) license can be obtain by
selecting the 'try and buy' option which loads our online try and buy
web page:

<div id="id36325" class="figure">

**Figure 5.28. EEWininfinst04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst04.png](images/EEWininfinst04.png)

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

<div id="id36333" class="figure">

**Figure 5.29. EEWininfinst05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst05.png](images/EEWininfinst05.png)

</div>

</div>

</div>

  

Select the license file to be used for the installation:

<div id="id36340" class="figure">

**Figure 5.30. EEWininfinst06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst06.png](images/EEWininfinst06.png)

</div>

</div>

</div>

  

Choose to perform a custom, typical or complete installation of the
driver:

<div id="id36347" class="figure">

**Figure 5.31. EEWininfinst07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst07.png](images/EEWininfinst07.png)

</div>

</div>

</div>

  

Select the features to be installed:

<div id="id36354" class="figure">

**Figure 5.32. EEWininfinst09.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst09.png](images/EEWininfinst09.png)

</div>

</div>

</div>

  

Click the install button to begin the installation of components:

<div id="id36361" class="figure">

**Figure 5.33. EEWininfinst10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst10.png](images/EEWininfinst10.png)

</div>

</div>

</div>

  

Installation in progress:

<div id="id36368" class="figure">

**Figure 5.34. EEWininfinst11.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst11.png](images/EEWininfinst11.png)

</div>

</div>

</div>

  

The Software installation is complete and ready for use:

<div id="id36375" class="figure">

**Figure 5.35. EEWininfinst12.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfinst12.png](images/EEWininfinst12.png)

</div>

</div>

</div>

  

</div>

<div id="eeinformixwinconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 5.2.2. Configuration

</div>

</div>

</div>

To configure an ODBCDSN, run the ODBCAdministrator located in the
Administrative Tools section of the Control Panel:

<div id="id36384" class="figure">

**Figure 5.36. EEWininfconf01.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf01.png](images/EEWininfconf01.png)

</div>

</div>

</div>

  

Click on the drivers Tab to confirm the OpenLinkSQLServer ODBCDriver
\[Express Edition\]\[6.0\] has been successfully installed

<div id="id36391" class="figure">

**Figure 5.37. EEWininfconf02.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf02.png](images/EEWininfconf02.png)

</div>

</div>

</div>

  

From either the User or System DSN tabs click on the Add button and
select the OpenLinkSQLServer ODBCDriver \[Express Edition\]\[6.0\] from
the list presented to create an ODBCDSN :

<div id="id36398" class="figure">

**Figure 5.38. EEWininfconf03.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf03.png](images/EEWininfconf03.png)

</div>

</div>

</div>

  

In the Data Source tab, select a suitable DSN name and optional
description for the Data Source to be created:

<div id="id36405" class="figure">

**Figure 5.39. EEWininfconf04.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf04.png](images/EEWininfconf04.png)

</div>

</div>

</div>

  

The Connection Tab request the minimum paramters required to make a
connection to the target database:

<div id="id36412" class="figure">

**Figure 5.40. EEWininfconf05.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf05.png](images/EEWininfconf05.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Host*</span> : This is the fully qualified
  hostname, or IP address, of the machine hosting the DBMS you wish to
  access, e.g., dbms-server.example.com, or 192.168.155.123. Any
  hostname which will be resolved by your local DNS is acceptable.

</div>

<div class="itemizedlist">

- <span class="emphasis">*Port*</span> : This is the port that Informix
  is listening on

</div>

<div class="itemizedlist">

- <span class="emphasis">*Database*</span> : This is the name of the
  database

</div>

<div class="itemizedlist">

- <span class="emphasis">*Database Server*</span> : This is the name of
  the database server

</div>

<div class="itemizedlist">

- <span class="emphasis">*Login ID*</span> : This is a valid user on for
  the Informix Database

</div>

<div class="itemizedlist">

- <span class="emphasis">*Password*</span> : Enter valid password and
  click next to verify that all settings are correct or uncheck check
  box to delay this to a later stage.

</div>

The advanced button displays additional optional parameters that can be
configured:

<div id="id36443" class="figure">

**Figure 5.41. EEWininfconf06.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf06.png](images/EEWininfconf06.png)

</div>

</div>

</div>

  

<div id="id36448" class="table">

**Table 5.2. **

<div class="table-contents">

|                                                             |
|-------------------------------------------------------------|
| <span class="emphasis">*IfxPORTNO_SECONDARY*</span>         |
| <span class="emphasis">*IfxIFXHOST_SECONDARY*</span>        |
| <span class="emphasis">*IfxINFORMIXSERVER_SECONDARY*</span> |
| <span class="emphasis">*IfxENABLE_HDRSWITCH*</span>         |
| <span class="emphasis">*IfxJDBCTEMP*</span>                 |
| <span class="emphasis">*IfxSECURITY*</span>                 |
| <span class="emphasis">*IfxPROXY*</span>                    |
| <span class="emphasis">*IfxSQLH_TYPE*</span>                |
| <span class="emphasis">*IfxSQLH_FILE*</span>                |
| <span class="emphasis">*IfxLDAP_URL*</span>                 |
| <span class="emphasis">*IfxLDAP_IFXBASE*</span>             |
| <span class="emphasis">*IfxLDAP_USER*</span>                |
| <span class="emphasis">*IfxLDAP_PASSWD*</span>              |
| <span class="emphasis">*IfxSQLH_LOC*</span>                 |
| <span class="emphasis">*IfxFET_BUF_SIZE*</span>             |
| <span class="emphasis">*IfxBIG_FET_BUF_SIZE*</span>         |
| <span class="emphasis">*IfxUSEV5SERVER*</span>              |
| <span class="emphasis">*IfxLOBCACHE*</span>                 |
| <span class="emphasis">*IfxIFX_USEPUT*</span>               |
| <span class="emphasis">*IfxDELIMIDENT*</span>               |
| <span class="emphasis">*IfxINFORMIXSTACKSIZE*</span>        |
| <span class="emphasis">*IfxDBSPACETEMP*</span>              |
| <span class="emphasis">*IfxDB_LOCALE*</span>                |
| <span class="emphasis">*IfxCLIENT_LOCALE*</span>            |
| <span class="emphasis">*IfxDBDATE*</span>                   |
| <span class="emphasis">*IfxGL_DATE*</span>                  |
| <span class="emphasis">*IfxDBCENTURY*</span>                |
| <span class="emphasis">*IfxSTMT_CACHE*</span>               |
| <span class="emphasis">*IfxNODEFDAC*</span>                 |
| <span class="emphasis">*IfxDBTEMP*</span>                   |
| <span class="emphasis">*IfxPSORT_DBTEMP*</span>             |
| <span class="emphasis">*IfxPSORT_NPROCS*</span>             |
| <span class="emphasis">*IfxDBUPSPACE*</span>                |
| <span class="emphasis">*IfxPDQPRIORITY*</span>              |
| <span class="emphasis">*IfxIFX_DIRECTIVES*</span>           |
| <span class="emphasis">*IfxIFX_EXTDIRECTIVES*</span>        |
| <span class="emphasis">*IfxOPTCOMPIND*</span>               |
| <span class="emphasis">*IfxINFORMIXCONRETRY*</span>         |
| <span class="emphasis">*IfxINFORMIXCONTIME*</span>          |
| <span class="emphasis">*IfxINFORMIXOPCACHE*</span>          |
| <span class="emphasis">*IfxPLCONFIG*</span>                 |
| <span class="emphasis">*IfxPATH*</span>                     |
| <span class="emphasis">*IfxPLOAD_LO_PATH*</span>            |
| <span class="emphasis">*IfxOPT_GOAL*</span>                 |
| <span class="emphasis">*IfxDBANSIWARN*</span>               |
| <span class="emphasis">*IfxIFX_CODESETLOB*</span>           |
| <span class="emphasis">*IfxIFX_LOCK_MODE_WAIT*</span>       |
| <span class="emphasis">*IfxIFX_ISOLATION_LEVEL*</span>      |

</div>

</div>

  

As indicated above the paramters of the options and preferences tabs are
not required for a basic connection.

<div id="id36648" class="figure">

**Figure 5.42. EEWininfconf07.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf07.png](images/EEWininfconf07.png)

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

<div id="id36694" class="figure">

**Figure 5.43. EEWininfconf08.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf08.png](images/EEWininfconf08.png)

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

<div id="id36720" class="figure">

**Figure 5.44. EEWininfconf09.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf09.png](images/EEWininfconf09.png)

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
verify successful connection can be made to the database.

<div id="id36740" class="figure">

**Figure 5.45. EEWininfconf10.png**

<div class="figure-contents">

<div class="mediaobject">

![EEWininfconf10.png](images/EEWininfconf10.png)

</div>

</div>

</div>

  

</div>

</div>
