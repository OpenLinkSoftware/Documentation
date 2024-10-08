<div>

<div>

<div>

<div>

## 2.14. Cluster Installation and Configuration

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 2.14.1. Virtuoso Elastic Cluster Installation & Configuration -- Version 7.x

</div>

</div>

</div>

These sections apply to Virtuoso as of version 7.x .

<div>

<div>

<div>

<div>

#### What

</div>

</div>

</div>

Virtuoso 7 and later versions can be configured in Elastic scale out
cluster mode. The data is sharded in a large number of self-contained
partitions. These partitions are divided among a number of database
server processes and can migrate between them.

</div>

<div>

<div>

<div>

<div>

#### Why

</div>

</div>

</div>

An Elastic cluster can be dynamically resized with new partitions or
shards dynamically added to the same or new hardware resources as the
need to increase the size of the scale cluster or relocation of
partitions is required.

</div>

<div>

<div>

<div>

<div>

#### How

</div>

</div>

</div>

This documentation details the steps for the installation and
configuration of a Virtuoso Elastic Cluster on Unix:

<div>

1.  <a href="clusterstcnf.html#clusterstcnfconf7unix" class="link"
    title="Virtuoso 7 Unix installation">Perform Virtuoso 7 Unix
    installation</a>

2.  <a href="clusterstcnf.html#clusterstcnfconf7clsize" class="link"
    title="Determine Elastic Cluster size">Determine Elastic Cluster
    size</a>

3.  <a href="clusterstcnf.html#clusterstcnfconf7enmode" class="link"
    title="Enable Elastic Cluster mode">Enable Elastic Cluster mode</a>

4.  <a href="clusterstcnf.html#clusterstcnfconf7start" class="link"
    title="Start Elastic Cluster">Start Elastic Cluster</a>

5.  <a href="clusterstcnf.html#clusterstcnfconf7split" class="link"
    title="Splitting Cluster nodes across different machines">Splitting
    Cluster nodes across different machines.</a>

</div>

</div>

<div>

<div>

<div>

<div>

#### Virtuoso 7 Unix installation

</div>

</div>

</div>

<span class="emphasis">*Step 1*</span> : Perform Virtuoso 7 Unix
installation

``` programlisting
$ tar xvf virtuoso-universal-server-7.x.tar
x install.sh
x universal-server.taz
$ sh install.sh

- Extracting Virtuoso Universal Server v7.x

- Creating default environment settings

- Creating default database settings
Configuring: database
Creating directory $VIRTUOSO_HOME/database/backup
Installing new virtuoso.ini in $VIRTUOSO_HOME/database
Installing new php.ini in $VIRTUOSO_HOME/database
Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t

- Registering ODBC drivers

- Registering .NET provider for Mono

- Installing VAD packages in database (this can take some time)

- Checking where license should be stored

- Starting OpenLink License Manager

- Checking for initial Virtuoso license

- Starting Virtuoso server instance

- Finalizing installation

This concludes the first part of the installation.

- Attempting to start browser

Please start a browser manually and open the following URL to finalize
the installation process:

     http://cname:8890/install/

Installation completed
$
```

</div>

<div>

<div>

<div>

<div>

#### Determine Elastic Cluster size

</div>

</div>

</div>

<span class="emphasis">*Step 2*</span> : Determine Elastic Cluster size

<div>

1.  Determine how many nodes you want to start the elastic cluster with:
    2, 3, 4, 5, 6, 7, 8 etc. Note: the number of the nodes must be \>= 2

2.  Setup Virtuoso environment and stop default database:

    ``` programlisting
    $ . ./virtuoso-environment.sh
    $ virtuoso-stop.sh
    Shutting down Virtuoso instance in [database]
    $
    ```

3.  Optionally remove the default database such that is does not get
    started with the cluster:

    ``` programlisting
    rm  -rf database
    ```

4.  Full list of supported options for the script
    "virtuoso-mkcluster.sh":

    ``` programlisting
      -cluster-size       Number of nodes in cluster
      -cluster-node       Node number in a cluster
      -cluster-port       Base portnumer for cluster
      -cluster-ipc-port   Base portnumer for cluster IPC
      -cluster_size       Size of the cluster
      -virtuoso_home      Virtuoso home path
    ```

5.  Run the virtuoso-mkcluster.sh script to create the cluster, note the
    default number of nodes is 4, but this can be changed by setting the
    environment variable CLUSTER_SIZE to the required number of nodes to
    be created before running the script:

    ``` programlisting
    $ virtuoso-mkcluster.sh
    Configuring cluster node: 1/4

    Creating directory $VIRTUOSO_HOME/cluster_01
    Creating directory $VIRTUOSO_HOME/cluster_01/backup
    Creating directory $VIRTUOSO_HOME/cluster_01/logs
    Installing new virtuoso.ini in $VIRTUOSO_HOME/cluster_01
    Installing new php.ini in $VIRTUOSO_HOME/cluster_01
    Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t
    Configuring cluster node: 2/4

    Creating directory $VIRTUOSO_HOME/cluster_02
    Creating directory $VIRTUOSO_HOME/cluster_02/backup
    Installing new virtuoso.ini in $VIRTUOSO_HOME/cluster_02
    Removing unneeded sections from virtuoso.ini
    Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t
    Configuring cluster node: 3/4

    Creating directory $VIRTUOSO_HOME/cluster_03
    Creating directory $VIRTUOSO_HOME/cluster_03/backup
    Installing new virtuoso.ini in $VIRTUOSO_HOME/cluster_03
    Removing unneeded sections from virtuoso.ini
    Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t
    Configuring cluster node: 4/4

    Creating directory $VIRTUOSO_HOME/cluster_04
    Creating directory $VIRTUOSO_HOME/cluster_04/backup
    Installing new virtuoso.ini in $VIRTUOSO_HOME/cluster_04
    Removing unneeded sections from virtuoso.ini
    Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t
    $
    ```

6.  In each cluster_XX directory the following the `cluster.ini` files
    are created for cluster internal communication:

    ``` programlisting
    $ more cluster_01/cluster.ini
    [Cluster]
    Threads             = 20
    Master              = Host1
    ThisHost            = Host1
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 1000
    Host1               = localhost:22201
    Host2               = localhost:22202
    Host3               = localhost:22203
    Host4               = localhost:22204
    MaxHosts            = 5
    $ more cluster_02/cluster.ini
    [Cluster]
    Threads             = 20
    Master              = Host1
    ThisHost            = Host2
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 1000
    Host1               = localhost:22201
    Host2               = localhost:22202
    Host3               = localhost:22203
    Host4               = localhost:22204
    MaxHosts            = 5
    $ more cluster_03/cluster.ini
    [Cluster]
    Threads             = 20
    Master              = Host1
    ThisHost            = Host3
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 1000
    Host1               = localhost:22201
    Host2               = localhost:22202
    Host3               = localhost:22203
    Host4               = localhost:22204
    MaxHosts            = 5
    $ more cluster_04/cluster.ini
    [Cluster]
    Threads             = 20
    Master              = Host1
    ThisHost            = Host4
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 1000
    Host1               = localhost:22201
    Host2               = localhost:22202
    Host3               = localhost:22203
    Host4               = localhost:22204
    MaxHosts            = 5
    $
    ```

</div>

</div>

<div>

<div>

<div>

<div>

#### Enable Elastic Cluster mode

</div>

</div>

</div>

<span class="emphasis">*Step 3*</span> : Enable Elastic Cluster mode

<div>

1.  The `cluster.ini` files need to be reconfigured as detailed below
    for elastic cluster and file slicing/sharding to be enabled.

2.  A common file called `cluster.global.ini` can be created and placed
    in the home directory of the Virtuoso installation:

    ``` programlisting
    [Cluster]
    Threads             = 300
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 100
    RDFLoadBytes        = 52428800
    Host1               = localhost:22201
    Host2               = localhost:22202
    Host3               = localhost:22203
    Host4               = localhost:22204
    ```

3.  This file can then be sym-linked to each of the `cluster_XX`
    directories of the cluster, and its content will be merged with the
    `cluster.ini` in the respective directory of each node when starting
    the cluster.

    ``` programlisting
    ln -s cluster.global.ini cluster_01/cluster.global.ini
    ln -s cluster.global.ini cluster_02/cluster.global.ini
    ln -s cluster.global.ini cluster_03/cluster.global.ini
    ln -s cluster.global.ini cluster_04/cluster.global.ini
    ```

4.  Edit each of the the `cluster.ini` files in the `cluster_XX`
    directories as follows to enable, elastic cluster mode:

    ``` programlisting
    $ more cluster_01/cluster.ini
    [Cluster]
    Master              = Host1
    ThisHost            = Host1

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 6
    MaxSlices = 2048

    $ more cluster_02/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host2

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 6
    MaxSlices = 2048

    $ more cluster_03/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host3

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 6
    MaxSlices = 2048

    $ more cluster_04/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host4

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 6
    MaxSlices = 2048
    ```

5.  The `[ELASTIC]` section in the `cluster.ini` files above, enables
    the elastic cluster mode, where multiple `segments` and `stripes` as
    detailed in the standard Virtuoso documentation
    <a href="ch-server.html#ini_striping" class="link"
    title="[Striping]">database striping</a> .

6.  The `Slices` parameter above should be set to the number of hardware
    threads on the CPUs running on. Thus in the example above where it
    is set to 6, this assumes all nodes are running on the same physical
    machine with 12 cores with hyper-threading enabled i.e. 24 threads,
    thus 6 per cluster node.

7.  The `MaxSlices` parameter above sets the the maximum number of
    physical slices in the cluster.

</div>

</div>

<div>

<div>

<div>

<div>

#### Start Elastic Cluster

</div>

</div>

</div>

<span class="emphasis">*Step 4*</span> : Start Elastic Cluster

<div>

1.  Start the Elastic cluster using the standard `virtuoso-start.sh`
    script run from the home directory of the Virtuoso
    installation,which automatically detects the number for nodes to be
    started:

    ``` programlisting

    $ virtuoso-start.sh
    Starting Virtuoso instance in [cluster_01]
    Starting Virtuoso instance in [cluster_02]
    Starting Virtuoso instance in [cluster_03]
    Starting Virtuoso instance in [cluster_04]
    $
    ```

2.  The default SQL port of the master node is 12201, as indicated in
    the virtuoso.ini file of the cluster_01 directory, and can then be
    used for connecting to the newly created cluster and check its
    status to ensure all nodes are online:

    ``` programlisting
    $ isql 12201
    Connected to OpenLink Virtuoso
    Driver: 07.10.3211 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> status('cluster_d');
    REPORT
    VARCHAR
    _______________________________________________________________________________

    Cluster: No samples, Please refresh

    1 Rows. -- 22 msec.
    SQL> status('cluster_d');
    REPORT
    VARCHAR
    _______________________________________________________________________________

    Cluster 4 nodes, 2 s. 5 m/s 0 KB/s  5% cpu 0%  read 0% clw threads 1r 0w 0i buffers 349144 2 d 0 w 0 pfs
    cl 1: 2 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 1r 0w 0i buffers 45391 2 d 0 w 0 pfs
    cl 2: 0 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 0r 0w 0i buffers 43367 0 d 0 w 0 pfs
    cl 3: 0 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 0r 0w 0i buffers 50129 0 d 0 w 0 pfs
    cl 4: 0 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 0r 0w 0i buffers 39383 0 d 0 w 0 pfs

    5 Rows. -- 22 msec.
    SQL>
    SQL> cl_ping(1,500, 1000);

    Done. -- 7 msec.
    SQL> cl_ping(2,500, 1000);

    Done. -- 52 msec.
    SQL> cl_ping(3,500, 1000);

    Done. -- 60 msec.
    SQL> cl_ping(4,500, 1000);

    Done. -- 51 msec.
    SQL>
    ```

3.  The `database.log` of the master node can be checked to verify the
    Elastic cluster mode has been enable on server startup, which will
    contain the entry <span class="emphasis">*PL LOG: Elastic cluster
    setup*</span> :

    ``` programlisting
    $ more cluster_01/database.log

                    Thu Oct 09 2014
    05:11:49 { Loading plugin 1: Type `plain', file `wikiv' in `../hosting'
    05:11:49   WikiV version 0.6 from OpenLink Software
    05:11:49   Support functions for WikiV collaboration tool
    05:11:49   SUCCESS plugin 1: loaded from ../hosting/wikiv.so }
    05:11:49 { Loading plugin 2: Type `plain', file `mediawiki' in `../hosting'
    05:11:49   MediaWiki version 0.1 from OpenLink Software
    05:11:49   Support functions for MediaWiki collaboration tool
    05:11:49   SUCCESS plugin 2: loaded from ../hosting/mediawiki.so }
    05:11:49 { Loading plugin 3: Type `plain', file `creolewiki' in `../hosting'
    05:11:49   CreoleWiki version 0.1 from OpenLink Software
    05:11:49   Support functions for CreoleWiki collaboration tool
    05:11:49   SUCCESS plugin 3: loaded from ../hosting/creolewiki.so }
    05:11:49 { Loading plugin 4: Type `plain', file `im' in `../hosting'
    05:11:49   IM version 0.61 from OpenLink Software
    05:11:49   Support functions for Image Magick 6.8.1
    05:11:49   SUCCESS plugin 4: loaded from ../hosting/im.so }
    05:11:49 { Loading plugin 5: Type `plain', file `wbxml2' in `../hosting'
    05:11:49   WBXML2 version 0.9 from OpenLink Software
    05:11:49   Support functions for WBXML2 0.9.2 Library
    05:11:49   SUCCESS plugin 5: loaded from ../hosting/wbxml2.so }
    05:11:49 { Loading plugin 6: Type `attach', file `libphp5.so' in `../hosting'
    05:11:49   SUCCESS plugin 6: loaded from ../hosting/libphp5.so }
    05:11:49 { Loading plugin 7: Type `Hosting', file `hosting_php.so' in `../hosting'
    05:11:49   Hosting version 3208 from OpenLink Software
    05:11:49   PHP engine version 5.3.21
    05:11:49   SUCCESS plugin 7: loaded from ../hosting/hosting_php.so }
    05:11:49 { Loading plugin 8: Type `plain', file `qrcode' in `../hosting'
    05:11:49   QRcode version 0.1 from OpenLink Software
    05:11:49   Support functions for ISO/IEC 18004:2006, using QR Code encoder (C) 2006 Kentaro Fukuchi <fukichi@megaui.net>
    05:11:49   SUCCESS plugin 8: loaded from ../hosting/qrcode.so }
    05:11:49 OpenLink Virtuoso Universal Server
    05:11:49 Version 07.10.3211-pthreads for Linux as of Oct  6 2014
    05:11:49 uses parts of OpenSSL, PCRE, Html Tidy
    05:11:51 SQL Optimizer enabled (max 1000 layouts)
    05:11:52 Compiler unit is timed at 0.000403 msec
    05:12:03 Checkpoint started
    05:12:04 Roll forward started
    05:12:04 Roll forward complete
    05:12:07 PL LOG: Elastic cluster setup
    05:12:08 Checkpoint started
    05:12:09 Checkpoint finished, log reused
    05:12:11 Checkpoint started
    05:12:12 Checkpoint finished, log reused
    05:12:12 PL LOG: new clustered database:Init of RDF
    05:12:23 Checkpoint started
    05:12:25 Checkpoint finished, log reused
    05:12:50 PL LOG: Installing Virtuoso Conductor version 1.00.8727 (DAV)
    05:12:51 Checkpoint started
    05:12:53 Checkpoint finished, log reused
    05:13:23 Checkpoint started
    05:13:25 Checkpoint finished, log reused
    05:13:26 Checkpoint started
    05:13:26 Checkpoint finished, log reused
    05:13:28 HTTP/WebDAV server online at 8890
    05:13:28 Server online at 12201 (pid 15211)
    05:13:29 ZeroConfig registration CLUSTER (MASALA)
    ```

4.  The cluster node directories can also be checked, where the database
    slice/shard files i.e. `database.db.X, database.db.Y, database.db.Z`
    can be seen:

    ``` programlisting
    $ ls -ltr cluster_01
    total 2322804
    drwxr-xr-x. 2 virtuoso virtuoso      4096 Oct  9 04:26 backup
    drwxr-xr-x. 2 virtuoso virtuoso      4096 Oct  9 04:26 logs
    -rwxr-xr-x. 1 virtuoso virtuoso     70607 Oct  9 04:26 php.ini
    lrwxrwxrwx. 1 virtuoso virtuoso        24 Oct  9 04:26 virtuoso -> ..//bin/virtuoso-iodbc-t
    -rw-r--r--. 1 virtuoso virtuoso         0 Oct  9 04:26 database.pxa
    -rwxr-xr-x. 1 virtuoso virtuoso      6594 Oct  9 04:33 virtuoso.ini
    -rw-r--r--. 1 virtuoso virtuoso       137 Oct  9 05:03 cluster.ini
    lrwxrwxrwx. 1 virtuoso virtuoso        21 Oct  9 05:04 cluster.global.ini -> ../cluster.global.ini
    drwxr-xr-x. 2 virtuoso virtuoso    131072 Oct  9 05:37 dump
    -rw-r--r--. 1 virtuoso virtuoso     32915 Oct  9 06:55 database.2pc
    -rw-r--r--. 1 virtuoso virtuoso        25 Oct 10 02:24 database.map
    -rw-r--r--. 1 virtuoso virtuoso  56623104 Oct 10 03:23 database-temp.db
    -rw-r--r--. 1 virtuoso virtuoso 824180736 Oct 10 05:10 database.db.16
    -rw-r--r--. 1 virtuoso virtuoso 723517440 Oct 10 05:10 database.db.8
    -rw-r--r--. 1 virtuoso virtuoso 740294656 Oct 10 05:10 database.db.0
    -rw-r--r--. 1 virtuoso virtuoso  33554432 Oct 10 05:10 database.db
    -rw-r--r--. 1 virtuoso virtuoso         0 Oct 10 05:10 database.trx
    -rw-r--r--. 1 virtuoso virtuoso     34234 Oct 10 05:10 database.log
    $
    ```

</div>

</div>

<div>

<div>

<div>

<div>

#### Splitting Cluster nodes across different machines

</div>

</div>

</div>

<span class="emphasis">*Step 5*</span> : Splitting Cluster nodes across
different machines

<div>

1.  To split the node across across physical machines for better scale
    out performance, scalability and growth, simply perform a parallel
    Virtuoso installation on the additional physical machines and move
    the cluster nodes required to the designated machine. Example, for
    the default 4 node cluster to be split across two identical machines
    it would make sense to split 2 nodes across each machine, thus you
    would move say the cluster_03 and cluster_04 directory nodes to the
    new machine (removing them from the original). The
    `cluster.global.ini` file on each node would then need to be updated
    to set the HostXX parameters to point to the new locations for nodes
    03 and 04:

    ``` programlisting
    $ more cluster.global.ini

    [Cluster]
    Threads             = 300
    ReqBatchSize        = 10000
    BatchesPerRPC       = 4
    BatchBufferBytes    = 20000
    LocalOnly           = 2
    MaxKeepAlivesMissed = 100
    RDFLoadBytes        = 52428800
    Host1               = hostname1:22201
    Host2               = hostname1:22202
    Host3               = hostname2:22203
    Host4               = hostname2:22204

    Machine 1 (hostname1)

    $ more cluster_01/cluster.ini
    [Cluster]
    Master              = Host1
    ThisHost            = Host1

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 12
    MaxSlices = 2048

    $ more cluster_02/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host2

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 12
    MaxSlices = 2048

    Machine 2 (hostname2)

    $ more cluster_03/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host3

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 12
    MaxSlices = 2048

    $ more cluster_04/cluster.ini

    [Cluster]
    Master              = Host1
    ThisHost            = Host4

    [ELASTIC]
    Segment1 = 4G, database.db = q1
    Slices = 12
    MaxSlices = 2048
    ```

2.  Note assuming the same number of CPU threads on each machine i.e.
    24, then the `Slices` param can be doubled to 12 for each node in
    `cluster.ini` , as above.

3.  The cluster nodes can then be started on each machine, with 2 nodes
    being started on each in this case to form the cluster:

    ``` programlisting
    Machine 1 (hostname1)

    $ virtuoso-start.sh
    Starting Virtuoso instance in [cluster_01]
    Starting Virtuoso instance in [cluster_02]
    $

    Machine 2 (hostname2)

    $ virtuoso-start.sh
    Starting Virtuoso instance in [cluster_03]
    Starting Virtuoso instance in [cluster_04]
    $
    ```

4.  To stop the cluster use the standard `virtuoso-stop.sh` script on
    each machine, which automatically detects the number for nodes to be
    stopped:

    ``` programlisting
    Machine 1 (hostname1)

    $ virtuoso-stop.sh
    Stopping Virtuoso instance in [cluster_01]
    Stopping Virtuoso instance in [cluster_02]

    Machine 2 (hostname2)

    $ virtuoso-stop.sh
    Stopping Virtuoso instance in [cluster_03]
    Stopping Virtuoso instance in [cluster_04]
    $
    ```

5.  The `cl_exec('shutdown')` command can also be run from `isql` on any
    node of the cluster to shutdown all nodes at once:

    ``` programlisting
    $ isql 12201
    Connected to OpenLink Virtuoso
    Driver: 07.10.3211 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> cl_exec ('checkpoint');

    Done. -- 2487 msec.
    SQL> cl_exec ('shutdown');

    *** Error 08S01: VD CL065: Lost connection to server
    at line 2 of Top-Level:
    cl_exec ('shutdown')
    $
    ```

</div>

</div>

</div>

</div>
