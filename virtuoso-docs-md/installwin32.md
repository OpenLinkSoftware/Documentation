<div id="installwin32" class="section">

<div class="titlepage">

<div>

<div>

## 2.2. Virtuoso for Windows

</div>

</div>

</div>

<div id="b4ustart" class="section">

<div class="titlepage">

<div>

<div>

### 2.2.1. Before You Start

</div>

</div>

</div>

To ensure a smooth installation, please review the following checklist
before you start the setup program.

<div id="haveudld" class="section">

<div class="titlepage">

<div>

<div>

#### Have you downloaded the software?

</div>

</div>

</div>

If you have not already done so, please download your copy of OpenLink
Virtuoso from the OpenLink web site. The URL is
<a href="http://www.openlinksw.com" class="ulink"
target="_top">http://www.openlinksw.com</a> . When you visit the site,
select "Download & Evaluation".

<div class="orderedlist">

1.  Select product "OpenLink Virtuoso: Personal Edition "

2.  From "Product Category" choose "Universal Server"

3.  From "Product" choose "Virtuoso Universal Server"

4.  Select "Database Version"

5.  From "server OS" select "Windows" and click "Next"

6.  Select a release and click "Next"

7.  You will be prompt to login in not already.

8.  Click "Next"

9.  Download the desired component. For example, click the HTTP link for
    "Multi-Threaded Universal Server (Commercial Edition) for OpenLink
    Virtuoso 4.x"

</div>

</div>

<div id="douhavelic" class="section">

<div class="titlepage">

<div>

<div>

#### Do you have the License file?

</div>

</div>

</div>

The server will need a license file, and this is automatically delivered
by email as part of the download process. It is therefore important to
supply a valid email address. The installer will prompt for the license
file location.

</div>

<div id="reinstvirt" class="section">

<div class="titlepage">

<div>

<div>

#### Reinstalling Virtuoso?

</div>

</div>

</div>

If you are reinstalling Virtuoso, you must first shutdown any additional
database servers you have configured on non default ports. The databases
on port 1111 and 1112 will automatically be stopped during the install
process. On Windows NT/2000/XP, go to the services applet in the Control
Panel. There you can stop services that appear with names of the form
"OpenLink Virtuoso DBMS Server \[instance name\]".

On Windows NT/2000/XP you can also shut them down with the following
commands in the Virtuoso\bin directory:

``` programlisting
virtuoso-odbc-t.exe +service stop
virtuoso-odbc-t.exe +instance myinstance +service stop
virtuoso-odbc-t.exe +instance anotherinstance +service stop
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                            |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                      |
|                              | There is an alternative executable available for Virtuoso called: virtuoso-odbc-f.exe, which you may have installed. This version is designed for versions of Windows that offer no native threading support such as Windows 98, and offers no advantages over virtuoso-odbc-t.exe for Windows NT/2000/XP. |

</div>

You can list the services with their status using:

``` programlisting
virtuoso +service list
```

</div>

<div id="allocoftcpports" class="section">

<div class="titlepage">

<div>

<div>

#### Allocation of TCP/IP ports

</div>

</div>

</div>

The Default database have the following port allocations:

<div id="id3858" class="table">

**Table 2.2. Port Usage**

<div class="table-contents">

| Port | Used by                                                           |
|------|-------------------------------------------------------------------|
| 1111 | Default Virtuoso Server port                                      |
| 8889 | Default Virtuoso Visual Server Administration Interface HTTP port |

</div>

</div>

  

By default, the Virtuoso DBMS listens on port 1111. This port number is
not selectable at install time. If the port is currently in use by
another server then after the installation completes you will need to
change the port number in the Local Virtuoso ODBC DSN that is created
during the installation process, and also in the following file:

``` programlisting
C:\Program Files\OpenLink Software\Virtuoso 5.0\bin\virtuoso.ini
```

To check if a port is in use on NT, you can use the following command,
and review the output:

``` programlisting
netstat -an | more
```

</div>

<div id="prevworkodbcdsn" class="section">

<div class="titlepage">

<div>

<div>

#### Do you already have an ODBC Data Source Name (DSN) that works?

</div>

</div>

</div>

The Virtual Database aspects of the Virtuoso for ODBC assumes that you
already have an ODBC driver on your machine from a database vendor,
OpenLink Software, or from another 3rd party vendor. It is a useful
sanity-check to ensure that you have an ODBC System Data Source Name
(DSN) on your machine, and that it successfully connects to your
database, and that it retrieve data. Any ODBC compliant tool can be used
to test that your ODBC Data Source Name (DSN) works, such as the sample
application we provide - C++ Demo32, and that it is sufficiently robust
to operate with Virtuoso. Virtuoso is ODBC Driver Independent and
certified to work with any drivers that are ODBC level 1 or higher.

</div>

</div>

</div>
