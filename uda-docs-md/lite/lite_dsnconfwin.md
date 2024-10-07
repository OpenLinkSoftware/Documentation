<div id="lite_dsnconfwin" class="section">

<div class="titlepage">

<div>

<div>

## 5.1. Windows Data Source Configuration

</div>

</div>

</div>

<div id="lite_odbcsetup" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.1. Creating ODBC Data Sources

</div>

</div>

</div>

<div id="lite_configdsn" class="section">

<div class="titlepage">

<div>

<div>

#### Windows ODBC Data Sources

</div>

</div>

</div>

The Microsoft ODBC 2.0, 3.0 & 3.5 Driver Manager (depicted below) allows
the creation of User, System, and File DSNs.

A User DSN will only be available to the user who creates the data
source; a System DSN will be available to the whole system so that any
user, including the system account, will be able to use that data
source; A File DSN is a special 'mobile' data source that stores the
data source information associated with the ODBC Driver in a file that
is sharable.

The steps for creating a DSN are as follows:-

From the desired tab (User; System; File) press the Add button to begin
creating a new Data source.

<div class="figure-float">

<div id="lite_fg-501" class="figure">

**Figure 5.1. Microsoft ODBC Administrator**

<div class="figure-contents">

<div class="mediaobject">

![Microsoft ODBC Administrator](images/odbcad02.gif)

</div>

</div>

</div>

  

</div>

Pick the ODBC Driver to be used to create your ODBC DSN. In this example
the Driver Labeled "OpenLink Lite for DB2 (32 Bit)" is highlighted.

<div class="figure-float">

<div id="lite_fg-502" class="figure">

**Figure 5.2. Microsoft ODBC Administrator**

<div class="figure-contents">

<div class="mediaobject">

![Microsoft ODBC Administrator](images/odbcad03.gif)

</div>

</div>

</div>

  

</div>

Once you have selected the appropriate OpenLink Lite Driver, you will be
presented with the OpenLink ODBC Data Source Configuration Wizard for
the driver selected. The Wizard has several frames, most of which
require you to provide information.

</div>

<div id="lite_tabdatasource" class="section">

<div class="titlepage">

<div>

<div>

#### Data Source Tab

</div>

</div>

</div>

The first tab is the Data Source Tab. The following parameters are
common to all databases.

<div class="figure-float">

<div id="lite_tab1eg" class="figure">

**Figure 5.3. Data Source tab (DB2 example)**

<div class="figure-contents">

<div class="mediaobject">

![Data Source tab (DB2 example)](images/db2set1.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Name. ** (Data source) The name of the ODBC DSN; this is how you
  will interact with the OpenLink Lite ODBC Driver from within
  ODBC-compliant applications once your ODBC DSN has been created.

- **Desription. ** Additional information that further describes the
  ODBC DSN that you are creating.

</div>

</div>

<div id="lite_tabdblayer" class="section">

<div class="titlepage">

<div>

<div>

#### Database-Specific Tab

</div>

</div>

</div>

In the second frame of the wizard, you enter a database alias for the
underlying communications layer of the database, and a username and
password. If you select the "Connect now to verify that all settings are
correct" check-box, pressing the Next\> button will verify that DSN can
connect.

<div class="figure-float">

<div id="lite_tab2eg" class="figure">

**Figure 5.4. Database-specific tab (DB2 example)**

<div class="figure-contents">

<div class="mediaobject">

![Database-specific tab (DB2 example)](images/db2set2.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="id1365" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

The third frame contains OpenLink-specific parameters for the DSN
connection; here you can set the connection to be read-only, have it
defer the fetching of long (BLOB) data, disable interactive login, set a
row-buffer size (the number of records to be transported over the
network in a single network hop), set a file containing SQL statements
to run on login, set the dynamic cursor sensitivity level, and enable
logging to a file.

<div class="figure-float">

<div id="lite_tab3eg" class="figure">

**Figure 5.5. OpenLink Parameters tab (DB2 example)**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab (DB2 example)](images/db2set3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="id1366" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

The fourth frame contains more custom parameters: you can enable changes
for the MS Jet Engine, disable autocommitting, and disable the rowset
size limit. You can also set the SQL_DBMS_NAME (required for some
applications, notably Access).

<div class="figure-float">

<div id="lite_tab4eg" class="figure">

**Figure 5.6. ODBC Parameters tab (DB2 example)**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab (DB2 example)](images/db2set4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="id1367" class="section">

<div class="titlepage">

<div>

<div>

#### \`About' frame

</div>

</div>

</div>

The fifth and final frame in the wizard shows the details of the
connection - the driver name and version and DSN configuration
parameters; it also gives you the option to test the data-source.

<div class="figure-float">

<div id="lite_tab5eg" class="figure">

**Figure 5.7. \`About' tab (DB2 example)**

<div class="figure-contents">

<div class="mediaobject">

![\`About' tab (DB2 example)](images/db2set5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="id1368" class="section">

<div class="titlepage">

<div>

<div>

#### Glossary of Standard Configuration Options

</div>

</div>

</div>

<div class="itemizedlist">

- **Name. ** (Data source) The name of the ODBC DSN; this is how you
  will interact with the OpenLink Lite ODBC Driver from within
  ODBC-compliant applications once your ODBC DSN has been created.

- **Desription. ** Additional information that further describes the
  ODBC DSN that you are creating.

- **MaxRows Override. ** Allows you to define a limit on the maximum
  number of rows to returned from a query. The default value of 0 means
  no limit.

- **Initial SQL. ** Lets you specify a file containing SQL statements
  that will be run against the database upon connection, automatically.

- **Enable Microsoft Jet Engine Options. ** Extra support or altered
  functionality for better compatibility with Microsoft Jet using
  applications such as Microsoft Access.

- **Disable AutoCommit. ** Change the default commit behaviour of the
  OpenLink Lite Driver. The default mode is AutoCommit mode (box
  unchecked).

- **Disable Rowset Size Limit. ** Disable the limitation enforced by the
  cursor library. The limitation is enforced by default to prevent the
  Driver claiming all available memory in the event that a resultset is
  generated from an erroneous query is very large. The limit is normally
  never reached.

- ##### High Cursor Sensitivity

  Enables or disables the row version cache used with dynamic cursors.

  When dynamic cursor sensitivity is set high, the Cursor Library
  calculates checksums for each row in the current rowset and compares
  these with the checksums (if any) already stored in the row version
  cache for the same rows when fetched previously. If the checksums
  differ for a row, the row has been updated since it was last fetched
  and the row status flag is set to SQL_ROW_UPDATED. The row version
  cache is then updated with the latest checksums for the rowset.

  From the user's point of view, the only visible difference between the
  two sensitivity settings is that a row status flag can never be set to
  SQL_ROW_UPDATED when the cursor sensitivity is low. (The row status is
  instead displayed as SQL_ROW_SUCCESS.) In all other respects,
  performance aside, the two settings are the same - deleted rows don't
  appear in the rowset, updates to the row since the row was last
  fetched are reflected in the row data, and inserted rows appear in the
  rowset if their keys fall within the span of the rowset.

  If your application does not need to detect the row status
  SQL_ROW_UPDATED, you should leave the 'High Cursor Sensitivity'
  checkbox unchecked, as performance is improved. The calculation and
  comparison of checksums for each row fetched carries an overhead.

  If this option is enabled, the table oplrvc must have been created
  beforehand using the appropriate script for the target database.

- **Row Buffer Size. ** This attribute specifies the number of records
  to be transported over the network in a single network hop. Values can
  range from 1 to 99.

- **Default UserID. ** This attribute specifies the default username to
  be used when attempting to make a connection. You may still override
  this at run time.

- **Hide Login Dialog. ** Suppress the ODBC "Username" and "Password"
  login dialog box when interacting with your ODBC DSN from within an
  ODBC compliant application.

- **Read Only connection. ** Specify whether the connection is to be
  "Read-only". Make sure the checkbox is unchecked to request a
  "Read/Write" connection.

</div>

</div>

</div>

<div id="liteusedb2" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.2. DB2

</div>

</div>

</div>

<div id="lite_db2dsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-511" class="figure">

**Figure 5.8. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/db2set1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_db2options" class="section">

<div class="titlepage">

<div>

<div>

#### DB2 Options

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-512" class="figure">

**Figure 5.9. DB2 Options tab**

<div class="figure-contents">

<div class="mediaobject">

![DB2 Options tab](images/db2set2.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Database Alias. ** The DB2 Connect Alias for the database to which
  you wish to connect.

</div>

</div>

<div id="lite_db2preferences" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-513" class="figure">

**Figure 5.10. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/db2set3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_db2connection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-514" class="figure">

**Figure 5.11. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/db2set4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_db2about" class="section">

<div class="titlepage">

<div>

<div>

#### Confirm and Test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-515" class="figure">

**Figure 5.12. Confirm and Test tab**

<div class="figure-contents">

<div class="mediaobject">

![Confirm and Test tab](images/db2set5.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteuseinformix9" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.3. Informix 7 and 9

</div>

</div>

</div>

<div id="lite_inf9dsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set1" class="figure">

**Figure 5.13. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/inf9set1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_inf9connect" class="section">

<div class="titlepage">

<div>

<div>

#### Informix 9 - Connect

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set2" class="figure">

**Figure 5.14. Informix 9 - Connect tab**

<div class="figure-contents">

<div class="mediaobject">

![Informix 9 - Connect tab](images/inf9set2.gif)

</div>

</div>

</div>

  

</div>

Enter details of the Informix server.

<div class="itemizedlist">

- **Server. ** The name of the Informix server that you want to
  communicate with.

- **Hostname. ** The network hostname of the machine hosting the
  Informix server.

- **Database. ** The name of the database on the server that you want to
  connect to.

- **Protocol. ** The informix network protocol identifier.

- **Service. ** The service name as configured in the
  winnt\system32\drivers\etc\services or windows\services file

- ##### Client Locale

  Define the client locale. This takes the form:

  ``` screen
  [language_territory.]codeset[@modifier]
  ```

  For example:

  ``` screen
  57371
                  en_us.57372
                  en_us.utf8@dict
  ```

  An Informix 9 Lite driver should use UTF-8 as the codeset. The
  language and territory should not matter; so it should be possible,
  for example, to use French (fr_fr) or American English (en_us).

  For Informix clients on Windows, the client locale is typically set
  through SetNet32. Rather than rely on the SetNet32 settings, our Lite
  driver instead sets the client locale at runtime.

  It is possible to use a codeset number (Eg. 57372) rather than a
  codeset name (UTF8) to specify UTF-8 as the codeset. Either form can
  be used. The registry file included in an Informix client installation
  lists the supported code sets and the correspondence between codeset
  names and numbers.

  The optional modifier has a maximum of four alphanumeric characters.
  This specification modifies the cultural-convention settings that the
  language and territory settings imply. The modifier usually indicates
  a special type of localized order that the locale supports. For
  example, you can set @modifier to specify dictionary or telephone book
  collation order.

- **Username & Password. ** If you enter the username and password here,
  and check the "Connect now" checkbox, proceeding to \`Next\>' will
  make a test connection to verify the above parameters.

- **XA Info. ** In the case of an OpenLink driver, this parameter is an
  ODBC Datasource Name (DSN): see the
  <a href="lite_xa.html#lite_xainfoconnstrfmt" class="link"
  title="xa_info, OPENINFO and CLOSEINFO String Formats">XA
  documentation</a> for more about this.

</div>

</div>

<div id="lite_inf9options" class="section">

<div class="titlepage">

<div>

<div>

#### Informix 9 Options

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set3" class="figure">

**Figure 5.15. Informix 9 Options tab**

<div class="figure-contents">

<div class="mediaobject">

![Informix 9 Options tab](images/inf9set3.gif)

</div>

</div>

</div>

  

</div>

Enter options for the Informix connection:

<div class="itemizedlist">

- **Space Pad Character colums. ** If set, then colums are padded to
  full width by using the space character.

- **Multiplex Sessions. ** determine the connection parallelization
  mode.

- **Force Online Database. ** If set, then the database will always
  appear as online.

</div>

</div>

<div id="lite_inf9prefs" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set4" class="figure">

**Figure 5.16. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/inf9set4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_inf9connection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set5" class="figure">

**Figure 5.17. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/inf9set5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_inf9about" class="section">

<div class="titlepage">

<div>

<div>

#### Finish and Test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_inf9set6" class="figure">

**Figure 5.18. Finish and test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and test tab](images/inf9set6.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteuseoping" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.4. Ingres and OpenIngres

</div>

</div>

</div>

<div id="lite_opingdsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-531" class="figure">

**Figure 5.19. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/oingset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_opingconnect" class="section">

<div class="titlepage">

<div>

<div>

#### Ingres Net

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-532" class="figure">

**Figure 5.20. Ingres - Net tab**

<div class="figure-contents">

<div class="mediaobject">

![Ingres - Net tab](images/oingset2.gif)

</div>

</div>

</div>

  

</div>

Enter details here about the Ingres server.

<div class="itemizedlist">

- **Connection. ** Takes the form \<vnode\>::\<dbname\> where vnode is
  the name of the virtual node configured either in the Ingres
  V(isual)DBA or Ingres Netutil utility, and dbname is the name of the
  database at the vnode destination that you want to connect to.

- ##### Roles & Effective Users

  Ingres allows you to connect as a particular role or effective user.
  From iidbdb you could execute:

  ``` programlisting
   create role myrole with password=myrolepwd;\g
                
  ```

  to create a role; it is then this role and password you would enter in
  the above dialog.

</div>

</div>

<div id="lite_opingprefs" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-533" class="figure">

**Figure 5.21. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/oingset3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_opingconnection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-534" class="figure">

**Figure 5.22. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/oingset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_opingabout" class="section">

<div class="titlepage">

<div>

<div>

#### Finish & test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-535" class="figure">

**Figure 5.23. Finish and tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and tab](images/oingset5.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteuseora" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.5. Oracle 8, 9, and 10

</div>

</div>

</div>

<div id="lite_oradsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-541" class="figure">

**Figure 5.24. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/oraset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_orasqlnet" class="section">

<div class="titlepage">

<div>

<div>

#### SQL\*NET tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-542" class="figure">

**Figure 5.25. SQL\*NET tab**

<div class="figure-contents">

<div class="mediaobject">

![SQL\*NET tab](images/oraset2.gif)

</div>

</div>

</div>

  

</div>

Enter details here for the SQL\*NET.

<div class="itemizedlist">

- **Connection String. ** This needs to be a valid SQL\*Net connect
  string. Typically this will only need to be the TNS Name as defined
  using the Oracle Easy Net configuration utility.

- **SQL\*net Interface. ** This lets you select the SQL\*Net DLL to be
  used. AutoScan is the default and best option. If this does not work
  then try and pick the option that seems to best suite your version of
  Oracle. If you are using Oracle 8i then use 'oci.dll'.

- **XA Info. ** In the case of an OpenLink driver, this parameter is an
  ODBC Datasource Name (DSN): see the
  <a href="lite_xa.html#lite_xainfoconnstrfmt" class="link"
  title="xa_info, OPENINFO and CLOSEINFO String Formats">XA
  documentation</a> for more about this.

</div>

</div>

<div id="lite_oraoracle" class="section">

<div class="titlepage">

<div>

<div>

#### Oracle tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-543" class="figure">

**Figure 5.26. Oracle tab**

<div class="figure-contents">

<div class="mediaobject">

![Oracle tab](images/oraset3.gif)

</div>

</div>

</div>

  

</div>

contains the options:

<div class="itemizedlist">

- ##### Custom Catalog Views

  You must run the ODBCCATx.SQL script against your database as user
  internal before this option can be checked! Enabling this gives best
  functionality and support especially for ODBC catalog calls.

  These scripts exist for each version of Oracle supported, the files
  "odbccat6.sql", "odbccat7.sql", and "odbccat8.sql" representing Oracle
  versions 6 up to version 8 respectively. These scripts are to be
  applied to your Oracle instance to enable efficient and extended
  functionality between OpenLink and Oracle when handling ODBC, JDBC,
  UDBC, and OLE-DB catalog calls such as SQLForeignKeys() and
  SQLPrimaryKeys() functions. These functions have significant impact on
  the performance of your OpenLink clients.

  To run these scripts you need to start the Oracle server manager
  (svrmgr or sqldba if you do this from the command line). Connect as
  internal and run the script by locating the relevant script file as
  you would any other Oracle SQL script file.

- **Count Stored Procedure Parameters in SQLProcedures. ** Enable
  'strict' parameter use.

</div>

</div>

<div id="lite_orataflite" class="section">

<div class="titlepage">

<div>

<div>

#### Transparent Application Failover (TAF) tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-543_01" class="figure">

**Figure 5.27. Oracle tab**

<div class="figure-contents">

<div class="mediaobject">

![Oracle tab](images/oraset3a.gif)

</div>

</div>

</div>

  

</div>

When OpenLink's TAF support is enabled, in the event that a failover
attempt fails, the Lite driver or Multi-Tier agent will instruct Oracle
to retry. By default, the maximum number of failover attempts is 10 and
the interval between retry attempts is 10 seconds. The default values
can be overridden.

See the <a href="lite_udauserrac.html#lite_udauserrachowto" class="link"
title="4.8.2. What you have to do to use it">Oracle RAC/TAF
documentation</a> for more.

</div>

<div id="lite_oraprefs" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-544" class="figure">

**Figure 5.28. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/oraset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_oraconnection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-545" class="figure">

**Figure 5.29. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/oraset5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_orafintest" class="section">

<div class="titlepage">

<div>

<div>

#### Finish and testing

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-547" class="figure">

**Figure 5.30. Finish and Test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and Test tab](images/oraset6.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_oraabout805" class="section">

<div class="titlepage">

<div>

<div>

#### Finishing and Testing

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-546" class="figure">

**Figure 5.31. Finishing and testing tab**

<div class="figure-contents">

<div class="mediaobject">

![Finishing and testing tab](images/oraset6805.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteuseprosql" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.6. Progress 9.1 SQL-92

</div>

</div>

</div>

<div id="lite_prosdsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-551s" class="figure">

**Figure 5.32. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/prosql1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_prosprogress" class="section">

<div class="titlepage">

<div>

<div>

#### Progress 9 tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-552s" class="figure">

**Figure 5.33. Progress 9 tab**

<div class="figure-contents">

<div class="mediaobject">

![Progress 9 tab](images/prosql2.gif)

</div>

</div>

</div>

  

</div>

Enter details here to specify Progress connection information.

<div class="itemizedlist">

- **Database name. ** Name of the Progress database.

- **Host name. ** Domain name or IP number of the machine hosting the
  database.

- **Port. ** TCP port on which the database is listening.

</div>

</div>

<div id="lite_prosprefs" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-553s" class="figure">

**Figure 5.34. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/prosql3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_prosconnection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-554s" class="figure">

**Figure 5.35. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/prosql4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_prosabout" class="section">

<div class="titlepage">

<div>

<div>

#### Finishing & Testing

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-555s" class="figure">

**Figure 5.36. Finishing and testing tab**

<div class="figure-contents">

<div class="mediaobject">

![Finishing and testing tab](images/prosql5.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteusepro" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.7. Other Progress

</div>

</div>

</div>

<div id="lite_prodsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-551" class="figure">

**Figure 5.37. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/proset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_proprogress" class="section">

<div class="titlepage">

<div>

<div>

#### Progress tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-552" class="figure">

**Figure 5.38. Progress tab**

<div class="figure-contents">

<div class="mediaobject">

![Progress tab](images/proset2.gif)

</div>

</div>

</div>

  

</div>

Enter details here to specify Progress connection information.

<div class="itemizedlist">

- ##### Session Options

  Any Progress server startup options are accepted in this box. Note:
  These options are required for the Small Client driver only.

  Typical options could be:

  ``` screen
  -SV -S <service> -H <hostname> -N TCP
  ```

- ##### Database Options

  Any valid Progress Database connection options. See your Progress
  manual for a complete list of accepted options.

  When using the Small Client driver, enter the following minimum
  database information in this box:

  ``` screen
  -db <dbname>
  ```

  When using the Large Client driver, enter the following minimum
  database information in this box:

  ``` screen
  -db <dbname> -S <service> -H <hostname> -N <protocol>
  ```

  Note: The \<service\> entry must meet the following requirements:

  <div class="orderedlist">

  1.  It must be listed in the Progress database server's /etc/services
      file, with a corresponding TCP port to which to bind.

  2.  It must be listed with the same name as above in your Windows
      \system32\drivers\etc\services file, matching the TCP port used
      for the database server's Progress service name.

  </div>

  To connect to multiple databases and make use of array fields see the
  <a href="lite_dsnconfwin.html#lite_progview" class="link"
  title="Connecting Progress Lite to Multiple Databases and Gaining Access to Arrays">tableview
  guide</a>

- **Table View. ** The full path and file name of the .dat 'tableview'
  file created after running the setup.p applications. See
  <a href="lite_dsnconfwin.html#lite_progview" class="link"
  title="Connecting Progress Lite to Multiple Databases and Gaining Access to Arrays">tableview
  guide</a> for more information.

</div>

</div>

<div id="lite_proprefs" class="section">

<div class="titlepage">

<div>

<div>

#### Additional Progress-specific parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-553" class="figure">

**Figure 5.39. Additional Progress-specific parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![Additional Progress-specific parameters tab](images/proset3.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Field size. ** Enter the minimum and maximum sizes for a char(N)
  field here

- **Expression Precision & Scale. ** This is the default precision and
  scale for anonymous numeric fields in the resultset.

- **Use space for SQL_IDENTIFIER_QUOTE_CHAR. ** Check this to enable a
  workaround for Business Objects' handling of the space-character in
  quoting an identifier.

</div>

</div>

<div id="lite_proconnection" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-554" class="figure">

**Figure 5.40. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/proset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_proabout" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-555" class="figure">

**Figure 5.41. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/proset5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_profin" class="section">

<div class="titlepage">

<div>

<div>

#### Finish and test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-556" class="figure">

**Figure 5.42. Finish and Test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and Test tab](images/proset6.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_progview" class="section">

<div class="titlepage">

<div>

<div>

#### Connecting Progress Lite to Multiple Databases and Gaining Access to Arrays

</div>

</div>

</div>

Utility and functionality for the Progress Driver that enables the user
to connect to multiple databases and use array fields. This is only
applicable to drivers not built against Progress SQL92 Libraries.

After installing a Progress Lite Driver you should find the following
files in the lite32 directory:

``` screen
setup.p
setup.i
oplrvc1.p
oplrvc2.p
```

setup.p is a Progress script program. When the program runs it will ask
you what databases you wish to connect to and generate a catalog file of
all the databases and tables within into a tableview file (.dat), and
will create its associated parameter file (.pf).

Doing this allows you to connect to multiple databases, allows you to
see all the tables in all databases from SQLTables, and allows you to
use arrays fields through ODBC.

Prior to running this program you must ensure that all database servers
for the databases you wish to include are running since the program will
need to connect to them.

Make sure that your \$DLC environment variable is set correctly to point
to your DLC directory.

e.g. DLC=/dbs/progress/dlc

export DLC

Go to the openlink/lite32 directory, and type the following:

\$DLC/bin/pro -p setup.p

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                         |
|:----------------------------:|:----------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                   |
|                              | This may vary between versions. In Progress 6, pro is in the dlc directory not dlc/bin. |

</div>

You may also need to set a PROPATH environment variable to include the
current working directory and the directory containing the setup.p
utility files.

You will get the following screens:

``` screen
.       @@@@@@   @@@@@@   @@@@@@@   @@@@@   @@@@@@   @@@@@@@   @@@@@    @@@@@
       @     @  @     @  @     @  @     @  @     @  @        @     @  @     @
      @     @  @     @  @     @  @        @     @  @        @        @
     @@@@@@   @@@@@@   @     @  @  @@@@  @@@@@@   @@@@@     @@@@@    @@@@@
    @        @   @    @     @  @     @  @   @    @              @        @
   @        @    @   @     @  @     @  @    @   @        @     @  @     @
  @        @     @  @@@@@@@   @@@@@   @     @  @@@@@@@   @@@@@    @@@@@
                           Progress Software Corporation
                                    14 Oak Park
                            Bedford, Massachusetts 01730
                                    617-280-4000
       PROGRESS is a registered trademark of Progress Software Corporation
      Copyright 1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995
                        by Progress Software Corporation
                             All Rights Reserved
PROGRESS Version 7.3C as of Thu Jun 29 15:05:14 EDT 1995
```

Followed by:

``` screen
+-----------------------------------------------------+
| Enter a number of databases you want to connect to. |
| The first database is your master database.         |
+-----------------------------------------------------+
+-----------------------------------------------------------------------------+
| # DbName                         Connect String                           OK|
|-- ------------------------------ ---------------------------------------- --|
| 1 ______________________________ ________________________________________ __|
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
+-----------------------------------------------------------------------------+
Enter data or press PF4 to end.
```

At this point you will need to give the program information to contact
the databases you want to include here. As shown below.

``` screen
+-----------------------------------------------------+
| Enter a number of databases you want to connect to. |
| The first database is your master database.         |
+-----------------------------------------------------+
+-----------------------------------------------------------------------------+
| # DbName                         Connect String                           OK|
|-- ------------------------------ ---------------------------------------- --|
| 1 /users/progress/dbs/pro7test__ -N tcp -H 194.152.95.26 -S pro7test_____ __|
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
+-----------------------------------------------------------------------------+
Enter data or press PF4 to end.
```

After entering the line of information press return. There will be a
little pause while the program checks that the database server is
running and can be contacted. When this is verified OK will appear at
the end of the line.

``` screen
+-----------------------------------------------------+
| Enter a number of databases you want to connect to. |
| The first database is your master database.         |
+-----------------------------------------------------+
+-----------------------------------------------------------------------------+
| # DbName                         Connect String                           OK|
|-- ------------------------------ ---------------------------------------- --|
| 1 /users/progress/dbs/pro7test__ -N tcp -H 194.152.95.26 -S pro7test_____ OK|
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
+-----------------------------------------------------------------------------+
Enter data or press PF4 to end.
```

The cursor will move to the next line. Repeat the above procedure for
each database. Press PF4 when finished. You will then need to supply the
name for the .dat and .pf files to be created.

``` screen
+-----------------------------------------------------+
| Enter a number of databases you want to connect to. |
| The first database is your master database.         |
+-----------------------------------------------------+
+-----------------------------------------------------------------------------+
| # DbName                         Connect String                           OK|
|-- ------------------------------ ---------------------------------------- --|
| 1 /users/progress/dbs/pro7test__ -N tcp -H 194.152.95.26 -S pro7test_____ OK|
| 2 ______________________________ ________________________________________ __|
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
+-----------------------------------------------------------------------------+
Basename for .pf and .dat files_____________________ 
Enter data or press PF4 to end.
```

After a brief period the program will have finished:

``` screen
+-----------------------------------------------------+
| Enter a number of databases you want to connect to. |
| The first database is your master database.         |
+-----------------------------------------------------+
+-----------------------------------------------------------------------------+
| # DbName                         Connect String                           OK|
|-- ------------------------------ ---------------------------------------- --|
| 1 /users/progress/dbs/pro7test__ -N tcp -H 194.152.95.26 -S pro7test_____ OK|
| 2 ______________________________ ________________________________________ __|
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
|                                                                             |
+-----------------------------------------------------------------------------+
Creating .pf file to use
Creating .dat file with table information 
Procedure Complete. Press space bar to continue.
```

Now you have to integrate these files into your system.

In the Lite Driver setup dialog box you will find an option box called
Table View. In this field place:

\<full path and file name to .dat file\>

Now you can use in the Connection Options, only:

-pf \<full path and file name to .pf file\>

To resolve you connection parameters since they are include in this
file.

</div>

</div>

<div id="liteusetds" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.8. Microsoft or Sybase SQL Server (TDS)

</div>

</div>

</div>

<div id="lite_tdsin" class="section">

<div class="titlepage">

<div>

<div>

#### Installation

</div>

</div>

</div>

The OpenLink ODBC Driver for SQL Server and Sybase for Windows is
distributed in a single .msi file.

Click the Open link that appears in your Downloads dialog.

<div id="id41965" class="figure">

**Figure 5.43. lite_tds_SQL_Open.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Open.png](images/lite_tds_SQL_Open.png)

</div>

</div>

</div>

  

The installer will display a "Welcome" message. Click "Next."

<div id="id41971" class="figure">

**Figure 5.44. lite_tds_SQL_Welcome.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Welcome.png](images/lite_tds_SQL_Welcome.png)

</div>

</div>

</div>

  

The next screen will display the License Agreement for the OpenLink Lite
Driver. Please read and check the "I accept the license agreement"
checkbox. Then, click Next.

<div id="id41977" class="figure">

**Figure 5.45. lite_tds_SQL_Agreement.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Agreement.png](images/lite_tds_SQL_Agreement.png)

</div>

</div>

</div>

  

Your driver needs a license file to operate. Click the Browse button to
locate a commercial or evaluation license that you have previously
downloaded onto your local hard drive. Alternatively, click the Try &
Buy button to obtain a commercial or evaluation license.

<div id="id41983" class="figure">

**Figure 5.46. lite_tds_SQL_License.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_License.png](images/lite_tds_SQL_License.png)

</div>

</div>

</div>

  

You can check the "I don't want to install a license file right now"
check box. This option will permit you to install the product. However,
you will not be able to use the product until you obtain a commercial or
evaluation license key.

<div id="id41990" class="figure">

**Figure 5.47. lite_tds_SQL_InstallOptions.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_InstallOptions.png](images/lite_tds_SQL_InstallOptions.png)

</div>

</div>

</div>

  

Click Next.

Choose among the Typical, Complete, or Custom installation types.

<div id="id41998" class="figure">

**Figure 5.48. lite_tds_SQL_InstallOptions.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_InstallOptions.png](images/lite_tds_SQL_InstallOptions.png)

</div>

</div>

</div>

  

Click Next.

Click the Install button.

<div id="id42005" class="figure">

**Figure 5.49. lite_tds_SQL_InstallButton.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_InstallButton.png](images/lite_tds_SQL_InstallButton.png)

</div>

</div>

</div>

  

Installation is complete. Click the Finish button.

<div id="id42011" class="figure">

**Figure 5.50. lite_tds_SQL_FinishButton.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_FinishButton.png](images/lite_tds_SQL_FinishButton.png)

</div>

</div>

</div>

  

You may be prompted to restart your computer, if you have a pre-existing
OpenLink License Manager running on your computer.

</div>

<div id="lite_tdsconf" class="section">

<div class="titlepage">

<div>

<div>

#### Configuration

</div>

</div>

</div>

Open the ODBC Data Sources Administrator that appears in the
Administrative Tools section of your Control Panel.

<div id="id42020" class="figure">

**Figure 5.51. lite_tds_MTx86_iODBC.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_MTx86_iODBC.png](images/lite_tds_MTx86_iODBC.png)

</div>

</div>

</div>

  

Click the System DSN tab:

<div id="id42026" class="figure">

**Figure 5.52. lite_tds_SQL_System.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_System.png](images/lite_tds_SQL_System.png)

</div>

</div>

</div>

  

Click the Add button. Then, select the OpenLink SQL Server and Sybase
Lite Driver from the list of available drivers:

<div id="id42032" class="figure">

**Figure 5.53. lite_tds_SQL_Available.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Available.png](images/lite_tds_SQL_Available.png)

</div>

</div>

</div>

  

Click Finish.

The first dialog prompts for a Data Source Name and optional
description.

<div id="id42039" class="figure">

**Figure 5.54. lite_tds_SQL_DSNName.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_DSNName.png](images/lite_tds_SQL_DSNName.png)

</div>

</div>

</div>

  

Click Next.

The second dialog prompts for information that identifies the SQL Server
DBMS and database.

<div id="id42046" class="figure">

**Figure 5.55. lite_tds_SQL_ConnTab.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_ConnTab.png](images/lite_tds_SQL_ConnTab.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Server Name* </span> - Select the drop down
  list box to invoke the driver's Dynamic discovery of SQL Server
  instance on the network and choose the instance require if available.

- <span class="emphasis">*Connect now to verify that all settings are
  correct* </span> -

- <span class="emphasis">*Login ID* </span> - A valid SQL Server
  username

- <span class="emphasis">*Password* </span> - A valid SQL Server
  password

</div>

Use the "Advanced" button to manually configure a connection if the SQL
Server instance could not be dynamically located, as detailed below.

<div id="id42065" class="figure">

**Figure 5.56. lite_tds_SQL_Advanced.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Advanced.png](images/lite_tds_SQL_Advanced.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*ServerType* </span> - An OpenLink proprietary
  parameter that associates the connection with a particular TDS version

- <span class="emphasis">*Hostname* </span> - The hostname or IP address
  on which SQL Server listens

- <span class="emphasis">*Port number* </span> - The TCP port on which
  SQL Server lists

- <span class="emphasis">*Server Name* </span> - SQL Server instance
  name on the specified host. A SQL Server instance can also be
  specified by appending "\InstanceName" to the ServerName ie
  "ServerName\InstanceName"

- <span class="emphasis">*Mirror Host* </span> - The name of the
  Failover Server hosting the mirrored database if configured

- <span class="emphasis">*Use strong encryption of data* </span> -
  Enable SSL encryption of data between driver and database

- <span class="emphasis">*Use Mars - Multiple Active Result Sets*</span>
  enables the concurrent processing of multiple statements/queries
  and/or result sets on a single connection

- <span class="emphasis">*Verify Server Certificate* </span> - Verify
  the Database Server SSL certificate against the one specified in the
  "CA file" field

- <span class="emphasis">*CA file* </span> - Specify the location of a
  Valid SSL Certificate for use during the connection

</div>

Click Next to continue.

The third dialog takes a combination of database specific and optional
parameters:

<div id="id42100" class="figure">

**Figure 5.57. lite_tds_SQL_DBSpecific.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_DBSpecific.png](images/lite_tds_SQL_DBSpecific.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Database* </span> - The SQL Server database

- <span class="emphasis">*Character set* </span> - The SQL Server
  character set

- <span class="emphasis">*Language* </span> - The SQL Server language

- <span class="emphasis">*Packet Size* </span> - A value that determines
  the number of bytes per network packet transferred from the database
  server to the client. The correct setting of this attribute can
  improve performance. When set to 0, the initial default, the driver
  uses the default packet size as specified in the Sybase server
  configuration. When set to -1, the driver computes the maximum
  allowable packet size on the first connect to the data source and
  saves the value in the system information. When set to x, an integer
  from 1 to 10, which indicates a multiple of 512 bytes (for example,
  Packet Size of 6 means to set the packet size to 6 \* 512 equal 3072
  bytes). For you to take advantage of this connection attribute, you
  must configure the System 10 server for a maximum network packet size
  greater than or equal to the value you specified for Packet Size.

- <span class="emphasis">*Prepare Method* </span> - This option is
  specific to the TDS Driver for MS & SQL Server SQLServers. It can take
  the values None, Partial Full (connectoptions -O \[0, 1, 2\]
  respectively). It is used to determine whether stored procedures are
  created on the server for calls to SQLPrepare.

- <span class="emphasis">*No Quoted Identifiers* </span> - This option
  indicates that the underlying driver does not support quoted
  identifiers, which is required for Jet engine based products like MS
  Access.

- <span class="emphasis">*Use ANSI nulls, padding and warnings*
  </span> - This option affects TDS agent & Lite Driver connections to
  MS SQLServer databases. SQL Server connectivity is not affected.

- <span class="emphasis">*Map Serializable to Snapshot isolation level*
  </span> - Enable Snapshot transaction isolation level in the driver.
  Snapshot Isolation is a new transaction isolation level available in
  SQL Server 2005

</div>

Click Next to continue.

The fourth dialog enables you to set optional, ODBC connection
parameters:

<div id="id42132" class="figure">

**Figure 5.58. lite_tds_SQL_Options.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Options.png](images/lite_tds_SQL_Options.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Read-only connection* </span> - Specifies
  whether the connection is "Read-only." Make sure the checkbox is
  unchecked to request a "Read/Write" connection.

- <span class="emphasis">*Defer fetching of long data* </span> - Defers
  fetching of LONG (BINARY, BLOB etc.) data unless explicitly requested
  in a query. This provides significant performance increases when
  fields in query do not include LONG data fields.

- <span class="emphasis">*Disable interactive login* </span> -
  Suppresses the ODBC "Username" and "Password" login dialog boxes when
  interacting with your ODBC DSN from within an ODBC compliant
  application.

- <span class="emphasis">*Row Buffer Size* </span> - This attribute
  specifies the number of records to be transported over the network in
  a single network hop. Values can range from 1 to 99.

- <span class="emphasis">*Max rows Override* </span> - Allows you to
  define a limit on the maximum number of rows to be returned from a
  query. The default value of 0 means no limit.

- <span class="emphasis">*Initial SQL* </span> - Lets you specify a file
  containing SQL statements that will be run automatically against the
  database upon connection.

- <span class="emphasis">*Dynamic Cursor Sensitivity* </span> - Enables
  or disables the row version cache used with dynamic cursors. When
  dynamic cursor sensitivity is set high, the Cursor Library calculates
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
  settings are the same. Deleted rows don't appear in the rowset.
  Updates to the row since the row was last fetched are reflected in the
  row data, and inserted rows appear in the rowset, if their keys fall
  within the span of the rowset. If your application does not need to
  detect the row status SQL_ROW_UPDATED, you should leave the 'High
  Cursor Sensitivity' checkbox unchecked, as performance is improved.
  The calculation and comparison of checksums for each row fetched
  carries an overhead. If this option is enabled, the table oplrvc must
  have been created beforehand using the appropriate script for the
  target database.

- <span class="emphasis">*Enable logging to the log file* </span> -
  Check the checkbox and use the associated textbox to provide the full
  path to a file in which to log diagnostic information.

</div>

Click Next to continue.

The fifth dialog enables you to set additional parameters to enhance
compatibility with applications:

<div id="id42164" class="figure">

**Figure 5.59. lite_tds_SQL_Compatibility.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Compatibility.png](images/lite_tds_SQL_Compatibility.png)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Enable Microsoft Jet engine options* </span> -
  Check this checkbox if you intend to use this driver with Microsoft
  Access.

- <span class="emphasis">*Disable* </span>

- <span class="emphasis">*Disable rowset size limit* </span> - Disables
  a limitation enforced by the cursor library. This limitation is
  enforced by default. It prevents the driver from claiming all
  available memory in the event that a resultset generated from an
  erroneous query is very large. The limit is normally never reached.

- <span class="emphasis">*Multiple Active Statements Emulation*
  </span> - Enables use of Multiple Active statements in an ODBC
  application even if the underlying database does not allow this, as it
  is emulated in the driver.

- <span class="emphasis">*SQL_DBMS Name* </span> - Manually overrides
  the SQLGetInfo(SQL_DBMS_NAME) response returned by the driver. This is
  required for products like Microsoft InfoPath for which the return the
  value should be "SQL Server".

</div>

Click Next to continue.

The final dialog enables you to text your Data Source. Click the Test
Data Source button.

<div id="id42187" class="figure">

**Figure 5.60. lite_tds_SQL_Test.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Test.png](images/lite_tds_SQL_Test.png)

</div>

</div>

</div>

  

A connection has been established:

<div id="id42193" class="figure">

**Figure 5.61. lite_tds_SQL_Connected.png**

<div class="figure-contents">

<div class="mediaobject">

![lite_tds_SQL_Connected.png](images/lite_tds_SQL_Connected.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="liteuseoj" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.9. ODBC-JDBC Lite Bridges for Java

</div>

</div>

</div>

<div id="lite_ojdsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-oj1" class="figure">

**Figure 5.62. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/ojset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_ojjdbc" class="section">

<div class="titlepage">

<div>

<div>

#### JDBC tab

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-oj2" class="figure">

**Figure 5.63. JDBC tab**

<div class="figure-contents">

<div class="mediaobject">

![JDBC tab](images/ojset2.gif)

</div>

</div>

</div>

  

</div>

Enter details here for the JDBC Driver to connect with:

<div class="itemizedlist">

- **JDBC Driver. ** The name of the JDBC Driver to be used for the
  connection

- **URL String. ** The JDBC connectstring URL for the JDBC Driver

- **Login ID & Password. ** Enter the username and password to use for
  the connection here. If you check the \`Connect now' box, pressing
  \`Next\>' will make a test connection to verify the above parameters.

</div>

</div>

<div id="lite_ojprefs" class="section">

<div class="titlepage">

<div>

<div>

#### JDBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-oj3" class="figure">

**Figure 5.64. JDBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![JDBC Parameters tab](images/ojset3.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Drop Catalog name from DatabaseMetaData calls. ** Enable this option
  to have the catalog name not appear for tables, views and procedures
  when requesting database meta-data.

- **Drop Schema name from DatabaseMetaData calls. ** Enable this option
  to have the schema-name not appear for tables, views and procedures
  when requesting database meta-data.

- **Return an empty resultset for SQLStatistics. ** Check this box to
  have SQLStatistics() return an empty resultset - use this if the
  underlying database does not support retrieving statistics about a
  table (e.g. what indexes there are on it).

- **Disable support of quoted identifier. ** If it is set, the call
  SQLGetInfo for 'SQL_IDENTIFIER_QUOTE_CHAR' will return the space ("
  "). It can be used if DBMS doesn't support quoted SQL like select \*
  from "account"

- **Disable support of search pattern escape. ** If it is set, the call
  SQLGetInfo for 'SQL_LIKE_ESCAPE_CLAUSE' will return the space (" ").
  It can be used if DBMS doesn't support SQL escape patterns

</div>

</div>

<div id="lite_ojconnection" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-554_01" class="figure">

**Figure 5.65. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/ojset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_ojwork" class="section">

<div class="titlepage">

<div>

<div>

#### Additional Compatibility Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-oj5" class="figure">

**Figure 5.66. Additional Compatibility Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![Additional Compatibility Parameters tab](images/ojset5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_ojabout" class="section">

<div class="titlepage">

<div>

<div>

#### Finish & Test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_fg-oj6" class="figure">

**Figure 5.67. Finish and test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and test tab](images/ojset6.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteusemy" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.10. MySQL

</div>

</div>

</div>

<div id="lite_mydsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-511" class="figure">

**Figure 5.68. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/myset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_myoptions" class="section">

<div class="titlepage">

<div>

<div>

#### MySQL Options

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-512" class="figure">

**Figure 5.69. MySQL Options tab**

<div class="figure-contents">

<div class="mediaobject">

![MySQL Options tab](images/myset2.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Hostname. ** The hostname on which the MySQL database server to be
  connected to is running on.

- **Port. ** The port number on which the MySQL database server is
  running on the host machine. Defaults to 3306 if not specified.

- **Database. ** The database name to which the connection is to be
  made.

</div>

</div>

<div id="lite_mypreferences" class="section">

<div class="titlepage">

<div>

<div>

#### MySQL Options

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-513" class="figure">

**Figure 5.70. MySQL Options tab**

<div class="figure-contents">

<div class="mediaobject">

![MySQL Options tab](images/myset3.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **No Transactions. ** Disable ODBC transaction management. All
  transactions will be automatically committed. This prevents palloc()
  failures with out-of-memory errors when doing really big transactions
  such as Exporting 10000 records from MS/Access.

</div>

</div>

<div id="lite_myconnection" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-514" class="figure">

**Figure 5.71. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/myset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_myabout" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-515" class="figure">

**Figure 5.72. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/myset5.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_myfinish" class="section">

<div class="titlepage">

<div>

<div>

#### Finish and Test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_my-516" class="figure">

**Figure 5.73. Finish and test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish and test tab](images/myset6.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="liteusepgr" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.11. PostgreSQL

</div>

</div>

</div>

<div id="lite_pgrdsname" class="section">

<div class="titlepage">

<div>

<div>

#### Datasource

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_pgr-511" class="figure">

**Figure 5.74. Datasource tab**

<div class="figure-contents">

<div class="mediaobject">

![Datasource tab](images/pgrset1.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_pgroptions" class="section">

<div class="titlepage">

<div>

<div>

#### PostgreSQL Options

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_pgr-512" class="figure">

**Figure 5.75. PostgreSQL Options tab**

<div class="figure-contents">

<div class="mediaobject">

![PostgreSQL Options tab](images/pgrset2.gif)

</div>

</div>

</div>

  

</div>

<div class="itemizedlist">

- **Hostname. ** The hostname on which the PostgreSQL database server to
  be connected to is running on.

- **Port. ** The port number on which the PostgreSQL database server is
  running on the host machine. Defaults to 3306 if not specified.

- **Database. ** The database name to which the connection is to be
  made.

- **No Transactions. ** Disable ODBC transaction management. All
  transactions will be automatically committed. This prevents palloc()
  failures with out-of-memory errors when doing really big transactions
  such as Exporting 10000 records from MS/Access.

</div>

</div>

<div id="lite_pgrpreferences" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_pgr-513" class="figure">

**Figure 5.76. OpenLink Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![OpenLink Parameters tab](images/pgrset3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_pgrconnection" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Parameters

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_pgr-514" class="figure">

**Figure 5.77. ODBC Parameters tab**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Parameters tab](images/pgrset4.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="lite_pgrabout" class="section">

<div class="titlepage">

<div>

<div>

#### Finish & Test

</div>

</div>

</div>

<div class="figure-float">

<div id="lite_pgr-515" class="figure">

**Figure 5.78. Finish & test tab**

<div class="figure-contents">

<div class="mediaobject">

![Finish & test tab](images/pgrset5.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="lite_connstring" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.12. Connect String parameters

</div>

</div>

</div>

<div id="lite_comcnstr" class="section">

<div class="titlepage">

<div>

<div>

#### Common Connect string

</div>

</div>

</div>

You may sometimes be required to build a complete ODBC Connection String
to access an ODBC Datasource.

A connection string has the following syntax:

``` programlisting
          connection-string ::= empty-string[;] | attribute[;] | attribute; connection-string
          empty-string ::=
          attribute ::= attribute-keyword=attribute-value | DRIVER=[{]attribute-value[}]
          attribute-keyword ::= DSN | UID | PWD | driver-defined-attribute-keyword
          attribute-value ::= character-string
          driver-defined-attribute-keyword ::= identifier
        
```

where character-string has zero or more characters; identifier has one
or more characters; attribute-keyword is not case-sensitive;
attribute-value may be case-sensitive; and the value of the DSN keyword
does not consist solely of blanks.

The following list describes valid attributes and their values common to
all databases:

<div class="itemizedlist">

- **DSN. ** Datasource name.

- **UID. ** Username.

- **PWD. ** Password.

- **DRIVER. ** The name of the ODBC Driver to be used. This will be the
  name displayed in the ODBC Administrator or returned by the SQLDrivers
  function.

- **ReadOnly. ** Yes/No - make the session readonly.

- **FetchBufferSize or FBS. ** 2 digit integer value to determine the
  number of rows to buffer in each fetch.

- **NoLoginBox or NLB. ** Yes/No - suppress the authentication dialog
  box that will appear if either username or password have been omitted.

- **MaxRows. ** integer value to limit the number of returned rows.

- **NoAutoCommit. ** Yes/No - define the default behaviour of the driver
  to adopt.

- **Jet. ** Yes/No - enable Microsoft Jet Engine compatibility features.

- **NoRowSetSizeLimit. ** Yes/No

- **SVAST. ** Yes/No - System views as system tables.

- **IntialSQL. ** Points to a file containing a list of initial SQL
  statements to be executed against the Database on connnect.

</div>

</div>

<div id="lite_cnstrdb2" class="section">

<div class="titlepage">

<div>

<div>

#### DB2 Connect string

</div>

</div>

</div>

There is nothing specific to DB2. See above section for common
parameters.

</div>

<div id="lite_cnstrinformix" class="section">

<div class="titlepage">

<div>

<div>

#### Informix Connect string

</div>

</div>

</div>

The following list describes valid attributes and their values that are
specific to Informix:

<div class="itemizedlist">

- **Protocol. ** Informix protocol identifier.

- **Service. ** Service name as in the etc\services file.

- **Host. ** hostname of the machine hosting the Informix server.

- **InfServer. ** Name of the Informix server.

- **Database. ** name of the database on the Informix server.

- **MultiSess. ** Yes/No - Multiplex Session.

</div>

</div>

<div id="lite_cnstroping" class="section">

<div class="titlepage">

<div>

<div>

#### Ingres and OpenIngres Connect string

</div>

</div>

</div>

The following list describes valid attributes and their values that are
specific to Ingres and OpenIngres:

<div class="itemizedlist">

- **Database. ** name of the database alias.

- **IngServer. ** \<vnode\>::\<dbname\>.

</div>

</div>

<div id="lite_cnstrora" class="section">

<div class="titlepage">

<div>

<div>

#### Oracle Connect string

</div>

</div>

</div>

The following list describes valid attributes and their values that are
specific to Oracle:

<div class="itemizedlist">

- **OraCatalogs. ** Yes/No.

- **QuotedIdentifiers. ** Yes/No.

- **SQLNETConnect. ** SQL\*Net connect string usually just the TNS name.

- **SQLNETInterface. ** Interface DLL or AutoScan for Driver self
  determination.

</div>

</div>

<div id="lite_cnstrpro" class="section">

<div class="titlepage">

<div>

<div>

#### Progress Connect string

</div>

</div>

</div>

The following list describes valid attributes and their values that are
specific to Progress:

<div class="itemizedlist">

- **Options. ** Valid Progress connection options.

- ##### TableView

  full path and filename to the tableview file.

  See <a href="lite_dsnconfwin.html#lite_progview" class="link"
  title="Connecting Progress Lite to Multiple Databases and Gaining Access to Arrays">tableview
  guide</a> for more information.

- **ServerOptions. ** Valid Progress server options.

- **SQLNETInterface. ** Interface DLL or AutoScan for Driver self
  determination.

</div>

</div>

<div id="lite_cnstrmssql" class="section">

<div class="titlepage">

<div>

<div>

#### Microsoft or Sybase SQLServer (TDS) Connect string

</div>

</div>

</div>

The following list describes valid attributes and their values that are
specific to Microsoft SQLServer:

<div class="itemizedlist">

- **TDSServer. ** The IP address or alias name for the server running
  SQL Server.

- **TDSPort. ** The TCP port number the SQLServer instance is running on

- **TDSVer. ** The TDS Protocol version for the type of SQLServer
  instance being used.

- **TDSDBase. ** The name of the SQLServer Database

</div>

</div>

</div>

<div id="lite_odbctesting" class="section">

<div class="titlepage">

<div>

<div>

### 5.1.13. Testing the ODBC Data Source

</div>

</div>

</div>

Once you have configured an ODBC Data Source you can test it using the
Test Connection button on the DataSources tab.

For a more thorough test, you can use the sample applications provided
in the OpenLink Lite Driver installer (unless you chose not to install
them). You will have short-cuts to the sample applications in the
'Start' Menu.

The sample application 'CPP Demo 32 Bit' is a good application to use to
test an ODBC Data Source. It is simple, allows you to execute simple SQL
Queries and includes source code.

When the application has been started, select 'Open Connection' from the
Environment menu item.

<div class="figure-float">

<div id="lite_fg-581" class="figure">

**Figure 5.79. CPP (C++) Demo**

<div class="figure-contents">

<div class="mediaobject">

![CPP (C++) Demo](images/cppdemo1.gif)

</div>

</div>

</div>

  

</div>

Select the data source you recently created and now want to test. Unless
you configured the data source to hide the login dialog prompt you will
be presented with it. You need to enter a valid username and password to
authenticate the connection.

<div class="figure-float">

<div id="lite_fg-582" class="figure">

**Figure 5.80. CPP (C++) Demo**

<div class="figure-contents">

<div class="mediaobject">

![CPP (C++) Demo](images/cppdemo2.gif)

</div>

</div>

</div>

  

</div>

Once the connection has been established you should observe that the
title bar of the application now includes the name of the data source
that you connected to.

Use the SQL/Execute SQL menu item to query the database and validate
basic communication between the Driver and the Database.

<div class="figure-float">

<div id="lite_fg-583" class="figure">

**Figure 5.81. CPP (C++) Demo**

<div class="figure-contents">

<div class="mediaobject">

![CPP (C++) Demo](images/cppdemo3.gif)

</div>

</div>

</div>

  

</div>

Enter a valid SQL Statement. You will need to know a valid table name
within the database to be able to retrieve information from it. To
simply return all available data in a particular table of your choice
simply change the name 'authors' (show below) to the name of the table
you wish to query. Press OK to execute the query.

<div class="figure-float">

<div id="lite_fg-584" class="figure">

**Figure 5.82. CPP (C++) Demo**

<div class="figure-contents">

<div class="mediaobject">

![CPP (C++) Demo](images/cppdemo4.gif)

</div>

</div>

</div>

  

</div>

If the query executes successfully you will see a table of the data
returned by the query.

<div class="figure-float">

<div id="lite_fg-585" class="figure">

**Figure 5.83. CPP (C++) Demo**

<div class="figure-contents">

<div class="mediaobject">

![CPP (C++) Demo](images/cppdemo5.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>
