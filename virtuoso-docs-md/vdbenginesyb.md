<div id="vdbenginesyb" class="section">

<div class="titlepage">

<div>

<div>

## 8.7. Using Microsoft Entity Frameworks to Access Sybase Schema Objects with Virtuoso

</div>

<div>

<div class="abstract">

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to Sybase Schema Objects using the OpenLink Virtuoso
Universal Server. This is achieved by linking the required Sybase Schema
objects into Virtuoso using its built in Virtual Database engine, and
then using the Virtuoso ADO.NET Entity Framework provider to query the
remote Sybase Schema objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**Sybase DBMS. ** An Sybase DBMS hosting the required Schema Objects
needs to be available. In this section the
<span class="emphasis">*Sybase pubs2 sample*</span> database will be
used to demonstrate the process.

An Sybase DBMS hosting the required Schema Objects needs to be
available. In this section the <span class="emphasis">*Sybase pubs2
sample*</span> database will be used to demonstrate the process.

**ODBC Driver for Sybase. ** An Sybase ODBC Driver is required for
Linking the Sybase Schema Objects into the Virtuoso Server. The OpenLink
<span class="emphasis">*ODBC Driver for Sybase*</span> will be used in
this section, for which a functional ODBC Data source name of "syb15ma"
will be assumed to exist on the machine hosting the Virtuoso Server.

An Sybase ODBC Driver is required for Linking the Sybase Schema Objects
into the Virtuoso Server. The OpenLink <span class="emphasis">*ODBC
Driver for Sybase*</span> will be used in this section, for which a
functional ODBC Data source name of "syb15ma" will be assumed to exist
on the machine hosting the Virtuoso Server.

**Virtuoso Universal Server. ** An Virtuoso installation including the
Virtuoso Universal Server and ADO.NET Entity Framework Provider is
required. The Virtuoso components used must be Release 5.10.x or above,
this being the minimum version containing support for Microsoft Entity
Frameworks

An Virtuoso installation including the Virtuoso Universal Server and
ADO.NET Entity Framework Provider is required. The Virtuoso components
used must be Release 5.10.x or above, this being the minimum version
containing support for Microsoft Entity Frameworks

**Microsoft Visual Studio 2008 SP1. ** Microsoft Visual Studio 2008
Service Pack 1 is required, this being the only version containing the
necessary Entity Framework support available at the time of writing.

Microsoft Visual Studio 2008 Service Pack 1 is required, this being the
only version containing the necessary Entity Framework support available
at the time of writing.

### Tasks

**Ensure Sybase Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
<span class="emphasis">*NOT*</span> Nullable, and will fail to generate
an EDM if any are. Thus ensure any tables to be used are defined as not
nullable in the Sybase database schema before attempting to generate an
EDM. In the case of the Sybase pubs2 database all tables are not
nullable, thus this should not be an issue in this case.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the Sybase database schema before attempting
to generate an EDM. In the case of the Sybase pubs2 database all tables
are not nullable, thus this should not be an issue in this case.

<div id="vdbenginesybinst" class="section">

<div class="titlepage">

<div>

<div>

### 8.7.1. Install and configure OpenLink ODBC Driver for Sybase

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus an Sybase ODBC Driver must be available with a suitably configured
DSN for connecting to the target database. The OpenLink ODBC Drivers for
Sybase have been used in this section, although in theory any Sybase
ODBC Driver can be used.

Installation instructions for the OpenLink ODBC Driver for Sybase are
available from:

<div class="itemizedlist">

- <a
  href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
  class="ulink" target="_top">Product Installation &amp; Basic
  Configuration (ODBC)</a>

</div>

</div>

</div>
