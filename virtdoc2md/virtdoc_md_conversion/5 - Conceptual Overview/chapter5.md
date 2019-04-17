# Conceptual Overview

# Core Database Engine

## Logical Data Model

Virtuoso provides an extended Object Relational model which offers all
the flexibility of relational access with inheritance, run time data
typing, late binding, identity based access.

### Table

A table is a uniquely named entity that has the following
characteristics:

  - Zero or more columns

  - One primary key

  - Zero or more keys (indices)

  - An optional super table from which this inherits properties

  - An optional object ID key, which may or may not be the primary key

  - Various SQL table constraints, e.g. CHECK's

A table will then have zero or more rows. The relationship of a table
and its rows can be thought of as a class-instance relationship.

### Column

A column is always defined in one table and has a name that is unique
within that table. A column may appear in more than one table as a
result of inheritance but always has one place of definition. i.e. one
database wide 'identity'.

A column has the following characteristics:

  - Table

  - Name inside the table

  - database wide ID

  - Data type

  - Various SQL constraints, e.g. DEFAULT, CHECK etc.

### Key

A key or index is the means by which tables manifest themselves in the
physical database. A key is always defined with respect to one table but
may occur in several as a result of inheritance. Keys have unique names
inside the table. A key has the following characteristics:

  - A database wide key ID

  - One or more 'significant' key parts, which are columns of the
    defining table or super tables

  - Zero or more 'trailing' key parts, columns of the defining table or
    supertables.

  - Whether the key is primary

  - Whether the key is unique

  - How the key is clustered

  - Whether the key is an object ID key

### Subtable

A subtable is a table that inherits all columns, the primary key and all
other keys from another table, called the super table.

A subtable can define its own columns and keys which add themselves to
those of the super table. No primary key can be redefined, though.

The inheritance relationship between tables is manifested by a
key-subkey relationship between the tables' primary and other keys.

A table has at most one supertable.

### Object ID

A table does not necessarily declare a primary key. Even so, the table
must have a primary key - in this case a synthetic record ID which is
defined as primary key. The record ID is an autoincrementing column that
is normally invisible but, if present, can be accessed by explicit
reference. One should not rely on this feature being available, though.

Thus

    create table nokey (a integer);

expands to

    create table nokey (a integer, _IDN integer identity, primary key (_IDN));

The first unique index to be defined will become the primary key if the
table is empty at the time of definition.

Thus

    create unique index a on nokey (a);

will change the nokey table to be as if defined by

    create table nokey (a integer, primary key (a));

Having a primary key other than \_IDN is always better than the default
primary key. Declaring a primary key is therefore always advisable.

## Data Types

Virtuoso supports most SQL 92 data types.

### CHARACTER & VARCHAR

  - CHARACTER

  - VARCHAR

  - VARCHAR '(' INTNUM ')'

  - VARCHAR

  - NVARCHAR '(' INTNUM ')'

  - CHARACTER '(' INTNUM ')'

The CHAR, CHARACTER and VARCHAR datatypes are implemented as a single
string type with dynamic length. The precision that may be specified
controls how the column is described by `SQLColumns()` ,
`SQLDescribeCol()` and so on. If a precision is not specified for a
VARCHAR then the default precision will be 0, which means do not check.
If a precision is not specified for a CHARACTER then Virtuoso sets the
precision to 1. An explicit precision of 0 can be specified to turn off
length checking for values stored in the column. If a value other than
string or NULL is assigned to the column it is cast to a varchar (using
CAST internally) and then stored into the column. If the value is not
castable to a varchar then Virtuoso returns an error. Additionally if
the column precision is greater than 0 and the value string length is
greater than the column precision Virtuoso will also return an error.

The length is stored separately. Space required is 2+length for

A varchar column may contain binary 0 bytes.

A string literal is delimited by single quotes.

### ANY

  - ANY

The ANY datatype is implemented as a single binary string type with
dynamic length. It is reported as a VARCHAR in `SQLColumns()` ,
`SQLDescribeCol()` and so on. The precision returned by these columns is
24 but has no effect. This type can contain arbitrary binary data,
including zeros.

The length is stored separately. The space required is 2+length

### NUMERIC & DECIMAL

  - NUMERIC

  - NUMERIC '(' INTNUM ')'

  - NUMERIC '(' INTNUM ',' INTNUM ')'

  - DECIMAL

  - DECIMAL '(' INTNUM ')'

  - DECIMAL '(' INTNUM ',' INTNUM ')'

The various forms of NUMERIC and DECIMAL refer to one variable-precision
floating point decimal data type that provides accurate arithmetic and
decimal rounding. The default maximum precision and scale are 40 and 20.
The precision is the number of decimal digits used in the computation.
The scale is the maximum number of decimal digits to the right of the
decimal point. Internal calculations are always precise but numbers are
truncated to the column's precision and scale when stored. If a value
being stored has more digits to the left of the decimal point than
allowed in the column, Virtuoso signals an error. If a number being
stored has more digits to the right of the decimal point than allowed in
a column the decimal part is rounded to the precision of the column.

The space consumption of a number is

    3 + precision / 2

bytes. The precision and scale of a column of this type are returned by
functions such as `SQLColumns()` and `SQLDescribeCol()` .

A DECIMAL or NUMERIC with precision \<= 9 and scale = 0 is transformed
to INTEGER.

Literal numbers outside of the 32 bit signed integer range are of type
decimal. Any numeric literals with a decimal point are of type decimal.
Literals with an exponent are of type double precision.

### INTEGER & SMALLINT

  - INT

  - INTEGER

  - SMALLINT

These types are represented as a 32-bit signed binary integer, described
as having a precision of 9 and a scale of 0, although the range is +/-
2\*\*31. Storage space is 2 bytes for SMALLINT and 4 bytes otherwise.

A column declared SMALLINT is described as SQL\_SMALLINT. A column
declared INTEGER or INT is described as SQL\_INTEGER.

Literals composed of of an optional sign and digits are of the integer
type if they fit in the 32 bit range.

### FLOAT & DOUBLE

  - FLOAT

  - FLOAT '(' INTNUM ')'

  - DOUBLE PRECISION

These types refer to the 64-bit IEEE floating-point number, the C
`double` type. This is a fixed-precision binary floating point number is
described as having a precision of 15 and a scale of 0. This type is
preferable to NUMERIC if decimal rounding is not required since it is
precise enough for most uses and more efficient than NUMERIC. The
storage requirement is 8 bytes.

Any number literal with an exponent has the double type, e.g. 2e9.

### REAL

  - REAL

This type is the 32-bit IEEE floating point number corresponding to the
C `float` type. The storage requirement is 5 bytes.

### LONG VARCHAR & LONG VARBINARY

  - LONG VARCHAR

  - LONG VARBINARY

These types implement a binary large object (BLOB) type. The length can
be up to 2\*\*31 bytes (2GB). If manipulated with the `SQLGetData()` and
`SQLPutData()` ODBC functions a BLOB need not fit in the DBMS's or the
client's memory. The LONG VARCHAR and LONG VARBINARY types are distinct
only because certain ODBC applications gain from being able to
distinguish long text from long binary. The types are described as
SQL\_LONGVARCHAR and SQL\_LONGVARBINARY respectively, with a precision
of 2GB.

Several long columns may exist on a single row. A long column may not be
a key part in an index or primary key.

Data in long columns is stored as a linked list of database pages. Thus,
a long column that does not fit in-line on the containing row will
require an integer number of 8K database pages. If a long column's value
is short enough to fit within the row containing it, the BLOB will be
stored on the row and will not take more space than a VARCHAR of the
same length. A long column fits on a row if the sum of the lengths of
columns, including the long column, is under 4070 bytes.

ORDER BY, GROUP BY and DISTINCT may not reference long data types.
Comparison of long data is not allowed unless first converted to the
corresponding short type (varchar, nvarchar or varbinary). This
conversion is only possible if the value is under 10MB in size. String
functions accept long varchars and long nvarchars and convert them to
varchar and nvarchar automatically. There is no long literal type per
se, the corresponding character or binary type is assignable to a long
type.

### VARBINARY

  - VARBINARY

This type is internally like VARCHAR but is distinct for compatibility
with ODBC applications. A VARBINARY column is described as SQL\_BINARY
to ODBC clients. The storage requirement is the same as for a
corresponding VARCHAR column. VARBINARY and VARCHAR data are never equal
even if the content is the same, but they can be cast to each other.
VARBINARY data sorts in the unsigned order of the bytes comprising the
data.

A varbinary literal is introduced by 0x followed by a hexadecimal
representation of the bytes, 2 characters per byte, e.g.
0x0123456789abcdef.

### TIMESTAMP; DATE & TIME

  - TIMESTAMP

  - DATETIME

  - TIME

  - DATE

All the time- and date-related types are internally represented as a
single 'datetime' type consisting of a Julian day, hour, minute, second,
6-digit fraction and timezone. The range of the year is from 0 to over
9999. This type can accommodate all values of any SQL92 time-related
type.

Although the internal representation is the same, a column of a
time-related type is described as being of the appropriate ODBC type,
i.e. SQL\_TIMESTAMP for TIMESTAMP and DATETIME and SQL\_DATE for DATE
and SQL\_TIME for TIME.

A DATETIME is described as precision 19, a DATE as precision 10 and a
TIME as precision 8.

A column declared a TIMESTAMP is automatically set to the timestamp of
the transaction that inserts or updates any column of the table
containing it. The timestamp of a transaction is guaranteed to be
distinct from that of any other transaction. For compatibility reasons a
TIMESTAMP column is described to ODBC clients as a binary of 10 bytes.
It is possible to use any date-related functions on TIMESTAMPs and to
bind a TIMESTAMP column to a DATE or DATETIME variable
(SQL\_C\_TIMESTAMP type in ODBC). Binding to a binary will also work but
the data will then be opaque.

SQL92 provides for types with a timezone. Although the ODBC API does not
expose the timezone, it is stored with these types and can be retrieved
with the [`timezone()`](#fn_timezone) function. The timezone has a
precision of minutes from UTC.

The storage requirement for these types is 10 bytes.

There is no date literal per se, but the ODBC shorthand for datetime
literals can be used. The datetime/timestamp literal is of the form {dt
'YYYY-MM-DD HH:MM.SS'}. The date literal is of the form {d
'YYYY-MM-DD'}. Dates and datetimes may be compared between themselves
but not with other types without explicit casting.

### Timezoneless Datetimes

Some traditional relational databases keep all values of DATETIME type
as combination of time and timezone data. Other keep time in some
specific timezone without paying any attention to timezone at all. In
RDF, the incoming triples may contain literals of types like
xsd:dateTime with arbitrary values matching ISO 8601, and this standard
permits the use of time values with optional timezone. Thus there should
be a way of handling both "timezoned" and "timezoneless" datetimes
inside one database. Virtuoso server supports this starting from version
07.20.3214.

*Important note:* The use of timezoneless datetimes may result in subtle
errors in data processing. Applications that worked fine with timezoned
datetimes may work incorrectly if timezoneless datetimes are used. The
related application errors may stay unnoticed during local testing and
reveal after worldwide use. To stay on safe side, the use of
timezoneless datetimes with pre-07.20.3214 databases remains blocked
even after the server executable is upgraded, so old applications will
continue to work as before. When developing new applications, please pay
attention to the check-list at the end of this section.

#### Enabling Timezoneless Support

Different applications may require different behavior when input data
contain timezoneless values. In some cases it is better to "cast" all of
them to timezoned than to upgrade existing code. Virtuoso offers 5
different modes of support. The mode is selected by
`TimezonelessDatetimes` parameter in `[Parameters]` section of
[virtuoso.ini](#virtini) . This should be set before creating the
database and the set value is stored in the database. After database is
created, an attempt to change the mode by patching
[virtuoso.ini](#virtini) will have no effect and virtuoso.log will
contain a warning about mismatch between virtuoso.ini and the database
file.

The possible variants are:

  - Never use timezoneless, as it was in old databases. Always set local
    timezone on parsing strings if no timezone specified. An attempt to
    set timezoneless by calling function
    [`forget_timezone()`](#fn_forget_timezone) will signal error.
    Timezoneless values still may come from outside as dezerializations
    of timezoneless DATETIME values, serialized by other database
    instances, but not in any other way:
    
        TimezonelessDatetimes=0

  - When parsing strings, set timezoneless if ISO format tells so:
    
        TimezonelessDatetimes=1

  - Set timezoneless always, exception is when the parsed string
    contains explicit timezone or when RFC requires the use of GMT or
    when timezone is set by function
    [`adjust_timezone()`](#fn_adjust_timezone) . This is default for new
    databases if `TimezonelessDatetimes` parameter is missing in
    virtuoso.ini
    
        TimezonelessDatetimes=2

  - Never use timezoneless. Always set local timezone on parsing strings
    if not timezone specified. An attempt to set timezoneless by calling
    function [`forget_timezone()`](#fn_forget_timezone) will signal
    error. Timezoneless values still may come from outside as
    deserializations of timezoneless DATETIME values, serialized by
    other database instances, but not in any other way. The difference
    with `TimezonelessDatetimes=0` is that timezones are always printed
    on cast datetimes to strings etc. so timezoneless-aware clients will
    get unambiguous data.
    
        TimezonelessDatetimes=3

  - On parsing string, set timezone to GMT if no timezone specified.
    However, timezoneless can be set by calling function
    [`forget_timezone()`](#fn_forget_timezone) . This mode can be
    convenient for global web services when real "local" timezones of
    specific users are not known.
    
        TimezonelessDatetimes=4

For new applications, consider the use of `TimezonelessDatetimes=2` as
primary variant, `TimezonelessDatetimes=1` as the second best.

#### Formats of Datetime Strings

Traditional SQL strings are of format "`YYYY-MM-DD hh:mm:ss` " with
optional decimal fraction at the end and optional timezone data.
Depending on software, the timezone can be specified as "timezone
offset", i.e. the difference with GMT in minutes or as "timezone label",
i.e. an identifier of timezone in special system dictionary that
contains not only an offset in minutes but also information about
daylight saving changes of the offset. Virtuoso does not support
timezone labels, only numerical timezone offsets. Depending on system,
the notation without the timezone data at the end means timezoneless
value or, more probably, the value in some "default" timezone, such as
local timezone of the server or GMT.

ISO 8601 introduced format "`YYYY-MM-DDThh:mm:ss` ", with "`T` "
character between "`date` " and "`time` " parts. It also prescribed an
unambiguous difference between timezoneless and timezoned values: absent
timezone means timezoneless value.

The timezone offset is written as "`+hh:mm` " or "`-hh:mm` ", the
"`+00:00` " is usually shortened to "`Z` ". Oracle Java may use 1 to 4
digits without delimiting ":", in that case 1 or 2 digits mean whole
hours whereas 3 or 4 digits mean an 1 or 2 digits of hour and two digits
of minutes. For historical reasons, "`-00:00` " notation differs from
"`+00:00` " and mean timezoneless, not GMT datetime.

#### Comparison of Datetimes

ISO 8601 explicitly warns that comparison of timezoned and timezoneless
datetime is not always possible. Valid timezones vary from -14:00 to
+14:00, the fact that the span can exceed 24 hours may be not obvious.
Nevertheless, storing rows in a database table require some unambiguous
order; any order is OK as soon as it does not break the rules and common
sense, but it should be well-defined. Virtuoso's order for mix of
timezoned and timezoneless datetimes is very simple.

1.  All timezoned datetimes are sorted in natural chronological order,
    like if they are converted to GMT first. The value of timezone
    offset does not matter.

2.  All timezoneless datetimes are sorted in natural chronological
    order, like they are in GMT already.

3.  For each GMT calendar day, all timezoned datetimes are placed before
    all timezoneless datetimes.

#### Related Functions

  - [`is_timezoneless()`](#fn_is_timezoneless) -- The function returns 1
    for timezoneless arguments, zero for timezoned.
    
        integer is_timezoneless (in dt datetime)

  - [`timezone()`](#fn_timezone) -- The function returns timezone offset
    of its first argument, as an integer value in minutes. If the first
    argument is timezoneless and second argument is missing or zero then
    the returned value is NULL. If the first argument is timezoneless
    and second argument is nonzero then the returned value is 0.
    
        integer timezone (in dt datetime [, in ignore_tzl integer])

  - [`adjust_timezone()`](#fn_adjust_timezone) -- The function returns
    its first argument with unchanged GMT value but new timezone offset,
    as it is specified by the second argument. If the first argument is
    timezoneless and third argument is missing or zero then error 22023
    is signaled. If the first argument is timezoneless and third
    argument is nonzero then no error is signaled and the argument is
    handled like it is a GMT value.
    
        datetime adjust_timezone (in dt datetime, in tz_offset integer [, in ignore_tzl integer])

  - [`dt_set_tz()`](#fn_dt_set_tz) -- The function returns its first
    argument with unchanged GMT value but new timezone offset. Unlike
    [`adjust_timezone()`](#fn_adjust_timezone) , if the argument is
    timezoneless then no error is signaled.
    
        datetime dt_set_tz (in dt datetime, in tz_offset integer)

  - [`forget_timezone()`](#fn_forget_timezone) -- The function returns
    its first argument as a timezoned value. If the first argument is
    timezoneless then it is returned unchanged. If the first argument is
    timezoned and second argument is missing or zero then the result is
    timezoneless value that "looks like" local time notation. If the
    first argument is timezoned and second argument is nonzero then the
    value is first made GMT and then it becomes timezoneless.
    
        datetime forget_timezone (in dt datetime [, in ignore_timezone integer])

  - [`now()`](#fn_now) -- returns the current transaction timestamp:
    
        datetime now ()

  - [`rdf_now_impl()`](#fn_rdf_now_impl) -- returns the timestamp
    associated with current transaction as a `DATETIME` . Alias of
    [`now()`](#fn_now) :
    
        datetime    rdf_now_impl ()

  - [`getdate()`](#fn_getdate) -- returns the current transaction
    timestamp, alias of [`now()`](#fn_now) :
    
        datetime getdate ();

  - [`get_timestamp()`](#fn_get_timestamp) -- returns the timestamp of
    the current transaction:
    
        datetime get_timestamp ()

  - [`current_timestamp()`](#fn_current_timestamp) -- All these names
    refer to one function that returns the timestamp of current
    transaction. It is the datetime of the beginning of current
    transaction with the fractional part of seconds replaced with serial
    number of a transaction within the second. If
    `TimezonelessDatetimes=0` then the time has local timezone offset
    (as it was set at the time of last server start); otherwise it is
    timezoneless.
    
        datetime current_timestamp ()

  - [`curdatetime()`](#fn_curdatetime) -- The function returns current
    datetime, like [`now()`](#fn_now) , but fractional part of seconds
    can be adjusted by providing the number of "microseconds" as the
    argument.
    
        datetime curdatetime ([in fraction_microseconds integer])

  - [`curdatetimeoffset()`](#fn_curdatetimeoffset) -- The function is
    like [`curdatetime()`](#fn_curdatetime) but the returned datetime is
    in GMT timezone.
    
        datetime curdatetimeoffset ([in fraction_microseconds integer])

  - [`curutcdatetime()`](#fn_curutcdatetime) -- Refers to function that
    is similar to [`curdatetime()`](#fn_curdatetime) but the returned
    datetime is in GMT timezone.
    
        datetime curutcdatetime ([in fraction_microseconds integer])

  - [`sysutcdatetime()`](#fn_sysutcdatetime) -- Refers to function that
    is similar to [`curdatetime()`](#fn_curdatetime) but the returned
    datetime is in GMT timezone.
    
        datetime sysutcdatetime ([in fraction_microseconds integer])

### Unicode Support

Virtuoso allows 30-bit Unicode data to be stored and retrieved from
database fields. The data are stored internally as UTF-8 encoded strings
for storage space optimization. Unicode fields are easily intermixable
with other character data as all SQL functions support wide-string case
and convert to the most wide character representation on demand. The
native width of the wide character type may differ between platforms.
Windows has a 16 bit wide character, whereas some Unixes have a 32 bit
wide character type. The native width applies to the Virtuoso NVARCHAR
data type when used as SQL data.

There are 3 additional data types to enable storing of Unicode data:

  - NCHAR

  - NVARCHAR

  - LONG NVARCHAR

All the Unicode types are equivalent to their corresponding "narrow"
type - CHAR, VARCHAR and LONG VARCHAR - except that instead of storing
data as one byte they allow Unicode characters. Their lengths are
defined and returned in characters instead of bytes. They collate
according to the active wide character collation, if any. By default
this is the order of the Unicode serialization values. These types can
be used anywhere the narrow character types can be used, except in LIKE
conditions.

Unicode literals are introduced by n' and closed with ' (single quote).
See Internationalization section on the interpretation of wide literals.
This may be either UTF-8 according to some character set.

When there is a need to convert a wide string to a narrow one or vice
versa, a character set is used. A character set returns a wide string
code for a wide char. For example there can be a definition of the
ISO-8859-5 "narrow" character set which describes mapping of non-ASCII
character codes to their Unicode equivalents. Virtuoso relies on the
fact that the ASCII character codes are represented in Unicode by
type-casting and in UTF8 as one-byte tokens with the same value as in
ASCII.

When conversion is done on the server-side using cast or some of the SQL
built-in functions, the wide characters are converted to narrow using a
system-independent server-side character set. In the absence of such a
character set, Virtuoso uses the Latin1 character set to project narrow
character codes into the Unicode space as equally valued wide-character
codes.

When conversion is done client-side - for example, when binding a
VARCHAR to a wide buffer - the default client's system character set is
used.

Wide-character literals have ANSI SQL92 syntax: N'xxx' (prefixing normal
literals with the letter N). These strings process escapes with a values
large enough to represent all the Unicode characters.

### User Defined Types

Virtuoso supports user-definable data types that can be based on any
hosted language or classes such as C\#. New types can be further derived
producing sub-types. User-defined types can include methods and
constructors to create any potentially complicated system to house data
as exactly required.

User defined types can be used to defined database table columns.

> **Tip**
> 
> The [User Defined Types](#udt) section.

### Built-in SQL Functions and Wide Characters

All the built-in SQL functions that take character attributes and have a
character input calculate their output type such that if any attribute
is a wide string or a wide BLOB, then the result is a wide string;
otherwise, the output character type is narrow.

Functions like `make_string()` that have character result types but that
do not have character parameters produce narrow strings. Virtuoso
provides equivalent functions for wide output, such as `make_wstring()`
.

### Client-side changes to support wide characters

Virtuoso' ODBC client implements the SQL...W functions (like
`SQLConnectW()` ) that take Unicode arguments. This enables faster
wide-character processing and allows binding of the SQL\_C\_WCHAR output
type. Since Virtuoso's SQL parser does not allow Unicode data in SQL
commands, they should be bound as parameters or should be represented as
escapes.

### Virtual Database and National Language Support

Attached tables use the default collation of the data source for narrow
strings. Virtuoso maps Wide-string columns in remote tables to the
appropriate local wide-character type. The data are then passed intact
in case of wide-to-wide mapping. When data are converted client-side in
the VDB the Server's system character set is used (where available).

### Operations Between Large Objects, Varchars and String Outputs

The built-in data types denoting sequences of characters, wide or
narrow, long or short, are:

Varchar

: a string of 8-bit characters, including 0's, up to 16MB long. These
are contiguously stored, so long contents, such as in the megabytes,
will be inefficient.

NVARCHAR

: A string of wide characters, of 2 or 4 bytes each, depending on the
platform. Because of the 16MB limit, the longest strings will be of 4M
or 8M characters, depending on the platform. Again long strings are not
recommended due to inefficiencies.

Binary

: A string of 8-bit bytes, up to 16 MB long, like a varchar but not
usable for character functions. There is a distinct binary type only for
compatibility with the SQL92 standard and ODBC, where the binary type is
treated differently in parameter binding.

Long varchar, long nvarchar

: These are long data types, stored persistently as a series of linked
pages and accessible to clients in fragments using the

SQLGetData()

and

SQLPutData()

calls. The length limit is 2GB. The wide variant, LONG NVARCHAR, is
internally stored as UTF8.

String\_output

: This is not a database column type but a run-time object that can be
used in stored procedures for accumulating a long sequence of 8-bit
bytes, including 0's. This type is not contiguously stored, hence it
stays efficient for large output and has no built-in size limit;
however, it is not automatically paged to disk, so it will consume
virtual memory for all its length. This type is useful for buffering
output for a next processing step.

Long varbinary

: This is a binary BLOB, identical to long varchar but distinct for
reasons of compatibility with SQL92 and ODBC, where this can behave
differently from long varchar for parameter binding.

XML Entity

: This type is a pointer to an element of an XML tree. The XML tree
itself may be either memory- or disk-based. In both cases there is a
reference-counted set of XML entities for each tree that Virtuoso uses
to reference individual elements of the tree. These are used for
navigating an XML tree in XPath or XSLT; hence, one entity gives access
to it parents, siblings, and so on. This is not properly a string type,
but it can be converted to one, producing the XML string value.

All these types have the common trait of representing sequences of
characters and hence some common operations and conversions are possible
between them.

#### Storage in Database

The descriptions below apply to insert and update operations for these
types:

  - Long varchar = x, where x is:
    
    varchar - The text is stored as is.
    
    Long varchar - the text is stored as is.
    
    string output - the contents in the string output are stored as the
    value, unchanged. The state of the string output is not changed.
    
    XML entity - The XML tree rooted at the entity is stored as
    persistent XML (disk-based) if the entity references a persistent
    XML tree. Note that this may either extract a subtree or copy a
    tree, depending on whether the entity references the root. If the
    entity references a memory-based tree, the text of the tree with the
    element as the topmost (document) element is produced and set as the
    value of the column.
    
    Nvarchar - The text is stored as wide, thus the value is internally
    a long nvarchar although the declared column type is long varchar.
    
    Long nvarchar - The value is stored as a long nvarchar, as with an
    nvarchar.

  - Long nvarchar = x
    
    The cases are identical to long varchar. Thus a wide value stays
    wide and a narrow value stays narrow. Specifically, a string output
    and XML entity result in a narrow value, although the character
    combination in the XML entity may be interpreted as wide.

  - Long varbinary = x
    
    Identical to long varchar. The binary type is only distinct in
    column metadata for ODBC clients, where its type conversions may be
    different.

  - Varchar = x, where x is:
    
    long varchar, string output, XML entity - as with long varchar.
    
    Nvarchar, Long nvarchar - the text is stored as wide; no information
    is lost.

  - Nvarchar = x, where x is:
    
    Long varchar, varchar - the string is converted to wide according to
    the character set effective in the connection.
    
    Long nvarchar, Nvarchar - The text is stored as is.

'String output' and 'XML entity' are not valid types for a column. These
types are only created by evaluating SQL expressions and are converted
as specified above if stored as a column value.

#### Retrieving Column Values

A BLOB column (long varchar, long nvarchar, long varbinary) may return
either a long varchar or a long nvarchar BLOB handle. If the actual
value is short enough to be inlined, a varchar or nvarchar value can be
returned as the column value instead. These are indistinguishable for
assignment and as arguments to SQL functions or for returning to a
client application. Only specific SQL functions (`isblob()` ,
`isstring()` , etc.) allow you to determine the difference at run time.
One exception is persistent XML entities, which come back as persistent
XML entities and are not compatible with string functions but are
assignable to various character columns.

An nvarchar column is always nvarchar.

A varchar value is either varchar or nvarchar. If the value stored was a
memory-based XML tree entity it comes back as a long varchar. If it was
a persistent XML tree, it comes back as an XML entity.

#### Assignment

PL variables are typed at run time.

A string (varchar, nvarchar, or varbinary) can be freely assigned and
passed as parameter. This makes a copy, except for reference (inout)
parameters.

A BLOB (long varchar, long nvarchar, long varbinary) is a reference to a
disk based structure, unless stored inline. Therefore, passing these as
parameters does not take significant time. If these are inline, these
are strings of under 4K bytes; hence assigning them is still efficient,
although it involves copying.

A string output cannot be assigned between two variables, though it can
be passed as a reference (inout) parameter in a PL procedure call.
Copying streams has problematic semantics and can be very
resource-consuming.

An XML entity can be assigned and passed as parameter without
restrictions.

#### Built-In SQL Functions

All SQL92 string functions will accept varchar, long varchar, nvarchar
or long nvarchar arguments. If the argument is long and its actual
length is above the maximum length of a varchar, the conversion fails
and Virtuoso signals an error. You can interchange long and varchar
types as long as the length remains under the varchar maximum of 16MB.

> **Note**
> 
> Varchars or nvarchars stored in columns have a much lower limit due to
> the 4K row length limit. Intermediate results or values converted from
> long columns are not affected by this limit.

If Virtuoso converts a value from long varchar to varchar or from long
nvarchar to nvarchar when passing the value as an argument to a string
function, the value changes in place. This has the effect of replacing
the handle with the string. Users normally do not see this, but may
detect it with type test functions such as `isblob()` .

#### Long Strings and Row Length Limit

You can declare string values that might be long and that do not have to
be key parts in indices as long varchar. These will automatically be
inlined if the row with the data inlined will fit within the 4K limit.
Otherwise the long values will be stored as separate LOBs. The
difference between varchar and long varchar is distinguishable only with
special test functions if the length is under the varchar limit.

A varchar column is sometimes substantially faster on update than a long
varchar column, even if the value ends up inlined. If the value is
inlined there is no difference in retrieval speed.

#### Handling Long Data for Input and Output

LOBs of up to 2GB can be handled as streams without demand on memory
from ODBC clients using `SQLGetData()` and `SQLPutData()` . All other
ways of processing long data will need to make either a contiguous or
non-contiguous copy in memory.

To transfer long data between PL procedures and files one can use the
[`string_to_file()`](#fn_string_to_file) function, which will accept a
handle and will not need to copy the content to memory in order to write
it.

To read a large object from a file to a table, you can use the
[`file_to_string_output()`](#fn_file_to_string_output) function to get
contents that may be longer than the varchar limit into a string output.
This can then be assigned to a BLOB column.

For long file-resident XML data you can use the
[`xml_persistent()`](#fn_xml_persistent) function with the file://
protocol.

> **Tip**
> 
> The XML Support chapter.

## Virtuoso Column Store

Note: This feature only applies to Virtuoso 7.0 and later.

As of version 7, Virtuoso offers a column-wise compressed storage format
alongside its traditional row-wise storage format.

In the column-wise storage model, each column of a table or index is
stored contiguously, so that values of a single column on consecutive
rows are physically adjacent. In this way, adjacent values are of the
same type, and if the index is sorted on said value, the consecutive
values often form an ascending sequence. This organization allows the
use of more powerful compression techniques than could be used for rows
where consecutive values belong to different columns, and thus are of
disparate data types with values in different ranges.

Furthermore, when queries only access a subset of columns from one
table, only those columns actually being accessed need to be read from
disk, thereby making better use of I/O throughput and memory.
Unreferenced columns will not take space in the memory based cache of
the database. Further, the traffic between CPU cache and main memory is
reduced when data is more compact, leading to better CPU utilization.

The column-wise format is substantially more compact and offers
substantially greater sequential-access performance, as well as greater
random-access performance in situations where many rows are accessed
together in a join. For single-row random-access, a row-wise format
offers higher performance as long as the data is in memory. In practice,
for large tables, the higher compression achieved with column-wise
storage allows a larger portion of the data to be kept in memory,
leading to less frequent I/O and consequently higher performance.

One should not use column-wise storage in cases where columns are
frequently updated, especially if a single row is updated per statement.
This will give performance substantially worse than row-wise storage.
However, bulk inserts and deletes are efficient with column-wise
storage.

### Creating Column Store Tables and Indices

Any index or primary key, i.e., any table, can be declared to be stored
column-wise. A single table can have multiple indices, of which some are
stored column-wise and some are not. As with tables stored row-wise, the
table row itself is stored following the primary key index entry on the
index tree leaf corresponding to the entry. This arrangement is
sometimes called a *clustered index* .

One can specify column-wise storage as the default for any new tables or
indices by adding ColumnStore = 1 to the \[Parameters\] section of the
virtuoso.ini file. Otherwise, tables and indices are created tow-wise
unless the column option is specified, as described below.

The statement below declares the table xx to be stored column-wise:

``` 
CREATE TABLE xx ( id    INT,
                  data  VARCHAR,
                  PRIMARY KEY (id) COLUMN
                );
 
```

This statement adds a column-wise stored index to the table:

``` 
CREATE COLUMN INDEX xxi
  ON xx (data);
 
```

The *COLUMN* keyword can come after the column list of the primary key
declaration of a table or anywhere between the *CREATE* and *INDEX*
keywords of a create index statement.

Note that the *BITMAP* keyword cannot be used together with the *COLUMN*
keyword. Column-wise indices will automatically use bitmap compression
when appropriate without this being specified. A column-wise index is
likely to be more space-efficient than a row-wise bitmap index with the
same key parts.

The directives for column compression in *CREATE TABLE (NO COMPRESS,
COMPRESS PREFIX)* have no effect on column-wise stored tables. Data is
compressed in a manner chosen at run time based on the data itself.

### Column Store Transaction Support

All SQL operations work identically for column- or row-wise tables and
indices. The locking behavior is also identical, with row-level locking
supported on all isolation levels. The behavior of the *READ COMMITTED*
isolation is non-locking, showing the pre-image of updated data when
reading pages with uncommitted inserts or updates.

Recovery is by roll forward, and checkpoints will only store committed
states of the database, even if started when there are uncommitted
transactions pending.

### Column Space Utilization

The system table *DB.DBA.sys\_col\_info* holds information about space
utilization of column-wise indices.

This table is updated only after the *DB.DBA.sys\_index\_space\_stats*
procedure view has been accessed. Thus, one must first make a selection
from *DB.DBA.sys\_index\_space\_stats* .

The columns of *sys\_col\_info* have the following meaning:

  - *COI\_TABLE*
    
    \- The table in question.

  - *COI\_INDEX*
    
    \- The index in question.

  - *COI\_NTH*
    
    \- The ordinal position of the column in question in the key.

  - *COI\_TYPE*
    
    \- This indicates the type of compression entry the rest of the row
    concerns. For each column in the key, there is a row with
    
    *coi\_type*
    
    set to -1, representing the total of the remaining fields.

  - *COI\_COLUMN*
    
    \- The name of the column concerned.

  - *COI\_PAGES*
    
    \- This is the number of database pages allocated for storing data
    of this column.

  - *COI\_CES*
    
    \- The count of compression entries for the column. A compression
    entry is logically an array of consecutive values that share a
    common compression format. Different parts of the same column may
    have different compression.

  - *COI\_VALUES*
    
    \- This is the count of values that are stored with the compression
    format in question.

  - *COI\_BYTES*
    
    \- The is the number of bytes actually occupied by the compression
    entries concerned. Pages may not always by full, thus this metric
    can be used to measure the page fill ratio, i.e.:
    
        100 * coi_bytes / (coi_n_pages * 8192.0)

To see which columns take the most space, and how full the pages are, as
well as the overall effectiveness of compression, one can do:

``` 
SELECT                                       coi_column         ,
                         coi_pages * 8192  AS  total_bytes        ,
         coi_bytes / (coi_pages * 8192.0)  AS  page_fill          ,
                                               coi_bytes          ,
             1.0 * coi_bytes / coi_values  AS  ce_bytes_per_value ,
          8192.0 * coi_pages / coi_values  AS  bytes_per_value
    FROM sys_col_info
   WHERE coi_type = -1
ORDER BY coi_pages DESC ;
 
```

Note that issuing a query like:

``` 
 SELECT TOP 20 *
    FROM sys_index_space_stats
ORDER BY iss_pages DESC;
 
```

will update the *sys\_col\_info* table which is initially empty.

The *sys\_index\_space\_stats* view shows the number of pages used for
the sparse row-wise index tree top for column-wise indices.

The number of rows shown there for column-wise indices is the number of
entries of the sparse index, not the row-count of the index. The space
utilization here will be under 1% of the total for a column-wise index.

Below we look at space utilization of the *O* column of the primary key
of the *RDF\_QUAD* table.

``` 
SELECT *
  FROM sys_col_info
 WHERE  coi_index = 'DB.DBA.RDF_QUAD'
   AND coi_column = 'O' ;
 coi_table             coi_index           coi_nth           coi_type          coi_column    coi_pages      coi_ces    coi_values    coi_bytes
 VARCHAR NOT NULL      VARCHAR NOT NULL    INTEGER NOT NULL  INTEGER NOT NULL  VARCHAR       INTEGER        INTEGER    INTEGER       INTEGER
 _______________________________________________________________________________

 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 -1                O             654663         0          1252064815    4617808494
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 1                 O             0              229074     97104862      947215
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 3                 O             0              3227395    490806316     3905658370
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 4                 O             0              94038      17227799      8554746
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 6                 O             0              389126     551074747     579191659
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 8                 O             0              160814     48480188      12026273
 DB.DBA.RDF_QUAD       DB.DBA.RDF_QUAD     2                 10                O             0              652817     47370903      111430231
 
```

The top line is the overall summary across all the compression types.

The lines below give information per-compression-type. The values of
*coi\_type* mean the following:

  - 1 -
    
    *run length*
    
    . The value occurs once, followed by the number of repetitions.

  - 3 -
    
    *array*
    
    . Values are stored consecutively without compression. The array
    elements are 4- or 8-byte depending on range. For variable length
    types, some compression applies because values differing only in
    their last byte will only have the last byte stored.

  - 4 -
    
    *bitmap*
    
    . For closely-spaced unique ascending values, the bitmap has a start
    value in full, and a bitmap with the nth bit set if start + nth
    occurs in the column.

  - 6 -
    
    *dictionary*
    
    . For non-ordered, low-cardinality columns, there can be a
    dictionary with either 4 or 8 bytes per entry, depending on the
    number of distinct values being encoded. The compression entry is
    prefixed by an array with the values in full, followed by an array
    of positions in the dictionary.

  - 8 -
    
    *run length with small deltas*
    
    . For repeating, closely-spaced ascending values, the
    run-length-delta format stores a start value in full, followed by an
    array of bytes of which 4 bits are a delta to the previous value,
    and 4 bits are a run length.

  - 10 -
    
    *integer delta with large deltas*
    
    . This format stores an initial value followed by stretches of
    non-ordered values within 64K of the base value. There can be
    multiple such stretches, each prefixed with a 32-bit delta from the
    base value. This is useful for closely-spaced medium- cardinality
    values like dates, or for relatively sparse ascending sequences,
    e.g., ascending sequences with a step of 1000 or more.

## Explicit Vectoring of Procedural Code

Note: This feature only applies to Virtuoso 7.0 and later.

Vectored execution can be explicitly controlled for Virtuoso PL code,
either by declaring a whole procedure to be vectored or by executing a
block inside a procedure on multiple values at one time. See more
detailed description, respectively for:

  - [Vectored Procedures](#vectoredprocedure)

  - [FOR VECTORED Statement](#forvectorestatement)

  - [Limitations on Vectored Code](#limitonvectorecode)

  - [Data Types and Vectoring](#datatypesandvectoring)

## Locking

Virtuoso offers a dynamic locking strategy that combines the high
resolution of row-level locking with the performance of page locking for
large transactions.

### Isolation Levels

Virtuoso has a full range of isolation options, ranging from `dirty
read` to `serializable` . The default isolation is `repeatable read` ,
which is adequate for most practical applications.

Isolation is set at the connection, i.e. transaction, level. Variously
isolated transactions may coexist and each will behave consistently with
its semantic.

`Repeatable read` and `serializable` transactions are susceptible at any
time to termination by deadlock, SQL state 40001. Other transactions are
susceptible to deadlock if they own locks as a result of insert, update
or delete. Deadlocks are resolved in favor of the older of the
contending transactions. A transaction's age is the count of reads
performed + 2 \* the count of rows inserted, deleted or updated.

Any transaction that has modified the database may be rolled back; all
transactions maintain a rollback log. This is a memory-based data
structure that contains the state of changed rows as they were before
the transaction first affected them. This leads to potential transient
memory consumption. All transactions that have changed the database also
have a roll-forward log, used to recreate the effects of the transaction
during roll-forward recovery.

#### Read Uncommitted

This corresponds to SQL\_TXN\_READ\_UNCOMMITTED. A read is never
prevented by locking, nor do read rows stay locked. The data being read
may or may not be committed, hence there is no guarantee of transaction
integrity.

#### Read Committed

Historical Read Committed

Starting with release 5.0, Virtuoso has a non-locking, versioned `read
committed` transaction mode. This is similar to Oracle's default
isolation.

If a locked row is read without FOR UPDATE being specified and another
transaction owns the lock, the reading transaction will see the row in
the state it had before being modified by the transaction owning the
lock. There will be no wait. If a row has been inserted but the insert
not committed, the row will not be seen by the `read committed`
transaction. If a row has been updated or deleted, the row will be seen
as it was before the uncommitted modifying transaction.

If a row is read in `read committed` mode with FOR UPDATE specified or
as part of a searched update or delete statement, the `read committed`
transaction will wait for a locked row and will set an exclusive lock on
the row if the row matches the search criteria. This exclusive lock will
be held until the `read committed` transaction terminates.

Hence, if FOR UPDATE is specified, a `read committed` transaction will
have repeatable read semantics, otherwise it guarantees no repeatable
read but does guarantee that uncommitted data are never seen.

To make this the default mode, set DefaultIsolation in the Parameters
section of virtuoso.ini to 2.

#### Row-by-Row Autocommit

This transaction mode causes all DML statements to commit after every
modified row. This is useful for single user situations where one does
large batch updates on tables. For example, an update of every row of a
multi gigabyte table would be likely to run out of rollback space before
completing. In practice, one can end up in a thrashing situation where a
large transaction is in progress, is interrupted by a checkpoint which
must temporarily roll back the changed pages, then again resume the
transaction etc., leading to serious server unavailability. Note that
normally the ini parameter TransactionAfterImageLimit places a cap on
transaction size, catching situations of this type before they lead to
thrashing.

The row by row autocommit mode prevents this from happening by
committing each updated, inserted or deleted row as soon as all the
indices of the row are updated. This mode will still maintain basic row
integrity, i.e. if the row's data is in one index, it will be in all
indices.

This mode is good for any batch operations where concurrent updates are
not expected or are not an issue. Examples include bulk loading of data,
materialization of RDF inferred data etc.

This mode is enabled with the log\_enable function. If the bit of 2's is
set in the argument, row-by-row autocommit is enabled and the setting
will persist until modified with log\_enable or the calling connection
is disconnected or the calling web request terminates. Thus, an argument
of 2 enables row-by-row autocommit and disables logging. An argument of
3 enables row-by-row autocommit and enables logging. This will cause
every updated row to be logged in the transaction log after it is
updated, which is not very efficient.

Since transaction-by-transaction recovery is generally not an issue in
batch updates, a value of 2 is usually better. If the server is killed
during the batch operation, it may simply be restarted and the operation
redone. Losing the first half through no logging will not be an issue
since the operation will anyway have to be redone.

There is a slight penalty to row-by-row autocommit in comparison with
making updates in larger batches but this is under 10%.

#### Repeatable Read

The transaction will wait for access to exclusively locked rows and will
lock all rows it reads. The locking of read rows can be shared or
exclusive depending on the FOR UPDATE clause in the SELECT or the
SQL\_CONCURRENCY statement option. In the case of a select over a range
of rows where not all rows match selecting criteria, only matching rows
are locked. This mode guarantees that any row locked by the reading
transaction can be re-read on the basis of its identity (primary key)
and will not have been changed by any other transaction while the
locking transaction is in progress. This mode does not prevent another
transaction from inserting new rows (phantoms) between rows locked by
the original transaction.

#### Serializable

This mode guarantees that concurrent transactions will look as if the
next transaction started only after the previous terminated. This is
like `repeatable read` but prevents phantoms. Space found to be empty in
one read will remain empty in the next read while the transaction is
ongoing.

Serializable isolation is implemented by locking all ranges of rows
matching criteria pertaining to the ordering index in a select. The
range here includes the last row before the first in the range. An empty
range can be locked by locking the row before the range by a special
follow lock, which prevents insertions to the right of the locked row. A
by-product of this is that serializable locking guarantees that a select
count will give the same result repeatedly unless the transaction itself
affect the rows counted.

`Serializable` isolation is slower than `repeatable read` and not
required by most applications.

All insert, delete and update operations make an exclusive row lock on
the rows they operate on, regardless of specified isolation.

### Lock Extent

If a transaction is the exclusive owner of locks on a database page and
a sufficient percentage of the rows are locked, it makes sense to
replace distinct row locks with a single page lock. The
LOCK\_ESCALATION\_PCT parameter controls the threshold for doing this.
See the SET statement for details.

If a cursor reads data serially and has a history of locking a high
percentage of rows on each page it traverses, it will start setting page
level locks as its first choice. It will do this when entering a new
page where there are no row-level locks.

### Transaction Size

There is no limit in Virtuoso to the transaction size, though the
underlying software or hardware may impose limits. Memory consumed by a
transaction is proportional to its number of locks held and number of
changed rows (insert, update, delete). BKLOBs manipulated by a
transaction do not contribute to memory consumption, because they are
always disk-based.

## Internationalization & Unicode

National strings are best represented as Unicode (NCHAR/LONG NVARCHAR)
columns. There is no guarantee that values stored inside narrow
(VARCHAR/LONG VARCHAR) columns will get correctly represented. If the
client application is also Unicode then no internationalization
conversions take place. Unfortunately, most current applications still
use narrow characters.

The national character set defines how strings will get converted from
narrow to wide characters and back throughout Virtuoso. A character set
is an array of 255 (without the zero) Unicode codes describing the
location of each character from the narrow character set in the Unicode
space. It has a "primary" or "preferred" name and a list of aliases.

Character sets in Virtuoso are kept inside the system table
SYS\_CHARSETS. Its layout is :

    CREATE TABLE SYS_CHARSETS (
        CS_NAME varchar,            -- The "preferred" charset name
        CS_TABLE long nvarchar,     -- the mapping table of length 255 Wide chars
        CS_ALIASES long varchar     -- serialized vector of aliases
    );

The CS\_NAME and CS\_ALIASES columns are SELECTable by PUBLIC. To
simplify retrieval of all official and unofficial names of character
sets, Virtuoso provides the following function:

[`charsets_list()`](#fn_charsets_list)

There are a number of character set definitions preloaded in the
SYS\_CHARSETS table. Currently these are:

GOST19768-87

IBM437, IBM850, IBM855, IBM866, IBM874

ISO-8859-1, ISO-8859-2, ISO-8859-3, ISO-8859-4, ISO-8859-5, ISO-8859-6,
ISO-8859-7, ISO-8859-8, ISO-8859-9, ISO-8859-10, ISO-8859-11,
ISO-8859-13, ISO-8859-14, ISO-8859-15

KOI-0, KOI-7, KOI8-A, KOI8-B, KOI8-E, KOI8-F, KOI8-R, KOI8-U

MAC-UKRAINIAN

MIK

WINDOWS-1250, WINDOWS-1251, WINDOWS-1252, WINDOWS-1257

New character sets can be defined using the following function:

[`charset_define()`](#fn_charset_define)

User-defined character sets can be dropped by deleting the row from the
SYS\_CHARSETS table and restarting the server.

Virtuoso performs all translations in accordance with a "current
charset". This is a connection attribute. It gets its value as follows:

1\. If the client supplies a CHARSET ODBC Connect string attribute
either from the DSN definition or as an argument to a

SQLDriverConnect()

call, Virtuoso searches for the name in SYS\_CHARSETS and, if there is a
match, that character set becomes the default.

2\. If the database default character set ('Charset' parameter in the
'Parameters' section of virtuoso.ini) is defined, it becomes the
default.

3\. If neither of these conditions is met, then Virtuoso uses ISO-8859-1
as the default character set; this maps the narrow chars as wide using
equality.

At any time the user can explicitly set the character set either with a
call to

    SQLSetConnectAttr (HDBC, SQL_CHARSET (=5002), CharacterSetString, StringLength)

or by executing the interactive SQL command:

    SET CHARSET='<name>|<alias>'

The current character set "preferred" name (as a string) is returned by
the following system function:

[`current_charset()`](#fn_current_charset)

Virtuoso has a default character set that gets used if the client does
not supply its own and in some special cases, like XML Views and FOR XML
AUTO statements.

The HTTP character set can be changed during an HTTP session using:

    SET HTTP_CHARSET='<name>|<alias>'

Example:

``` 
     <?vsp
         set http_charset = 'ISO-CELTIC';
     ?>
     <html><body><h1>Cén chaoi 'bhfuil tú?</h1></body></htm
    
```

Virtuoso supports the following types of translations from Unicode
characters to narrow characters:

  - String translation:
    
    If the Unicode represents a part of the US-ASCII (0-127) character
    set then its value gets used;
    
    If the Unicode has a mapping to narrow in the character set then use
    it;
    
    If neither of the above then the narrow '?' is returned.

  - Command translation:
    
    If the Unicode represents a part of the US-ASCII (0-127) character
    set then its value gets used;
    
    If the Unicode has a mapping to narrow in the character set then use
    it;
    
    If neither of the above then the Unicode gets escaped using the form
    \\xNNNN (hexadecimal).

  - HTTP/XML translation:
    
    If the Unicode represents a part of the US-ASCII (0-127) character
    set then its value gets used after replacing the special symbols
    (\<, \>, & etc.) with their entity references;
    
    If the Unicode has a mapping to narrow in the character set then use
    it. The narrow char is then checked to see if needs to be escaped;
    
    If none of the above then the Unicode gets escaped using the form
    &\#DDDDDD; (decimal)

### Character Set Use in ODBC/UDBC/CLI Clients

This section describes where a translation is done in the case of an
ODBC/UDBC/CLI client. These are described as solution because the
Virtuoso CLI is the same as the ODBC/UDBC interface.

For the functions `SQLPrepareW()` , `SQLExecDirectW()` , and
`SQLNativeSQLW()` any Unicode arguments will become narrow strings by
using the command translation described above.

When doing the bindings

    SQL_C_WCHAR -> SQL_xxx

and

    SQL_Nxxx -> SQL_C_xxx (except SQL_C_WCHAR)

Virtuoso converts Unicode strings to narrow strings using the string
translation described above.

### Character Set Use in the ODBC/UDBC/CLI Server

The server uses the character set in the CAST operator when converting
NCHAR/LONG NVARCHAR to any other type.

### Character Set Use in the HTTP Server

The HTTP server appends a

    charset=xxxx

attribute to the

    Content-Type:

HTTP header field when returning the HTTP header to the client. This can
be overridden by calling functions such as `http_header()` .

The HTTP server uses the character set mainly to format correctly values
using the `http_value()` function or its VSP equivalent \<?= ...\>. In
these cases wide values and XML entities - the result of XML processing
function like `xpath_contains()` - get represented using the HTTP/XML
translation rules described above. The same rules apply for results
returned by the FOR XML directive, by XML Views, and for WebDAV content.

### Character Set Use in the XML Processor

The Virtuoso embedded XML parser correctly processes all encodings
defined in the SYS\_CHARSETS table and UTF8.

### Generation of SQL

The `xpath()` and `xpath_contains()` functions translate their
expressions as follows:

#### Input Processing

Narrow strings are these get translated to Unicode as per the character
set and then to UTF-8, which is the internal encoding used by the
Virtuoso XML tools.

SQL Views and FOR XML directives take their values from narrow columns
by firstly converting them to Unicode based on the database character
set and then to UTF-8.

#### Output Processing

Almost all the XML processors and generators return their values as type
DV\_XML\_ENTITY (\_\_tag() 230). If such a value's character
representation is requested either by CAST or by

http\_value()

then Virtuoso converts it to narrow characters using the HTTP/XML
translation rules given above.

XPath expressions that return string values are returned as NCHAR values
to the clients, which then convert them to narrow character if needed.

## Creating A Collation

Virtuoso supports collation orders for CHAR and VARCHAR fields that are
different from the binary, as per ANSI SQL92. When comparing strings
using a collation, Virtuoso compares the "weights" of the characters
instead of their codes. This allows programs to make different
characters compare as equal (example: case-insensitive comparisons).

A collation can be created by supplying a collation definition text file
to the `collation_define()` SQL function. The collation definition file
contains a list of the exceptions to the binary collation order. An
exception consists of \<character code\> = \<collation weight\> pairs.
For example a case-insensitive collation can be defined by specifying
all the lower case letters to have the same collation weights as the
corresponding uppercase ones.

### Collation Definition File

The collation definition file should follow the following guidelines:

  - Each definition should reside on a separate line.

  - The format of the definition is: \<CHAR\>=\<CODE\>, where `CHAR` and
    `CODE` can be either the letters themselves, or their decimal codes.
    For example: '67=68' is the same as 'C=D' using the ASCII character
    set. For Unicode collations the codes can exceed the byte boundary.

You can define a new collation using the following function:

[`collation_define (
COLLATION_NAME

FILE_PATH

ADD_TYPE

)`](#fn_collation_define)

### Collations System Table

The SYS\_COLLATIONS system table holds the data for all defined
collations. It has the following structure:

    CREATE TABLE SYS_COLLATIONS (
        COLL_NAME VARCHAR,
        COLL_TABLE LONG VARBINARY,
        COLL_IS_WIDE INTEGER);

`COLL_NAME` is the fully qualified name of the collation - its
identifier.

`COLL_TABLE` holds the collation table itself. This is 256 bytes or
65536 wide chars.

`COLL_IS_WIDE` holds the collation's type: 0 for CHAR and 1 for NCHAR.
An 8-bit collation cannot be used by anything that requires NCHAR data
and vice versa.

A collation can be deleted by deleting its row from SYS\_COLLATIONS.

> **Note**
> 
> The collation will still be available until the server is restarted,
> as it's definition is cached in memory.

### Collations and Column Data

The collation is a property of the column holding the data. This means
that all comparisons including that column will use its collation. SQL
functions will strip collation data from the column; for example, if a
column "CompanyName" has an assigned collation "Spanish" then the SQL
call

    LEFT (CompanyName, 10);

will use the default collation).

Collations can be defined on a per-column basis, at table creation time,
and on a per-database basis as a configuration parameter. There is a
special form of the CAST operator that allows casting a column to a
collation.

A collation identifier has the same form as any other SQL identifier
(\<qualifier\>.\<owner\>.\<name\>) and it can be escaped with the same
syntax as other identifiers.

#### Defining a Collation for a Table Column

You may assign a collation to a column at table creation using the
following syntax:

    create table TABLE_NAME (
    ...
    COLLATED   VARCHAR(50) COLLATE Spanish,
    COLLATED   CHAR(20) COLLATE DB.DBA.Spanish,
    ....
    )

Assigning a collation to a non-character column gives an error.

If the COLLATE is omitted, the default database collation is used.

On database start-up the collation for each table's column is loaded
from the SYS\_COLLATIONS table and if not found, the COLLATE attribute
is ignored until the next restart.

#### Defining Database-Wide Collations

The database's default collation is defined by the configuration
parameter "Collation" in the "Parameters" section of the
[virtuoso.ini](#virtini) file. This database wide collation is the
default system collation used where none other is specified. This
setting can only be changed in the virtuoso.ini file and hence requires
a Virtuoso server restart. As with all collations, legal values are
those contained in the DB.DBA.SYS\_COLLATIONS table. The list can be
retrieved using [`charsets_list(1)`](#fn_charsets_list)

# Virtual Database (VDB) Engine

  - [The Need for VDB Engines](#consneed4vdb)

  - [First Generation Virtual Database Products](#consfirstvdbps)

  - [VDB Implementation Issues](#vdbimpliss)

  - [VDB Engine Components](#vdbcomponents)

# Web & Internet Protocol Support

Virtuoso provides direct access to a number of Internet protocols
through built in procedures. These protocols include SMTP, NNTP, POP3,
HTTP, XML and many more. Combined with Virtuoso's native database and
virtual database capabilities applications can be developed very rapidly
from scratch or existing systems can be enhanced with a rich set of
tools. An old customer table can be used to create a mail shot; a
products table can now generate an XML file which can be converted to
plain text and or HTML via XSLT which can be emailed to the customers
every week automatically using the scheduler, or on request from a VSP
page served by the HTTP server. The possibilities are endless and all
these abilities are contained within a single server.

# Web Services Protocol Support

The Internet is reaching a stage where automatic processes want to rely
on other sites and services presenting their uses in a standard way.
This is Web Services. What ever an organization or repository of data
contains the it needs to be exploited as fully as possibly. This is
exposing existing systems as Web Services. These need to be accessible
over well known protocols which combine to provide a service over the
web.

SQL provides the means to query data within a database. This is a very
well known and supported operation. The query may or may not be able to
make use of free text indexes to obtain results faster and more
accurately from textual sources. The source could even come from a
remote database contacted over ODBC, JDBC or OLEDB - more well supported
standards. The results may be shipped to another server for further
processing. Further processing could include transformations into
various XML's directly or via an XSLT stylesheet. This collaboration of
services can be enhanced further with other Web and Internet protocols
for the grand objective of making parts of useful information or ability
consumable over the Internet as a Web Service.

![Towards Web Services...](virtpyramid.jpg)

# Architecture

The base of Virtuoso is the Virtuoso Data Management. This handles the
normal tasks of the database and virtual database collaborating between
local native and remote SQL and XML based resources. Web and Internet
services and protocols then sit atop of this layer to expose Virtuoso to
the Web and its users.

![OpenLink Virtuoso Product Architecture](varch32.jpg)
