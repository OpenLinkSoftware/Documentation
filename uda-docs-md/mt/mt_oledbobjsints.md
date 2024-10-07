<div id="mt_oledbobjsints" class="section">

<div class="titlepage">

<div>

<div>

## 5.7. Objects and Interfaces Implemented by the OpenLink Provider

</div>

</div>

</div>

The OpenLink provider implements four OLE DB objects.

<div class="itemizedlist">

- The data source object, which enables consumers to connect and
  initialize the interaction with the database.

- The session, which enables consumers to create a rowset for the data
  set in the database.

- The rowset, which exposes a data set to the consumer.

- The command, which enables consumers to create a SQL string for the
  data in the database.

</div>

These objects, along with the interfaces implemented in the OpenLink
provider, are described below.

<div id="id4261" class="table">

**Table 5.2. OLE-DB Interfaces Implemented**

<div class="table-contents">

<table data-summary="OLE-DB Interfaces Implemented" data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;" data-char="." data-charoff="50">Interface
name</th>
<th data-char="." data-charoff="50">Method name</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IDBInitialize</p></td>
<td data-char="." data-charoff="50"><p>Initialize</p>
<p>Uninitialize</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IDBCreateSession</p></td>
<td data-char="." data-charoff="50"><p>CreateSession</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IDBProperties</p></td>
<td data-char="." data-charoff="50"><p>GetProperties</p>
<p>GetPropertyInfo</p>
<p>SetProperties</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IPersist</p></td>
<td data-char="." data-charoff="50"><p>GetClassID</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IGetDataSource</p></td>
<td data-char="." data-charoff="50"><p>GetDataSource</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ICommand</p></td>
<td data-char="." data-charoff="50"><p>Cancel</p>
<p>Execute</p>
<p>GetDBSession</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ICommandText</p></td>
<td data-char="." data-charoff="50"><p>GetCommandText</p>
<p>SetCommandText</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ICommandProperties</p></td>
<td data-char="." data-charoff="50"><p>GetProperties</p>
<p>SetProperties</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ICommandPrepare</p></td>
<td data-char="." data-charoff="50"><p>Prepare</p>
<p>Unprepare</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IOpenRowset</p></td>
<td data-char="." data-charoff="50"><p>OpenRowset</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IColumnsInfo</p></td>
<td data-char="." data-charoff="50"><p>GetColumnInfo</p>
<p>MapColumnIDs</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IConvertType</p></td>
<td data-char="." data-charoff="50"><p>CanConvert</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IAccessor</p></td>
<td data-char="." data-charoff="50"><p>AddRefAccessor</p>
<p>CreateAccessor</p>
<p>GetBindings</p>
<p>ReleaseAccessor</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IRowset</p></td>
<td data-char="." data-charoff="50"><p>AddRefRows</p>
<p>GetData</p>
<p>GetNextRows</p>
<p>ReleaseRows</p>
<p>RestartPosition</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IRowsetInfo</p></td>
<td data-char="." data-charoff="50"><p>GetProperties</p>
<p>GetReferencedRowset</p>
<p>GetSpecification</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IRowsetChange</p></td>
<td data-char="." data-charoff="50"><p>DeleteRows</p>
<p>InsertRow</p>
<p>SetData</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IRowsetLocate</p></td>
<td data-char="." data-charoff="50"><p>Compare</p>
<p>GetRowsAt</p>
<p>GetRowsByBookmark</p>
<p>Hash</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ISessionProperties</p></td>
<td data-char="." data-charoff="50"><p>GetProperties</p>
<p>SetProperties</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ISupportErrorInfo</p></td>
<td data-char="."
data-charoff="50"><p>InterfaceSupportsErrorInfo</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IErrorInfo</p></td>
<td data-char="." data-charoff="50"><p>GetDescription</p>
<p>GetGUID</p>
<p>GetHelpContext</p>
<p>GetHelpFile</p>
<p>GetSource</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>IErrorLookup</p></td>
<td data-char="." data-charoff="50"><p>GetErrorDescription</p>
<p>GetHelpInfo</p>
<p>ReleaseErrors</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>ISQLErrorInfo</p></td>
<td data-char="." data-charoff="50"><p>GetSQLInfo</p></td>
</tr>
</tbody>
</table>

</div>

</div>

  

<div id="mt_oledbinvprov" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.1. Invoking the OpenLink Provider

</div>

</div>

</div>

The OpenLink ODBC Provider (oploleod.dll) can be loaded using a variety
of methods, depending on your programming environment.

<div id="mt_oledbcocreateinstance" class="section">

<div class="titlepage">

<div>

<div>

#### Using CoCreateInstance

</div>

</div>

</div>

If you are writing an application which calls the OLE DB API directly, a
consumer typically creates a provider's Data Source object by passing
the provider's class identifier (CLSID) to the COM CoCreateInstance
function and requesting the IDBInitialize interface. Every OLE DB
provider declares a unique CLSID for itself. The CLSIDs for the OpenLink
ODBC Provider, the OpenLink Error Lookup Service and the OpenLink ODBC
Data Source Enumerator are given in the example below, which declares
macros for each of the class identifiers.

``` programlisting
#ifdef DBINITCONSTANTS
// Provider CLSID
EXTERN_C const CLSID CLSID_OPLOLEDB =
  {0X2D93A18D, 0XAC86, 0X11D1, {0X9C, 0XEA, 0XE5, 0X2A, 0X53, 0XBE, 0XA0, 0X7D}};
// OpenLink Error Lookup Service CLSID
EXTERN_C const CLSID CLSID_OPLOLEDB_ERROR =
  {0X2D93A18E, 0XAC86, 0X11D1, {0X9C, 0XEA, 0XE5, 0X2A, 0X53, 0XBE, 0XA0, 0X7D}};
// OpenLink ODBC Data Source Enumerator CLSID
EXTERN_C const CLSID CLSID_OPLOLEDB_ENUM =
  {0X2D93A190, 0XAC86, 0X11D1, {0X9C, 0XEA, 0XE5, 0X2A, 0X53, 0XBE, 0XA0, 0X7D}};
#else //DBINITCONSTANTS
EXTERN_C const CLSID CLSID_OPLOLEDB;
EXTERN_C const CLSID CLSID_OPLOLEDB_ERROR;
EXTERN_C const CLSID CLSID_OPLOLEDB_ENUM;
#endif //DBINITCONSTANTS
IDBInitialize * pIDBInitialize;
HRESULT hr;
hr = CoCreateInstance(CLSID_OPLOLEDB, NULL, CLSCTX_INPROC_SERVER,
      IID_IDBInitialize, (void**) &amp;pIDBInitialize);
if (FAILED(hr))
{
   // Display error
...
}
```

</div>

</div>

<div id="mt_oledbconnadodotnet" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.2. Connecting from ADO or .Net

</div>

</div>

</div>

The provider's name is "OpenLinkODBC". The OpenLink OLE DB Provider is
invoked from ADO or .Net using a connection string which typically takes
the following form:

Provider=OpenLinkODBC; Data
Source=<span class="emphasis">*w2ks2*</span>;User
ID=<span class="emphasis">*SCOTT*</span>;Password=<span class="emphasis">*tiger*</span>;Extended
Properties="Cursors=Driver;BookmarkDefault=On";

</div>

<div id="mt_initializprops" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.3. Initialization Properties

</div>

</div>

</div>

When the consumer calls IDBInitialize::Initialize, the OpenLink Provider
calls the UDBC/ODBC functions SQLSetConnectOption, to set various
connection options, and SQLDriverConnect, to connect to an ODBC data
source. The values passed to SQLSetConnectOption and SQLDriverConnect
come from the initialization properties set by the consumer.

When the data source object is first created, the value of each
initialization property is set to a default value.

<div id="mt_initpropsused" class="section">

<div class="titlepage">

<div>

<div>

#### Initialization Properties Used

</div>

</div>

</div>

The following lists the initialization properties currently used by the
OpenLink Provider. Any properties not listed are not used by the
OpenLink Provider.

<div id="id4431" class="table">

**Table 5.3. OLE-DB Initialization Properties**

<div class="table-contents">

| Property                   | Description                                                                                                                                                                                                  |
|:---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DBPROP_AUTH_PASSWORD       | Passed as the value of the PWD keyword in SQLDriverConnect.                                                                                                                                                  |
| DBPROP_AUTH_USERID         | Passed as the value of the UID keyword in SQLDriverConnect.                                                                                                                                                  |
| DBPROP_INIT_CATALOG        | Sets the initial catalog for data sources which recognise catalogs.                                                                                                                                          |
| DBPROP_INIT_DATASOURCE     | Passed as the value of the DSN keyword in SQLDriverConnect.                                                                                                                                                  |
| DBPROP_INIT_HWND           | Passed as the value of the hwnd argument in SQLDriverConnect.                                                                                                                                                |
| DBPROP_INIT_MODE           | Mapped to the ODBC connect option SQL_ACCESS_MODE.                                                                                                                                                           |
| DBPROP_INIT_PROMPT         | Passed as the value of the fDriverCompletion parameter in SQLDriverConnect.                                                                                                                                  |
| DBPROP_INIT_PROVIDERSTRING | Specifies extended properties for controlling ODBC Cursor Library usage (through the 'Cursors' keyword) and the whether bookmarks are exposed by default on rowsets (through the 'BookmarkDefault' keyword). |
| DBPROP_INIT_TIMEOUT        | Mapped to the ODBC connect option SQL_LOGIN_TIMEOUT.                                                                                                                                                         |

</div>

</div>

  

</div>

<div id="mt_setgetprovprops" class="section">

<div class="titlepage">

<div>

<div>

#### Setting and Getting Provider Properties

</div>

</div>

</div>

The data source object is the first object created when a consumer
instantiates the provider by calling <span class="emphasis">
*CoCreateInstance*</span>.

The data source object provides the starting point for communications
between the provider and consumer. For example, a consumer can call
<span class="emphasis">*CoCreateInstance*</span> and request an
<span class="emphasis">*IDBInitialize*</span> interface pointer to
instantiate a data source object. The provider has a CLSID (class ID)
that is stored in the Windows Registry. The consumer can use this CLSID
with <span class="emphasis">*CoCreateInstance*</span> to instantiate the
data source object. The OpenLink provider setup program registers the
OpenLink provider in the Windows Registry.

The data source object is responsible for setting and returning
information about the properties supported by the provider and exposing
the list of supported keywords and literals. This functionality is
supported through the mandatory
<span class="emphasis">*IDBProperties*</span> interface and the optional
<span class="emphasis"> *IDBInfo*</span> interface. The
<span class="emphasis">*IDBProperties*</span> interface contains three
methods:

<div class="itemizedlist">

- <span class="emphasis">*GetProperties*</span> returns the list of
  properties currently set on the data source object.

- <span class="emphasis">*GetPropertyInfo*</span> returns information
  about supported rowset and data source properties.

- <span class="emphasis">*SetProperties*</span> sets the properties on
  the data source object.

</div>

The <span class="emphasis">*IDBInfo*</span> interface contains two
methods:

<div class="itemizedlist">

- <span class="emphasis">*GetKeywords*</span> returns a list of
  supported keywords.

- <span class="emphasis">*GetLiteralInfo*</span> returns information
  about literals used in text commands.

</div>

</div>

</div>

<div id="mt_inuninitdsnobj" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.4. Initializing and Uninitializing the Data Source Object

</div>

</div>

</div>

The <span class="emphasis">*IDBInitialize*</span> interface contains two
methods: <span class="emphasis">*Initialize*</span> and
<span class="emphasis">*Uninitialize*</span>.

<span class="emphasis">*Initialize*</span> enables consumers to
explicitly initialize a data source object. Consumers must set
properties on the data source object before attempting to initialize it;
and consumers must supply a valid datasource name to the database in
IDBProperties::SetProperties. If the datasource is invalid, the OpenLink
provider returns an E_FAIL error on initialization.

<span class="emphasis">*Uninitialize*</span> enables consumers to return
the data source object to an uninitialized state. It is an error to call
<span class="emphasis">*IDBInitialize::Uninitialize*</span> when there
are open sessions or rowsets on the data source object.

</div>

<div id="mt_createsession" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.5. Creating a Session

</div>

</div>

</div>

After you initialize the data source object, you must create a session
object to manage the session and provide the framework needed to create
a rowset with <span class="emphasis"> *IOpenRowset::OpenRowset*</span>.
The <span class="emphasis"> *IDBCreateSession::CreateSession*</span>
interface on the data source object enables you to create a new session
object and returns an interface pointer to the session.

Once the session has been created, the provider must expose the
interface pointer to the data source object that created the session.
This interface pointer is exposed through the mandatory interface
IGetDataSource.

</div>

<div id="mt_createrowset" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.6. Creating a Rowset

</div>

</div>

</div>

The session contains the interface that enables consumers to open a
database and create a rowset object containing all rows in the database.
The OpenLink provider implements both the
<span class="emphasis">*IOpenRowset*</span>, and the
<span class="emphasis">*ICommand*</span> (and associated
<span class="emphasis">*ICommandText, ICommandProperties)*</span>
interfaces on the session to create a rowset..

<div id="mt_instantexprowset" class="section">

<div class="titlepage">

<div>

<div>

#### Instantiating and Exposing a Rowset

</div>

</div>

</div>

The <span class="emphasis">*IOpenRowset*</span> interface contains a
single method: <span class="emphasis">*OpenRowset*</span>.
<span class="emphasis">*IOpenRowset*</span> is a required interface on
the session. <span class="emphasis">*IOpenRowset::OpenRowset*</span> can
be used by consumers that do not support command objects to generate a
rowset of all rows in a table or index.

The <span class="emphasis">*ICommand*</span> interface contains the
method: <span class="emphasis"> *Execute*</span>.
<span class="emphasis">*ICommand::Execute*</span> generates a rowset
from the SQL query set by <span class="emphasis">
*ICommandText::SetCommandText*</span>.

</div>

<div id="mt_consprovintactionrowset" class="section">

<div class="titlepage">

<div>

<div>

#### Consumer and Provider Interactions with the Rowset

</div>

</div>

</div>

After receiving the rowset interface pointer, the consumer can request
rowset metadata from the provider through <span class="emphasis">
*IColumnsInfo*</span>. The consumer then creates bindings by requesting
<span class="emphasis">*IAccessor*</span> from the provider and
specifying the bindings through
<span class="emphasis">*IAccessor::CreateAccessor*</span>. The provider
returns a handle to the accessor to the consumer.

The consumer then requests a number of rows from the provider using
<span class="emphasis">*IRowset::GetNextRows*</span>. The provider
retrieves the data for these rows and stores it in the data cache. The
provider then returns an array of row handles to the consumer. Each row
handle returned by the provider has an initial reference count of one.
The consumer is then free to get the data for any rows from the provider
using <span class="emphasis"> *GetData*</span>. The consumer supplies
<span class="emphasis">*GetData*</span> with the row handle, the handle
of an accessor, and the buffer location into which to return the data;
the provider copies the data to the location specified by the consumer.

To update rows, consumers call <span class="emphasis">
*IRowsetChange::SetData*</span>, which sets the data in the data cache
to the values specified by the consumer. To delete rows from the rowset,
the consumer calls <span class="emphasis">
*IRowsetChange::DeleteRows*</span>. To insert rows into the rowset, the
consumer calls <span class="emphasis">*IRowsetChange::InsertRow*</span>.
Note that the OpenLink Provider is not able to fetch back a newly
inserted row if the underlying datasource does not provide this
functionality.

When the consumer makes any change to data in the data cache, the
effects of the change are written to the data source immediately. OLE DB
specifies a change-buffering model, which enables the consumer to make
changes that are not realized until the consumer calls
<span class="emphasis"> *IRowsetUpdate::Update*</span>; this model is
not supported by the OpenLink provider.

When the consumer has finished working with a row, it can release the
row by calling <span class="emphasis">*IRowset::ReleaseRows*</span>.
<span class="emphasis"> *ReleaseRows*</span> simply decrements the
reference count on the row in the data cache. If the reference count for
that row reaches zero, the row data is released from the data cache.

</div>

</div>

<div id="mt_exposmetadata" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.7. Exposing Metadata

</div>

</div>

</div>

the OpenLink Provider expose information about the columns of a rowset
through <span class="emphasis">*IColumnsInfo*</span>. The information
for each column is returned in a DBCOLUMNINFO structure. OLE DB also has
an optional metadata interface, <span class="emphasis">
*IColumnsRowset*</span>; the OpenLink provider does not implement this
interface.

The <span class="emphasis">*GetColumnInfo*</span> method returns
metadata that is most commonly used by consumers: column ID, column
name, the ordinal number of the column in the rowset, the column's data
type, and so on.

The provider returns the information in an array of DBCOLUMNINFO
structures, one DBCOLUMNINFO structure per column in the rowset. The
order of the structures returned in the array is the order in which the
columns appear in the rowset.

<div id="mt_icolsinfo" class="section">

<div class="titlepage">

<div>

<div>

#### IColumnsInfo

</div>

</div>

</div>

Columns that have an ODBC SQL type of SQL_LONGVARCHAR or
SQL_LONGVARBINARY are returned as type DBTYPE_BYTES or DBTYPE_STR, and
the DBCOLUMNFLAG_ISLONG is set in the dwFlags element of the
DBCOLUMNINFO structure.

</div>

<div id="mt_retcolordinals" class="section">

<div class="titlepage">

<div>

<div>

#### Returning Column Ordinals

</div>

</div>

</div>

Columns in a rowset are identified by a column ID, which is a value of
type DBID in the DBCOLUMNINFO structure.

The <span class="emphasis">*MapColumnIDs*</span> method returns column
ordinals for all column IDs provided in the
<span class="emphasis">*rgColumnIDs*</span> array. Column ordinals do
not change during the life of the rowset, but may change between
different instances of the rowset.

</div>

</div>

<div id="mt_supportedoledbconversions" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.8. Supported Conversions

</div>

</div>

</div>

Before the consumer creates an accessor, it can call
<span class="emphasis">*IConvertType::CanConvert*</span> to determine if
the provider supports a particular conversion.

<div id="mt_oledbdefdtmap" class="section">

<div class="titlepage">

<div>

<div>

#### Default Data Type Mapping

</div>

</div>

</div>

The OpenLink Provider binds to the ODBC/UDBC data source using the types
in the table below. The SQL type is queried using SQLDescribeCol. The
sign of the data type (signed/unsigned) is determined using
SQLColAttributes. It is used in deciding which C type to use in internal
buffers and which type indicator to return through
<span class="emphasis"> *IColumnsInfo::GetColumnInfo*</span>.

<div id="id4580" class="table">

**Table 5.4. OLE-DB Data Type Mappings**

<div class="table-contents">

<table data-summary="OLE-DB Data Type Mappings" data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;" data-char="." data-charoff="50">SQL Type
Indicator</th>
<th data-char="." data-charoff="50">Indicator of C Type Used For
Internal Buffers</th>
<th data-char="." data-charoff="50">OLE DB Type Indicator</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_CHAR,</p>
<p>SQL_VARCHAR,</p>
<p>SQL_LONGVARCHAR,</p>
<p>SQL_DECIMAL,</p>
<p>SQL_NUMERIC</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_CHAR</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_STR</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_BIT</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_BIT</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_BOOL</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_TINYINT,</p>
<p>SQL_SMALLINT</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_USHORT,</p>
<p>SQL_C_SSHORT</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_I2</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_INTEGER</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_ULONG,</p>
<p>SQL_C_SLONG</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_I4</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_BIGINT</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_STR</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_STR</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_REAL</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_FLOAT</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_R4</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_FLOAT,</p>
<p>SQL_DOUBLE</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_DOUBLE</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_R8</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_BINARY,</p>
<p>SQL_VARBINARY,</p>
<p>SQL_LONGVARBINARY</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_BINARY</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_BYTES</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_DATE</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_DATE</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_DATE</p></td>
</tr>
<tr class="even">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_TIME</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_TIME</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_DATE</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;" data-char="."
data-charoff="50"><p>SQL_TIMESTAMP</p></td>
<td data-char="." data-charoff="50"><p>SQL_C_TIMESTAMP</p></td>
<td data-char="." data-charoff="50"><p>DBTYPE_DATE</p></td>
</tr>
</tbody>
</table>

</div>

</div>

  

</div>

<div id="mt_oledblenbind" class="section">

<div class="titlepage">

<div>

<div>

#### Length Binding

</div>

</div>

</div>

For types DBTYPE_UI1, DBTYPE_I2, DBTYPE_I4, DBTYPE_I8, DBTYPE_R4,
DBTYPE_R8, DBTYPE_CY, DBTYPE_NUMERIC, the length binding is always set
to the fixed size of the destination binding type, rather than the
internal source type.

</div>

<div id="mt_oledbsupdataconversions" class="section">

<div class="titlepage">

<div>

<div>

#### Supported Data Conversions

</div>

</div>

</div>

The follwoing table outlines the supported type conversion implemented
in the OpenLink provider. An 'X' means supported, and '-' means not
supported.

<div id="id4683" class="table">

**Table 5.5. OLE-DB Data Type Conversions**

<div class="table-contents">

|             | I1  | I2  | I4  | I8  | UI1 | UI2 | UI4 | UI8 | R4  | R8  | CY  | DEC | NUM | BOOL | DATE | DBDATE | DBTIMESTAMP | DBTIME | BYTES | BSTR | STR | WSTR | DISP | UNK | GUID |
|:------------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|------|------|--------|-------------|--------|-------|------|-----|------|------|-----|------|
| I1          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| I2          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| I4          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| I8          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| UI1         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| UI2         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| UI4         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| UI8         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| R4          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| R8          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| CY          | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| DEC         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| NUM         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| BOOL        | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | X    | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | \-   |
| DATE        | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | X    | X      | X           | X      | X     | X    | X   | X    | \-   | \-  | \-   |
| DBDATE      | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | X    | X      | \-          | X      | X     | X    | X   | X    | \-   | \-  | \-   |
| DBTIME      | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | X    | \-     | X           | X      | X     | X    | X   | X    | \-   | \-  | \-   |
| DBTIMESTAMP | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | X    | X      | X           | X      | X     | X    | X   | X    | \-   | \-  | \-   |
| BYTES       | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X    | X    | X      | \-          | X      | X     | X    | X   | X    | X    | X   | X    |
| BSTR        | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X    | X    | X      | X           | X      | X     | X    | X   | X    | \-   | \-  | X    |
| STR         | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X    | X    | X      | X           | X      | X     | X    | X   | X    | \-   | X   | X    |
| WSTR        | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X   | X    | X    | X      | X           | X      | X     | X    | X   | X    | \-   | X   | X    |
| DISP        | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | \-   | \-     | \-          | \-     | X     | \-   | \-  | \-   | X    | X   | \-   |
| UNK         | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | \-   | \-     | \-          | \-     | X     | \-   | \-  | \-   | \-   | X   | \-   |
| GUID        | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-  | \-   | \-   | \-     | \-          | \-     | X     | X    | X   | X    | \-   | \-  | X    |

</div>

</div>

  

</div>

</div>

<div id="mt_createuseaccessors" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.9. Creating and Using Accessors

</div>

</div>

</div>

Consumers describe the memory structure for their buffers through a
process called binding. An accessor is a group of bindings. The OpenLink
provider does not currently support reference accessors, which allow the
consumer direct access to the rowset's data cache.

Accessors are implemented through
<span class="emphasis">*IAccessor*</span>. Accessors are created with
<span class="emphasis">*IAccessor::CreateAccessor*</span> and released
with <span class="emphasis">*IAccessor::ReleaseAccessor*</span>.
<span class="emphasis"> *IAccessor::GetBindings*</span> can be used to
determine the bindings in an existing accessor.
IAccessor::AddRefAccessor enables the consumer to add a reference count
to an existing accessor.

Accessors may not always be validated immediately at the time of
creation. Instead, they may be validated at the time the first row is
fetched. Errors will be returned at the first attempt to use such an
accessor.

Creating an Accessor

<span class="emphasis">*CreateAccessor*</span> associates a set of
bindings with an accessor handle that is used to send data to or fetch
data from the rowset's data cache. The OpenLink provider supports only
the DBACCESSOR_ROWDATA accessor flag, which specifies that the accessor
is to be used for rowset data.

Returning Accessor Bindings

<span class="emphasis">*GetBindings*</span> returns the bindings in an
existing accessor.

Adding a Reference Count to an Existing Accessor

AddRefAccessor adds a reference count to an existing accessor.

Releasing an Accessor

<span class="emphasis">*ReleaseAccessor*</span> decrements the reference
count on an accessor; when the reference count reaches zero, the
accessor is released.

</div>

<div id="mt_oledbrowsetmetadata" class="section">

<div class="titlepage">

<div>

<div>

### 5.7.10. Rowset MetaData

</div>

</div>

</div>

<span class="emphasis">*IRowsetInfo*</span> enables consumers to query
the properties of a rowset through <span class="emphasis">
*IRowsetInfo::GetProperties*</span>. Consumers can get an interface
pointer to the object that created the rowset by calling
<span class="emphasis">*IRowsetInfo::GetSpecification*</span>.

<span class="emphasis">*IRowset*</span> provides methods for fetching
rows sequentially, exposing data from those rows to consumers, and
managing the rows in the rowset. <span class="emphasis">*IRowset*</span>
contains five methods: <span class="emphasis">*AddRefRows*</span>,
<span class="emphasis">*GetData*</span>, <span class="emphasis">
*GetNextRows*</span>, <span class="emphasis">*ReleaseRows*</span>, and
<span class="emphasis"> *RestartPosition*</span>.

<div id="mt_increfcountrowhndl" class="section">

<div class="titlepage">

<div>

<div>

#### Incrementing the Reference Count on Row Handles

</div>

</div>

</div>

<span class="emphasis">*AddRefRows*</span> increments the reference
count on the row handles supplied by the caller.
<span class="emphasis">*AddRefRows*</span> enables consumers to make
multiple references to a row in the data cache.

</div>

<div id="mt_popldatacache" class="section">

<div class="titlepage">

<div>

<div>

#### Populating the Data Cache

</div>

</div>

</div>

<span class="emphasis">*IRowset::GetNextRows*</span> gets the next
sequence of rows from the datasource and places them in the rowset's
data cache. When <span class="emphasis">*GetNextRows*</span> is first
called, it starts at the beginning of the rowset. After that,
<span class="emphasis">*GetNextRows*</span> maintains information about
its current position so it can proceed forward from that position. The
OpenLink provider also provides support for
<span class="emphasis">*IRowset::RestartPosition*</span>, which
repositions the next fetch position to the beginning of the rowset.

</div>

<div id="mt_retrdatafromcache" class="section">

<div class="titlepage">

<div>

<div>

#### Retrieving Data from the Data Cache

</div>

</div>

</div>

<span class="emphasis">*IRowset::GetData*</span> enables consumers to
retrieve data from the data cache.
<span class="emphasis">*GetData*</span> uses the bindings in the
accessor to determine how the data should be returned and what data
should be returned to the consumer's buffer. Then,
<span class="emphasis">*GetData*</span> converts the data in the cache
to the type specified in the binding and transfers the converted data to
the consumer.

</div>

<div id="mt_decrefcountrowhndl" class="section">

<div class="titlepage">

<div>

<div>

#### Decrementing the Reference Count on Row Handles

</div>

</div>

</div>

<span class="emphasis">*IRowset::ReleaseRows*</span> decrements the
reference count on the rows specified. A consumer must call
<span class="emphasis"> *ReleaseRows*</span> once for each time a row
was fetched or each time the row had its reference count incremented by
<span class="emphasis"> *AddRefRow*</span>. When the reference count
reaches zero, the row is released if the rowset is in immediate update
mode.

In providers that implement
<span class="emphasis">*IRowsetUpdate*</span>, rows are released unless
there are pending changes on the row. The OpenLink provider does not
implement this interface; the OpenLink provider always performs rowset
updates in immediate mode, which means that changes are immediately
applied to the underlying data source. Therefore, the OpenLink provider
does not recognize any changes as pending.

</div>

<div id="mt_oledbretrowsetfirstrow" class="section">

<div class="titlepage">

<div>

<div>

#### Returning to the First Row of the Rowset

</div>

</div>

</div>

<span class="emphasis">*IRowset::RestartPosition*</span> moves the next
fetch position used by <span class="emphasis">*GetNextRows*</span> to
the first row of the rowset.

</div>

<div id="mt_oledbupdrows" class="section">

<div class="titlepage">

<div>

<div>

#### Updating Rows

</div>

</div>

</div>

<span class="emphasis">*IRowsetChange*</span> enables consumers to
change the values of columns in a row of data. If the consumer wants to
change the data, it must first construct an accessor for the columns to
be changed. <span class="emphasis">*IRowsetChange*</span> contains three
methods: DeleteRows, InsertRow, and
<span class="emphasis">*SetData*</span>.

</div>

<div id="mt_oledbdelrows" class="section">

<div class="titlepage">

<div>

<div>

#### Deleting Rows

</div>

</div>

</div>

<span class="emphasis">*IRowsetChange*</span> also enables consumers to
delete rows from the rowset.
<span class="emphasis">*IRowsetChange*</span>::<span class="emphasis">*DeleteRows*</span>
deletes rows from the rowset and are applied to the data source
immediately.

</div>

<div id="mt_irowsetchange" class="section">

<div class="titlepage">

<div>

<div>

#### IRowsetChange

</div>

</div>

</div>

IRowsetChange is implemented using the UDBC/ODBC function SQLSetPos. It
therefore can be exposed only when the underlying datasource supports
SQLSetPos. Newly inserted rows cannot be updated.

</div>

</div>

</div>
