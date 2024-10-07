<div id="vdbenginepsql" class="section">

<div class="titlepage">

<div>

<div>

## 8.9. Using Microsoft Entity Frameworks to Access PostgreSQL Schema Objects with Virtuoso

</div>

<div>

<div class="abstract">

**Abstract**

This document details the steps required to provide Microsoft Entity
Framework access to PostgreSQL Schema Objects using the OpenLink
Virtuoso Universal Server. This is achieved by linking the required
PostgreSQL Schema objects into Virtuoso using its built in Virtual
Database engine, and then using the Virtuoso ADO.NET Entity Framework
provider to query the remote PostgreSQL Schema objects linked into the
Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**PostgreSQL DBMS. ** An PostgreSQL DBMS hosting the required Schema
Objects needs to be available. In this section the
<span class="emphasis">*PostgreSQL*</span> sample database will be used
to demonstrate the process.

An PostgreSQL DBMS hosting the required Schema Objects needs to be
available. In this section the
<span class="emphasis">*PostgreSQL*</span> sample database will be used
to demonstrate the process.

**ODBC Driver for PostgreSQL. ** An PostgreSQL ODBC Driver is required
for Linking the PostgreSQL Schema Objects into the Virtuoso Server. The
OpenLink <span class="emphasis">*ODBC Driver for PostgreSQL*</span> will
be used in this section, for which a functional ODBC Data source name of
"ora10ma" will be assumed to exist on the machine hosting the Virtuoso
Server.

An PostgreSQL ODBC Driver is required for Linking the PostgreSQL Schema
Objects into the Virtuoso Server. The OpenLink
<span class="emphasis">*ODBC Driver for PostgreSQL*</span> will be used
in this section, for which a functional ODBC Data source name of
"ora10ma" will be assumed to exist on the machine hosting the Virtuoso
Server.

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

**Ensure PostgreSQL Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
<span class="emphasis">*NOT*</span> Nullable, and will fail to generate
an EDM if any are. Thus ensure any tables to be used are defined as not
nullable in the PostgreSQL database schema before attempting to generate
an EDM. In the case of the PostgreSQL database all tables are not
nullable, thus this should not be an issue in this case.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the PostgreSQL database schema before
attempting to generate an EDM. In the case of the PostgreSQL database
all tables are not nullable, thus this should not be an issue in this
case.

<div id="vdbenginepsqlinst" class="section">

<div class="titlepage">

<div>

<div>

### 8.9.1. Install and configure OpenLink ODBC Driver for PostgreSQL

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus an PostgreSQL ODBC Driver must be available with a suitably
configured DSN for connecting to the target database. The OpenLink ODBC
Drivers for PostgreSQL have been used in this section, although in
theory any PostgreSQL ODBC Driver can be used.

Installation instructions for the OpenLink ODBC Driver for PostgreSQL
are available from:

<div class="itemizedlist">

- <a
  href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
  class="ulink" target="_top">Product Installation &amp; Basic
  Configuration (ODBC)</a>

</div>

</div>

</div>
