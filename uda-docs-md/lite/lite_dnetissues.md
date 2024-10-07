<div id="lite_dnetissues" class="section">

<div class="titlepage">

<div>

<div>

## 6.6. Known Issues

</div>

</div>

</div>

<div id="lite_dnetunsign" class="section">

<div class="titlepage">

<div>

<div>

### 6.6.1. Unsigned Type Handling

</div>

</div>

</div>

<div id="lite_dnetunsignunman" class="section">

<div class="titlepage">

<div>

<div>

#### Unmanaged ODBC Provider

</div>

</div>

</div>

The provider assumes that all integer data returned by an ODBC driver is
signed. The provider only examines the ODBC SQL type of the data to
ascertain its type. But, the ODBC SQL type gives no indication of
whether the data is signed or unsigned. The ODBC to .NET type mappings
used internally for fetched data assume that all data is signed. There
is the potential for overflow errors when fetching unsigned integer
data, because the .NET types to which integer data is mapped are all
signed. However, across the range of databases currently supported by
OpenLink, this problem only manifests itself in one instance – with the
SQL Server TinyInt type. This is the only native unsigned type supported
across the databases covered by OpenLink. However, if the ODBC provider
is to support third party ODBC drivers, more databases could expose this
fault.

The SQL Server TinyInt type has a range of 0 .. 255. It is returned by
the provider as a .NET System.SByte type which has a range of –127 ..
128. At present, TinyInt values over 128 will not be returned correctly
by the provider.

</div>

<div id="lite_dnetunsignman" class="section">

<div class="titlepage">

<div>

<div>

#### Managed Providers

</div>

</div>

</div>

The same general problem exists in the GenericClient managed provider.
However, the provider handles SQL_TINYINT data as a special case, so the
problem with the SQL Server TinyInt type does not arise. If the provider
detects data fetched using the OpenLink CTYPE_UNS8 transport type, it
changes the mapping for SQL_TINYINT from System.SByte to System.Byte.
Any other type of unsigned integer data will not be handled correctly,
but at present this does not arise as TinyInt is the only unsigned
native DBMS type the provider encounters across our currently supported
agents.

</div>

</div>

<div id="lite_dnettimestamp" class="section">

<div class="titlepage">

<div>

<div>

### 6.6.2. Timestamp Precision

</div>

</div>

</div>

Both the managed and unmanaged providers map the ODBC SQL_TYPE_TIMESTAMP
type to the .NET DateTime type. The .NET DateTime type stores times with
millisecond precision, whereas an ODBC SQL_C_TIMESTAMP struct can hold
seconds accurate to nanoseconds. A loss of precision will result when
fetching timestamp data from databases which hold fractional second data
to greater than millisecond precision. The corresponding DateTime values
returned to an application will be rounded to the nearest millisecond.

</div>

</div>
