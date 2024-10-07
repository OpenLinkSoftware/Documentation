<div id="clusternetmeter" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.35. How can I use the net_meter utility before starting the ingestion to a cluster?

</div>

</div>

</div>

The <a href="ch-overview.html" class="link"
title="Chapter 1. Overview">net_meter</a> utility is a SQL procedure
that runs a network test procedure on every host of the cluster. The
network test procedure sends a message to every other host of the
cluster and waits for the replies from each host. After the last reply
is received the action is repeated. This results in a symmetrical load
of the network, all points acting as both clients and servers to all
other points.

``` programlisting
net_meter (
  in n_threads int,
  in n_batches int,
  in bytes int,
  in ops_per_batch int)
```

The parameters have the following meaning:

<div class="itemizedlist">

- <span class="emphasis">*n_threads*</span>

  : The number of network test instances started on each host. A value
  of 4 on a cluster of 4 hosts would result in a total of 16 network
  test procedures spread over 4 processes.

- <span class="emphasis">*n_batches*</span>

  : The number of message exchanges done by each network test procedure.
  A message exchange consists of sending one request to every other host
  of the cluster and of waiting for all to have replied.

- <span class="emphasis">*bytes*</span>

  : The number of bytes sent to each host in each message exchange. The
  reply from each host has the same number of bytes.

- <span class="emphasis">*ops_per_batch*</span>

  : This causes each message batch to contain several operations. In
  practice this is a multiplier on the number of bytes.

</div>

<div id="clusternetmeterex" class="section">

<div class="titlepage">

<div>

<div>

#### Example

</div>

</div>

</div>

Assume anuser has run 2 sets of tests on a cluster:

The first one was 1 thread, 1000 batches, 1000 bytes per exchange, 1
operation per batch:

``` programlisting
SQL> net_meter (1, 1000, 1000, 1);

round_trips     MBps
REAL            REAL

_______________________________________

1245.393315542000254  2.489418401123078

1 Rows. -- 39345 msec.
```

resulted in a measured throughput of 2.5 MBps

The second one was 1 thread, 5000 batches, 10000 bytes per exchange, 1
operation per batch:

``` programlisting
SQL> net_meter (1, 5000, 10000, 1);

round_trips     MBps
REAL            REAL

___________________________________________

15915.291672080031181  305.017186586494738

1 Rows. -- 15394 msec.
```

resulted in a measured throughput of 305 MBps.

This indicates that the user's network is slow when sending multiple
short messages.

When using the ingestion you should check the:

``` programlisting
status('cluster');
```

command a few times and check the XX KB/s amount which should be around
or above the 2500 mark.

</div>

</div>
