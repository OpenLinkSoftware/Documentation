<div id="eefirebirdrwin" class="sect1">

<div class="titlepage">

<div>

<div>

## 4.1. OpenLink ODBC Driver for Firebird (Express Edition) for Mac OS X

</div>

</div>

</div>

<div id="eefirebirdmacinst" class="sect2">

<div class="titlepage">

<div>

<div>

### 4.1.1. Installation Guide

</div>

</div>

</div>

The OpenLink ODBC Driver for Firebird (Express Edition) is distributed
as a Disk image (DMG) file. Simply double click on the disk image
'mul6efrb.dmg' to extract the installer mpkg file:

<div id="id35312" class="figure">

**Figure 4.1. ee-frb-00.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-00.png](images/ee-frb-00.png)

</div>

</div>

</div>

  

Double click on the mpkg file to run the installer and following the on
screen instriuction as indicated below to complete the installation:

<div id="id35318" class="figure">

**Figure 4.2. ee-frb-01.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-01.png](images/ee-frb-01.png)

</div>

</div>

</div>

  

Installer Welcome Dialog for the OpenLink ODBC Driver for Firebird
(Express Edition):

<div id="id35324" class="figure">

**Figure 4.3. ee-frb-02.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-02.png](images/ee-frb-02.png)

</div>

</div>

</div>

  

Please review the readme file for installation requirements and known
issues:

<div id="id35330" class="figure">

**Figure 4.4. ee-frb-03.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-03.png](images/ee-frb-03.png)

</div>

</div>

</div>

  

Please read the software license agreement before continuing your
installation:

<div id="id35336" class="figure">

**Figure 4.5. ee-frb-04.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-04.png](images/ee-frb-04.png)

</div>

</div>

</div>

  

Select destination volume for driver installation:

<div id="id35342" class="figure">

**Figure 4.6. ee-frb-05.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-05.png](images/ee-frb-05.png)

</div>

</div>

</div>

  

Choose to perform a custome or default installation of the driver:

<div id="id35348" class="figure">

**Figure 4.7. ee-frb-06.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-06.png](images/ee-frb-06.png)

</div>

</div>

</div>

  

If you chose the custom option select which of the components below are
to be installed:

<div id="id35354" class="figure">

**Figure 4.8. ee-frb-07.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-07.png](images/ee-frb-07.png)

</div>

</div>

</div>

  

The Software must be installed as a user with Administrative privileges
on the machine:

<div id="id35360" class="figure">

**Figure 4.9. ee-frb-08.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-08.png](images/ee-frb-08.png)

</div>

</div>

</div>

  

After the driver has been installed you will be prompted for a license
file. If a license file already exists on the machine then select the
'use exisiting file' option. A trial (try) or full (buy) license can be
obtain by selecting the 'try and buy' option which loads our online try
and buy web page:

<div id="id35366" class="figure">

**Figure 4.10. ee-frb-09.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-09.png](images/ee-frb-09.png)

</div>

</div>

</div>

  

To obtain the trial license you must be a registered user on the
OpenLink Web site and login with the username (e-mail address) and
password for that user. Click on the 'Shop' link to visit our online
shop cart to purchases a full license if required:

<div id="id35372" class="figure">

**Figure 4.11. ee-frb-10.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-10.png](images/ee-frb-10.png)

</div>

</div>

</div>

  

Click on the 'download license' button to obtain the license file
immediately and save to your desktop. Alternatively an auto e-mail will
be sent to the registered users e-mail address with a link to their
OpenLink Data Space (ODS) where all trial and full license files will be
stored in the Briefcase for download at a later date.

<div id="id35378" class="figure">

**Figure 4.12. ee-frb-11.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-11.png](images/ee-frb-11.png)

</div>

</div>

</div>

  

Select the license file to be used for the installation:

<div id="id35384" class="figure">

**Figure 4.13. ee-frb-12.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-12.png](images/ee-frb-12.png)

</div>

</div>

</div>

  

Installation is complete:

<div id="id35390" class="figure">

**Figure 4.14. ee-frb-13.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-13.png](images/ee-frb-13.png)

</div>

</div>

</div>

  

</div>

<div id="eefirebirdmacconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 4.1.2. Configuration

</div>

</div>

</div>

To configure an ODBC DSN, run the OpenLink iODBC Administrator located
in the /Applications/iODBC folder:

<div id="id35398" class="figure">

**Figure 4.15. ee-frb-14.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-14.png](images/ee-frb-14.png)

</div>

</div>

</div>

  

Click on the add button to Choose the ODBC Driver the DSN should be
created for:

<div id="id35404" class="figure">

**Figure 4.16. ee-frb-15.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-15.png](images/ee-frb-15.png)

</div>

</div>

</div>

  

Choose the OpenLink Firebird Driver (Express Edition) v6.0 from the list
of available drivers:

<div id="id35410" class="figure">

**Figure 4.17. ee-frb-16.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-16.png](images/ee-frb-16.png)

</div>

</div>

</div>

  

In the Data Source tab, select a suitable DSN name and optional
description for the Data Source to be created:

<div id="id35416" class="figure">

**Figure 4.18. ee-frb-17.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-17.png](images/ee-frb-17.png)

</div>

</div>

</div>

  

The Connection Tab request the minimum paramters required to make a
connection to the target database:

<div id="id35422" class="figure">

**Figure 4.19. ee-frb-18.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-18.png](images/ee-frb-18.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- Hostname - the hostname of the server on which Firebird is running

- PortName - the port on whcih the Firebird instance listens

- Database - the name of a valid database

- Username - the name of a valid Firebird user

- Advanced - additional optional configuration parameters:

</div>

<div id="id35438" class="table">

**Table 4.1. **

<div class="table-contents">

|                                                            |
|------------------------------------------------------------|
| <span class="emphasis">*BlobBufferLength*</span>           |
| <span class="emphasis">*BlobBufferSize*</span>             |
| <span class="emphasis">*BuffersNumber*</span>              |
| <span class="emphasis">*DefaultIsolation*</span>           |
| <span class="emphasis">*Encoding*</span>                   |
| <span class="emphasis">*LoginTimeout*</span>               |
| <span class="emphasis">*RoleName*</span>                   |
| <span class="emphasis">*SocketBufferSize*</span>           |
| <span class="emphasis">*SqlDialect*</span>                 |
| <span class="emphasis">*TimestampUsesLocalTimezone*</span> |
| <span class="emphasis">*UseStandardUdf*</span>             |
| <span class="emphasis">*UseStreamBlobs*</span>             |
| <span class="emphasis">*UseTranslation*</span>             |
| <span class="emphasis">*CharSet*</span>                    |

</div>

</div>

  

As indiacted above the paramters of the options and preferences tabs are
not required for a basic connection:

<div id="id35499" class="figure">

**Figure 4.20. ee-frb-19.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-19.png](images/ee-frb-19.png)

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
  the connection is to be read-only. Make sure the checkbox is unchecked
  to request a read/write connection.

- <span class="emphasis">*Drop Catalog from meta-calls*</span> - Enable
  this option to have the catalog name not appear for tables, views and
  procedures when requesting database meta-data.

- <span class="emphasis">*Drop Schema from meta calls*</span> - Enable
  this option to have the schema-name not appear for tables, views and
  procedures when requesting database meta-data.

- <span class="emphasis">*SQLStatistics disabled*</span> - Check this
  box to have SQLStatistics() return an empty resultset. Use this if the
  underlying database does not support retrieving statistics about a
  table (e.g. what indexes there are on it).

- <span class="emphasis">*No support of quoted identifier*</span> - If
  it is set, the call SQLGetInfo for 'SQL_IDENTIFIER_QUOTE_CHAR' will
  return the space (" "). It can be used if DBMS doesn't support quoted
  SQL like select \* from "account"

- <span class="emphasis">*No support of search string escape*</span> -
  If it is set, the call SQLGetInfo for 'SQL_LIKE_ESCAPE_CLAUSE' will
  return the space (" "). It can be used if DBMS doesn't support SQL
  escape patterns

- <span class="emphasis">*Patch of NULL size of SQL_CHAR*</span> - If
  set this option overrides the size of SQL_CHAR column type returned by
  the database with the value set in the text box (in bytes). With the
  default value of 0 the driver uses the size returned by the database.

- <span class="emphasis">*SQL_DBMS Name*</span> - Manually override the
  SQLGetInfo(SQL_DBMS_NAME) response returned by the driver. This is
  know to be required for products like Microsoft InfoPath for which the
  return the value should be "SQL Server".

</div>

<div id="id35535" class="figure">

**Figure 4.21. ee-frb-20.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-20.png](images/ee-frb-20.png)

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

<div id="id35563" class="figure">

**Figure 4.22. ee-frb-21.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-21.png](images/ee-frb-21.png)

</div>

</div>

</div>

  

Enter a vaild username and pasword for the database:

<div id="id35569" class="figure">

**Figure 4.23. ee-frb-22.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-22.png](images/ee-frb-22.png)

</div>

</div>

</div>

  

A successful connection to the database has been made:

<div id="id35575" class="figure">

**Figure 4.24. ee-frb-23.png**

<div class="figure-contents">

<div class="mediaobject">

![ee-frb-23.png](images/ee-frb-23.png)

</div>

</div>

</div>

  

</div>

</div>
