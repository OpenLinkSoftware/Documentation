<div id="mt_OpenLinkMiddleware" class="section">

<div class="titlepage">

<div>

<div>

## 11.7. OpenLink Server Components Configuration

</div>

</div>

</div>

The OpenLink JDBC agent and OpenLink Database agents form the OpenLink
server components, In the prior section you would have installed these
components on the appropriate server machine.

Following installation you have to configure these server components in
order to enable connectivity between your backend database(s) and your
OpenLink Driver for JDBC. Both of these components are exposed to your
OpenLink Driver for JDBC via the OpenLink Request Broker.

This new OpenLink release enables the direct connection to an OpenLink
Database agent from your OpenLink Java client classes, as JDBC support
in now built in to the database agents. Thus you no longer have to
connect via the OpenLink JDBC Agent proxy, as in the past, although
connection via this method is still supported. Obviously connecting
directly to the Database agent will provide better performance, and is
now the recomended connection method whenever possible.

### Database Agents

OpenLink Database Agents are the OpenLink data access server components
that actually provide database connectivity services to your OpenLink
Driver for JDBC. A Database Agent exists for each database engine
supported by OpenLink, the supported database list currently includes:
Oracle, DB2, Informix, Sybase, Ingres, Progress, Microsoft SQL Server,
OpenLink Virtuoso, Solid, PostgresSQL, and other ODBC based databases.

Please follow the instructions provided in the OpenLink Database Agents
configuration guide prior to attempting to use your OpenLink Drivers for
JDBC (if you haven't already done so as part of the installation
process).

</div>
