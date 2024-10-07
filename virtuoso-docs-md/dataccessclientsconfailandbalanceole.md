<div id="dataccessclientsconfailandbalanceole" class="section">

<div class="titlepage">

<div>

<div>

### 7.8.4. OLE DB

</div>

</div>

</div>

<div id="dataccessclientsconfailandbalanceolef" class="section">

<div class="titlepage">

<div>

<div>

#### Failover Connect String format

</div>

</div>

</div>

``` programlisting
Provider=VIRTOLEDB;Data Source=server1:port1,server2:port2,server3;User Id=dba;Password=dba;Initial Catalog=Demo;Prompt=NoPrompt;
```

</div>

<div id="dataccessclientsconfailandbalanceoler" class="section">

<div class="titlepage">

<div>

<div>

#### Round Robin Connect String format

</div>

</div>

</div>

``` programlisting
  Provider=VIRTOLEDB;Data Source=server1:port1,server2:port2,server3;User Id=dba;
Password=dba;Initial Catalog=Demo;Prompt=NoPrompt;Round Robin=true
```

</div>

</div>
