<div>

<div>

<div>

<div>

### 16.19.3. Set up RDF Replication via procedure calls

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Example

</div>

</div>

</div>

The following example shows how to use SQL procedures to set up Virtuoso
RDF Graph Replication in a Chain Topology.

<div>

<div>

**Figure 16.310. Chain Replication Topology**

<div>

<div>

![Chain Replication Topology](images/ui/topo-chain.png)

</div>

</div>

</div>

  

</div>

This can also be done
<a href="rdfgraphreplicationtopl.html#rdfgraphreplicationtoplchainex"
class="link" title="Chain Replication Topology Example">through the
HTTP-based Virtuoso Conductor</a> .

<div>

<div>

<div>

<div>

##### Prerequisites

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Database INI Parameters

</div>

</div>

</div>

Suppose there are 3 Virtuoso instances on the same machine.

The first instance holds the master copy of the data and publishes its
changes to all other instances that subscribe to this master.

The second instance subscribes to the publication of the master copy,
but also publishes all of these changes to any instance that subscribes
to it.

The third instance only subscribes to the publication of the second
instance.

Each of these 3 servers need unique ports and ServerName, DefaultHost
for this replication scheme to work properly. Although not needed, this
example also sets separate names for the database and related files.
This results in the following ini parameters values (only changes are
shown, the rest can remain default):

<div>

1.  repl1/virtuoso.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso1.db
    TransactionFile = virtuoso1.trx
    ErrorLogFile     = virtuoso1.log
    ...
    [Parameters]
    ServerPort               = 1111
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8891
    ...
    [URIQA]
    DefaultHost = example.com:8891
    ...
    [Replication]
    ServerName   = db1-r
    ...
    ```

2.  repl2/virtuoso.ini:

    ``` programlisting
    ...
    [Database]
    DatabaseFile    = virtuoso2.db
    TransactionFile = virtuoso2.trx
    ErrorLogFile     = virtuoso2.log
    ...
    [Parameters]
    ServerPort               = 1112
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8892
    ...
    [URIQA]
    DefaultHost = localhost:8892
    ...
    [Replication]
    ServerName   = db2-r
    ...
    ```

3.  repl3/virtuoso.ini:

    ``` programlisting

    ...
    [Database]
    DatabaseFile    = virtuoso3.db
    TransactionFile = virtuoso3.trx
    ErrorLogFile     = virtuoso3.log
    ...
    [Parameters]
    ServerPort               = 1113
    SchedulerInterval        = 1
    ...
    [HTTPServer]
    ServerPort                  = 8893
    ...
    [URIQA]
    DefaultHost = example.com:8893
    ...
    [Replication]
    ServerName   = db3-r
    ...
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Database DSNs

</div>

</div>

</div>

Use the ODBC Administrator on your Virtuoso host (e.g., on Windows,
Start menu -\> Control Panel -\> Administrative Tools -\> Data Sources
(ODBC); on Mac OS X, /Applications/Utilities/OpenLink ODBC
Administrator.app) to create a System DSN for each of db1, db2, db3,
with names db1, db2 and db3, respectively.

</div>

</div>

<div>

<div>

<div>

<div>

##### Configure Publishers and Subscribers

</div>

</div>

</div>

<div>

1.  Run the databases by starting start.sh, which has the following
    content:

    ``` programlisting
    cd repl1
    virtuoso -f &
    cd ../repl2
    virtuoso -f &
    cd ../repl3
    virtuoso -f &
    cd ..
    ```

2.  Use the

    <span class="emphasis">*isql*</span>

    command to execute the following rep.sql file:

    ``` programlisting
    --
    --  connect to the first database which is only a publisher
    --
    set DSN=localhost:1111;
    reconnect;

    --
    -- start publishing the graph http://test.org
    ---
    DB.DBA.RDF_REPL_START();
    DB.DBA.RDF_REPL_GRAPH_INS ('http://test.org');

    --
    --  connect to the second database in the chain, which is both a publisher and a subscriber
    --
    set DSN=localhost:1112;
    reconnect;

    --
    --  start publishing the graph http://test.org
    --
    DB.DBA.RDF_REPL_START();
    DB.DBA.RDF_REPL_GRAPH_INS ('http://test.org');

    --
    --  contact the first database
    --
    repl_server ('db1-r', 'db1', 'localhost:1111');

    --
    --  subscribe to its RDF publication(s)
    --
    repl_subscribe ('db1-r', '__rdf_repl', 'dav', 'dav', 'dba', 'dba');

    --
    --  bring the replication service online
    --
    repl_sync_all();

    --
    --  and set scheduler to check every minute
    --
    DB.DBA.SUB_SCHEDULE ('db1-r', '__rdf_repl', 1);

    --
    --  connect to the third database in the chain, which is only a subscriber
    --
    set DSN=localhost:1113;
    reconnect;

    --
    -- uncomment next 2 commands if this database should also be a publisher
    --
    --DB.DBA.RDF_REPL_START();
    --DB.DBA.RDF_REPL_GRAPH_INS ('http://test.org');

    --
    --  contact second database
    --
    repl_server ('db2-r', 'db2', 'localhost:1112');

    --
    --  subscribe to its RDF publication(s)
    --
    repl_subscribe ('db2-r', '__rdf_repl', 'dav', 'dav', 'dba', 'dba');

    --
    --  bring the replication service online
    --
    repl_sync_all();

    --
    --  and set schedule to check every minute
    --
    DB.DBA.SUB_SCHEDULE ('db2-r', '__rdf_repl', 1);
    ```

</div>

</div>

</div>

</div>
