<div>

<div>

<div>

<div>

# Chapter 8. Virtual Database Engine

</div>

<div>

<div>

**Abstract**

This chapter covers Remote Table Attachment, Usage of Remote Tables from
ODBC, JDBC, ADO.NET, SQLX, XPath/XQuery, Linked Data Views.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">8.1. [Virtual Database (VDB)
Engine](ch-vdbengine.html#thevdb)</span>

<span class="section">8.1.1. [The Need for VDB
Engines](ch-vdbengine.html#consneed4vdb)</span>

<span class="section">8.1.2. [First Generation Virtual Database
Products](ch-vdbengine.html#consfirstvdbps)</span>

<span class="section">8.1.3. [VDB Implementation
Issues](ch-vdbengine.html#vdbimpliss)</span>

<span class="section">8.1.4. [VDB Engine
Components](ch-vdbengine.html#vdbcomponents)</span>

<span class="section">8.2. [Using Microsoft Entity Frameworks to Access
Oracle Schema Objects with Virtuoso](vdbenginemc.html)</span>

<span class="section">8.2.1. [Install and configure OpenLink ODBC Driver
for Oracle](vdbenginemc.html#vdbenginemcinst)</span>

<span class="section">8.2.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemcconfvsr.html)</span>

<span class="section">8.2.3. [Linking Oracle tables into OpenLink
Virtuoso](vdbenginemclink.html)</span>

<span class="section">8.2.4. [Creating EDM in Visual Studio
2008](vdbenginemccrvs.html)</span>

<span class="section">8.2.5. [Using EDM to create Entity Framework based
applications](vdbenginemcuedm.html)</span>

<span class="section">8.3. [Using Microsoft Entity Frameworks to Access
Progress Schema Objects with Virtuoso](vdbenginepr.html)</span>

<span class="section">8.3.1. [Install and configure OpenLink ODBC Driver
for Progress (SQL-92)](vdbenginepr.html#vdbengineprinst)</span>

<span class="section">8.3.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineprconfvsr.html)</span>

<span class="section">8.3.3. [Linking Progress tables into
Virtuoso](vdbengineprlnk.html)</span>

<span class="section">8.3.4. [Creating EDM in Visual Studio
2008](vdbengineprcrem.html)</span>

<span class="section">8.3.5. [Manually creating EDM Associations (FKs)
for the Progress isports database](vdbengineprmedm.html)</span>

<span class="section">8.3.6. [Using EDM to create Entity Framework based
applications](vdbenginepredcr.html)</span>

<span class="section">8.4. [Using Microsoft Entity Frameworks to Access
Ingres Schema Objects with Virtuoso](vdbengineing.html)</span>

<span class="section">8.4.1. [Install and configure OpenLink ODBC Driver
for Ingres](vdbengineing.html#vdbengineinginst)</span>

<span class="section">8.4.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineingconfvsr.html)</span>

<span class="section">8.4.3. [Linking Ingres tables into OpenLink
Virtuoso](vdbengineinglink.html)</span>

<span class="section">8.4.4. [Creating EDM in Visual Studio
2008](vdbengineingcre.html)</span>

<span class="section">8.4.5. [Manually creating EDM Associations (FKs)
for the Ingres Tutorial database](vdbengineingmc.html)</span>

<span class="section">8.4.6. [Using EDM to create Entity Framework based
applications](vdbengineingmfr.html)</span>

<span class="section">8.5. [Using Microsoft Entity Frameworks to Access
Informix Schema Objects with Virtuoso](vdbengineinf.html)</span>

<span class="section">8.5.1. [Install and configure OpenLink ODBC Driver
for Informix](vdbengineinf.html#vdbengineinfinst)</span>

<span class="section">8.5.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineinfconfvsr.html)</span>

<span class="section">8.5.3. [Linking Informix tables into OpenLink
Virtuoso](vdbengineinflink.html)</span>

<span class="section">8.5.4. [Creating EDM in Visual Studio
2008](vdbengineinfcre.html)</span>

<span class="section">8.5.5. [Using EDM to create Entity Framework based
applications](vdbengineinfdm.html)</span>

<span class="section">8.6. [Using Microsoft Entity Frameworks to Access
DB2 Schema Objects with Virtuoso](vdbenginedb2.html)</span>

<span class="section">8.6.1. [Install and configure OpenLink ODBC Driver
for DB2](vdbenginedb2.html#vdbenginedb2inst)</span>

<span class="section">8.6.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginedb2confvsr.html)</span>

<span class="section">8.6.3. [Linking DB2 tables into OpenLink
Virtuoso](vdbenginedb2link.html)</span>

<span class="section">8.6.4. [Creating EDM in Visual Studio
2008](vdbenginedb2crvs.html)</span>

<span class="section">8.6.5. [Using EDM to create Entity Framework based
applications](vdbenginedb2uedm.html)</span>

<span class="section">8.7. [Using Microsoft Entity Frameworks to Access
Sybase Schema Objects with Virtuoso](vdbenginesyb.html)</span>

<span class="section">8.7.1. [Install and configure OpenLink ODBC Driver
for Sybase](vdbenginesyb.html#vdbenginesybinst)</span>

<span class="section">8.7.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginesybconfvsr.html)</span>

<span class="section">8.7.3. [Linking Sybase tables into OpenLink
Virtuoso](vdbenginesyblink.html)</span>

<span class="section">8.7.4. [Creating EDM in Visual Studio
2008](vdbenginesybcrvs.html)</span>

<span class="section">8.7.5. [Manually creating EDM Associations (FKs)
for the Sybase pubs2 database](vdbenginesybinstmedm.html)</span>

<span class="section">8.7.6. [Using EDM to create Entity Framework based
applications](vdbenginesybuedm.html)</span>

<span class="section">8.8. [Using Microsoft Entity Frameworks to Access
MySQL Schema Objects with Virtuoso](vdbenginemsql.html)</span>

<span class="section">8.8.1. [Install and configure OpenLink ODBC Driver
for MySQL](vdbenginemsql.html#vdbenginemsqlinst)</span>

<span class="section">8.8.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemsqlconfvsr.html)</span>

<span class="section">8.8.3. [Linking MySQL tables into OpenLink
Virtuoso](vdbenginemsqllink.html)</span>

<span class="section">8.8.4. [Creating EDM in Visual Studio
2008](vdbenginemsqlcrvs.html)</span>

<span class="section">8.8.5. [Using EDM to create Entity Framework based
applications](vdbenginemsqluedm.html)</span>

<span class="section">8.9. [Using Microsoft Entity Frameworks to Access
PostgreSQL Schema Objects with Virtuoso](vdbenginepsql.html)</span>

<span class="section">8.9.1. [Install and configure OpenLink ODBC Driver
for PostgreSQL](vdbenginepsql.html#vdbenginepsqlinst)</span>

<span class="section">8.9.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginepsqlconfvsr.html)</span>

<span class="section">8.9.3. [Linking PostgreSQL tables into OpenLink
Virtuoso](vdbenginepsqllink.html)</span>

<span class="section">8.9.4. [Creating EDM in Visual Studio
2008](vdbenginepsqlcrvs.html)</span>

<span class="section">8.9.5. [Using EDM to create Entity Framework based
applications](vdbenginepsqluedm.html)</span>

<span class="section">8.10. [Using Microsoft Entity Frameworks to Access
ODBC to JDBC Bridge Schema Objects with
Virtuoso](vdbengineodtjd.html)</span>

<span class="section">8.10.1. [Install and configure OpenLink ODBC
Driver for ODBC to JDBC
Bridge](vdbengineodtjd.html#vdbengineodtjdinst)</span>

<span class="section">8.10.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbengineodtjdconfvsr.html)</span>

<span class="section">8.10.3. [Linking ODBC to JDBC Bridge tables into
OpenLink Virtuoso](vdbengineodtjdlink.html)</span>

<span class="section">8.10.4. [Creating EDM in Visual Studio
2008](vdbengineodtjdcrvs.html)</span>

<span class="section">8.10.5. [Using EDM to create Entity Framework
based applications](vdbengineodtjduedm.html)</span>

<span class="section">8.11. [Using Microsoft Entity Frameworks to Access
ODBC to ODBC Bridge Schema Objects with
Virtuoso](vdbengineodbcod.html)</span>

<span class="section">8.11.1. [Install and configure OpenLink ODBC
Driver for ODBC to ODBC
Bridge](vdbengineodbcod.html#vdbengineodbcodinst)</span>

<span class="section">8.11.2. [Linking ODBC to ODBC Bridge tables into
OpenLink Virtuoso](vdbengineodbcodlink.html)</span>

<span class="section">8.11.3. [Creating EDM in Visual Studio
2008](vdbengineodbcodcrvs.html)</span>

<span class="section">8.11.4. [Using EDM to create Entity Framework
based applications](vdbengineodbcoduedm.html)</span>

<span class="section">8.12. [Using Microsoft Entity Frameworks to Access
Firebird Schema Objects with Virtuoso](vdbenginefirebd.html)</span>

<span class="section">8.12.1. [Install and configure the Firebird ODBC
Driver](vdbenginefirebd.html#vdbenginefirebdinst)</span>

<span class="section">8.12.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginefirebdconfvsr.html)</span>

<span class="section">8.12.3. [Linking Firebird tables into OpenLink
Virtuoso](vdbenginefirebdlink.html)</span>

<span class="section">8.12.4. [Creating EDM in Visual Studio
2008](vdbenginefirebdcrvs.html)</span>

<span class="section">8.12.5. [Using EDM to create Entity Framework
based applications](vdbenginefirebduedm.html)</span>

<span class="section">8.13. [Using Microsoft Entity Frameworks to Access
Microsoft SQL Server Schema Objects with
Virtuoso](vdbenginemsqls.html)</span>

<span class="section">8.13.1. [Install and configure OpenLink ODBC
Driver for Microsoft SQL
Server](vdbenginemsqls.html#vdbenginemsqlsinst)</span>

<span class="section">8.13.2. [Install and configure OpenLink Virtuoso
Universal Server](vdbenginemsqlsconfvsr.html)</span>

<span class="section">8.13.3. [Linking Microsoft SQL Server tables into
OpenLink Virtuoso](vdbenginemsqlslink.html)</span>

<span class="section">8.13.4. [Creating EDM in Visual Studio
2008](vdbenginemsqlscrvs.html)</span>

<span class="section">8.13.5. [Using EDM to create Entity Framework
based applications](vdbenginemsqlsuedm.html)</span>

<span class="section">8.14. [Parallel Operations and Bulk Data Transfer
with Remote Tables](vdbparallelopandrtables.html)</span>

</div>

<div>

<div>

<div>

<div>

## 8.1. Virtual Database (VDB) Engine

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 8.1.1. The Need for VDB Engines

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Situation Analysis

</div>

</div>

</div>

As computer hardware, network protocols, database engines, applications,
application servers, and desktop productivity tools, proliferate the
enterprise, integration of disparate applications from disparate vendors
is becoming an all too common problem.

Add the emergence of standards based Distributed Computing galvanized by
the Internet infrastructure and associated Internet protocols to this
picture, and the need for Integration is even higher.

Increasing the industry at large is looking to a new technology
deliverable known as Universal Data Access Middleware to address these
systems integration pains.

"With Universal Data Access (UDA), customers receive all of the benefits
of a high-level and consistent Application Programming Interface (API)
that abstracts all the database complexities while providing a
capability that can be specified, controlled, and managed on its own to
optimize the near universal need of programs for data access".

<span class="emphasis">*Source IDC, 1998 Middleware Markets & Trends*
</span>

At OpenLink Software, it is our opinion that a new genre of UDA
middleware called the "Virtual Database", is set to emerge as the
dominant UDA middleware solution for addressing the integration
challenges as they exist today, and tomorrow. This new UDA middleware
format plays the role of a Universal Data Access manager, fusing
traditional database functionality and traditional data access
middleware functionality into a single independent packaged software
solution.

</div>

<div>

<div>

<div>

<div>

#### Virtual Database Engines Defined

</div>

</div>

</div>

A Virtual Database (VDB) Engine is a UDA middleware format that
transparently brings local and or remote heterogeneous databases
together using logical database references called Data Source Names
(DSN's). A VDB Engine exposes Metadata and Data held within these
heterogeneous DSN's to clients applications and services homogeneously.

VDB Engines presume the existence of a number of Database Engines and
Data Access Drivers provided by a variety of database vendors within an
organization. VDB Engines provide transparent access to these
heterogeneous databases via DSN's associated with the relevant data
access drivers without exposing end-users or developers to the
intricacies of heterogeneous data access.

</div>

<div>

<div>

<div>

<div>

#### Data Source Names (DSN's)

</div>

</div>

</div>

A Data Source Name is a logical reference that exposes database to
standards compliant or native data access drivers. DSN's provide a
flexible naming and binding service for database driven applications
developers and end-users alike. Applications no longer need to be
inextricably linked to specific database names or specific database
engines.

<div>

<div>

**Figure 8.1. Distributed Computing Infrastructure Incorporating A
Virtual Database Engine**

<div>

<div>

![Distributed Computing Infrastructure Incorporating A Virtual Database
Engine](images/wpImage18.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 8.1.2. First Generation Virtual Database Products

</div>

</div>

</div>

Although the strict VDB definition may be new, there are a number of
products that have been around for a while that attempt to address VDB
issues. The list of such products includes The Microsoft JET Engine,
Borland Database Engine (BDE), and IBM DataJoiner.

<div>

<div>

<div>

<div>

#### Microsoft JET

</div>

</div>

</div>

The Microsoft JET Engine lies at the heart of Microsoft Access, it is
the piece of technology that allows you to link external and typically
remote database tables into your local Access space via ODBC Data
Sources. Once this link process has been completed, Access allows you to
build Queries, Reports, Forms etc. using these external database tables
as though they were Local Access tables. JET can also link to external
tables hosted within desktop database engines via native interfaces.

The Microsoft JET Engine services are exposed via Microsoft provided
data access interfaces such as: DAO, ADO, and OLE-DB. These interfaces
are integral parts of most Microsoft applications, thereby exposing the
benefits of the JET VDB transparently.

</div>

<div>

<div>

<div>

<div>

#### Borland Database Engine

</div>

</div>

</div>

The Borland Database Engine (BDE) from Inprise like the Microsoft JET
Engine also facilitates external table linkage via ODBC Data Sources.
The BDE also lets you link to external database tables via native
database interfaces and there is no restriction to desktop database
engines when you adopt this approach.

Although the BDE has a published set of APIs, it is predominantly used
by Inprise applications in very much the same way JET is used by
Microsoft applications.

</div>

<div>

<div>

<div>

<div>

#### IBM DataJoiner

</div>

</div>

</div>

DataJoiner from IBM provides the ability access heterogeneous data
sources via IBM DB/2 Client Application Enablers. It does support ODBC
and JDBC as client interfaces and makes use of Native or ODBC based data
access for external Data I/O.

</div>

</div>

<div>

<div>

<div>

<div>

### 8.1.3. VDB Implementation Issues

</div>

</div>

</div>

The essential components that affect the implementation of VDB Engines
are, High-Level Data Access Interfaces, Low-Level Data Access Interfaces
and Traditional Database Functionality.

<div>

<div>

<div>

<div>

#### High-Level Data Access Interfaces

</div>

</div>

</div>

A VDB Engine's capabilities are exposed via High Level Data Access
interfaces. For the purpose of this document, a high level data access
interface is an interface utilized predominantly by applications, as
opposed to middleware developers for achieving application database
independence. A high level data access interface sits atop Low-Level
data access interfaces, providing an abstraction layer that serves to
simplifying the process of database independent application development.

A number of High Level Data Access standards exist today, the more
prevalent being:

|                                                                      |
|----------------------------------------------------------------------|
| <a href="http://www.microsoft.com/vbasic/techmat/whitepapers/ado20/" 
 class="ulink" target="_top">Data Access Objects (DAO)</a>             |
| <a href="http://www.microsoft.com/vbasic/techmat/whitepapers/ado20/" 
 class="ulink" target="_top">Remote Data Objects (RDO)</a>             |
| <a href="http://www.microsoft.com/data/ado/" class="ulink"           
 target="_top">ActiveX Data Objects (ADO)</a>                          |
| <a href="http://www.microsoft.com/data/oledb/" class="ulink"         
 target="_top">OLE-DB</a>                                              |
| <a href="http://java.sun.com/products/java-blend/index.html"         
 class="ulink" target="_top">JavaBlend</a>                             |
| <a href="http://java.sun.com/beans/infobus/index.html" class="ulink" 
 target="_top">InfoBus</a>                                             |

It is important to note that low-level Data access interfaces such as
ODBC, UDBC, JDBC and OLE-DB transparently serve the high-level
interfaces mentioned in the section above. Thus, in most cases VDB
vendors will treat ODBC, UDBC, JDBC, and OLE-DB as high-level interfaces
by providing VDB data access drivers conforming to these standards as
part of the VDB deliverable.

</div>

<div>

<div>

<div>

<div>

#### Low-Level Data Access Interfaces

</div>

</div>

</div>

A VDB Engine's data I/O occurs via low-level data access interfaces to
underlying database engines or data sources. In recent times the Open
Database Connectivity
(<a href="http://www.microsoft.com/data/" class="ulink"
target="_top">ODBC</a> ) API and the X/Open
<a href="http://www.jcc.com/sql_stnd.html" class="ulink"
target="_top">SQL</a> Call Level Interface (CLI) have emerged as the
dominant industry wide Low-Level Data Access Standards. OLE-DB from
Microsoft is also emerging as a new low-level data access standard for
relational and non-relational data in the Microsoft Component Object
Model (COM) world. While JDBC is emerging like wise as the low-level
data access standard for the burgeoning Java world.

A VDB may also be a Native Database Interface Client, making use of
database engine vendor provided data access interfaces. Native
interfaces are based upon Embedded SQL, an older format Low-Level data
access interface that preceded the X/Open SQL CLI. It is important to
note that ODBC from Microsoft, JDBC from JavaSoft, and UDBC from
OpenLink Software are all derived from the X/Open SQL CLI.

</div>

<div>

<div>

<div>

<div>

#### Traditional Database Functionality

</div>

</div>

</div>

The degree to which a VDB implements a traditional database engine's
functionality has a direct bearing on the intrinsic value of a VDB
engine. Traditional database functionality is extensive, but for the
purposes of this document, a core set of functionality common to all
commercial database engines has been assembled. The functionality list
includes:

**Query Language Support. ** standard syntax for interrogating,
manipulating, describing, and securing data contained within a database.
Examples include the Structured Query Language (SQL) for relational
databases and the Object Query Language (OQL) for Object and
Object-Relational Databases.

**Query Processor. ** the mechanism used by a database engine to convert
Query Language Statements into actual data retrieval instructions. In
addition, this database component is responsible for ensuring Query
Language syntax conformance, Query Execution Plan Assembly and Query
Fulfillment.

**Standard Data Types Support. ** data contained within a database must
be describable using standard data types e.g. Character, Number, Date,
etc.

**VIEW Support. ** pre constructed query statements stored within a
database, for the purpose of query simplification, or content and
structural security.

**Stored Procedure Support. ** Stored Procedures facilitate the
embedding of application programming logic within a database. Their
pre-compiled nature enhances data access performance by reducing message
hops between database servers and database clients.

**Scrollable Cursor Support. ** the process by which the result of a
database query (known as a result-set) is traversed. Traversal occurs in
either direction, backwards or forwards, using result-set chunks (known
as row-sets). Resultset scrolling occurs when database engines exchange
data with database clients.

**Concurrency Control. ** the process through which a database engine
supports multiple sessions running concurrently, across multiple
database users and database client applications without compromising
underlying data integrity or introducing quantum increases in
application response times.

**Transaction Support. ** ensures that database instructions can be
grouped into logical units of execution that are Atomic, Consistent,
Isolated from the effect of other units of execution affecting the same
underlying data, and Durable.

**Transaction Isolation. ** describes the ability of a database engine
to provide transaction process partitioning options called Isolation
Levels, that offer different ways of managing the effects of multiple
and concurrent transactions affecting the same underlying data.

**Distributed Transaction Support. ** describes the ability to preserve
transaction atomicity, consistency, integrity, and durability across
database servers hosted on the same or different database server
machines within a networked environment. This involves supporting
transaction Commits and Rollbacks using a 2-phase commit protocol.

**User Definable Type Support. ** this is how a database engine allows
end-users extend its base functionality. This is achieved by providing
interfaces that allow end-users create new ways in which a database
engine's data is described and manipulated.

**Federated Database Support. ** data access and manipulation across
database servers resident on the same machine.

**Distributed Database Support. ** data access, and manipulation across
database servers resident on the different machines within a networked
environment.

**Security. ** the process by which data, and data transmission is
protected using a combination of database and operating system
privileges, roles and roles hierarchies. It also includes the ability of
a database engine to protect data transmitted to its clients using data
encryption.

</div>

</div>

<div>

<div>

<div>

<div>

### 8.1.4. VDB Engine Components

</div>

</div>

</div>

The prior section outlined the critical implementation issues that
affect the development and implementation of VDB Engines. These issues
form the basis around which a component based framework for depicting
VDB architectures has been derived.

The components that comprise a VDB Engine framework are as follows:

<div>

<div>

<div>

<div>

#### Data Access Drivers

</div>

</div>

</div>

The VDB component that forms the entry point to the VDB Engine's
services, these drivers may or may not conform to industry standards.
Applications and Services that sit atop a VDB Engine must have their
data access layers written to the same Application Programming
Interfaces (APIs) implemented by the Data Access Drivers provided by a
VDB engine.

</div>

<div>

<div>

<div>

<div>

#### Security Manager

</div>

</div>

</div>

The VDB component that is responsible for protecting data and data
transmission (using encryption) within the VDB Engine's domain. It is
also responsible for managing Application, User, Group, Role and Domain
privileges as they relate to the creation, manipulation and destruction
of VDB data and metadata.

</div>

<div>

<div>

<div>

<div>

#### Query Manager

</div>

</div>

</div>

The VDB component that handles queries presented to it by the VDB
Engine's data access drivers. It provides query syntax checking, query
execution plan compilation, and query fulfillment services. A query
processor is built in conformance to one or more query language
specifications, the most notable being the Structured Query Language
(SQL) for relational database engines, and the Object Query Language
(OQL) for Object-Relational and Object Database engines.

</div>

<div>

<div>

<div>

<div>

#### Meta Data Manager

</div>

</div>

</div>

The VDB component that provides the Query Processor with information
about the data entities from which the Query Processor's execution plan
is derived. Metadata managers are also the components responsible for
linking external data sources into the VDB domain and directing the
Query Processor to the appropriate Data I/O manager.

</div>

<div>

<div>

<div>

<div>

#### Transaction Manager

</div>

</div>

</div>

The Transaction Manager component ensures that transactions are Atomic
(clearly distinguishable units), Consistent (thereby preserving
integrity of data), Isolated from the effect of other transactions, and
Durable (such that the effects of committed transactions survive
failure). The Transaction Manager ensures VDB Engines are capable of
supporting Online Transaction Processing (OLTP) and Distributed
Transaction oriented applications and services. Transaction Managers may
be standards based implementing X/Open's XA Resource Manager
Specifications. Distributed transaction support is implemented by using
a two-phase commit protocol.

</div>

<div>

<div>

<div>

<div>

#### Concurrency Manager

</div>

</div>

</div>

The VDB component that ensures client applications and services are
capable of opening multiple concurrent sessions that execute data
INSERTS, UPDATES and DELETIONS, without implicitly reducing application
response times or compromising data integrity. Concurrency control is
delivered in one of two formats, Optimistic or Pessimistic depending on
the response times desired by VDB client applications or services.

</div>

<div>

<div>

<div>

<div>

#### Local Data I/O Manager

</div>

</div>

</div>

VDB Engine's that provide local data storage uses this component for
reading and writing data to disk. This is how a VDB provides traditional
database engine data storage services.

</div>

<div>

<div>

<div>

<div>

#### External Data I/O Manager

</div>

</div>

</div>

VDB component that handles data reads and writes to external data
sources. The External Data I/O Manager be implemented using standard
data access interfaces such as ODBC, JDBC, UDBC, OLE-DB or Native data
source interfaces.

</div>

<div>

<div>

<div>

<div>

#### Replication Manager

</div>

</div>

</div>

Component that manages data migration and synchronization across two or
more VDB servers within a distributed computing environment. This
component acts as a data coordinator between the activities of Local
Data I/O and External Data I/O Managers across VDB servers. The
Replication Manager enables a VDB Engine offer automated bi-directional
data, and metadata transformation services across heterogeneous data
sources without end-user or developer intervention.

<div>

<div>

**Figure 8.2. Virtual Database Engine Architecture & Components**

<div>

<div>

![Virtual Database Engine Architecture &
Components](images/wpImage19.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### VDB Implementation Approaches

</div>

</div>

</div>

There are no golden VDB implementation specifications, but the
implementation of a VDB has a direct impact the degree to which you
realize desired value from the VDB concept as a whole.

The VDB value proposition is simply stated as follows:

"To provide transparent access to heterogeneous data sources,
independent of host operating system and underlying database engines ".

VDB implementations can be categorized as follows:

<div>

**Table 8.1. VDB Implementation Categories**

<div>

|         | VDB Data Access Interface | VDB External Data I/O     | Traditional Database Functionality |
|:--------|---------------------------|---------------------------|------------------------------------|
| Type 1  | Native                    | Native                    | Partial                            |
| Type 2  | Native                    | Native                    | Full                               |
| Type 3  | Native                    | Standards Based           | Partial                            |
| Type 4  | Native                    | Standards Based           | Full                               |
| Type 5  | Standards Based           | Native                    | Partial                            |
| Type 6  | Standards Based           | Native                    | Full                               |
| Type 7  | Standards Based           | Standards Based           | Partial                            |
| Type 8  | Standards Based           | Standards Based           | Full                               |
| Type 9  | Standards Based           | Standards Based or Native | Partial                            |
| Type 10 | Standards Based           | Standards Based or Native | Full                               |

</div>

</div>

  

The sections that follow provide illustrations of the different VDB
formats, depicting the components that provide the basis for the
categorization used in the table above.

<div>

<div>

<div>

<div>

##### Type 1 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via Native and
Proprietary high-level data access interfaces. Data I/O is achieved via
native, proprietary, and data source specific low-level data access
interfaces. This category of VDB does not possess a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.3. Type 1 VDB Engine Architecture**

<div>

<div>

![Type 1 VDB Engine Architecture](images/wpImage20.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 2 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via Native and
Proprietary high-level data access interfaces. External data I/O is
achieved via native, proprietary, and data source specific low-level
data access interfaces. This category of VDB possesses a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.4. Type 2 VDB Engine Architecture**

<div>

<div>

![Type 2 VDB Engine Architecture](images/wpImage21.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 3 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via Native and
Proprietary high-level data access interfaces. Data I/O is achieved via
Open, Standards based, and Database Independent low-level data access
interfaces. This category of VDB does not possess a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.5. Type 3 VDB Engine Architecture**

<div>

<div>

![Type 3 VDB Engine Architecture](images/wpImage22.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 4 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via Native and
Proprietary high-level data access interfaces. External data I/O is
achieved via Open, Standards based, and Database Independent low-level
data access interfaces. This category of VDB possesses a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.6. Type 4 VDB Architecture**

<div>

<div>

![Type 4 VDB Architecture](images/wpImage23.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 5 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via open and
standards based high-level data access Interfaces. Data I/O is achieved
via native, proprietary, and data source specific low-level interfaces.
This category of VDB does not possess a complete set of traditional
database engine components.

<div>

<div>

**Figure 8.7. Type 5 VDB Engine Architecture**

<div>

<div>

![Type 5 VDB Engine Architecture](images/wpImage24.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 6 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services to clients via open, standards
based, high and low-level Interfaces. External data I/O is achieved via
native, proprietary, and data source specific low-level interfaces. This
category of VDB possesses a complete set of traditional database engine
components.

<div>

<div>

**Figure 8.8. Type 6 - VDB Engine Architecture**

<div>

<div>

![Type 6 - VDB Engine Architecture](images/wpImage25.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 7 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services via open, standards based
high-level data access interfaces. Data I/O is achieved via Open,
Standards based, and Database Independent low-level data access
interfaces. This category of VDB does not possess a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.9. Type 7 VDB Engine Architecture**

<div>

<div>

![Type 7 VDB Engine Architecture](images/wpImage26.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 8 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services via open, standards based,
high and low-level interfaces. External data I/O is achieved via Open,
Standards based, and Database Independent low-level data access
interfaces. This category of VDB does possess a complete set of
traditional database engine components.

<div>

<div>

**Figure 8.10. Type 8 VDB Engine Architecture**

<div>

<div>

![Type 8 VDB Engine Architecture](images/wpImage27.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 9 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services via Open, Standards based,
high-level data access interfaces. Data I/O is achieved by using either
Open, Standards based, and Database Independent low-level data access
interfaces or Native, Proprietary, and Database Specific low-level data
access interfaces. This category of VDB does not possess a complete set
of traditional database engine components.

<div>

<div>

**Figure 8.11. Type 9 VDB Architecture**

<div>

<div>

![Type 9 VDB Architecture](images/wpImage28.gif)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Type 10 VDB Engine

</div>

</div>

</div>

This category of VDB exposes its services via Open, Standards based,
high-level data access interfaces. External data I/O is achieved by
using either Open, Standards based, and Database Independent low-level
data access interfaces or Native, Proprietary, and Database Specific
low-level data access interfaces. This category of VDB possesses a
complete set of traditional database engine components.

<div>

<div>

**Figure 8.12. Type 10 VDB Architecture**

<div>

<div>

![Type 10 VDB Architecture](images/wpImage29.gif)

</div>

</div>

</div>

  

</div>

</div>

</div>

</div>

</div>

</div>
