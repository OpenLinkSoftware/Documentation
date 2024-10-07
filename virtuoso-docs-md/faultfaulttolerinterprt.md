<div id="faultfaulttolerinterprt" class="section">

<div class="titlepage">

<div>

<div>

### 6.4.7. Interpreting Status Messages

</div>

</div>

</div>

There are special error codes and status reports dealing with cluster
failures.

The status function with an argument of 'cluster_d' shows a host by host
report of the cluster:

``` programlisting
SQL> status ('cluster_d');
```

If all is normal, the message is as described in the cluster
administration section. If some hosts are down, meaning that they do not
accept network connections at the cluster port, these are first listed
as being down. Then follows the summary status line and a status line
for all the hosts that can be connected to.

A host being contactable over the cluster protocol does not mean that it
is online or in sync with the rest.

If a physical cluster has no logical clusters that are in duplicate,
there is no redundancy, except for the built in redundancy of schema.

If a host is not in the online state, an extra line in the cluster
status report describes the state in more detail. The state can be one
of:

<div class="itemizedlist">

- roll forward - The host is recovering from log. The count of
  transactions replayed to date is shown after this.

- removed - The host is considered down and no attempt is made to
  contact it until it explicitly rejoins the cluster. This is controlled
  with the cl_host_enable function.

</div>

It is possible that the host considers itself in one state and the host
showing the report thinks that it is in some other state. If this is so,
the status report mentions it.

Applications see cluster failures through the following SQL states:

<div class="itemizedlist">

- 08C01 - A host cannot be contacted or can be contacted but is not in
  the online state

- 08C02 - An operation that previously had a connection to a host finds
  that it no longer has the connection.

- 08C03 - A master only operation was tried on a non-master. Indicates
  possibility of divergent understanding of master succession. This is
  expected to reset itself.

- 08C04 - A write was attempted on a partition that is flagged read
  only, as per cl_read_only.

- 08C05 - A request was refused because the host serving the request
  thinks the requesting host is not admitted to cluster as per
  cl_host_enable, i.e. was removed and not reintroduced.

- 08C06 - A cluster operation was not made because the host thinks it is
  not joined to the cluster either because it has not finished roll
  forward or because it is marked removed by ch_host_enable.

</div>

</div>
