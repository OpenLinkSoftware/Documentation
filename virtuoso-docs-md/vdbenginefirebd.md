<div>

<div>

<div>

<div>

## 8.12. Using Microsoft Entity Frameworks to Access Firebird Schema Objects with Virtuoso

</div>

<div>

<div>

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to Firebird Schema Objects using the OpenLink Virtuoso
Universal Server. This is achieved by linking the required Firebird
Schema objects into Virtuoso using its built in Virtual Database engine,
and then using the Virtuoso ADO.NET Entity Framework provider to query
the remote Firebird Schema objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**Firebird DBMS. ** A Firebird DBMS hosting the required Schema Objects
needs to be available. In this section the
<span class="emphasis">*Firebird employee*</span> database will be used
to demonstrate the process.

A Firebird DBMS hosting the required Schema Objects needs to be
available. In this section the <span class="emphasis">*Firebird
employee*</span> database will be used to demonstrate the process.

**ODBC Driver for Firebird. ** A Firebird ODBC Driver is required for
Linking the Firebird Schema Objects into the Virtuoso Server. The
<span class="emphasis">*native Firebird ODBC Driver*</span> will be used
in this section, for which a functional ODBC Data source name of "fire"
will be assumed to exist on the machine hosting the Virtuoso Server.

A Firebird ODBC Driver is required for Linking the Firebird Schema
Objects into the Virtuoso Server. The <span class="emphasis">*native
Firebird ODBC Driver*</span> will be used in this section, for which a
functional ODBC Data source name of "fire" will be assumed to exist on
the machine hosting the Virtuoso Server.

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

**Ensure Firebird Primary Keys (PKs) are not nullable. ** The Visual
Studio 2008 Entity Data Model (EDM) requires that all primary keys are
<span class="emphasis">*NOT*</span> Nullable, and will fail to generate
an EDM if any are. Thus ensure any tables to be used are defined as not
nullable in the Firebird database schema before attempting to generate
an EDM. In the case of the Firebird employee database all tables are not
nullable, thus this should not be an issue in this case.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the Firebird database schema before
attempting to generate an EDM. In the case of the Firebird employee
database all tables are not nullable, thus this should not be an issue
in this case.

<div>

<div>

<div>

<div>

### 8.12.1. Install and configure the Firebird ODBC Driver

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus a Firebird ODBC Driver must be available with a suitably configured
DSN for connecting to the target database.

</div>

</div>
