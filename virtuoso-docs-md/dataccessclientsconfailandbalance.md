<div id="dataccessclientsconfailandbalance" class="section">

<div class="titlepage">

<div>

<div>

## 7.8. Virtuoso Data Access Clients Connection Fail over and Load Balancing Support

</div>

</div>

</div>

The Virtuoso Data Access Clients ODBC, JDBC, ADO.Net, OLE DB, Sesame,
Jena and Redland as of Release 6.1 and above support round robin
connections to Virtuoso server instances enabling server fail over, load
balancing and fault tolerant connections to be performed across multiple
server instances configured in a cluster or as separate server
instances.

Fail over connections are enabled by specifying a comma delimited list
of servers to failover to, in the "Host" or 'Server" connect string
attribute, with the list being worked through in the order presented to
determine which Virtuoso Server instance is used. A Round robin (load
balanced) connection can be configured by adding the connect string
attribute "RoundRobin" = \[True \| Yes \| False \| No\], in which case
the server for the connection is chosen at random from the comma
delimited provided as for a Failover connection above.

Example connect strings for Virtuoso ODBC, JDBC, ADO.Net and OLE DB
driver/providers are provided below. The Virtuoso Sesame and Jena
providers which make use of the JDBC driver and Redland Provider which
makes use of the ODBC driver, would simply make use of a suitably
configured JDBC or ODBC connect string to enable Failover or Round Robin
connections to be made with them.

<div id="dataccessclientsconfailandbalanceodbc" class="section">

<div class="titlepage">

<div>

<div>

### 7.8.1. ODBC

</div>

</div>

</div>

<div id="dataccessclientsconfailandbalanceodbcf" class="section">

<div class="titlepage">

<div>

<div>

#### Failover Connect String format

</div>

</div>

</div>

``` programlisting
Driver={OpenLink Virtuoso};Host=server1:port1,server2:port2,server3:port3;UID=dba;PWD=dba;
```

</div>

<div id="dataccessclientsconfailandbalanceodbcr" class="section">

<div class="titlepage">

<div>

<div>

#### Round Robin Connect String format

</div>

</div>

</div>

``` programlisting
Driver={OpenLink Virtuoso};Host=server1:port1,server2:port2,server3:port3;UID=dba;PWD=dba;RoundRobin=Yes"
```

Or alternatively ensure the "use Round Robin for failover connection"
check box in the setup dialog.

<div class="figure-float">

<div id="adf1" class="figure">

**Figure 7.35. ODBC Round Robin Connect String format**

<div class="figure-contents">

<div class="mediaobject">

![ODBC Round Robin Connect String format](images/ui/adf1.png)

</div>

</div>

</div>

  

</div>

</div>

</div>

</div>
