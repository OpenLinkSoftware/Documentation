<div id="ch-quicktours" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 3. Quick Start & Tours

</div>

<div>

<div class="abstract">

**Abstract**

This chapter is aimed at getting Virtuoso up and running quickly with a
few basic examples to demonstrate key concepts.

The Virtuoso quick start tour is designed to familiarize you with some
of the components in Virtuoso. After completing the tour, you should be
able to link new tables into Virtuoso, and query the tables.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">3.1. [Where to
Start](ch-quicktours.html#newadminui)</span>

<span class="section">3.1.1. [Default
Passwords](ch-quicktours.html#defpasschange)</span>

<span class="section">3.1.2. [Post-Installation Sanity
Check](ch-quicktours.html#postinstsanity)</span>

<span class="section">3.1.3. [Administering Your Virtuoso
Installation](ch-quicktours.html#administeringtheserver)</span>

<span class="section">3.2. [Client Connections](qsclientcon.html)</span>

<span class="section">3.2.1. [ODBC](qsclientcon.html#qsodbc)</span>

<span class="section">3.2.2. [JDBC](qajdbc.html)</span>

<span class="section">3.2.3. [OLEDB](qsoledb.html)</span>

<span class="section">3.3. [Virtual Database
Server](qsvdbsrv.html)</span>

<span class="section">3.3.1. [Configuring Your ODBC Data
Sources](qsvdbsrv.html#confodbcdsn)</span>

<span class="section">3.3.2. [Datasource Check](dsnchk.html)</span>

<span class="section">3.3.3. [Demo Datasource
Query](demoquery.html)</span>

<span class="section">3.3.4. [Linking Remote Tables Into
Virtuoso](lnktabvirt.html)</span>

<span class="section">3.3.5. [Listing or Unlinking
Tables](listunlnktabs.html)</span>

<span class="section">3.3.6. [Querying Linked
Tables](querybisql.html)</span>

<span class="section">3.4. [Web Server](qswebserver.html)</span>

<span class="section">3.4.1. [Virtual
Directories](qswebserver.html#qsvirtdir)</span>

<span class="section">3.4.2. [Multi Homing](qsmultihome.html)</span>

<span class="section">3.5. [WebDAV](qswebdav.html)</span>

<span class="section">3.5.1. [Web
Folders](qswebdav.html#qswebfolders)</span>

<span class="section">3.6. [Web Services](qswebservices.html)</span>

<span class="section">3.7. [Exposing Persistent Stored Modules as Web
Services](qstexpwsmodules.html)</span>

<span class="section">3.7.1. [Publishing Stored Procedures as Web
Services](qstexpwsmodules.html#qstexpwspls)</span>

<span class="section">3.7.2. [XML Query
Templates](qstxmlqtemplates.html)</span>

<span class="section">3.7.3. [Publishing VSE's as Web
Services](qstpublishbifs.html)</span>

<span class="section">3.8. [VSMX - Virtuoso Service Module for
XML](qsvsmx.html)</span>

<span class="section">3.9. [SQL to XML](qssqltoxml.html)</span>

<span class="section">3.9.1. [FOR XML Execution
Modes](qssqltoxml.html#qsforxmlmodes)</span>

<span class="section">3.9.2. [Tables With XML
Columns](qsxmlcolumn.html)</span>

<span class="section">3.10. [NNTP](qsnntp.html)</span>

<span class="section">3.10.1. [NNTP Server
Setup](qsnntp.html#qsnntpservsetup)</span>

<span class="section">3.10.2. [Local & Remote
Groups](qslocalvsremotegrps.html)</span>

<span class="section">3.10.3. [NNTP Client Setup](qscliconn.html)</span>

<span class="section">3.11. [Dynamic Web
Pages](vspquickstart.html)</span>

<span class="section">3.12. [VSP Examples](qsvspexamples.html)</span>

<span class="section">3.12.1. [Simple HTML FORM
usage](qsvspexamples.html#simpleforms)</span>

<span class="section">3.12.2. [Manipulating Database Data in
VSP](vspdbinout.html)</span>

<span class="section">3.12.3. [Simple Tutorial](vspequi.html)</span>

<span class="section">3.13. [Third-Party Runtime Typing, Hosting & User
Defined Types](qshostingplugs.html)</span>

<span class="section">3.14. [Troubleshooting Tips](troutips.html)</span>

<span class="section">3.14.1. [General
Tips](troutips.html#tipsgen)</span>

<span class="section">3.14.2. [DBMS Server will not
start](tipsdbnotstart.html)</span>

<span class="section">3.14.3. [Case Mode](tipscasemode.html)</span>

</div>

<div id="newadminui" class="section">

<div class="titlepage">

<div>

<div>

## 3.1. Where to Start

</div>

</div>

</div>

<div id="defpasschange" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.1. Default Passwords

</div>

</div>

</div>

When you start up Virtuoso for the first time, there are 3 user accounts
defined:

<div id="id8106" class="decimalstyle">

**Table 3.1. Default users of Virtuoso**

<div class="decimalstyle-contents">

| User Name | Default Password | Usage                                                                                                       |
|:----------|------------------|-------------------------------------------------------------------------------------------------------------|
| dba       | dba              | Default Database Administrator account.                                                                     |
| dav       | dav              | WebDAV Administrator account.                                                                               |
| vad       | vad              | WebDAV account for internal usage in VAD (disabled by default).                                             |
| demo      | demo             | Default demo user for the demo database. This user is the owner of the Demo catalogue of the demo database. |
| soap      | soap             | SQL User for demonstrating SOAP services.                                                                   |
| fori      | fori             | SQL user account for 'Forums' tutorial application demonstration in the Demo database.                      |

</div>

</div>

  

One database user and 2 WebDAV users. These users have their passwords
set to default values. It is therefore important to change them
immediately after the installation.

The one database user is the database administrator with username "dba"
and password "dba". This can be changed using the
<a href="configuringvirtuosoclients.html#isql" class="link"
title="Native Virtuoso Interactive SQL Query (ISQL)">Interactive SQL</a>
utility. When started without parameters, the ISQL tries to log on as
dba with the default password. The SQL statement to change a user's
password is:

``` programlisting
set password <old password> <new password>
```

The password is an identifier, so take care to use proper quotation.

You can also use the graphical
<a href="dbadmin.html#dbusersandgroups" class="link"
title="Users &amp; Group Accounts">Virtuoso Administration Interface</a>
to administer Virtuoso database users.

The 2 WebDAV user accounts, dav and davuser also have their password set
to their username. There are 2 easy ways to change them. Either use the
GUI in Administration Interface under WebDAV Administration / WebDAV
services / Users Administrator or use the SQL statement:

``` programlisting
update WS.WS.SYS_DAV_USER set U_PASSWORD='<new password>'
where U_NAME='<username>'
    
```

Note quotation around varchar values. Please remember to perform these
operations for all Virtuoso server instances installed. By default these
are the Virtuoso with an empty database and Virtuoso \[demo\] with the
demo database.

</div>

<div id="postinstsanity" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.2. Post-Installation Sanity Check

</div>

</div>

</div>

<div id="posttestisql" class="section">

<div class="titlepage">

<div>

<div>

#### Verify by ISQL

</div>

</div>

</div>

Verify usability of your Virtuoso server by executing the following
command from your command line prompt:

``` programlisting
isql
```

From the ISQL prompt enter the following SQL command:

``` programlisting
select * from DB.DBA.SYS_USERS;
```

This should produce a resultset containing one record if everything has
been implemented correctly to this point.

<div class="figure-float">

<div id="inst022" class="figure">

**Figure 3.1. ISQL in Telnet**

<div class="figure-contents">

<div class="mediaobject">

![ISQL in Telnet](images/ln-inst3.gif)

</div>

</div>

</div>

  

</div>

</div>

<div id="posttesthttp" class="section">

<div class="titlepage">

<div>

<div>

#### Verify by HTTP

</div>

</div>

</div>

A quick way to check that the database is running, is to point a browser
to the http port. The following example URLs will show the System
Manager for the default, and the demo Virtuoso databases:

``` programlisting
http://example.com:8889/
http://example.com:8890/
http://a_virtuoso_server.org:8890/
```

On a Windows Client there is a shortcut to the
<span class="emphasis">*OpenLink Virtuoso Conductor*</span> in the
OpenLink Virtuoso program group.

You will be presented with the OpenLink Virtuoso Conductor screen:

<div class="figure-float">

<div id="inst018" class="figure">

**Figure 3.2. Virtuoso Conductor**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Conductor](images/ln-inst4.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="posttestqry" class="section">

<div class="titlepage">

<div>

<div>

#### Verify by web based SQL query

</div>

</div>

</div>

Click on the <span class="emphasis">*Conductor*</span> link to enter the
Virtuoso Server Administration Conductor Interface. You will be
presented with a login form, type in the correct details for the
database DBA user, by default this is username=dba; password=dba.

<div class="figure-float">

<div id="inst019" class="figure">

**Figure 3.3. Virtuoso Conductor - Login Form**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Conductor - Login Form](images/ln-inst-login.png)

</div>

</div>

</div>

  

</div>

Got to tab "Database" and then go to tab "Interactive SQL".

<div class="figure-float">

<div id="inst020" class="figure">

**Figure 3.4. Virtuoso Conductor - Interactive SQL**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Conductor - Interactive SQL](images/ln-inst-isql.png)

</div>

</div>

</div>

  

</div>

Enter the SQL Statement command "SELECT \* FROM SYS_USERS" in the SQL
Statement text area. Note that only valid SQL can be supplied, so you
cannot type a database command such as "tables;". Also, note that the
";" is not valid in this context. Press
<span class="emphasis">*Execute*</span> .

You should see the SQL results, as shown below.

<div class="figure-float">

<div id="inst021" class="figure">

**Figure 3.5. Virtuoso Conductor - SQL Results**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso Conductor - SQL Results](images/ln-inst-isql2.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div id="administeringtheserver" class="section">

<div class="titlepage">

<div>

<div>

### 3.1.3. Administering Your Virtuoso Installation

</div>

</div>

</div>

Virtuoso has been designed for Web based Administration. With your
Virtuoso server running you will be able to point a Web browser at the
servers listening address and port. The installation will include the
default server and optionally the demo database server. The default
server listens on port 8890 whilst the demo server listens on port 8889.
If you are using the machine where Virtuoso was installed then the
server address can be localhost or the hostname otherwise you will need
to know the hostname or IP address of the machine where Virtuoso was
installed. The URL that you will want to point your browser may be:

``` programlisting
http://example.com:8890/
```

Note that that trailing / is important and may be required for older
browsers

<div class="figure-float">

<div id="qsinst021" class="figure">

**Figure 3.6. Visual Server Administration Interface**

<div class="figure-contents">

<div class="mediaobject">

![Visual Server Administration Interface](images/ln-inst4.png)

</div>

</div>

</div>

  

</div>

The "Conductor" link will take you to the Visual Server Administration
Interface. Information about Visual Server Administration Interface can
be found in the Server Administration chapter , which describes all the
Interfaces available for configuring your server.

</div>

</div>

</div>
