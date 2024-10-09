<div>

<div>

<div>

<div>

## 8.3. Using Microsoft Entity Frameworks to Access Progress Schema Objects with Virtuoso

</div>

<div>

<div>

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to Progress Schema Objects using the OpenLink Virtuoso
Universal Server. This is achieved by Linking the required Progress
Schema objects into Virtuoso using its built in Virtual Database engine,
and then using the Virtuoso ADO.Net Entity Framework provider to query
the remote Progress Schema objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

### Prerequisites

**Progress OpenEdge 10. ** A Progress DBMS hosting the required Schema
Objects needs to be available. In this section, the
<span class="emphasis">*isports*</span> sample database will be used to
demonstrate the process.

A Progress DBMS hosting the required Schema Objects needs to be
available. In this section, the <span class="emphasis">*isports*</span>
sample database will be used to demonstrate the process.

**OpenLink ODBC Driver for Progress (SQL-92). ** A Progress ODBC Driver
is required to link the Progress Schema Objects into the Virtuoso
Server. The OpenLink <span class="emphasis">*ODBC Driver for Progress
(SQL-92)*</span> will be used in this section, for which a functional
ODBC Data source name of "<span class="emphasis">*prs101c*</span> " will
be assumed to exist on the machine hosting the Virtuoso Server.

A Progress ODBC Driver is required to link the Progress Schema Objects
into the Virtuoso Server. The OpenLink <span class="emphasis">*ODBC
Driver for Progress (SQL-92)*</span> will be used in this section, for
which a functional ODBC Data source name of
"<span class="emphasis">*prs101c*</span> " will be assumed to exist on
the machine hosting the Virtuoso Server.

**OpenLink Virtuoso 5.10.x. ** An OpenLink Virtuoso Universal Server
installation including the Virtuoso Universal Server and ADO.NET Entity
Framework Provider is required. The Virtuoso components must be Release
5.10.x or above, this being the minimum version containing support for
Microsoft Entity Frameworks.

An OpenLink Virtuoso Universal Server installation including the
Virtuoso Universal Server and ADO.NET Entity Framework Provider is
required. The Virtuoso components must be Release 5.10.x or above, this
being the minimum version containing support for Microsoft Entity
Frameworks.

**Microsoft Visual Studio 2008 + SP1. ** Microsoft Visual Studio 2008
with Service Pack 1 is required, this being the only version containing
the necessary Entity Framework support available at the time of writing.

Microsoft Visual Studio 2008 with Service Pack 1 is required, this being
the only version containing the necessary Entity Framework support
available at the time of writing.

### Tasks

**Ensure Progress Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
NOT Nullable, and will fail to generate an EDM if any are nullable. Thus
ensure any tables to be used are defined as not nullable in the Progress
database schema before attempting to generate an EDM.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are NOT Nullable, and will fail to generate an EDM if any are
nullable. Thus ensure any tables to be used are defined as not nullable
in the Progress database schema before attempting to generate an EDM.

It seems that, by default, several Primary Keys (PKs) in the isports
database allows \<NULL\> values. It seems somewhat nonsensical - that a
unique key used, specifically, to identify a row in a table can be
allowed to be \<NULL\>.

This issue is best addressed directly in the database schema, by
redefining those PKs that allow \<NULL\> so as not to allow \<NULL\>.
Progress does not seem to talk in terms of \<NULL\>, instead using the
term "Mandatory"

The following section will provide more specific details about how to
ensure Progress PKs are not nullable:

<div>

- Ensuring Progress PKs are not nullable

</div>

<div>

<div>

<div>

<div>

### 8.3.1. Install and configure OpenLink ODBC Driver for Progress (SQL-92)

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus a Progress ODBC Driver must be available with a suitably configured
DSN for connecting to the target database. The OpenLink ODBC Drivers for
Progress have been used in this section, although in theory any Progress
ODBC Driver can be used.

Installation instructions for the OpenLink ODBC Driver for Oracle are
available from:

<div>

- <a
  href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
  class="ulink" target="_top">Product Installation &amp; Basic
  Configuration (ODBC)</a>

</div>

</div>

</div>
