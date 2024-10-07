<div id="lite_unicode" class="section">

<div class="titlepage">

<div>

<div>

## 10.1. Database Configuration for Unicode

</div>

</div>

</div>

Below are instructions on the configuration of the Unicode enabled
drivers and databases for testing. Typically the first task to be
performed is the creation of a Unicode enabled Database, which for most
databases means configuring them to store data using the UTF8 encoding.

<div id="lite_uniora" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.1. Oracle 8 & 9

</div>

</div>

</div>

The Oracle 9i, 8i and 8.0 databases store Unicode data in the UTF8
encoding scheme, which is an ASCII compatible multibyte encoding for
Unicode.

<div id="lite_unioradb" class="section">

<div class="titlepage">

<div>

<div>

#### Database Confguration

</div>

</div>

</div>

Using the Oracle ‘Database Configuration Assistant’ wizard follow the
options for creating a new database, selecting the ‘custom’ option when
presented and you will during the configuration of this Custom database
be allowed to ‘Change the Character Set’, at which point this can be
changed to UTF8.

To check the character set in use by your database, execute the
following query in SQL\*Plus:

``` screen
SQL> SELECT parameter, value FROM nls_database_parameters
   WHERE parameter = 'NLS_CHARACTERSET';
PARAMETER             VALUE
------------------    ---------------------
NLS_CHARACTERSET      UTF8
SQL>.
```

Unicode support is dependent on the Unicode features available through
the Oracle Call Interface (OCI). OCI 8.1.5 supports inputting Unicode
data into a database and retrieving Unicode data from a database.

The Following Oracle Data types can be using for storing Unicode data:

``` screen
CHAR
VARCHAR
VARCHAR2
```

</div>

<div id="lite_unioradr" class="section">

<div class="titlepage">

<div>

<div>

#### Driver Configuration

</div>

</div>

</div>

The Oracle configuration parameter for control character sets is the
NLS_LANG environment variable, which should be set to the correct
character set for your client. Oracle 8.1.7 claims to be capable of
dynamically determining the character set in use on the client and does
not require the NLS_LANG to be set, but it is not a bad idea to set it
anyway.

Additional information on Oracle Unicode support can be found from <a
href="http://otn.oracle.com/docs/products/oracle8i/doc_library/817_doc/server.817/a76966/ch3.htm#41680"
class="ulink" target="_top">otn.oracle.com</a>

</div>

</div>

<div id="lite_uniinf" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.2. Informix 9.x

</div>

</div>

</div>

<div id="lite_uniinfdb" class="section">

<div class="titlepage">

<div>

<div>

#### Database Configuration

</div>

</div>

</div>

When a database is created, the DB_LOCALE in effect at the time is
stored in the system catalog and used throughout the lifetime of the
database. Using DBACCESS, create a new database with DB_LOCALE set
beforehand to ‘EN_US.UTF8’. Specifying UTF8 as the codeset allows the
creation of schema objects with names which can contain multibyte
characters.

The database locale being used by a database can be viewed in DBACCESS
using the menu commands: Database \> Info \> NLS.

The documentation for Informix GLS states that DB_LOCALE is also used to
correctly interpret the locale sensitive datatypes NCHAR and NVARCHAR.
The code set specified in DB_LOCALE specifies which characters are valid
in any character column as well as the names of database objects.

</div>

<div id="lite_uniinfcl" class="section">

<div class="titlepage">

<div>

<div>

#### Setting the Client Locale

</div>

</div>

</div>

The codeset to be used by an Informix client application is specified as
part of the client locale. The client locale takes the form:

``` screen
language_territory.codeset[@modifier]
```

An Informix 9 Lite driver or agent should use UTF-8 as the codeset. The
language and territory should not matter; so it should be possible, for
example, to use French (fr_fr) or American English (en_us). For Informix
clients on Windows, the client locale is typically set through SetNet32.
Rather than rely on the SetNet32 settings, our agent or Lite driver
instead sets the client locale at runtime. For an Informix Lite driver
on Windows, you must manually add an entry to the registry to set the
client locale under the entry for the appropriate DSN in the ODBC.INI
hive, add the value:

``` screen
ClientLocale:REG_SZ:<client locale>
e.g.
ClientLocale:REG_SZ:EN_US.57372
```

This example uses a codeset number (57372) rather than a codeset name
(UTF8) to specify UTF-8 as the codeset. Either form can be used. The
registry file included in an Informix client installation lists the
supported code sets and the correspondence between codeset names and
numbers.

</div>

<div id="lite_uniinfdr" class="section">

<div class="titlepage">

<div>

<div>

#### Driver Configuration

</div>

</div>

</div>

For an Informix agent (on Windows or Unix), specify the CLIENT_LOCALE
environment variable setting in the \[Environment INFORMIX…\] section of
the rulebook. For an Informix Unix Lite driver, set the CLIENT_LOCALE
environment variable appropriately.

</div>

</div>

<div id="lite_unisyb" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.3. Sybase 12.5 +

</div>

</div>

</div>

<div id="lite_unisybdb" class="section">

<div class="titlepage">

<div>

<div>

#### Database Configuration

</div>

</div>

</div>

The pre-requisites for Unicode with Sybase are:

<div class="itemizedlist">

- Sybase Active Server (ASE) Version 12.5 or later. (Unicode support is
  NOT enabled for Version 12.0);

- Default character set for the Sybase Server needs to be "UTF-8".

</div>

To set this:

<div class="orderedlist">

1.  Make sure the Sybase SQL Server is not running. (Cancel it from the
    "Services" screen).

2.  Run "Server Configuration" from the "Sybase" entry in the Task Menu
    bar, or run SYCONFIG.EXE directly;

3.  Either Create a new Active Server or Configure an existing Active
    Server. (Selection is via Pushbuttons on the dialog box);

4.  For either method, select the "Language" pushbutton;

5.  Select the "Character Set" pushbutton;

6.  Select the "Set Default" pushbutton;

7.  Select "Unicode 3.0.1 UTF-8" from the list box.

</div>

If this entry is not available, you will have to add it. From the
Character Set selection dialog box, select the "Add / Delete"
pushbutton. Select the character set from the list box of those
available. Select the "Add" pushbutton (or the "Add All" pushbutton to
make all character sets available). Select OK. One the default character
set has been selected, select "OK" and "Exit". Start (or restart) the
Sybase SQL-Server.

</div>

<div id="lite_unisybdr" class="section">

<div class="titlepage">

<div>

<div>

#### Driver Configuration

</div>

</div>

</div>

There is no need to set anything at the Client end. The character set in
use is actually set using Sybase locale functions at connection time.
However, it may be useful to ensure that "utf8" is one of the enabled
character sets for the relevant platform, in the file
\[SYBASE\]/locales/locales.dat.

</div>

</div>

<div id="lite_unipro" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.4. Progress 9.1 (SQL-92)

</div>

</div>

</div>

<div id="lite_uniprodb" class="section">

<div class="titlepage">

<div>

<div>

#### Database Configuration

</div>

</div>

</div>

The Progress database can be run in the UTF-8 Unicode codepage. The
sql-92 client can be also be run in unicode. The SQL-92 server uses the
codepage of the connected database as its internal codepage. Conversion
between the database codepage and the SQL-92 client codepage is done by
the server. There are no specific functions provided for converting
between codepages within an ESQL-92 program.

The easiest method to create to Progress Unicode enabled database is to
use the ‘proutil’ program to convert an existing database to utf8 format
using the following command:

``` screen
proutil <db-name> -C convchar convert utf-8
```

Multibyte characters can be used in character and varchar fields.
Character string literals and the arguments to string functions can also
be multibyte characters. There are some provisos for specific functions
noted in the documentation. In addition, when the SQL-92 language
element syntax requires single quotes, double quotes, parentheses, or
braces, the requirement is for the single-byte ASCII encoding of these
characters, and other encodings are not equivalent. The string operators
in Progress SQL-92 consider the unit of length to be the character
count, not a byte count or a column count.

When a column of type CHAR or VARCHAR is created the maximum length
specified is a number of characters so the actual number of bytes
storage required depends on the database codepage. The length of
character data returned in the sqlda is in bytes not characters.

</div>

<div id="lite_uniprodr" class="section">

<div class="titlepage">

<div>

<div>

#### Driver Configuration

</div>

</div>

</div>

For ESQL-92 clients the internal codepage is determined by the value of
the client's SQL_CLIENT_CHARSET environment variable, if set. Otherwise,
the internal codepage is that of the client's locale. There is a similar
environment variable that controls the codepage of messages sent by the
database server.

</div>

</div>

<div id="lite_unidb2" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.5. DB/2 v7.x

</div>

</div>

</div>

<div id="lite_unidb2db" class="section">

<div class="titlepage">

<div>

<div>

#### Database Configuration

</div>

</div>

</div>

Using the DB/2 ‘Control Center’ create a new database instance using the
wizard provide. During the create of this database you will be prompted
to specify the locale for the new database, which should be set to a
code set type of UTF-8. Unicode data can be stored in the following DB/2
datatypes:

<div class="itemizedlist">

- GRAPHIC

- VARGRAPHIC

- LONGVARGRAPHIC

- DBCLOB

</div>

</div>

<div id="lite_unidb2dr" class="section">

<div class="titlepage">

<div>

<div>

#### Driver Configuration

</div>

</div>

</div>

There are no specific environment variables that need to be set for the
DB/2 Driver to handle Unicode data. One special consideration when
inserting Unicode data into the daatbase though is that you cannot
insert literal Unicode values into the database. Instead these values
have to be inserted as bound parameters as follows:

``` screen
CREATE TABLE UTEST (F1 GRAPHIC(20), F2 VARGRAPHIC(20), F3 LONG VARGRAPHIC,
        F4 DBCLOB(100));
         Successfully connected to DSN 'UO_db2'.
SQLBindParameter:
  In: StatementHandle = 0x00751860, ParameterNumber = 1,
      InputOutputtype = SQL_PARAM_INPUT=1, ValueType = SQL_C_WCHAR=-8,
      ParameterType = SQL_WCHAR=-8, ColumnSize = 0, DecimalDigits = 0,
      ParameterValuePtr = "?????", BufferLength = 0,
      StrLen_or_IndPtr = SQL_NTS=-3, SQL_LEN_DATA_AT_EXEC = FALSE,
      Buffer Size = 600
   Return:       SQL_SUCCESS=0
SQLExecDirect:
   In: Statementhandle = 0x00751860, StatementText = "insert into utest(f1) 
values(?)", Statementlength = 31
   Return:       SQL_SUCCESS=0
SQLExecDirect:
   In: Statementhandle = 0x00751860, StatementText = "select * from utest", 
Statementlength = 19
   Return:       SQL_SUCCESS=0
Get Data All:
"F1", "F2", "F3", "F4"
"АБВГД               ", <Null>, <Null>, NO DATA
1 row fetched from 4 columns.
```

This is because the Graphic string data types are compatible only with
other graphic string data types, and never with numeric, character
string, or datetime data types.

Note that additional Unicode support has been added to the DB/2 agent
for VARCHAR, LONGVARCHAR, CLOB & BLOB types, although a specific Patch
(FIXPAK7) is required from IBM to obtain this support in DB/2 v 7.2
databases and FIXPAK 3 & 7 are required for DB/2 v7.1 databases.

The application code page must be set to UTF-8, which can be done by
issuing the command:

``` screen
      db2set DB2CODEPAGE=1208
```

on the client (DB2 Lite) or server (DB2 agent) as appropriate.

</div>

</div>

<div id="lite_unisql" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.6. MS SQLServer 2000

</div>

</div>

</div>

There are no Unicode-specific settings for SQLServer. When creating a
Database, the collation type for the database can be specified but there
is no UTF8 or Unicode specific setting, and a wide (Unicode) language
type like Chinese or similar has to be selected, after which wide
(Unicode) data can be inserted into the SQLServer wide character types
NCHAR & NVARCHAR.

</div>

<div id="lite_unigeninfo" class="section">

<div class="titlepage">

<div>

<div>

### 10.1.7. Operational Notes

</div>

</div>

</div>

If you are debugging a unicode connection, you can expect to see this in
the request broker log - note the serveropts field:

``` programlisting
...
14:08:11 using mapping: db2:*:*:*:*:*:*
14:08:11 using [generic_db2] ServerProgram=db2_mv
14:08:11 connect params: domain=DB2 db=sample serveropts=W readonly=0
...
```

The Unicode parameters that are supplied to the server options cannot be
displayed properly in the broker log so the above will be seen; this is
normal behaviour.

</div>

</div>
