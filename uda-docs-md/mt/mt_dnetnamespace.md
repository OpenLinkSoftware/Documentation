<div id="mt_dnetnamespace" class="section">

<div class="titlepage">

<div>

<div>

## 4.5. OpenLink.Data Namespace

</div>

</div>

</div>

All the public classes in the OpenLink.Data namespace are detailed in
this section. Note that all of the OpenLink .Net Data Providers use the
same common class names, thus the descriptions below are applicable to
all enabling maximum re-use of code across Providers.

<span class="emphasis">*IMPORTANT: Public class members inherited from a
base class defined by the .NET Framework Class Library (FCL), or which
implement an FCL defined interface method, are not described. For
details of these inherited members, refer to the .NET FCL documentation
for the base class or interface. Where an OpenLink class implements an
ADO.NET interface and adds additional methods or properties, these
extensions are documented.* </span>

In the class descriptions which follow, all code extracts showing
partial class definitions, method signatures etc. are in C#. Examples
for other .NET languages are not shown.

<div id="mt_cloplcommand" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.1. OPLCommand

</div>

</div>

</div>

Represents an SQL statement or stored procedure to execute against a
database.

``` programlisting
public class OPLCommand : Component, IDbCommand, ICloneable
```

<div id="mt_cloplcommandC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLCommand ();
```

Initializes a new instance of the OPLCommand class.

``` programlisting
public OPLCommand (string cmdText);
```

Initializes a new instance of the OPLCommand class with the text of the
query.

``` programlisting
public OPLCommand (string cmdText, OPLConnection connection);
```

Initializes a new instance of the OPLCommand class with the text of the
query and an OPLConnection object.

``` programlisting
public OPLCommand (string cmdText, OPLConnection connection,OPLTransaction txn);
```

Initializes a new instance of the OPLCommand class with the text of the
query, an OPLConnection object and an OPLTransaction object.

</div>

<div id="mt_cloplcommandP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

<div id="id1319" class="section">

<div class="titlepage">

<div>

<div>

##### PassThrough

</div>

</div>

</div>

``` programlisting
public bool PassThrough {get; set;}
```

Allows the command text to be passed to the data source without being
parsed by the Generic Provider.

</div>

<div id="id1320" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The PassThrough property defaults to false. When pass-through is
disabled, the Generic Provider parses command text associated with the
OPLCommand and queries the data source for additional metadata on tables
referenced in a select statement. The command parser in the Generic
Provider is limited to the SQL grammar defined by ODBC. If you wish to
pass native SQL to the data source you should enable pass-through;
however this will have the following side-effects:

|                                                                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Some of the metadata returned by OPLDataReader.GetSchemaTable may not be accurate, specifically the metadata resultset columns IsKeyColumn, BaseSchemaName, BaseCatalogName, BaseTableName. |
| The command behavior setting CommandBehavior.KeyInfo will not append missing key columns to the end of a select list.                                                                       |
| OPLCommandBuilder may not work, depending on the select statement used.                                                                                                                     |

</div>

</div>

</div>

<div id="mt_cloplcommandbuild" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.2. OPLCommandBuilder

</div>

</div>

</div>

Automatically generates single-table commands used to reconcile changes
made to a DataSet with the associated data source.

``` programlisting
public sealed class OPLCommandBuilder : Component
```

<div id="mt_cloplcommandbuildC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLCommandBuilder ();
```

Initializes a new instance of the OPLCommandBuilder class.

``` programlisting
public OPLCommandBuilder (OPLDataAdapter adapter);
```

Initializes a new instance of the OPLCommandBuilder class with the
associated OPLDataAdapter object.

</div>

<div id="mt_cloplcommandbuildM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
public static void DeriveParameters (OPLCommand command);
```

Retrieves parameter information from the stored procedure specified in
the OPLCommand and populates the Parameters collection of the specified
OPLCommand object.

``` programlisting
protected override void Dispose (bool disposing);
```

Releases the resources used by the OPLCommandBuilder.

``` programlisting
public OPLCommand GetDeleteCommand ();
```

Gets the automatically generated OPLCommand object required to perform
deletions at the data source.

``` programlisting
public OPLCommand GetInsertCommand ();
```

Gets the automatically generated OPLCommand object required to perform
insertions at the data source.

``` programlisting
public OPLCommand GetUpdateCommand ();
```

Gets the automatically generated OPLCommand object required to perform
updates at the data source.

``` programlisting
public void RefreshSchema ();
```

Refreshes the database schema information used to generate INSERT,
UPDATE, or DELETE statements.

</div>

<div id="mt_cloplcommandbuildP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public OPLDataAdapter DataAdapter {get; set;}
```

Gets or sets an OPLDataAdapter object for which this OPLCommandBuilder
object will generate SQL statements.

``` programlisting
public string QuotePrefix {get; set;}
```

Gets or sets the beginning character or characters to use when working
with database objects (for example, tables or columns) whose names
contain characters such as spaces or reserved tokens.

``` programlisting
public string QuoteSuffix {get; set;}
```

Gets or sets the ending character or characters to use when working with
database objects, (for example, tables or columns), whose names contain
characters such as spaces or reserved tokens.

</div>

</div>

<div id="mt_cloplconnect" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.3. OPLConnect

</div>

</div>

</div>

Represents an open connection to a data source.

``` programlisting
public sealed class OPLConnection : Component, ICloneable, IDbConnection
```

<div id="mt_cloplconnectC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLConnection();
```

Initializes a new instance of the OPLConnect class.

``` programlisting
public OPLConnection(string connectionString);
```

Initializes a new instance of the OPLConnection class with the specified
connection string.

</div>

<div id="mt_cloplconnectM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
protected override void Dispose (bool disposing);
```

Releases the resources used by the OPLConnection.

</div>

<div id="mt_cloplconnectE" class="section">

<div class="titlepage">

<div>

<div>

#### Events

</div>

</div>

</div>

``` programlisting
public event StateChangeEventHandler StateChange;
```

Occurs when the state of the connection changes.

<div id="id1321" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The StateChange event is raised immediately after the State changes from
Closed to Opened, or from Opened to Closed.

``` programlisting
public event OPLInfoMessageEventHandler InfoMessage;
```

Returns warning messages from the DBMS.

``` programlisting
public delegate void OPLInfoMessageEventHandler (object sender, OPLInfoMessageEventArgs e)
```

``` programlisting
class OPLInfoMessageEventArgs;
```

</div>

</div>

</div>

<div id="mt_clopldataadapter" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.4. OPLDataAdapter

</div>

</div>

</div>

Represents a set of data commands and a database connection that are
used to fill a DataSet and update a data source.

<div id="mt_clopldataadapterC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLDataAdapter();
```

Initializes a new instance of the OPLDataAdapter class.

``` programlisting
public OPLDataAdapter (OPLCommand selectCommand);
```

Initializes a new instance of the OPLDataAdapter class with the
specified SQL SELECT statement.

``` programlisting
public OPLDataAdapter (string selectCommandText, OPLConnection selectConnection);
```

Initializes a new instance of the OPLDataAdapter class with an SQL
SELECT statement and an OPLConnection.

``` programlisting
public OPLDataAdapter (string selectCommandText, string selectConnectionString);
```

Initializes a new instance of the OPLDataAdapter class with an SQL
SELECT statement and a connection string.

</div>

<div id="mt_clopldatadapterM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
public event OPLRowUpdatedEventHandler RowUpdated;
```

Occurs during an Update operation after a command is executed against
the data source.

``` programlisting
public event OPLRowUpdatingEventHandler RowUpdating;
```

Occurs during an Update operation before a command is executed against
the data source.

</div>

</div>

<div id="mt_clopldatareader" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.5. OPLDataReader

</div>

</div>

</div>

Provides a way of reading a forward-only stream of data rows from a data
source.

``` programlisting
public sealed class OPLDataReader : MarshalByRefObject, IDataReader, IDataRecord, IDisposable, IEnumerable
```

</div>

<div id="mt_cloplerror" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.6. OPLError

</div>

</div>

</div>

Holds information about a warning or error returned by a data source.

``` programlisting
public sealed class OPLError
```

<div id="mt_cloplerrorR" class="section">

<div class="titlepage">

<div>

<div>

#### Remarks

</div>

</div>

</div>

This class is created whenever an error occurs. Each instance of
OPLError created is then managed by the OPLErrorCollection class, which
in turn is created by the OPLException class.

</div>

<div id="mt_cloplerrorP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public string Message {get;}
```

Gets a short description of the error.

``` programlisting
public string SQLState {get;}
```

Gets the five character ODBC SQL state associated with the error.

``` programlisting
public int NativeError {get;}
```

Gets the data source-specific error information.

</div>

</div>

<div id="mt_cloplerrorcol" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.7. OPLErrorCollection

</div>

</div>

</div>

Represents a collection of one or more OPLError objects that give
detailed information about an OPLException.

``` programlisting
public sealed class OPLErrorCollection : ICollection
```

<div id="mt_cloplerrorcolR" class="section">

<div class="titlepage">

<div>

<div>

#### Remarks

</div>

</div>

</div>

This class is created by OPLException to collect instances of the
OPLError class. OPLErrorCollection always contains at least one instance
of the OPLError class.

</div>

<div id="mt_cloplerrorcolM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
public IEnumerator GetEnumerator();
```

This member supports the .NET Framework infrastructure and is not
intended to be used directly from your code.

</div>

<div id="mt_cloplerrorcolP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public OPLError this[int i] {get;}
```

Gets the error at the specified index. In C#, this property is the
indexer for the OPLErrorCollection class.

</div>

</div>

<div id="mt_cloplexcept" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.8. OPLException

</div>

</div>

</div>

The exception that is generated when a warning or error is returned by a
data source or the Generic Provider.

``` programlisting
public sealed class OPLException : SystemException
```

<div id="mt_cloplexceptP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public OPLErrorCollection Errors {get;}
```

Gets a collection of one or more OPLError objects that give detailed
information about the exception.

``` programlisting
public override string Message {get;}
```

Gets the text describing the error.

</div>

</div>

<div id="mt_cloplparam" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.9. OPLParameter

</div>

</div>

</div>

Represents a parameter to an OPLCommand and optionally, its mapping to a
DataSet column.

``` programlisting
public class OPLParameter : MarshalByRefObject, IDbDataParameter, IDataParameter, ICloneable
```

<div id="mt_cloplparamC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLParameter();
```

Initializes a new instance of the OPLParameter class.

``` programlisting
public OPLParameter(string parameterName, object value);
```

Initializes a new instance of the OPLParameter class with the parameter
name and a value of the new OPLParameter object.

``` programlisting
public OPLParameter(string parameterName, OPLDbType type);
```

Initializes a new instance of the OPLParameter class with the parameter
name and the data type.

``` programlisting
public OPLParameter(string parameterName, OPLDbType type, int size);
```

Initializes a new instance of the OPLParameter class with the parameter
name, the OPLDbType and the size.

``` programlisting
public OPLParameter(string parameterName, OPLDbType type, int size, string sourceColumn);
```

Initializes a new instance of the OPLParameter class with the parameter
name, the OPLDbType, the size, and the source column name.

``` programlisting
public OPLParameter(string parameterName, OPLDbType type, int size, ParameterDirection direction, Boolean isNullable, Byte precision, Byte scale, string sourceColumn, DataRowVersion sourceVersion, object value);
```

Initializes a new instance of the OPLParameter class with the parameter
name, the type of the parameter, the size of the parameter, a
ParameterDirection, whether the parameter is nullable, the precision of
the parameter, the scale of the parameter, the source column, a
DataRowVersion to use, and the value of the parameter.

</div>

<div id="mt_cloplparamM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
public override string ToString ();
```

Gets a string containing the ParameterName.

</div>

<div id="mt_cloplparamP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public OPLDbType OPLDbType {get; set;}
```

Gets or sets the OPLDbType of the parameter.

<div id="id1322" class="section">

<div class="titlepage">

<div>

<div>

##### Remarks

</div>

</div>

</div>

The OPLDbType and DbType are linked. Therefore, setting the DbType
changes the OPLType to a supporting OPLDbType. For a list of the
supported data types, see the appropriate OPLDbType member.

</div>

</div>

</div>

<div id="mt_cloplparamcol" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.10. OPLParameterCollection

</div>

</div>

</div>

Represents a collection of parameters relevant to an OPLCommand as well
as their respective mappings to columns in a DataSet.

``` programlisting
public class OPLParameterCollection : MarshalByRefObject, IDataParameterCollection, ICollection, IEnumerable, IList
```

<div id="mt_cloplparamcolM" class="section">

<div class="titlepage">

<div>

<div>

#### Methods

</div>

</div>

</div>

``` programlisting
public int Add (OPLParameter value);
```

Adds the specified OPLParameter to the OPLParameterCollection

``` programlisting
public int Add (string parameterName, object value);
```

Adds an OPLParameter to the OPLParameterCollection given the parameter
name and value.

``` programlisting
public int Add (string parameterName, OPLDbType dbType);
```

Adds an OPLParameter to the OPLParameterCollection given the parameter
name and data type.

``` programlisting
public int Add (string parameterName, OPLDbType dbType, int size);
```

Adds an OPLParameter to the OPLParameterCollection given the the
parameter name, data type, and column length.

``` programlisting
public int Add (string parameterName, OPLDbType dbType, int size, string sourceColumn);
```

Adds an OPLParameter to the OPLParameterCollection given the parameter
name, data type, column length, and source column name.

</div>

<div id="mt_cloplparamcolP" class="section">

<div class="titlepage">

<div>

<div>

#### Properties

</div>

</div>

</div>

``` programlisting
public OPLParameter this[int index] {get; set;}
```

Gets or sets the OPLParameter at the specified index

``` programlisting
public OPLParameter this[string parameterName] {get; set;}
```

Gets or sets the OPLParameter with the specified name.

</div>

</div>

<div id="mt_rUpdated" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.11. OPLRowUpdatedEventArgs

</div>

</div>

</div>

Provides data for the OPLDataAdapter.RowUpdated event.

<div id="mt_rUpdatedC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLRowUpdatedEventArgs(DataRow row, IDbCommand command, StatementType statementType, DataTableMapping tableMapping);
```

Initializes a new instance of the OPLRowUpdatedEventArgs class.

</div>

<div id="mt_rUpdatedM" class="section">

<div class="titlepage">

<div>

<div>

#### properties

</div>

</div>

</div>

``` programlisting
public new OPLCommand Command {get;}
```

Gets the OPLCommand executed when Update is called.

</div>

</div>

<div id="mt_rUpdatedHan" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.12. OPLRowUpdatedEventHandler

</div>

</div>

</div>

Represents a method that will handle the RowUpdated event of an
OPLDataAdapter.

``` programlisting
public delegate void OPLRowUpdatedEventHandler(object sender, OPLRowUpdatedEventArgs e);
```

</div>

<div id="mt_rUpdating" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.13. OPLRowUpdatingEventArgs

</div>

</div>

</div>

Provides data for the OPLDataAdapter.RowUpdating event.

<div id="mt_rUpdatingC" class="section">

<div class="titlepage">

<div>

<div>

#### Constructors

</div>

</div>

</div>

``` programlisting
public OPLRowUpdatingEventArgs(DataRow row, IDbCommand command, StatementType statementType, DataTableMapping tableMapping);
```

Initializes a new instance of the OPLRowUpdatingEventArgs class.

</div>

<div id="mt_rUpdatingM" class="section">

<div class="titlepage">

<div>

<div>

#### properties

</div>

</div>

</div>

``` programlisting
public new OPLCommand Command {get; set;}
```

Gets or sets the OPLCommand to execute when Update is called.

</div>

</div>

<div id="mt_rUpdatingHan" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.14. OPLRowUpdatingEventHandler

</div>

</div>

</div>

Represents a method that will handle the RowUpdating event of an
OPLDataAdapter.

``` programlisting
public delegate void OPLRowUpdatingEventHandler(object sender, OPLRowUpdatingEventArgs e);
```

</div>

<div id="mt_clopltran" class="section">

<div class="titlepage">

<div>

<div>

### 4.5.15. OPLTransaction

</div>

</div>

</div>

Represents an SQL transaction to be made at a data source.

``` programlisting
public sealed class OPLTransaction : MarshalByRefObject, IDbTransaction, IDisposable
```

</div>

</div>
