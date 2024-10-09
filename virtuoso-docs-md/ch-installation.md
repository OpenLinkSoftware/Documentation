<div>

<div>

<div>

<div>

# Chapter 2. Installation Guide

</div>

<div>

<div>

**Abstract**

This chapter applies exclusively to the various commercial releases of
Virtuoso. If you are working with the open source version, please refer
to the instructions on the web site where you obtained it.

This chapter describes how to install OpenLink Virtuoso VDBMS. It
contains both a quick start install guide and full walk through install
guides for major platforms.

Virtuoso has been designed from the ground-up to be easy to implement.

The installation generally runs without problems, run the setup program
or script and follow the on screen instruction prompts. You will be
asked some questions, if in any doubt please follow the instructions in
this guide in order to install and configure your Virtuoso components
correctly.

Once installed, each instance of Virtuoso is controlled by an INI
(initialization) file. This file links the Virtuoso Server process with
an actual database file or device. For example, the demo instance of
Virtuoso on all platforms is controlled by the demo.ini file that is
found in the demo directory along with the demo.db and related files.
There is a one-to-one relationship between server processes and database
files.

The INI file is a text file consisting of keys and key values. You will
set several of these values during installation. At any time thereafter,
their values can be changed by editing the INI file with a standard text
editor.

The details of the INI file sections, keys, and the meanings of the key
values are described in the
<a href="ch-server.html#configsrvstupfiles" class="link"
title="Configuring Server Startup Files">Configuring Server Startup
Files</a> section.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">2.1. [Virtuoso on All platforms Commmon
Specifics](ch-installation.html#installallplatforms)</span>

<span class="section">2.1.1. [Installation
Requirements](ch-installation.html#srvadminstallreqt)</span>

<span class="section">2.1.2. [Operational
Requirements](ch-installation.html#srvadmopreq)</span>

<span class="section">2.1.3. [Operating System
Support](ch-installation.html#srvadmossupport)</span>

<span class="section">2.1.4.
[Limits](ch-installation.html#limitsandparameters)</span>

<span class="section">2.2. [Virtuoso for
Windows](installwin32.html)</span>

<span class="section">2.2.1. [Before You
Start](installwin32.html#b4ustart)</span>

<span class="section">2.2.2. [Getting To Know Your Virtuoso
Components](knowthywinvirt.html)</span>

<span class="section">2.2.3. [Installation
Steps](installstepswin.html)</span>

<span class="section">2.2.4. [Post
Installation](wininstpost.html)</span>

<span class="section">2.2.5. [Starting Your Virtuoso
Server](startvdbms.html)</span>

<span class="section">2.2.6. [Creating and Deleting Virtuoso
Services](creatingdeletingservices.html)</span>

<span class="section">2.2.7. [Configuring Virtuoso Client
Components](configuringvirtuosoclients.html)</span>

<span class="section">2.2.8. [Default
passwords](defpasschgwin.html)</span>

<span class="section">2.3. [Installing the Virtuoso Universal Server on
Unix-like OS (AIX, HP-UX, Linux, Solaris,
etc.)](virtuosoinstallunixpe.html)</span>

<span class="section">2.3.1.
[Installation](virtuosoinstallunixpe.html#virtuosoinstallunixpedescr)</span>

<span class="section">2.3.2.
[Configuration](virtuosoinstallunixpeconfg.html)</span>

<span class="section">2.3.3. [Demo
Database](installdemopersonaledition.html)</span>

<span class="section">2.4. [Virtuoso for Mac OS
X](installmacosx.html)</span>

<span class="section">2.4.1. [Before You
Install](installmacosx.html#macosxbeforeuinst)</span>

<span class="section">2.4.2. [Virtuoso Drag and Drop Installer for Mac
OS X](macosxinstdragdrop.html)</span>

<span class="section">2.4.3. [Installing Virtuoso 6 or
earlier](macosxinst.html)</span>

<span class="section">2.4.4. [Configuration](macosxconfigur.html)</span>

<span class="section">2.4.5. [Post
Installation](macosxinstpost.html)</span>

<span class="section">2.4.6. [Configuring an ODBC Data
Source](macosxodbcdsnconf.html)</span>

<span class="section">2.4.7. [Testing an ODBC Data
Source](macosxodbcdsntest.html)</span>

<span class="section">2.4.8. [Default
passwords](defpasschgmac.html)</span>

<span class="section">2.4.9. [Demo Database](installdemomac.html)</span>

<span class="section">2.5. [OpenLink License
Management](oplmgr.html)</span>

<span class="section">2.5.1. [License
Files](oplmgr.html#oplmngrlf)</span>

<span class="section">2.5.2. [License Manager](oplmngrlm.html)</span>

<span class="section">2.5.3. [Debugging License
Problems](oplmngrdlp.html)</span>

<span class="section">2.6. [Virtuoso ADO.Net Data Grid Form
Application](installvsgrid.html)</span>

<span class="section">2.7. [Using Visual Studio 2008 to Build an Entity
Frameworks based Windows Form Application](installvsent.html)</span>

<span class="section">2.7.1.
[Pre-requisites](installvsent.html#installvsentprereq)</span>

<span class="section">2.7.2. [Create the School database and
schema](installvsentcreatedb.html)</span>

<span class="section">2.7.3. [Generating the School Entity Data
Mode](installvsentgenmodel.html)</span>

<span class="section">2.7.4. [Querying Entities and
Associations](installvsentqueryentity.html)</span>

<span class="section">2.7.5. [Inserting and Updating
Data](installvsentinsertandupdate.html)</span>

<span class="section">2.8. [Using Visual Studio 2008 to Build an ADO.NET
Data Services based Application](installusado.html)</span>

<span class="section">2.8.1.
[Introduction](installusado.html#installusadointro)</span>

<span class="section">2.8.2. [Getting Started: Creating Data
Services](installusadogetstart.html)</span>

<span class="section">2.8.3. [Creating a Data Service using the ADO.NET
Entity Framework](installusadocreateservice.html)</span>

<span class="section">2.9. [Windows Form Application for accessing
Virtuoso RDF data via SPASQL using the Virtuoso ADO.Net
Provider](installwfas.html)</span>

<span class="section">2.9.1.
[Pre-requisites](installwfas.html#installwfasintro)</span>

<span class="section">2.9.2. [Creating the
Application](installwfasgetstart.html)</span>

<span class="section">2.9.3. [Extending RDFDemo to Allow Dereferencing
of External IRIs](installwfasxtendcomlab.html)</span>

<span class="section">2.9.4. [Extending RDFDemo to Display More Compact
Labels](installwfasxtendcomplab.html)</span>

<span class="section">2.9.5. [Modifying the Northwind Ontology to Add
Labels](installwfasmodify.html)</span>

<span class="section">2.9.6. [Extending RDFDemo to Display Images and
Longer Text Fields.](installwfasxtendlongtext.html)</span>

<span class="section">2.9.7. [Extending RDFDemo To Make The Property
Labels Clickable](installwfasxtendproplab.html)</span>

<span class="section">2.10. [Creating a Web Browser Application to
Access RDF Data Using The Virtuoso ADO.Net
Provider](installcrweb.html)</span>

<span class="section">2.10.1.
[Pre-requisites](installcrweb.html#installcrwebintro)</span>

<span class="section">2.10.2. [Creating the Web
Service](installcrwebcrserv.html)</span>

<span class="section">2.10.3. [Creating the Browser
Application](installcrbrappl.html)</span>

<span class="section">2.10.4. [Deploy With
IIS](installcrwebiis.html)</span>

<span class="section">2.11. [Creating a Silverlight Application to
consume the service](installsilver.html)</span>

<span class="section">2.11.1.
[Pre-requisites](installsilver.html#installsilverpreq)</span>

<span class="section">2.11.2. [Creating the Application for
Silverlight.](installsilvercrser.html)</span>

<span class="section">2.12. [Creating A Simple .NET RIA Services
Application To Display Data From Virtuoso](installnetriadd.html)</span>

<span class="section">2.12.1.
[Pre-requisites](installnetriadd.html#installnetriaddpreq)</span>

<span class="section">2.12.2. [Creating the
Application](installnetriaddcrser.html)</span>

<span class="section">2.12.3. [Displaying RDF
Data](installnetriaddcrdf.html)</span>

<span class="section">2.12.4. [Next
Steps](installnetriaddcnext.html)</span>

<span class="section">2.13. [Creating a .Net RIA Services Application
That Will Update Virtuoso Data](installnetriavd.html)</span>

<span class="section">2.13.1.
[Pre-requisites](installnetriavd.html#installnetriavdpreq)</span>

<span class="section">2.13.2. [Creating the
Application](installnetriavdcrser.html)</span>

<span class="section">2.13.3. [Propagate Updates to
Virtuoso](installnetriavdcrprup.html)</span>

<span class="section">2.14. [Cluster Installation and
Configuration](clusterstcnf.html)</span>

<span class="section">2.14.1. [Virtuoso Elastic Cluster Installation &
Configuration -- Version 7.x](clusterstcnf.html#clusterstcnf7)</span>

<span class="section">2.14.2. [Virtuoso default Cluster Installation and
Configuration](clusterstcnfsetup.html)</span>

<span class="section">2.14.3. [Backup and
Restore](clusterstcnfbackuprestore.html)</span>

<span class="section">2.14.4. [Cluster
Configuration](clusterstcnfconfig.html)</span>

<span class="section">2.14.5. [HTTP Service Configuration on Subordinate
Nodes of a Virtuoso Cluster](clusterstcnfconfnodesconfig.html)</span>

<span class="section">2.14.6. [Troubleshooting
Tips](clusterstcnftrsh.html)</span>

<span class="section">2.14.7. [See Also:](ch02s14s07.html)</span>

</div>

<div>

<div>

<div>

<div>

## 2.1. Virtuoso on All platforms Commmon Specifics

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 2.1.1. Installation Requirements

</div>

</div>

</div>

A typical installation will require a minimum of 400Mb of hard disk
space to install the code, samples, documentation and sample database.
The database will need additional space for data inserted, backups, logs
and reports, web pages, etc.

The size of the database .db file will not reduce when data is removed.
The spare space will however be reclaimed for later use.

</div>

<div>

<div>

<div>

<div>

### 2.1.2. Operational Requirements

</div>

</div>

</div>

The Virtuoso database requires a minimum of 64Mb of system memory for
each instance to operate in. Each connection will take between 70kb and
130kb of memory.

The memory usage is affected by the following parameters in the
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">Virtuoso configuration file</a> .

|                  |
|------------------|
| ServerThreads    |
| ServerThreadSize |
| MainThreadSize   |
| FutureThreadSize |
| NumberOfBuffers  |

See the following Parameter section for more details.

</div>

<div>

<div>

<div>

<div>

### 2.1.3. Operating System Support

</div>

</div>

</div>

Virtuoso runs on the following operating systems:

|                                 |
|---------------------------------|
| Windows                         |
| Linux                           |
| Unix: AIX, HP-UX, Solaris, etc. |
| Mac OS X                        |

</div>

<div>

<div>

<div>

<div>

### 2.1.4. Limits

</div>

</div>

</div>

The below table lists the most important parameters and limits for a
database or a Virtuoso server instance. For space consumption of
individual data types, see
<a href="ch-server.html#spaceconsump" class="link"
title="Space Consumption">Space Consumption</a> .

<div>

**Table 2.1. Limits**

<div>

| Limit Description             | Value                                                                                                                                                    |
|:------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identifier length             | 100                                                                                                                                                      |
| User name and password length | 100                                                                                                                                                      |
| SQLstmt and proc text         | 100K+                                                                                                                                                    |
| varchar length                | Constrained by max row length when stored into non-LOB column, 10MB inside procedure code.                                                               |
| Numeric precision             | Max 40 digits                                                                                                                                            |
| LOB column length             | 2GB                                                                                                                                                      |
| row length                    | 4086                                                                                                                                                     |
| Columns per row               | 200                                                                                                                                                      |
| Database size                 | 32TB for data, 32TB for temp data                                                                                                                        |
| Page size                     | 8K                                                                                                                                                       |
| File size                     | 64 bit file offsets on supporting OS's                                                                                                                   |
| Files per database            | unlimited                                                                                                                                                |
| Table size                    | Up to database size                                                                                                                                      |
| Tables per database           | 64K keys, a table takes 1 key for primary key, 1 key per index and 1 key for each obsolete primary key layout resulting from adding or dropping columns. |
| Indexes per table             | Unlimited, subject to global cap on keys.                                                                                                                |
| Row in sorting/distinct temp  | 4078b, as in tables                                                                                                                                      |
| Locks per transaction         | Depends on memory, 16b per row lock, 60b per page with at least one row lock.                                                                            |
| Changes per transaction       | Depends on memory, ini parameter allows cap on rollback before image.                                                                                    |
| Virtual memory\>              | Depends on OS, 64 bit pointers on 64 bit platforms                                                                                                       |
| Threads                       | Depends on OS, ini files specifies cap for pool for SQL client and web server worker thread pools.                                                       |
| Max connections               | Depends on OS fdset size, at least 2048, license can set a limit                                                                                         |
| Memory per connection         | 22K plus up to 100 cached SQL statement compilations                                                                                                     |

</div>

</div>

  

</div>

</div>

</div>
