<div id="vdbengineing" class="section">

<div class="titlepage">

<div>

<div>

## 8.4. Using Microsoft Entity Frameworks to Access Ingres Schema Objects with Virtuoso

</div>

<div>

<div class="abstract">

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to Ingres Schema Objects using the OpenLink Virtuoso
Universal Server. This is achieved by linking the required Ingres Schema
objects into Virtuoso using its built in Virtual Database engine, and
then using the Virtuoso ADO.NET Entity Framework provider to query the
remote Ingres Schema objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**Ingres DBMS. ** An Ingres DBMS hosting the required Schema Objects
needs to be available. In this section the Ingres Tutorial sample
database will be used to demonstrate the process.

An Ingres DBMS hosting the required Schema Objects needs to be
available. In this section the Ingres Tutorial sample database will be
used to demonstrate the process.

**ODBC Driver for Ingres. ** An Ingres ODBC Driver is required for
Linking the Ingres Schema Objects into the Virtuoso Server. The
<span class="emphasis">*OpenLink ODBC Driver for Ingres*</span> will be
used in this section, for which a functional ODBC Data source name of
<span class="emphasis">*ingiima*</span> will be assumed to exist on the
machine hosting the Virtuoso Server.

An Ingres ODBC Driver is required for Linking the Ingres Schema Objects
into the Virtuoso Server. The <span class="emphasis">*OpenLink ODBC
Driver for Ingres*</span> will be used in this section, for which a
functional ODBC Data source name of
<span class="emphasis">*ingiima*</span> will be assumed to exist on the
machine hosting the Virtuoso Server.

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

**Ensure Ingres Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
<span class="emphasis">*NOT*</span> Nullable, and will fail to generate
an EDM if any are. Thus ensure any tables to be used are defined as not
nullable in the Ingres database schema before attempting to generate an
EDM. In the case of the Ingres database all tables are not nullable,
thus this should not be an issue in this case.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the Ingres database schema before attempting
to generate an EDM. In the case of the Ingres database all tables are
not nullable, thus this should not be an issue in this case.

<div id="vdbengineinginst" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.1. Install and configure OpenLink ODBC Driver for Ingres

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus an Ingres ODBC Driver must be available with a suitably configured
DSN for connecting to the target database. The OpenLink ODBC Drivers for
Ingres have been used in this section, although in theory any Ingres
ODBC Driver can be used.

Installation instructions for the OpenLink ODBC Driver for Ingres are
available from:

<div class="itemizedlist">

- <a
  href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
  class="ulink" target="_top">Product Installation &amp; Basic
  Configuration (ODBC)</a>

</div>

</div>

</div>
