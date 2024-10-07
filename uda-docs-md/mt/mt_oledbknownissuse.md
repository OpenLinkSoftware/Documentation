<div id="mt_oledbknownissuse" class="section">

<div class="titlepage">

<div>

<div>

## 5.6. Known Issues

</div>

</div>

</div>

These are the known issues that apply to the OpenLink OLEDB provider as
of September 2005:

<div id="mt_oledbnigen" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.1. General Issues

</div>

</div>

</div>

<div class="itemizedlist">

- The OpenLink ODBC Provider does not allow a consumer to specify the
  type of server-side cursors used internally. ADO consumers, for
  instance Visual Basic 6 and Visual Interdev 6, should use client-side
  cursors.

- Batched commands are not supported.

</div>

</div>

<div id="mt_oledbdotnet" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.2. .Net

</div>

</div>

</div>

<div class="itemizedlist">

- Automatic generation of the DeleteCommand, InsertCommand and
  UpdateCommand properties of a DataAdapter by a CommandBuilder is not
  supported.

- Parameters must be bound in the order they occur in a command.

</div>

</div>

<div id="mt_oledbvi6" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.3. Visual Interdev 6

</div>

</div>

</div>

Visual Interdev uses the username you specify at connect time as the
owner qualifier when referring to schema objects. If the target database
uses case-sensitive qualifiers, the case of the username you specify
when connecting must match the case of the owner qualifier of schema
objects belonging to that user. For instance, if using the Oracle sample
user “SCOTT”, connect as “SCOTT” not “scott”. If the incorrect case is
used, Visual Interdev may fail to retrieve schema information. One
manifestation of this problem is that the Query Builder may not list the
columns belonging to a table.

</div>

<div id="mt_oledbvb6ado" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.4. Visual Basic 6 and ADO

</div>

</div>

</div>

When specifying the SQL for the Recordsource property in an ADO Data
Control (ADO DC), you must quote the table name. If you do not, VB
converts the SQL to lowercase and then quotes the table name when
attempting an update. e.g. If you enter ‘select \* from emp’, when
attempting an update, this becomes ‘update “emp”…’. Databases which
support case-sensitive schema object names, e.g. Oracle, will then
either reject this SQL, complaining that the table doesn’t exist, or
reference the wrong table. To avoid this problem, enter the query as
‘select \* from “EMP”’.

</div>

<div id="mt_oledbsqlsrvdts" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.5. SQL Server Data Transformation Services

</div>

</div>

</div>

The provider implements interface IRowsetFastLoad. This is an interface
specific to the SQL Server OLE DB Provider and is required by SQL Server
DTS, even on third party OLE DB providers. Export of tables from SQL
Server to Oracle using DTS is possible.

The OpenLink OLE DB provider uses a scrollable cursor to support
scrolling over rowsets. OpenLink scrollable cursors require a unique row
identifer (primary key, rowid etc.) to act as a key column. If the
table(s) used to populate the OLE DB rowset do not have a primary key or
similar then the OpenLink OLEDB provider can still provide a rowset
however it will be created as read only. With Oracle, the pseudo column
rowid acts as a key - the table does not have to have a primary key to
make the rowset writeable. With DB2, the table(s) must have a primary
key otherwise the rowset will be read only.

If you choose to export all primary and foreign keys in the table, the
DTS appears to assume it is talking to SQL Server when creating the
target table. It uses a fixed SQL syntax in the CREATE TABLE command to
express the primary key as a table constraint. Oracle accepts this
syntax, however DB2 rejects it.

As a consequence of the above currently the only way to export a table
to DB2 is to manually create the target table before launching DTS. If
the target table already exists, DTS does not attempt to create it; it
just copies the data from the source table. The manually created table
must have a primary key.

The DTS does not handle quoting of the target table name correctly. The
user must specify the target table name using the appropriate case which
does not require quoting. e.g. When exporting to Oracle, give the table
name in uppercase.

<div id="id1323" class="section">

<div class="titlepage">

<div>

<div>

#### Provider Options in the SQL Server Enterprise manager

</div>

</div>

</div>

When setting up a linked server using the Enterprise Manager you can
configure the way SQL Server uses your OLE DB provider by clicking on
the Provider Options button just under the box where the provider is
selected. The options in the Provider Options dialogue box apply to the
provider rather than the specific server so any changes made here will
effect all linked servers using that provider. A list of all the servers
using the provider is given in the bottom half of the box.

Note that once a server has been created it is not possible to change
these options in the property page for that server. To change them after
the linked server has been created you have to create a new server and
alter the options there. Making changes to these options when creating a
new linked server affects all existing linked servers. Once you have set
up a linked server the options you have chosen effectivley become the
defaults for the provider you are using.

A document describing the Provider Options, called 'Configuring OLE DB
Providers for distributed Queries', can be found in the SQL Server Books
Online documentation or on the web at <a
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/adminsql/ad_1_server_8ib7.asp"
class="ulink"
target="_top">http://msdn.microsoft.com/library/default.asp?url=/library/en-us/adminsql/ad_1_server_8ib7.asp</a>

By default none of the options is enabled for our driver. These options
are specifically for SQLServer distributed queries using linked servers
rather than being general OLE DB options.

</div>

<div id="id1324" class="section">

<div class="titlepage">

<div>

<div>

#### Provider Options

</div>

</div>

</div>

|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dynamic Parameters - you can set this if the provider supports the ICommandWithParameters interface. This in supported in the OpenLink provider.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| NestedQueries - can be set if provider allows SELECT in a FROM clause. May cause concerns with the underlying Cursor libraries. This option should not be enabled if the underlying DSN or DBMS does not allow nested queries.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| LevelZeroOnly - Should not be enabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Allow InProcess - This option should be checked. Checking this option stops errors like: ` Error 7311: Could not obtain the schema rowset for OLE DB provider 'UNKNOWN'. The provider supports the interface, but returns a failure code when it is used. OLE DB error trace [OLE/DB Provider 'UNKNOWN' IDBSchemaRowset::GetRowset returned 0x800706c6:]. `                                                                                                                                                                                                                                                                                                                                                         |
| Error 0x800706c6 is RPC_S_INVALID_BOUND. The error message identifies the OLE DB provider that the error comes from as UNKNOWN and our log files show no sign of the error. SQL Server uses a proxy/stub dll, msdaps.dll, to marshal oledb interfaces between processes/apartments. These errors from the 'UNKNOWN' provider come from msdaps.dll. If the OLE DB provider is invoked out of process or is marked as apartment model then this stub gets used. By default if the OLE DB provider is a Microsoft provider then SQL Server invokes it in process and this proxy is not used. Checking the Allow InProcess box when using our provider ensures that this stub dll is not used and so avoids this error. |
| NonTransactedUpdates - this is entirely up to the user to choose.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| IndexAsAccessPath - should be left disabled.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| DisallowAdhocAccess - Disables use of OPENROWSET and OPENDATASOURCE with the provider. Up to the user to choose                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

</div>

<div id="id1325" class="section">

<div class="titlepage">

<div>

<div>

#### Connection Errors. Error 0x80004005

</div>

</div>

</div>

If the linked server has problems connecting then the following error is
generated:

``` programlisting
Error 7399: OLE DB provider 'OpenLinkODBC' reported and error. The provider
did not give any information about the error. OLE DB error trace [OLE/DB
Provider'OpenLinkODBC' IDBInitialize::Initialize returned 0x80004005: The
provider did not give any information about the error.].
```

Reasons for this error could be:

|                                                                          |
|--------------------------------------------------------------------------|
| The ODBC DSN does not exist                                              |
| The linked database is not started                                       |
| Username or password not set up correctly on the security property page. |

The first thing to check when getting this error is that the underlying
ODBC DSN is connecting correctly and after that if the DSN name has been
spelt correctly in the linked server definition. This error may also
occur when using the OPENQUERY, OPENROWSET, and OPENDATASOURCE syntax.
In addition to the connection errors listed above other causes of this
error may be an incorrect table, column or owner name in the statement.

</div>

<div id="id1326" class="section">

<div class="titlepage">

<div>

<div>

#### Using SQLServer Authentication

</div>

</div>

</div>

When using OPENROWSET or OPENDATASOURCE options on logging into SQL
Server using SQL Server authentication, the following error might be
seen:

``` programlisting
Could not perform Windows NT authentication because delegation is not
available.
```

This error is avoided if the connection to the SQL Server is made using
Windows NT authentication.

This problem only occurred when using OPENROWSET and OPENDATASOURCE not
with OPENQUERY, i.e. only when the connection information was given in
the query not when a linked server had been set up in the Enterprise
Manager.

</div>

<div id="id1327" class="section">

<div class="titlepage">

<div>

<div>

#### Linking Progress Servers.

</div>

</div>

</div>

Linking to Progress using a SQL-89 datasource works if the linked server
is set up in the Enterprise Manager and the OPENQUERY syntax is used.
Connections made using the OPENDATASOURCE or OPENROWSET syntax fail. The
Progress SQL-89 engine does not handle the SQL generated by SQL Server
when executing the OPENROWSET or OPENDATASOURCE query.

Linking to Progress using a SQL-92 datasource works using OPENQUERY,
OPENDATASOURCE and OPENROWSET.

</div>

<div id="id1328" class="section">

<div class="titlepage">

<div>

<div>

#### Inconsistent Metadata

</div>

</div>

</div>

Queries that fail with errors about inconsistent metadata usually
indicate that there is a discrepancy between the information returned
from SQLColumns and from SQLDescribeCol by the underlying ODBC driver.

</div>

</div>

</div>
