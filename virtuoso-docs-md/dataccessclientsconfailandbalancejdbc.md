<div id="dataccessclientsconfailandbalancejdbc" class="section">

<div class="titlepage">

<div>

<div>

### 7.8.3. JDBC

</div>

</div>

</div>

<div id="dataccessclientsconfailandbalancejdbcf" class="section">

<div class="titlepage">

<div>

<div>

#### Failover Connect String format

</div>

</div>

</div>

``` programlisting
jdbc:virtuoso://server1:port1,server2:port2,server3/UID=dba/PWD=dba/;
```

</div>

<div id="dataccessclientsconfailandbalancejdbcr" class="section">

<div class="titlepage">

<div>

<div>

#### Round Robin Connect String format

</div>

</div>

</div>

``` programlisting
jdbc:virtuoso://server1:port1,server2:port2,server3:1111/UID=dba/PWD=dba/ROUNDROBIN=yes;
```

</div>

</div>
