<div id="lite_oraconcpoolgeneric" class="section">

<div class="titlepage">

<div>

<div>

## 5.6. Oracle Connection Pooling Support

</div>

</div>

</div>

<div id="lite_oraconpoolwhat" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.1. What it is

</div>

</div>

</div>

Oracle Connection-Pooling gives you the ability to retain a pool of open
connections to the database within the ODBC Driver, thereby avoiding
costly connection-establishment overhead for every connection from the
client. Being implemented in the ODBC Driver means you do not have to
rely on the Driver Manager component implementing connection-pooling for
you, and have finer control over how it behaves too.

<div id="id44881" class="figure">

**Figure 5.175. orapooling.png**

<div class="figure-contents">

<div class="mediaobject">

![orapooling.png](images/orapooling.png)

</div>

</div>

</div>

  

</div>

<div id="lite_oraconpooladvant" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.2. Benefits

</div>

</div>

</div>

OCI separates the concept of database sessions (user logins) from
physical connections (server attachments). By pooling connections, it is
possible for an application to multiplex several sessions over fewer
physical connections. Because the number of physical connections is less
than the number of database sessions in use by the application and
because the shared pool of physical connections typically has a
corresponding back-end server pool containing an identical number of
dedicated server processes; the number of back-end server processes is
also reduced by connection pooling. Thus many more database sessions can
be multiplexed. If the number of back-end server processes may cause
scaling problems on the database, OCI connection pooling can be of
benefit.

Client-side connection pooling by the driver manager may be done on a
per-process basis. For instance, on Unix each application gets its own
driver-manager instance in its process. In contrast, in a multi-threaded
OpenLink agent with connection re-use enabled, an agent connection pool
can span different client processes. Cross-client connection pooling may
be preferable to client-side connection pooling in certain application
domains and may offer better scalability. For instance, if the agent is
used by an application server or web server.

</div>

<div id="lite_oraconpoolhow" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.3. How it Works

</div>

</div>

</div>

If OCI connection pooling is enabled, a separate connection pool is
created for each Oracle instance connected to. All connections
specifying the same server instance (i.e. the same TNS service name)
share the same connection pool. The connection pool is reference counted
and only destroyed when the last Lite/agent connection using it is
closed down.

Each agent connection holds a reference to an OCI connection pool record
or OCPR. The OCPR contains a handle to the OCI connection pool
associated with the Oracle instance connected to. The agent maintains a
hash table of OCPRs, keyed by instance name. Each OCPR is reference
counted. The reference count for an OCPR is incremented each time an
agent uses the connection pool to connect to the associated Oracle
instance, and decremented when the agent connection is closed. The OCPR
is destroyed, and the connection pool closed, when the last agent
connection using it is closed.

When an agent is about to establish a connection to an Oracle instance,
it searches for an OCPR for the instance. If one exists, a connection
pool for that instance already exists. The agent requests an OCI
connection from this pool and increments the reference count of the
OCPR. If one doesn't exist, the agent creates an OCI connection pool for
the instance by registering a new OCPR.

Note: different ODBC DSNs, using this driver and the same server
instance, may specify different pool settings (max pool size, min pool
size etc.) The settings of the first DSN to connect fixes the
characteristics of the pool.

The maximum number of connection pools supported by an Oracle agent or
Lite driver is 100. Each connection pool allows up to 500 connections,
depending on the value set in the environment variable OCI_CONNPOOL_MAX
or the Lite driver setup dialog. The maximum linger time is 300 seconds.

</div>

<div id="lite_oraconpooloplhow" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.4. The OpenLink Perspective: what you do to use it

</div>

</div>

</div>

When an OCI connection pool is created, it is characterised by several
parameters:

<div class="itemizedlist">

- the minimum number of connections to be opened when the pool is
  created;

- the maximum number of connections that can be opened in the pool;

  <div class="itemizedlist">

  - When the maximum number of connections are open in the pool, and all
    the connections are busy, if a call needs a connection, it will wait
    until it gets one if connWait is TRUE, if FALSE an error is
    returned.

  </div>

</div>

<div class="itemizedlist">

- the incremental number of connections to be opened when all the
  connections are busy and a call needs a connection.

  <div class="itemizedlist">

  - This increment is used only when the total number of open
    connections is less than the maximum number of connections that can
    be opened in that pool.

  </div>

</div>

<div class="itemizedlist">

- whether, when all connections in the pool are found to be busy and the
  number of connections has already reached the maximum, to wait for a
  connection or report an error.

</div>

<div class="itemizedlist">

- how long the last connection in the pool should linger before the pool
  is destroyed (this option is available for the single-tier WIN32
  drivers only)

</div>

</div>

<div id="lite_oraconcpoollite" class="section">

<div class="titlepage">

<div>

<div>

### 5.6.5. 

</div>

</div>

</div>

<div id="id1369" class="section">

<div class="titlepage">

<div>

<div>

#### Unix / Linux

</div>

</div>

</div>

OpenLink Single-Tier (Lite) Drivers require the following environment
variables to be set in the connecting process (shell or ODBC
application):

<div class="itemizedlist">

- OCI_CONNPOOL_MIN - if not set defaults to 0

- OCI_CONNPOOL_INCR - if not set defaults to 1

- OCI_CONNPOOL_MAX - if not set defaults to OCI_CONNPOOL_MIN +
  OCI_CONNPOOL_INCR

- OCI_CONNPOOL_WAIT - if not set defaults to TRUE

- OCI_CONNPOOL_LINGER - if not set defaults to 0 seconds

</div>

OCI connection pooling is disabled by setting a minimum connection pool
size of 0.

</div>

<div id="id1370" class="section">

<div class="titlepage">

<div>

<div>

#### Windows

</div>

</div>

</div>

On Windows, when using the OpenLink Lite Driver for Oracle, the
parameters can be configured using the Lite driver's setup dialog:

<div class="itemizedlist">

- OCI_CONNPOOL_MIN - if not set defaults to 0

- OCI_CONNPOOL_INCR - if not set defaults to 1

- OCI_CONNPOOL_MAX - if not set defaults to OCI_CONNPOOL_MIN +
  OCI_CONNPOOL_INCR

- OCI_CONNPOOL_WAIT - if not set defaults to TRUE

- OCI_CONNPOOL_LINGER - if not set defaults to 0 seconds

</div>

</div>

<div id="id1371" class="section">

<div class="titlepage">

<div>

<div>

#### Linger Time

</div>

</div>

</div>

This option is currently only available for WIN32 single-tier Oracle
drivers

Normally, when connection-pooling is enabled for an Oracle instance, the
pool is destroyed when the last connection in use is closed. The next
connection to the Oracle instance recreates the pool. Depending on the
minimum size of the pool, the time taken to create it can be
significant. If your application is designed in such a way that the
connection usage count could regularly fall to zero (e.g. in a webserver
environment), the overhead of the pool creation time could negate the
benefits of pooling. The 'linger time' option can help alleviate this
problem, at the cost of introducing a disconnection delay for the last
pooled connection in use. The linger time should be set no longer than
the pool creation time and no longer than the maximum disconnection time
acceptable for the application.

</div>

</div>

</div>
