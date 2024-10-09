<div>

<div>

<div>

<div>

### 2.14.2. Virtuoso default Cluster Installation and Configuration

</div>

</div>

</div>

These sections apply to Virtuoso as of version 6.x and higher.

<div>

1.  Run the Virtuoso 6 Unix ( MacOsX) installer to perform a default
    installation:

    ``` programlisting
    $ tar xvf virtuoso-universal-server-6.1.tar
    x install.sh
    x universal-server.taz
    $ sh install.sh

    - Extracting Virtuoso Universal Server v6.1

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

2.  Determine how many nodes you want to start the cluster with: 2, 3,
    4, 5, 6, 7, 8 etc.

    <span class="emphasis">*Note*</span>

    : the number of the nodes should be \>= 2

3.  Setup Virtuoso environment and stop default database:

    ``` programlisting
    $ . ./virtuoso-environment.sh
    $ virtuoso-stop.sh
    Shutting down Virtuoso instance in [database]
    $
    ```

4.  Optionally remove the default database such that is does not get
    started with the cluster:

    ``` programlisting
    rm  -rf database
    ```

5.  Full list of supported options for the script

    <span class="emphasis">*"virtuoso-mkcluster.sh"*</span>

    :

    ``` programlisting
      -cluster-size       Number of nodes in cluster
      -cluster-node       Node number in a cluster
      -cluster-port       Base portnumer for cluster
      -cluster-ipc-port   Base portnumer for cluster IPC
      -cluster_size       Size of the cluster
      -virtuoso_home      Virtuoso home path
    ```

6.  Run the virtuoso-mkcluster.sh script to create the cluster, note the
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

7.  For each of the cluster_XX directories created edit the cluster.ini
    file and set the HostXX parameter to the hostname:portno to be used
    by the cluster nodes for internal communication.

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
    Host1               = hostname:22201
    Host2               = hostname:22202
    Host3               = hostname:22203
    Host4               = hostname:22204
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
    Host1               = hostname:22201
    Host2               = hostname:22202
    Host3               = hostname:22203
    Host4               = hostname:22204
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
    Host1               = hostname:22201
    Host2               = hostname:22202
    Host3               = hostname:22203
    Host4               = hostname:22204
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
    Host1               = hostname:22201
    Host2               = hostname:22202
    Host3               = hostname:22203
    Host4               = hostname:22204
    MaxHosts            = 5
    $
    ```

8.  Start the cluster using the standard virtuoso-start.sh script which
    automatically detects the number for nodes to be started:

    ``` programlisting
    $ virtuoso-start.sh
    Starting Virtuoso instance in [cluster_01]
    Starting Virtuoso instance in [cluster_02]
    Starting Virtuoso instance in [cluster_03]
    Starting Virtuoso instance in [cluster_04]
    $
    ```

9.  The default SQL port of the master node is 12201, as indicated in
    the virtuoso.ini file of the cluster_01 directory, and can then be
    used for connecting to the newly created cluster and check its
    status to ensure all nodes are online:

    ``` programlisting
    $ isql 12201
    Connected to OpenLink Virtuoso
    Driver: 06.01.3127 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> status ('cluster');
    REPORT
    VARCHAR
    _______________________________________________________________________________

    Cluster 4 nodes, 4 s. 1 m/s 0 KB/s  0% cpu 0%  read 0% clw threads 1r 0w 0i buffers 2981 0 d 0 w 0 pfs

    1 Rows. -- 7 msec.
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

10. To split the node across across physical machines for better
    performance and scalability, simply perform a parallel Virtuoso
    installation on the additional physical machines and move the
    cluster nodes required to the designated machine. Example, for the
    default 4 node cluster to be split across two identical machines it
    would make sense to split 2 nodes across each machine, thus you
    would move say the cluster_03 and cluster_04 directory nodes to the
    new machine (removing them from the original). The cluster.ini file
    on each node would then need to be updated to set the HostXX
    parameters to point to the new locations for nodes 03 and 04:

    ``` programlisting
    Machine 1 (hostname1)

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
    Host1               = hostname1:22201
    Host2               = hostname1:22202
    Host3               = hostname2:22203
    Host4               = hostname2:22204
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
    Host1               = hostname1:22201
    Host2               = hostname1:22202
    Host3               = hostname2:22203
    Host4               = hostname2:22204
    MaxHosts            = 5
    $

    Machine 2 (hostname2)

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
    Host1               = hostname1:22201
    Host2               = hostname1:22202
    Host3               = hostname2:22203
    Host4               = hostname2:22204
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
    Host1               = hostname1:22201
    Host2               = hostname1:22202
    Host3               = hostname2:22203
    Host4               = hostname2:22204
    MaxHosts            = 5
    $
    ```

11. The nodes can then be started on each machine, with 2 nodes being
    started on each in this case to form the cluster:

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

12. To stop the cluster use the standard virtuoso-stop.sh script which
    automatically detects the number for nodes to be stopped:

    ``` programlisting
    $ virtuoso-stop.sh
    Stopping Virtuoso instance in [cluster_01]
    Stopping Virtuoso instance in [cluster_02]
    Stopping Virtuoso instance in [cluster_03]
    Stopping Virtuoso instance in [cluster_04]
    $
    ```

</div>

</div>
