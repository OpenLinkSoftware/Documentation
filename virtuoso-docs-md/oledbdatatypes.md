<div id="oledbdatatypes" class="section">

<div class="titlepage">

<div>

<div>

### 7.5.3. Data Types

</div>

</div>

</div>

<div id="mappings" class="section">

<div class="titlepage">

<div>

<div>

#### Data Type Mappings in Rowsets and Parameters

</div>

</div>

</div>

The methods that provide information about rowset columns and command
parameters (IColumnsInfo::GetColumnInfo,
ICommandWithParameters::GetParameterInfo) use the mapping of Virtuoso
data types into OLE DB data types shown in the following table.

<div id="id21938" class="table">

**Table 7.18. Data Type Mappings**

<div class="table-contents">

| Virtuoso Type  | OLE DB Type        |
|----------------|--------------------|
| CHAR           | DBTYPE_STR         |
| VARCHAR        | DBTYPE_STR         |
| LONG VARCHAR   | DBTYPE_STR         |
| NCHAR          | DBTYPE_WSTR        |
| NVARCHAR       | DBTYPE_WSTR        |
| LONG NVARCHAR  | DBTYPE_WSTR        |
| NUMERIC        | DBTYPE_NUMERIC     |
| DECIMAL        | DBTYPE_NUMERIC     |
| SMALLINT       | DBTYPE_I2          |
| INTEGER        | DBTYPE_I4          |
| FLOAT          | DBTYPE_R8          |
| DOUBLE         | DBTYPE_R8          |
| REAL           | DBTYPE_R4          |
| VARBINARY      | DBTYPE_BYTES       |
| LONG VARBINARY | DBTYPE_BYTES       |
| DATE           | DBTYPE_DBDATE      |
| TIME           | DBTYPE_DBTIME      |
| DATETIME       | DBTYPE_DBTIMESTAMP |
| TIMESTAMP      | BINARY             |

</div>

</div>

  

</div>

<div id="conversions" class="section">

<div class="titlepage">

<div>

<div>

#### Data Type Conversions

</div>

</div>

</div>

Applications can bind column and parameter values using data types
different from those described in
<a href="oledbdatatypes.html#mappings" class="xref"
title="Data Type Mappings in Rowsets and Parameters">the section called
“Data Type Mappings in Rowsets and Parameters”</a> . In such cases
VIRTOLEDB uses OLE DB Data Conversion Library. See MDAC documentation
for the list of supported data type conversions.

</div>

<div id="longdata" class="section">

<div class="titlepage">

<div>

<div>

#### Long Data Types

</div>

</div>

</div>

Long data types include LONG VARCHAR, LONG NVARCHAR, and LONG VARBINARY.
A long value can only be bound to a buffer that have one of these OLE DB
types:

<div class="itemizedlist">

- DBTYPE_IUNKNOWN

- DBTYPE_STR

- DBTYPE_STR \| DBTYPE_BYREF

- DBTYPE_WSTR

- DBTYPE_WSTR \| DBTYPE_BYREF

- DBTYPE_BYTES

- DBTYPE_BYTES \| DBTYPE_BYREF

</div>

Other type conversions are not supported.

If a long data is bound to a DBTYPE_IUNKNOWN type, this implies the use
of the ISequentialStream interface. VIRTOLEDB supports the
ISequentialStream::Read method both when getting and setting data. The
ISequentialStream::Write method is never supported.

</div>

</div>
