<div id="mt_iodbcsdkconfdsn" class="section">

<div class="titlepage">

<div>

<div>

## 14.2. Configuring Data Sources

</div>

</div>

</div>

The graphical (GTK+-based) configuration screen makes setting up your
data-sources (DSNs) quite intuitive, especially if you're used to the
setup screens on Windows:

<div class="figure-float">

<div id="mt_iodbcgtk001" class="figure">

**Figure 14.1. iODBC GTK Administrator**

<div class="figure-contents">

<div class="mediaobject">

![iODBC GTK Administrator](images/iodbcgtk001.jpg)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="mt_iodbcgtk002" class="figure">

**Figure 14.2. iODBC GTK Administrator**

<div class="figure-contents">

<div class="mediaobject">

![iODBC GTK Administrator](images/iodbcgtk002.jpg)

</div>

</div>

</div>

  

</div>

An example of adding a new datasource follows:

<div id="mt_iodbcsdkunixfiles" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.1. The Configuration Files

</div>

</div>

</div>

The iODBC library searches for its DSN through a set few files:

|                                                    |
|----------------------------------------------------|
| \$ODBCINI - the environment variable, if set       |
| ~/.odbc.ini - in your home-directory, if it exists |
| /etc/odbc.ini - a system-wide default              |

The format of this file is very simple; there are 3 sections, one for
ODBC itself (setting up tracing), one for a list of DSNs, and one for
the definitions of those DSNs, thus:

``` programlisting
[ODBC]
Debug         = 1
Trace         = 0
DebugFile     = /home/tim/temp/odbc-debugfile.log
TraceFile     = /home/tim/temp/odbc-tracefile.log
TraceAutoStop = 1
```

``` programlisting
[ODBC Data Sources]
Virtuoso30 = OpenLink Virtuoso 3.0
```

``` programlisting
[Virtuoso30]
Description = Virtuoso 3.0
Driver      = /opt/opl/virtuoso-o12/lib/virtodbc.so
Address     = localhost:1111
UserName    = dba
User        = dba
```

Each DSN configured has an entry in the \`ODBC Data Sources' section,
and a complete definition in a paragraph section of its own.

There is also an ODBCINSTINI file; this contains descriptions of the
ODBC drivers available.

``` programlisting
[ODBC Drivers]
OpenLink Generic = installed
[OpenLink Generic]
Driver = /opt/openlink/odbcsdk/lib/oplodbc.so
```

</div>

<div id="mt_iodbcsdktestunix" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.2. Making a Test Connection

</div>

</div>

</div>

To test that a DSN connects correctly, you can use the supplied
\`odbctest' utility.

``` programlisting
zsh, purple  3:58PM bin/ % ls
iodbc-config*  iodbcadm-gtk*  odbctest*
zsh, purple  3:58PM bin/ % echo $ODBCINI
/home/tim/.odbc.ini
zsh, purple  3:58PM bin/ % ./odbctest
iODBC Demonstration program
This program shows an interactive SQL processor
Enter ODBC connect string (? shows list):
Progress9.x(solaris)           | OpenLink Generic ODBC Driver
Progress9.x(solaris)           | OpenLink Generic ODBC Driver
pgsqlPurple                    | PostgreSQL native driver
pgsqlPurpleOpl                 | PostgreSQL using OpenLink driver
pgsqlPurpleVirtDemo            | Virtuoso database driver
SQLServer                      | OpenLink Generic ODBC Driver
Enter ODBC connect string (? shows list): DSN=pgsqlPurpleOpl
Driver: 04.50.0801 OpenLink Generic ODBC Driver (oplodbc.so)
SQL&gt;select count(*) from timtest;
count
-----------
100
 result set 1 returned 1 rows.
```

Any of the DSN attributes can be overridden in the connect-string, which
takes the form

``` programlisting
DSN=dsn_name[;attr=value]*
```

The attributes themselves depend on the database driver behind the DSN;
normally they control the username (where the attribute could be
called\`userid' or \`uid') and password (if specified) used to connect
to the database, some form of server hostname specification (\`host=' or
\`server='), and a means to identify a database instance on that server
(\`database='). A driver may also have custom attributes, such as
FetchBufferSize, Port, etc.

</div>

<div id="mt_compsampodbc" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.3. Compiling Sample Program

</div>

</div>

</div>

To compile the sample "odbctest" application, follow these steps:

<div class="orderedlist">

1.  Navigate to the directory:

    ``` programlisting
    odbcsdk/examples
    ```

2.  Type the following commands to use the default Makefile and
    odbctest.c code:

    ``` programlisting
    make clean
    make
    ```

</div>

</div>

<div id="mt_devodbc" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.4. Developing ODBC Applications

</div>

</div>

</div>

The ODBC SDK only implements an interface for the 'C' programming
language.

To write an ODBC application,you must perform the following tasks:

<div class="orderedlist">

1.  Include the files "sql.h" and "sqlext.h" in your 'C' program(s).

2.  Link the application with the following driver libraries:

    ``` programlisting
    lib/libiodbc.a
    lib/libiodbc.so
    ```

3.  At runtime, the ODBC drivers required for the connection are as
    follows (must be included in your shared library path):

    ``` programlisting
    libiodbc.so.2.1.2
    libiodbc.so.2
    ```

4.  Compile the program in the same directory as the "Makefile" file
    using the syntax:

    ``` programlisting
    make
    ```

</div>

Note: Some UNIX systems also need -lsocket, -lnsl_s or both.

</div>

<div id="mt_furtherread" class="section">

<div class="titlepage">

<div>

<div>

### 14.2.5. Further Reading:

</div>

</div>

</div>

"Data Management: SQL Call Level Interface (CLI)"

from X/Open in conjunction with SQL Access Group

ISBN: 1-872630-63-4

X/Open Document Number: S203

Microsoft ODBC API documentation:
http://www.microsoft.com/data/odbc/default.htm

</div>

</div>
