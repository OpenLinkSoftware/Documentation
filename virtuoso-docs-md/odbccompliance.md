<div id="odbccompliance" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.4. ODBC Compliance

</div>

</div>

</div>

The Virtuoso Driver for ODBC conforms to both the ODBC 1.x,2.x,and 3.x
versions of the ODBC specification, it implements Core, Level 1, Level
2, and Extensions functionality. It also has a native support for the
wide versions of the ODBC API (e.g. SQLColumnsW) in Windows. This driver
enables you to communicate with local or remote Virtuoso servers across
any combination of platforms supported by Virtuoso.

<div id="odbccompliance_01" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC API implementation details

</div>

</div>

</div>

<div id="sqlallochandle" class="section">

<div class="titlepage">

<div>

<div>

##### SQLAllocHandle

</div>

</div>

</div>

Virtuoso ODBC driver does not allow allocation and usage of explicitly
allocated descriptor handles. That is why the SQLAllocHandle
(SQL_HANDLE_DESC) will return an error.

</div>

<div id="sqlbulkoperations" class="section">

<div class="titlepage">

<div>

<div>

##### SQLBulkOperations

</div>

</div>

</div>

Only the SQL_ADD operation is supported.

</div>

<div id="sqlcolattributes" class="section">

<div class="titlepage">

<div>

<div>

##### SQLColAttributes

</div>

</div>

</div>

The virtuoso ODBC driver does not return information for the following
attributes:

<div class="itemizedlist">

- **SQL_COLUMN_TABLE_NAME. ** Returns an empty string instead

- **SQL_COLUMN_OWNER_NAME. ** Returns an empty string instead

- **SQL_COLUMN_QUALIFIER_NAME. ** Returns an empty string instead

- **SQL_COLUMN_CASE_SENSITIVE. ** Returns 1 instead

- **SQL_COLUMN_AUTO_INCREMENT. ** Returns 0 instead

- **SQL_COLUMN_MONEY. ** Returns 0 instead

- **SQL_COLUMN_UNSIGNED. ** Returns 0 instead

</div>

</div>

<div id="sqldriverconnect" class="section">

<div class="titlepage">

<div>

<div>

##### SQLDriverConnect

</div>

</div>

</div>

The Virtuoso ODBC driver recognizes the following SQLDriverConnect
connection string keywords:

<div class="itemizedlist">

- **DSN. ** The data source name.

- **HOST. ** The virtuoso server host specification (in the form :
  \[\<hostname\>\[:\]\]\[\<portnumber\>\]

- **UID. ** The virtuoso user ID used to connect

- **PWD. ** The login password used to connect

- **DATABASE. ** The qualifier to use when connected (overrides the
  user's default qualifier)

- **CHARSET. ** The name of the character set to use for wide/narrow
  conversions

- **DAYLIGHT. ** Boolean parameter (1/0). When ON (1) it takes into
  account the client OS daylight savings settings.

- **ENCRYPT. ** String parameter (file name or "1"). Specifies how the
  ODBC connection will be encrypted. see the Using SSL For Secure ODBC
  connections for details.

- **PWDCLEAR. ** Integer parameter (default to 0). Specifies how the
  password will be sent over the wire. 0 - send digest of the password,
  1 - send password in cleartext, 2 - send password garbaled.

- **SERVERCERT. ** String parameter (file name). Specifies the path for
  the CA list used to verify the server's certificate (in PEM format).
  see the Using SSL For Secure ODBC connections for details.

- **FORCE_DBMS_NAME. ** String parameter (default "OpenLink Virtuoso").
  When set it alters the result of SQLGetInfo (SQL_DBMS_NAME).

- **NoSystemTables. ** Boolean parameter (1/0) (default 0). When set it
  alters the result of SQLTables () so that it won't find or return
  tables of type SYSTEM TABLE.

- **IsolationLevel. ** String parameter ("Read Uncommitted"/"Read
  Committed"/"Repeatable Read"/"Serializable"). When set it specifies
  the initial transaction isolation mode for that connection.

</div>

</div>

<div id="sqlgetenvattr" class="section">

<div class="titlepage">

<div>

<div>

##### SQLGetEnvAttr

</div>

</div>

</div>

The SQL_ATTR_OUTPUT_NTS does not have any effect on the Virtuoso driver.
It allows the value to be set and retrieved but with no further effect.

</div>

<div id="sqlnativesql" class="section">

<div class="titlepage">

<div>

<div>

##### SQLNativeSql

</div>

</div>

</div>

All ODBC syntax is parsed server side. The native SQL syntax for
Virtuoso is the ODBC syntax.

</div>

<div id="not_supp" class="section">

<div class="titlepage">

<div>

<div>

##### Not Supported ODBC API functions

</div>

</div>

</div>

Virtuoso ODBC driver does not support the following ODBC API functions:

<div class="itemizedlist">

- SQLCopyDesc

</div>

</div>

</div>

</div>
