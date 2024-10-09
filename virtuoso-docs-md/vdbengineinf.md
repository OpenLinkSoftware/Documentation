<div>

<div>

<div>

<div>

## 8.5. Using Microsoft Entity Frameworks to Access Informix Schema Objects with Virtuoso

</div>

<div>

<div>

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to Informix Schema Objects using the OpenLink Virtuoso
Universal Server. This is achieved by linking the required Informix
Schema objects into Virtuoso using its built in Virtual Database engine,
and then using the Virtuoso ADO.NET Entity Framework provider to query
the remote Informix Schema objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**Informix DBMS. ** An Informix DBMS hosting the required Schema Objects
needs to be available. In this section the
<span class="emphasis">*Informix stores_demo*</span> sample database
will be used to demonstrate the process.

An Informix DBMS hosting the required Schema Objects needs to be
available. In this section the <span class="emphasis">*Informix
stores_demo*</span> sample database will be used to demonstrate the
process.

**ODBC Driver for Informix. ** An Informix ODBC Driver is required for
Linking the Informix Schema Objects into the Virtuoso Server. The
OpenLink <span class="emphasis">*ODBC Driver for Informix*</span> will
be used in this section, for which a functional ODBC Data source name of
"inf10ma" will be assumed to exist on the machine hosting the Virtuoso
Server.

An Informix ODBC Driver is required for Linking the Informix Schema
Objects into the Virtuoso Server. The OpenLink
<span class="emphasis">*ODBC Driver for Informix*</span> will be used in
this section, for which a functional ODBC Data source name of "inf10ma"
will be assumed to exist on the machine hosting the Virtuoso Server.

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

**Ensure Informix Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
<span class="emphasis">*NOT*</span> Nullable, and will fail to generate
an EDM if any are. Thus ensure any tables to be used are defined as not
nullable in the Informix database schema before attempting to generate
an EDM. In the case of the Informix stores_demo database many tables
have primary keys that are nullable so these will need to be redeclared.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the Informix database schema before
attempting to generate an EDM. In the case of the Informix stores_demo
database many tables have primary keys that are nullable so these will
need to be redeclared.

This is possible using dbaccess however care needs to be taken,
particularly with the following

<div>

- Amending a PK field to be not nullable can results in the primary key
  constraint being removed.

- Amending a PK field to be not nullable when the primary key is
  referenced by a foreign key constraint results in the foreign key
  constraint being removed.

</div>

In both of the cases above the primary key and foreign key constraints
that are removed will have to be manually recreated.

<div>

<div>

<div>

<div>

### 8.5.1. Install and configure OpenLink ODBC Driver for Informix

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus an Informix ODBC Driver must be available with a suitably
configured DSN for connecting to the target database. The OpenLink ODBC
Drivers for Informix have been used in this section, although in theory
any Informix ODBC Driver can be used.

Installation instructions for the OpenLink ODBC Driver for Informix are
available from:

<div>

- <a
  href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
  class="ulink" target="_top">Product Installation &amp; Basic
  Configuration (ODBC)</a>

</div>

</div>

</div>
