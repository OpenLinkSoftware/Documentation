<div id="mt_overview" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 1. Overview

</div>

<div>

<div class="abstract">

**Abstract**

ODBC, and further developments such as JDBC, OLEDB, define a low-level
set of calls which allow client applications and servers applications to
exchange instructions and share data without needing to know anything
about each other. It applies to any Client-Server operation, whether or
not the client and server applications are resident on the same machine,
or on different PC's, or even if the server is on a remote machine
running a different operating system.

This chapter introduces OpenLink's offerings to provide these
technologies to you.

</div>

</div>

</div>

</div>

OpenLink Universal Data Access (UDA) Multi Tier consists of three main
components, of varying types:

<div class="itemizedlist">

- **Generic Client. ** One client driver connecting to a variety of data
  sources.

  <div class="itemizedlist">

  - ODBC

  - UDBC

  - JDBC

  - OLE-DB

  </div>

- **Request Broker. ** Responsible for managing connections between
  Generic Clients and Server Agents. The Request Broker is completely
  configurable and its responses to incoming requests from Clients
  controlled by the <span class="emphasis">*Sessions Rules Book*</span>
  (oplrqb.ini).

- **Server Agents. ** Task specific applications exclusively launched by
  the Request Broker for Generic Clients to communicate with, and
  facilitate their needs.

  <div class="itemizedlist">

  - **Database Agents. ** one specific for each database and major
    version as required: Oracle, Progress, Ingres, Postgres, SQL Server,
    etc...

  - **Proxy Agent. ** special agent for forwarding requests to another
    Request Broker, particularly useful on firewalls.

  - **ODBC Agent. ** Special case of Database Agent where another ODBC
    datasource is the database.

  </div>

</div>

The Request Broker and Server Agents are typical addressed as the server
components. This is a logical distinction because the client and server
can be the same machine. In testing environments this is often the case.

The Request Broker is responsible for brokering the services of OpenLink
Data Access and Service Providing Agents. It is also the component
responsible for coordinating and controlling your entire OpenLink Data
Access session irrespective of Data Access mechanism being used. This is
the heart and soul of the OpenLink Database Independent Communications
Layer. It is the technology that enables the OpenLink Data Access
drivers to communicate with your backend database engines alleviating
the need to acquire additional database specific networking software
from your backend database vendor(s). More than one Broker may exist on
a system if each instance is defined separately.

One or more Database Agents (one for each supported database engine) are
database specific components that provide the actual backend database
connectivity and data access services to your OpenLink Data Access
Clients (ODBC, JDBC, UDBC, OLE-DB etc.). These components are actually
clients from the perspective of each supported backend database, this is
because they are built using the Call Level Interfaces (CLIs) or
Embedded SQL interfaces of these backend databases.

Service Provider Agents (ODBC, JDBC, PROXY) are generic agents that
provide Distributed Data Access Protocol handling services to OpenLink
Data Access Drivers. The data access protocols supported are as follows:

<div class="itemizedlist">

- <span class="emphasis">*ODBC Agent*</span> - enabling OpenLink
  Multi-Tier ODBC Drivers to connect to local or remote non OpenLink
  ODBC Drivers

- <span class="emphasis">*JDBC Agent*</span> - enabling OpenLink JDBC
  Drivers to connect local or remote OpenLink or non OpenLink ODBC or
  UDBC Drivers

- <span class="emphasis">*PROXY Agent*</span> - enabling all OpenLink
  Data Access Clients to connect to OpenLink Database Agents that do not
  reside on the same server machine as the prime OpenLink Request
  Broker. The prime Broker being the Request Broker that all your
  OpenLink Clients are configured to request data access services from.
  This enables you to configure your OpenLink Database Agents for use in
  N-Tier distributed computing environments.

</div>

An architectural overview of the OpenLink Multi-tier Data Access
infrastructure is available at:
<a href="http://www.openlinksw.com/info/mtproduct.htm" class="ulink"
target="_top">www.openlinksw.com/info/mtproduct.htm</a>. Note that the
OpenLink Request Broker is the core component that makes up the OpenLink
Database Independent Communications Layer in this illustration.

The components listed above are presented to you for download at the end
of your interaction with the OpenLink Software
<a href="http://www.openlinksw.com/main/softdld.htm" class="ulink"
target="_top">Download Wizard.</a>

</div>
