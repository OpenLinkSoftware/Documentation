<div id="mt_AgentCompAdm" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 8. Server Agent Administration

</div>

<div>

<div class="abstract">

**Abstract**

Guide for successfully installing and running the OpenLink server
components from the OpenLink Multi Tier Data Access Suite. This chapter
describes the roles of the OpenLink Database/Service Agents and how to
configure them. OpenLink Server Agents come in two main types, the
Database agent and the Service agent. Database agents provide the only
database dependant component, usually requiring a separate agent per
database major version to connect to. Service agents provide other
services such as proxying of connections or special interfaces to other
ODBC data sources.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">8.1. [Administration
Assistant](mt_agentconfig.html)</span>

<span class="section">8.1.1. [Wizard Based
Administration](mt_agentconfig.html#mt_wizbasedconf)</span>

<span class="section">8.1.2. [Forms Based
Administration](mt_agentconfig.html#mt_frmagntadm)</span>

<span class="section">8.2. [Agent-Specific
Settings](mt_dbspecset.html)</span>

<span class="section">8.2.1. [Common Agent Configuration
Options](mt_dbspecset.html#mt_oplconfaall)</span>

<span class="section">8.2.2.
[Virtuoso](mt_dbspecset.html#mt_virtspecset)</span>

<span class="section">8.2.3.
[Informix](mt_dbspecset.html#mt_infspecset)</span>

<span class="section">8.2.4.
[Ingres](mt_dbspecset.html#mt_ingspec)</span>

<span class="section">8.2.5.
[Progress](mt_dbspecset.html#mt_prospec)</span>

<span class="section">8.2.6.
[Oracle](mt_dbspecset.html#mt_oraspec)</span>

<span class="section">8.2.7.
[Sybase](mt_dbspecset.html#mt_sybspec)</span>

<span class="section">8.2.8. [Microsoft SQL
Server](mt_dbspecset.html#mt_sqlservspec)</span>

<span class="section">8.2.9. [TDS](mt_dbspecset.html#mt_tdsspec)</span>

<span class="section">8.2.10. [DB2](mt_dbspecset.html#mt_db2spec)</span>

<span class="section">8.2.11.
[PostgresSQL](mt_dbspecset.html#mt_postgresspec)</span>

<span class="section">8.2.12.
[MySQL](mt_dbspecset.html#mt_mysqlspec)</span>

<span class="section">8.2.13. [OpenLink ODBC Agent Installation &
Configuration](mt_dbspecset.html#mt_odbcconf)</span>

<span class="section">8.2.14. [OpenLink ODBC-JDBC Agent Bridge
Installation & Configuration](mt_dbspecset.html#mt_odbcjdbcconf)</span>

<span class="section">8.2.15. [OpenLink Proxy
Agent](mt_dbspecset.html#mt_oplprxyag)</span>

<span class="section">8.3. [Database Configuration for
Unicode](mt_unicode.html)</span>

<span class="section">8.3.1. [Oracle 8 &
9](mt_unicode.html#mt_uniora)</span>

<span class="section">8.3.2. [Informix
9.x](mt_unicode.html#mt_uniinf)</span>

<span class="section">8.3.3. [Sybase 12.5
+](mt_unicode.html#mt_unisyb)</span>

<span class="section">8.3.4. [Progress 9.1
(SQL-92)](mt_unicode.html#mt_unipro)</span>

<span class="section">8.3.5. [DB/2
v7.x](mt_unicode.html#mt_unidb2)</span>

<span class="section">8.3.6. [MS SQLServer
2000](mt_unicode.html#mt_unisql)</span>

<span class="section">8.3.7. [Operational
Notes](mt_unicode.html#mt_unigeninfo)</span>

<span class="section">8.4. [Obtaining Agent
Information](mt_getagntinfo.html)</span>

<span class="section">8.4.1. [Specific Agent
Information](mt_getagntinfo.html#mt_verrelfuncinfo)</span>

<span class="section">8.5. [Linking OpenLink DB
Agents](mt_relinkdb.html)</span>

<span class="section">8.5.1. [General Linking
Approach](mt_relinkdb.html#mt_relinkgeneral)</span>

<span class="section">8.5.2. [Relinking Progress
Agents](mt_relinkdb.html#mt_relinkpro)</span>

<span class="section">8.6. [Progress Troubleshooting & Advanced
Configuration](mt_conprog.html)</span>

<span class="section">8.6.1. [OpenLink Data Access
Components](mt_conprog.html#mt_conprogudacomps)</span>

<span class="section">8.6.2. [How OpenLink's Data Access Drivers Connect
To Your Progress Database](mt_conprog.html#mt_conproghowtoprog)</span>

<span class="section">8.6.3. [Initial Connection
Problems](mt_conprog.html#mt_conprogtrblesht)</span>

<span class="section">8.6.4. [Making OpenLink Database Agent Use a
Sockets Based IPC](mt_conprog.html#mt_conprogsocketspro)</span>

<span class="section">8.6.5. [Distributed Databases, Array Fields,
Database
Triggers](mt_conprog.html#mt_conprogDistributedDatabases)</span>

<span class="section">8.6.6. [Using OpenLink ODBC, Progress & Microsoft
Access](mt_conprog.html#mt_conprogusingoplodbc)</span>

<span class="section">8.6.7. [Key Microsoft Access Jet Engines Setting
That Can Affect Your OpenLink ODBC
Experience](mt_conprog.html#mt_conprogjetsetngs)</span>

<span class="section">8.7. [Application Server
Architecture](mt_appserverarchitect.html)</span>

</div>

OpenLink Database/Service Agents are the only database specific
components within the OpenLink Multi-Tier middleware framework. It is
these components that actually initiate and maintain database sessions
with your OpenLink Clients, basically playing the role of a data access
server.

Database Agents are servers implementing client data access interfaces
such as ODBC, JDBC, UDBC, and OLE-DB using the lower level native call
level interfaces provided by each supported database engine. These call
level interfaces are themselves increasing based on the X/Open SQL Call
Level Interface (CLI) specification. The older database engines that do
not support or implement the X/Open SQL CLI specification simply provide
traditional Embedded SQL interfaces.

The fact that Database Agents are built using natives interfaces
provided by database engine vendors has some very important
implications:

<div class="orderedlist">

1.  Through the eyes of a backend database, a database agent is a
    database client, no different to any other native client provided or
    bundled with the backend database engine.

2.  A database agent inherits all of the functionality of a traditional
    database client, this includes: Distributed Database, SQL syntax,
    Stored Procedure support, and anything else that may be specific to
    the relevant backend database engine.

3.  Configuring a database agent is no different to configuring an
    native database client, they share operating system environment
    variable dependencies etc..

4.  Resource utilization is identical to resource consumption for native
    clients, this means that if you have special setting for your native
    client sessions, you will be able to apply these when configuring
    your database agents.

5.  Any efficiencies or deficiencies in the database engines CLI client
    to database server inter process communications (IPC) also affects a
    database agent.

</div>

All database engines operate under a client-server paradigm, that is to
say there are always two distinct processes involved in a database
session, the database server and the database client. The database
server must be up and running before a database client can communicate
with a database. Database client and server processes may or may not
reside on the same physical machine, at the same time this has no
bearing on the fundamentals of database client and server process
interaction as just explained.

</div>
