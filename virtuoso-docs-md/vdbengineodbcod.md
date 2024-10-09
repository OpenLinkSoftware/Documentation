<div>

<div>

<div>

<div>

## 8.11. Using Microsoft Entity Frameworks to Access ODBC to ODBC Bridge Schema Objects with Virtuoso

</div>

<div>

<div>

**Abstract**

This section details the steps required to provide Microsoft Entity
Framework access to ODBC to ODBC Bridge Schema Objects using the
OpenLink Virtuoso Universal Server. This is achieved by linking the
required ODBC to ODBC Bridge Schema objects into Virtuoso using its
built in Virtual Database engine, and then using the Virtuoso ADO.NET
Entity Framework provider to query the remote ODBC to ODBC Bridge Schema
objects linked into the Virtuoso Server.

</div>

</div>

</div>

</div>

**Prerequisites. ** The following prerequisites must be in place for
this solution to be possible.

**ODBC to ODBC Bridge DBMS. ** An ODBC to ODBC Bridge DBMS hosting the
required Schema Objects needs to be available. In this section we shall
make and ODBC to ODBC bridge connection to another
<span class="emphasis">*Virtuoso Northwind Demo*</span> database to
demonstrate the process.

An ODBC to ODBC Bridge DBMS hosting the required Schema Objects needs to
be available. In this section we shall make and ODBC to ODBC bridge
connection to another <span class="emphasis">*Virtuoso Northwind
Demo*</span> database to demonstrate the process.

**ODBC to ODBC Bridge Driver. ** An ODBC to ODBC Bridge Driver is
required for Linking the ODBC to ODBC Bridge Schema Objects into the
Virtuoso Server. The <span class="emphasis">*OpenLink ODBC to ODBC
Bridge Driver*</span> will be used in this section, for which a
functional ODBC Data source name of "odbcma" will be assumed to exist on
the machine hosting the Virtuoso Server.

An ODBC to ODBC Bridge Driver is required for Linking the ODBC to ODBC
Bridge Schema Objects into the Virtuoso Server. The
<span class="emphasis">*OpenLink ODBC to ODBC Bridge Driver*</span> will
be used in this section, for which a functional ODBC Data source name of
"odbcma" will be assumed to exist on the machine hosting the Virtuoso
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

**Ensure ODBC to ODBC Bridge Primary Keys (PKs) are not nullable. ** The
Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the ODBC to ODBC Bridge database schema
before attempting to generate an EDM. In the case of the ODBC to ODBC
Bridge Virtuoso Northwind Demo database all tables are not nullable,
thus this should not be an issue in this case.

The Visual Studio 2008 Entity Data Model (EDM) requires that all primary
keys are <span class="emphasis">*NOT*</span> Nullable, and will fail to
generate an EDM if any are. Thus ensure any tables to be used are
defined as not nullable in the ODBC to ODBC Bridge database schema
before attempting to generate an EDM. In the case of the ODBC to ODBC
Bridge Virtuoso Northwind Demo database all tables are not nullable,
thus this should not be an issue in this case.

<div>

<div>

<div>

<div>

### 8.11.1. Install and configure OpenLink ODBC Driver for ODBC to ODBC Bridge

</div>

</div>

</div>

The Virtuoso Virtual Database engine uses ODBC as the connectivity
mechanism for linking remote database objects into its local schema.
Thus an ODBC to ODBC Bridge Driver must be available with a suitably
configured DSN for connecting to the target database. The OpenLink ODBC
to ODBC Bridge Drivers have been used in this document, although in
theory any ODBC to ODBC Bridge Driver can be used.

Installation instructions for the OpenLink ODBC Driver for ODBC to ODBC
Bridge are available from: <a
href="http://wikis.openlinksw.com/dataspace/owiki/wiki/UdaWikiWeb/InstallConfigODBC"
class="ulink" target="_top">Product Installation &amp; Basic
Configuration (ODBC)</a>

<div>

<div>

<div>

<div>

#### Install and configure OpenLink Virtuoso Universal Server

</div>

</div>

</div>

<div>

1.  <a href="ch-accessinterfaces.html#virtclientrefinstallandconfigvirt"
    class="link"
    title="Installation of the ADO.Net Provider Client and Virtuoso Universal Server on Windows">Install
    and configure OpenLink Virtuoso Universal Server</a>

</div>

</div>

</div>

</div>
