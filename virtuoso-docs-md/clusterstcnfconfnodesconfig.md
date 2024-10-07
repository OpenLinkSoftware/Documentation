<div id="clusterstcnfconfnodesconfig" class="section">

<div class="titlepage">

<div>

<div>

### 2.14.5. HTTP Service Configuration on Subordinate Nodes of a Virtuoso Cluster

</div>

</div>

</div>

This section applies to Virtuoso as of version 6.x and higher.

<div id="clusterstcnfconfnodesconfigwhat" class="section">

<div class="titlepage">

<div>

<div>

#### What

</div>

</div>

</div>

This documentation details how to configure the Subordinate (also called
Slave) Nodes of a Virtuoso Elastic Cluster to service HTTP clients.

</div>

<div id="clusterstcnfconfnodesconfigwhy" class="section">

<div class="titlepage">

<div>

<div>

#### Why

</div>

</div>

</div>

By default, only the Primary (also called Master) instance of a Virtuoso
Elastic Cluster is configured to provide HTTP services.

The Subordinate (also called Slave) nodes of the cluster may also be
configured to provide HTTP services, enabling load balancing by
spreading HTTP requests across the cluster's nodes.

</div>

<div id="clusterstcnfconfnodesconfighow" class="section">

<div class="titlepage">

<div>

<div>

#### How

</div>

</div>

</div>

This documentation details the steps for the installation and
configuration of a Virtuoso Elastic Cluster on Unix:

<div class="orderedlist">

1.  <span class="emphasis">*Step 1*</span>

    : Set up each instance as a HTTP Server;

2.  <span class="emphasis">*Step 2*</span>

    : Install and configure HTTP services on each instance;

3.  <span class="emphasis">*Step 3*</span>

    : Configure load balancing.

</div>

</div>

<div id="clusterstcnfconfnodesconfiginst" class="section">

<div class="titlepage">

<div>

<div>

#### Set up each instance as an HTTP Server

</div>

</div>

</div>

<span class="emphasis">*Step 1*</span> : Set up each instance as a HTTP
Server

Each node can be configured to provide HTTP services as follows:

<div class="orderedlist">

1.  Copy the `[HTTP Server]` section from the Primary instance's
    configuration file (by default, `virtuoso.ini` ) to the
    configuration file of each Subordinate instance:

    ``` programlisting
    [HTTPServer]
    ServerPort                  = 8890
    ServerRoot                  = ../vsp
    DavRoot                     = DAV
    EnabledDavVSP               = 0
    HTTPProxyEnabled            = 0
    TempASPXDir                 = 0
    DefaultMailServer           = localhost:25
    MaxClientConnections        = 5
    MaxKeepAlives               = 10
    KeepAliveTimeout            = 10
    MaxCachedProxyConnections   = 10
    ProxyConnectionCacheTimeout = 15
    HTTPThreadSize              = 280000
    HttpPrintWarningsInOutput   = 0
    Charset                     = UTF-8
    ;HTTPLogFile                 = logs/http.log
    MaintenancePage             = atomic.html
    EnabledGzipContent          = 1
    ```

2.  Edit the `ServerPort` parameter to make it unique on the machine
    hosting this instance; i.e., if a subordinate instance is running on
    same physical node as the primary instance, then the subordinate's
    HTTP port must to be changed (from 8890, for instance) to a unique
    port (e.g., 8891).

3.  Install the Virtuoso Conductor to enable HTTP Administration of the
    instance being configured. Note: if the subordinate instance is not
    on the same machine as the primary instance, then the vad directory
    may also need to be copied from the primary instance to the
    subordinate instance.:

    ``` programlisting
    SQL> vad_install ('../vad/conductor_dav.vad', 0);
    SQL_STATE  SQL_MESSAGE
    VARCHAR  VARCHAR
    _______________________________________________________________________________

    00000    No errors detected
    00000    Installation of "Virtuoso Conductor" is complete.
    00000    Now making a final checkpoint.
    00000    Final checkpoint is made.
    00000    SUCCESS

    6 Rows. -- 10263 msec.
    SQL>
    ```

</div>

</div>

<div id="clusterstcnfconfnodesconfigservice" class="section">

<div class="titlepage">

<div>

<div>

#### Install and configure HTTP services on each instance

</div>

</div>

</div>

<span class="emphasis">*Step 2*</span> : Install and configure HTTP
services on each instance

Any HTTP services required on the subordinate instance will need to
specifically installed or configured on that physical node. For example,
the Virtuoso default SPARQL endpoint (`/sparql` ) may be configured by:

<div class="orderedlist">

1.  Log in into the Virtuoso Conductor http://hostname:port/conductor :

    <div class="figure-float">

    <div id="clst1" class="figure">

    **Figure 2.185. Configure SPARQL Endpoint: log in**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: log in](images/ui/cluster1.jpg)

    </div>

    </div>

    </div>

      

    </div>

2.  Go the the Web Application Server -\> Virtual Domains & Directories
    tab:

    <div class="figure-float">

    <div id="clst2" class="figure">

    **Figure 2.186. Configure SPARQL Endpoint: Virtual Domains and
    Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: Virtual Domains and
    Directories](images/ui/cluster2.jpg)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the New Directory Action for the Default Web Site HTTP host:

    <div class="figure-float">

    <div id="clst3" class="figure">

    **Figure 2.187. Configure SPARQL Endpoint: new directory**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: new directory](images/ui/cluster3.jpg)

    </div>

    </div>

    </div>

      

    </div>

4.  Select the Type radio button and SPARQL access point item from the
    drop down list box:

    <div class="figure-float">

    <div id="clst4" class="figure">

    **Figure 2.188. Configure SPARQL Endpoint: set type SPARQL**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: set type
    SPARQL](images/ui/cluster4.jpg)

    </div>

    </div>

    </div>

      

    </div>

5.  Click "Next".

6.  Enter /sparql as the Path param in the Virtual Directory Information
    section and click Save Changes:

    <div class="figure-float">

    <div id="clst5" class="figure">

    **Figure 2.189. Configure SPARQL Endpoint: set /sparql virtual
    directory**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: set /sparql virtual
    directory](images/ui/cluster5.jpg)

    </div>

    </div>

    </div>

      

    </div>

7.  The SPARQL endpoint will not be accessible on
    http://hostname:port/sparql the the newly configured slave nodes:

    <div class="figure-float">

    <div id="clst6" class="figure">

    **Figure 2.190. Configure SPARQL Endpoint: SPARQL Endpoint**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Configure SPARQL Endpoint: SPARQL
    Endpoint](images/ui/cluster6.jpg)

    </div>

    </div>

    </div>

      

    </div>

8.  Further details on SPARQL endpoint configuration can be found in
    <a href="rdfsparqlprotocolendpoint.html#rdfsupportedprotocolendpoint"
    class="link" title="Service Endpoint">Service Endpoint</a>
    documentation section.

9.  Typical Virtuoso server log output from a slave node when started,
    showing the HTTP server running on port 8890, being:

    ``` programlisting
    20:12:49 OpenLink Virtuoso Universal Server
    20:12:49 Version 07.10.3209-pthreads for Linux as of Apr 26 2014
    20:12:49 uses parts of OpenSSL, PCRE, Html Tidy
    20:12:49 Registered to OpenLink Virtuoso (Internal Use)
    20:12:49 Personal Edition license for 500 connections
    20:12:49 Issued by OpenLink Software
    20:12:49 This license will expire on Sun May 17 06:18:35 2015 GMT
    20:12:49 Enabled Cluster Extension
    20:12:49 Enabled Column Store Extension
    20:12:57 Database version 3126
    20:12:57 SQL Optimizer enabled (max 1000 layouts)
    20:12:58 Compiler unit is timed at 0.000208 msec
    20:12:58 Roll forward started
    20:12:58 Roll forward complete
    20:12:59 Checkpoint started
    20:12:59 Checkpoint finished, log reused
    20:12:59 HTTP/WebDAV server online at 8890
    20:12:59 Server online at 12202 (pid 15969)
    ```

</div>

</div>

<div id="clusterstcnfconfnodesconfigload" class="section">

<div class="titlepage">

<div>

<div>

#### Configure load balancing

</div>

</div>

</div>

<span class="emphasis">*Step 3*</span> : Configure load balancing

A reverse-proxy service (like Nginx or Apache) can then be configured
such that requests are proxied across as any or all nodes of the
cluster, to provide the desired load balancing.

</div>

<div id="clusterstcnfconfnodesconfigaddinf" class="section">

<div class="titlepage">

<div>

<div>

#### Additional Information

</div>

</div>

</div>

<div class="itemizedlist">

- Only the Primary Node of an Elastic Cluster may be configured as a
  Publisher for Virtuoso Replication Cluster purposes.

- The <a
  href="http://virtuoso.openlinksw.com/whitepapers/LOD2_D2.1.5_LOD_Cloud_Hosted_On_The_LOD2_Knowledge_Store_Cluster_500B_Triples.pdf"
  class="ulink" target="_top">Virtuoso 500 billion triple Berlin SPARQL
  Benchmark (BSBM) dataset</a> runs were performed on a 24-node Elastic
  Cluster. Each node was configured to provide HTTP services and a
  SPARQL endpoint, and the query load was spread over the entire
  cluster.

</div>

</div>

</div>
