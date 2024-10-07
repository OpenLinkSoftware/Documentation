<div id="mt_sql2kconnectopts" class="section">

<div class="titlepage">

<div>

<div>

## 17.5. SQL Server 2000 – Connection Options

</div>

</div>

</div>

<div id="mt_sql2kopts" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.1. Connection Option Parameters

</div>

</div>

</div>

When configuring an OpenLink SQL Server 2000 multi-tier Agent
(sql2k\_\[sm\]v\[.exe\] only and not sql\_\[sm\]v\[.exe\]), the
following keywords and values may be entered in the
<span class="emphasis">*Connection Options*</span> section of the entry
for the agent in the Request Broker configuration file (oplrqb.ini). All
are optional.

<div id="id34459" class="decimalstyle">

**Table 17.21. **

<div class="decimalstyle-contents">

<table data-summary="  " data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;" data-char="." data-charoff="50">Key</th>
<th data-char="." data-charoff="50">Keyword</th>
<th data-char="." data-charoff="50">Value(s)</th>
<th data-char="." data-charoff="50">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-A</td>
<td data-char="." data-charoff="50">ADDRESS</td>
<td data-char="." data-charoff="50">Network address of the server which
is running an instance of SQL Server.</td>
<td data-char="." data-charoff="50">Address is usually the network name
of the server, but can be other names such as a pipe, or a TCP/IP port
and socket address.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-B</td>
<td data-char="." data-charoff="50">FALLBACK</td>
<td data-char="." data-charoff="50"><p>Yes (default)</p>
<p>No</p>
<p>Applies to SQL Server 6.5 only.</p></td>
<td data-char="." data-charoff="50">When yes, instructs the driver to
attempt connection to a fallback server if connection to a primary
server fails. When no, no attempt at a fallback connection is made. This
option applies only to standby servers. It does not apply to a virtual
server in a cluster / failover configuration.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-C</td>
<td data-char="." data-charoff="50">AUTOTRANSLATE</td>
<td data-char="." data-charoff="50"><p>Yes (default)</p>
<p>No</p></td>
<td data-char="." data-charoff="50">When yes, ANSI character strings
sent between the client and server are translated by converting through
Unicode to minimize problems in matching extended characters between the
code pages on the client and the server.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-D</td>
<td data-char="." data-charoff="50">DATABASE</td>
<td data-char="." data-charoff="50">Database Name</td>
<td data-char="." data-charoff="50">The name of the database which will
be the default database for the connection. Note however, that for
OpenLink Agents and Single-tier Drivers, this value is normally entered
into a separate control on the Configuration module. If this control
contains a name, entering this option as a connection option also could
lead to the attempt to establish a connection being rejected.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-E</td>
<td data-char="." data-charoff="50">QUERYLOGFILE</td>
<td data-char="." data-charoff="50">Full path, name and extension of the
log file.</td>
<td data-char="." data-charoff="50">This option applies only when Option
–O (QUERYLOG_ON) is set to <span class="emphasis"><em>yes</em></span>.
This is the file to which data for long-running queries is saved.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-F</td>
<td data-char="." data-charoff="50">ATTACHDBFILENAME</td>
<td data-char="." data-charoff="50">Name of the primary file of an
attachable database. Include the full path and escape any \ characters
if using a C character string variable. Example:
c:\\MyFolder\\MyDB.mdf</td>
<td data-char="." data-charoff="50"><p>This database is attached and
becomes the default database for the connection. You must also specify
the database name in the parameter, DATABASE. However, see above for the
Database option, -D.</p>
<p>If the database was previously attached, SQL Server will not reattach
it; it will use the attached database as the default for the
connection.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-G</td>
<td data-char="." data-charoff="50">QUERYLOGTIME</td>
<td data-char="." data-charoff="50">Numeric character string</td>
<td data-char="." data-charoff="50">Applies only when Option –O
(QUERYLOG_ON) is set to <span class="emphasis"><em>yes</em></span>. This
specifies the threshold (in milliseconds) for logging long-running
queries. Any query that does not get a response within this time is
written to the long-running query log file (which is defined by the
Option, -E, QUERYLOGFILE).</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-H</td>
<td data-char="." data-charoff="50">SERVER</td>
<td data-char="." data-charoff="50">Server Name</td>
<td data-char="." data-charoff="50">Name of a server which is running an
instance of SQL Server on the network. By default, this is <span
class="emphasis"><em>local</em></span>.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-L</td>
<td data-char="." data-charoff="50">LANGUAGE</td>
<td data-char="." data-charoff="50">SQL Server language name.</td>
<td data-char="." data-charoff="50">SQL Server language name. SQL Server
can store messages for multiple languages in sysmessages. If connecting
to a SQL Server with multiple languages, Language specifies which set of
messages are used for the connection.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-N</td>
<td data-char="." data-charoff="50">NETWORK</td>
<td data-char="." data-charoff="50">Name of a network library
dynamic-link library. E.g. dbnmpntw</td>
<td data-char="." data-charoff="50">The name need not include the path
and must not include the .dll file name extension.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-O</td>
<td data-char="." data-charoff="50">QUERYLOG_ON</td>
<td data-char="." data-charoff="50"><p>Yes</p>
<p>No (default)</p></td>
<td data-char="." data-charoff="50">Enables or disables logging
long-running query data on the connection.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-Q</td>
<td data-char="." data-charoff="50">QUOTEDID</td>
<td data-char="." data-charoff="50"><p>Yes (default)</p>
<p>No</p></td>
<td data-char="." data-charoff="50">When yes, ,the SQL-92 rules
regarding the use of quotation marks in SQL statements are applied. When
no, the legacy Transact-SQL rules apply.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-R</td>
<td data-char="." data-charoff="50">REGIONAL</td>
<td data-char="." data-charoff="50"><p>Yes</p>
<p>No (default)</p></td>
<td data-char="." data-charoff="50">When yes, client settings are used
when converting currency, date, and time data to character data. When
no, ODBC standard strings are used to represent currency, date, and time
data that is converted to string data.</td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-S</td>
<td data-char="." data-charoff="50">STATSLOG_ON</td>
<td data-char="." data-charoff="50"><p>Yes</p>
<p>No (default)</p></td>
<td data-char="." data-charoff="50">When set to <span
class="emphasis"><em>yes</em></span>, SQL Server ODBC driver performance
data is captured.</td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-T</td>
<td data-char="." data-charoff="50">TRUSTEDCONNECTION</td>
<td data-char="." data-charoff="50"><p>Yes</p>
<p>No (default)</p></td>
<td data-char="." data-charoff="50"><p>When yes, Windows Authentication
Mode is used for login validation. I.e. no User ID or Password need be
supplied.</p>
<p>When no, a User ID and password must be supplied.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;" data-char="." data-charoff="50">-U</td>
<td data-char="." data-charoff="50">USEPROCFORPREPARE</td>
<td data-char="." data-charoff="50"><p>0 (default)</p>
<p>1</p>
<p>2</p>
<p>Applies to SQL Server 6.5 only.</p></td>
<td data-char="." data-charoff="50"><p>When 0, the SQL Server ODBC
driver does not create temporary stored procedures for SQLPrepare.</p>
<p>When 1, instructs the SQL Server ODBC driver to create temporary
stored procedures when statements are prepared with SQLPrepare. The
temporary stored procedures are not dropped until the connection is
broken.</p>
<p>When 2, the SQL Server ODBC driver creates temporary stored
procedures for SQLPrepare, but only one procedure is created per
statement handle and the procedure is dropped when the statement handle
becomes invalid or a new SQL statement is prepared.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;" data-char="." data-charoff="50">-W</td>
<td data-char="." data-charoff="50">ANSINPW</td>
<td data-char="." data-charoff="50"><p>Yes (default)</p>
<p>No</p></td>
<td data-char="." data-charoff="50">When yes, the driver uses
ANSI-defined behaviors for handling NULL comparisons, character data
padding, warnings, and NULL concatenation. When no, ANSI defined
behaviors are not exposed.</td>
</tr>
</tbody>
</table>

</div>

</div>

  

</div>

<div id="mt_sql2kentry" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.2. Entry Format

</div>

</div>

</div>

<div id="mt_sql2kodbcad" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Administrator

</div>

</div>

</div>

Options should be entered into the ConnectOptions control in the format:

``` screen
-<OptionLetter1> value1 -<OptionLetter2> value2 etc
e.g.
-C no L English
```

See the table above for a list of available option letters.

</div>

<div id="mt_sql2koplrqb" class="section">

<div class="titlepage">

<div>

<div>

#### Oplrqb.ini Settings

</div>

</div>

</div>

Connection Options are entered following the
<span class="emphasis">*ConnectOptions*</span> keyword. Options may be
entered in the same format as in the ODBC Configuration dialog, using
key letters as above for example:

``` screen
ConnectOptions = {-c no l English}
```

Surrounding braces (‘{‘ and ‘}’) may be used but are not necessary.

Alternately, the full keywords may be used. In this case, they should be
entered in the format:

``` screen
ConnectOptions = {Option1=value1;Option2=value2;etc}
```

Semicolons should be used to separate items in the list. Surrounding
braces (‘{‘ and ‘}’) may be used but are not necessary. If surrounding
braces are used, any text outside the braces will be discarded. A
trailing semicolon is not necessary and ought not to be used, but should
not cause fatal errors if it is used.

</div>

<div id="mt_sql2kgeneral" class="section">

<div class="titlepage">

<div>

<div>

#### General

</div>

</div>

</div>

Items may be entered into the list in any order. They are not
case-sensitive, so upper case or lower case or a mixture of both can be
used (though this may depend on the SQL Server itself).

If no option key letters or keys are used, the Agent will assume that
the complete ConnectOptions entry is the name of the server running the
SQL Server database i.e. it will assume it to be a value for the keyword
<span class="emphasis">*SERVER*</span>. See the notes for this keyword
in the table above.

</div>

</div>

<div id="mt_sql2kkeywords" class="section">

<div class="titlepage">

<div>

<div>

### 17.5.3. Disallowed Keywords

</div>

</div>

</div>

The following Keywords should not be added to the ConnectOptions entry,
as they are set by the Agent Configuration Setup dialog, or are applied
automatically by the Request Broker:

|                      |
|----------------------|
| APP                  |
| DATABASE (see below) |
| DRIVER               |
| DSN                  |
| FILEDSN              |
| PWD                  |
| UID (see below)      |

If any of the above Keywords are used, the agent will probably fail to
log on to the Database server, as duplicate Connect Options may have
been supplied.

Note: It is possible to add <span class="emphasis">*DATABASE=*</span>
and <span class="emphasis">*UID=*</span> entries, provided that the
Database:Name and Database:Username edit controls in the Agent
Configuration dialog are left blank. Note the comments for the keyword,
<span class="emphasis">*TrustedConnection*</span> above, which affects
the handling of the UID keyword.

The OpenLink SQL2000 agent does not perform any consistency or validity
checking on the ConnectOptions entry, and passes the Connection options
as entered to the SQL Server. If invalid keywords or values, or
unreadable entries are supplied, the SQL Server may reject the login.

The exception is the case where the ConnectOptions entry contains no
recognizable entries, in which case it is assumed to be the value for
the keyword, <span class="emphasis">*SERVER*</span>. A completely
corrupted ConnectOptions entry will therefore probably try to connect to
an invalid server.

</div>

</div>
