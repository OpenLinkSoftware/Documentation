<div id="lite_uliteinst" class="section">

<div class="titlepage">

<div>

<div>

## 4.4. UNIX & Linux

</div>

</div>

</div>

The OpenLink Single-Tier Drivers for ODBC for Unix may be installed
within an existing Multi-Tier installation, or in a separate
environment.

If the Lite Drivers are installed within an (existing/new) Multi-Tier
installation, then the Lite Drivers use the normal Admin Assistant which
is started up as part of the broker. There are no special Admin
Assistant pages just for Lite.

If the Lites are installed in their own directory, the HTTP-based iODBC
Administrator package provides a standalone version of the Multi-Tier
Admin Assistant with a shortened menu structure containing only the
items relevant to Lite.

When installing the Lite packages, the install.sh script does the
following:

<div class="orderedlist">

1.  Registers the driver to bin/odbcinst.ini

2.  Creates a sample data source in bin/odbc.ini

3.  If appropriate environment settings are found, e.g., INFORMIXDIR,
    they are added to the bin/openlink.ini file automatically.

4.  If appropriate environment settings are found, e.g., INFORMIXDIR,
    lib directories are added to the LD_LIBRARY_PATH setting in
    openlink.sh. <span class="emphasis">*Please note that your
    LD_LIBRARY_PATH must point to the location of any shared libraries
    required by the Database Vendors communication layer in order for
    the OpenLink Lite driver to load.*</span>

</div>

Once the Lite driver is installed you can proceed to create data
sources. You can either edit the configuration files by hand or use a
web based interface to configure them. Refer to the
<a href="lite_unixliteconf.html" class="link"
title="5.2. Unix Data Source Configuration">Unix Data Source
Configuration</a> section for more information.

<div id="lite_uliteinste" class="example">

**Example 4.1. Sample Installation**

<div class="example-contents">

Here is an example run of the installer:

``` screen
    $ ls -l
    total 318
    -rwxr-xr-x    1 openlink openlink    31478 Nov 15 16:59 install.sh
    -rw-rw-r--    1 openlink openlink   289089 Nov 15 16:59 sql_lt.taz
    $ ./install.sh
    Extracting (sql_lt.taz) ...
    Adding OpenLink SQL Server Lite Driver to odbcinst.ini ...
    Adding sql_lite to odbc.ini ...
    Creating scripts ...
    Enter the name of the user that will own the
    programs [ENTER=Use Current User Settings]  :
    Enter the name of the group that will own the
    programs [ENTER=Use Current Group Settings] :
    Changing ownership ...
    End of installation
    $ ls -lR
    .:
    total 323
    drwxrwxr-x    2 openlink openlink     1024 Nov 15 16:59 bin
    -rwxr-xr-x    1 openlink openlink    31478 Nov 15 16:59 install.sh
    drwxrwxr-x    2 openlink openlink     1024 Nov 15 16:37 lib
    -rwxr-xr-x    1 openlink openlink      861 Nov 15 16:59 openlink.csh
    -rwxr-xr-x    1 openlink openlink      951 Nov 15 16:59 openlink.sh
    drwxrwxr-x    3 openlink openlink     1024 Nov 15 16:37 scripts
    -rw-rw-r--    1 openlink openlink   289089 Nov 15 16:59 sql_lt.taz
    ./bin:
    total 37
    -rw-r--r--    1 openlink openlink     1413 Nov 15 16:37 freetds.conf
    -rwxr-xr-x    1 openlink openlink    26800 Nov 15 16:37 inifile
    -rw-rw-r--    1 openlink openlink      335 Nov 15 16:59 odbc.ini
    -rw-rw-r--    1 openlink openlink      220 Nov 15 16:59 odbcinst.ini
    -rw-rw-r--    1 openlink openlink     5008 Nov 15 16:59 openlink.ini
    ./lib:
    total 657
    -rwxr-xr-x    1 openlink openlink      781 Nov 15 16:37 sql_st_lt.la
    -rwxr-xr-x    1 openlink openlink   667268 Nov 15 16:37 sql_st_lt.so
    ./scripts:
    total 1
    drwxrwxr-x    2 openlink openlink     1024 Nov 15 16:37 SQLServer
    ./scripts/SQLServer:
    total 1
    -rw-r--r--    1 openlink openlink      883 Nov 15 16:37 oplrvc.sql
```

</div>

</div>

  

</div>
