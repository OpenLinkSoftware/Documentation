<div id="clusteroperationdiagnostics" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.7. Cluster Network Diagnostics and Metrics

</div>

</div>

</div>

Proper cluster operation requires that each process in the cluster be
capable of initiating a connection to any other process. This may be
prevented by firewall settings or the like. If a connection can be
initiated from host 1 to host 2, it does not follow that host 2 can
initiate a connection to host 1. These situations can lead to
intermittent errors. These errors can be difficult to pinpoint since
operations from host 2 to host 1 can work for most of the time if there
is a connection available that was already established by the other
host.

To check point to point connectivity, do the following on each host in
turn, with no other activity on the cluster:

Log in to the SQL port of the host.

``` programlisting
SQL> cl_reset ();
SQL status ('cluster');
SQL status ('cluster');
```

The first status ('cluster') may show no samples if this is the first
time it is called. At the second call you should see a status line that
does not contain mentions of any host being down.

The cl_reset function disconnects any connections to other cluster hosts
from this host. This makes sure that a fresh connection will be started
for the status command.

<div id="clusteroperationdiagnosticsnm" class="section">

<div class="titlepage">

<div>

<div>

#### net_meter utility

</div>

</div>

</div>

The net_meter utility is a SQL stored procedure that measures the
aggregate throughput of a cluster network with different types of
workload.

First load the netmeter.sql file on the master node of the cluster.

``` programlisting
SQL> load netmeter.sql;
```

Then run

``` programlisting
SQL> net_meter (1, 1000, 1000, 1);
```

This returns a single result row with two numbers: The count of round
trips per second and the throughput in megabytes per second.

``` programlisting
net_meter ( in n_threads int,
            in n_batches int,
            in bytes int,
            in ops_per_batch int)
```

This SQL procedure runs a network test procedure on every host of the
cluster. The network test procedure sends a message to every other host
of the cluster and waits for the replies from each host. After the last
reply is received the action is repeated. This results in a symmetrical
load of the network, all points acting as both clients and servers to
all other points.

The parameters have the following meaning:

<div class="itemizedlist">

- <span class="emphasis">*n_threads*</span>

  \- The number of network test instances started on each host. A value
  of 4 on a cluster of 4 hosts would result in a total of 16 network
  test procedures spread over 4 processes.

- <span class="emphasis">*n_batches*</span>

  \- The number of message exchanges done by each network test
  procedure. A message exchange consists of sending one request to every
  other host of the cluster and of waiting for all to have replied.

- <span class="emphasis">*bytes*</span>

  \- The number of bytes sent to each host in each message exchange. The
  reply from each host has the same number of bytes.

- <span class="emphasis">*ops_per_batch*</span>

  \- This causes each message batch to contain several operations. In
  practice this is a multiplier on the number of bytes.

</div>

</div>

<div id="clusteroperationdiagnosticscp" class="section">

<div class="titlepage">

<div>

<div>

#### cl_ping

</div>

</div>

</div>

``` programlisting
cl_ping ( in target_host int,
          in n_pings int,
          in bytes_per_ping int)
```

This built-in function measures raw point to point network throughput.
Whereas net_meter includes a more complex n to n point traffic pattern
and scheduling of functions on multiple threads, cl_ping does not
involve anything except a process to process connection and no thread
switching, transaction contexts or other overhead.

</div>

<div id="clusteroperationdiagnosticsci" class="section">

<div class="titlepage">

<div>

<div>

#### cl_io_report

</div>

</div>

</div>

This built in function prints out a summary of the cluster connections
of the host on which it is run. The output goes to the server process'
standard output. This lists the bytes in and out as well as the file
descriptor numbers of any connections this host has with any other host.

</div>

</div>
