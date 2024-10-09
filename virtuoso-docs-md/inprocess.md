<div>

<div>

<div>

<div>

## 7.6. Virtuoso In-Process Client

</div>

</div>

</div>

The in-process client is an efficient mechanism used by hosted
applications to access the database functionality of the hosting
Virtuoso server.

Normally applications access Virtuoso using the remote procedure call
mechanism hidden behind some sort of higher-level API such as ADO.NET,
ODBC, and so on. The RPC based mechanism is the only available interface
for non-hosted applications. For hosted applications, when the
application and the DBMS server reside in the same OS process, Virtuoso
provides a mechanism based on direct in-process procedure calls.

The in-process call mechanism by itself is not exposed to the
applications. It is hidden behind the same APIs as the RPC one: ODBC,
JDBC, ADO.NET. So in both cases applications deal with the same APIs and
the application logic does not change. The application chooses which
mechanism to use when it opens a database connection.

To make an in-process connection to a Virtuoso server from within an
application hosted by the same server it is necessary to use a special
inprocess address syntax distinguishing it from the regular network
"HOST:PORT" address syntax. The In-process address has the following
form:

``` programlisting
:in-process:PORT
```

Note that it begins with a colon, then specifies the "`in-process` "
keyword, followed by another colon, and finally the port number on which
the server listens for TCP connections.

This port is only used for establishing the in-process connection, after
which the connection proceeds exclusively through the in-process
procedure call mechanism.

The in-process connections are presently only supported by the Virtuoso
ODBC driver and the ODBC-based .NET Data Provider
(OpenLink.Data.VirtuosoClient). The managed .NET Data Provider
(OpenLink.Data.Virtuoso) does not yet support in-process connections.

In-process ODBC connection are defined in either a DSN or a connect
string directly. This is an example section of the odbc.ini file for
unix/linux:

``` programlisting
[InProcess]
Driver  = /opt/virtuoso/lib/virtodbc32_r.so
Address = :in-process:1111
```

To open an ADO.NET connection the in-process address should be specified
in the connection string.

Here is an example of using the OpenLink.Data.VirtuosoClient adapter
specifying the details on the connect string:

``` programlisting
VirtuosoConnection = new VirtuosoConnection ("HOST=:in-process:1111");
```

Every in-process connection originates from the existing connection. For
instance, it might be initiated by a stored procedure called from an
ISQL connection, or it can be called from an ASPX session.

In-process connections always inherit the user ID from its parent
connection. There is no way to set or change the connecting user ID.
Therefore the user ID and password are not specified when the in-process
connection is opened.

In-process connections also limit database transactions. The autocommit
mode is never in effect for in-process connections. The setting of
autocommit mode is silently ignored without reporting any errors.

</div>
