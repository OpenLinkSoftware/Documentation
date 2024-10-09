<div>

<div>

<div>

<div>

### 6.4.8. Administration API

</div>

</div>

</div>

This section documents the SQL procedures used for managing failures and
setting hosts on and off line. These are stored procedures for DBA group
users only, all in the DB.DBA. qualifier/owner. The dba will typically
not call these directly. These are intended for use by management
scripts and internal functions.

``` programlisting
cl_host_enable (in host_no int, in flag int)
```

The host_no is the number as in the cluster.ini Host\<nn\> entries. The
flag is 1 for joined and 0 for removed.

This controls whether a host is excluded from operations. Only a
previously excluded host can be rejoined to the cluster with this
function. This is not for adding new hosts. A host will be excluded from
operations if it is long term unavailable,e.g. is running on failed
hardware. If the unavailability is only for the time of a restart,
removing the host is not generally practical.

If a host is rejoined to its cluster, then the caller of this function
asserts that the joining host is up to date. If it were not up to date
one could get discrepancy between copies of partitions, which is a loss
of integrity and can be hard to detect. Being up to date means, for all
objects of all replicated logical clusters where this host participates,
having the exact same logical content in the host's (i.e. server
process') database files as in the databases of the hosts which are in
the same group as the rejoining host.

This function must be called on a master host that is itself in the
online state. The setting is recorded on all master hosts. All
non-master hosts update their copy of this setting from the first
available master in the master succession. There is always at least one
master node that is in the online state. If they all are offline, then
the cluster in general is unavailable and the last one cannot be removed
from online state with cl_host_enable.

This function aborts all pending transactions, so that the whole cluster
has no uncommitted state. This puts all the hosts that can be reached
into an atomic state where they only accept operations from the master
who initiated the atomic state. If the atomic state cannot be obtained
within a timeout, the operation fails and can be retried. This is
possible if two hosts attempt to get an atomic state and deadlock or if
rollback of pending state takes longer than the timeout. Once in atomic
state, all masters record the change in cluster join status and all
non-masters get a notification of the change. Once all these are
acknowledge and logged, the atomic section ends.

An application whose transaction was aborted in this manner will see
this as a deadlock, with the 40001 SQL state and a message mentioning
global atomic state.

``` programlisting
cl_read_only (in host_no int, in flag int)
```

This sets the partitions of which host host_no has a copy into read only
state. A flag of 1 means read only, 0 means read write. This does not
abort transactions but will prevent any new updates touching the
partition. Transactions with existing uncommitted state in the partition
can commit. To abort all transactions first, use this with \_\_atomic
(1) first and then \_\_atomic (0) to finish the atomic state. This is a
volatile state and does not survive server restart. This is intended for
use in bringing copies of partitions up to date, which is a process that
would have to be retried anyway if interrupted by failure.

``` programlisting
__atomic (in flag int)
```

This places the cluster in global atomic mode. A flag of 1 starts this
and a flag of 0 finishes this. Row autocommit is also implicitly
enabled. During such time, no host of the cluster accepts connection
through web or SQL ports and only serves requests made by the
transaction which started the atomic section with \_\_atomic (1). When
an atomic section starts, all transactions are aborted and are
guaranteed to all be rolled back upon successful completion of
\_\_atomic (1). New transactions will also not start until \_\_atomic
(0) is called. Starting an atomic section may fail by timeout if
rollback takes too long or if two competing \_\_atomic(1) requests
deadlock with each other.

``` programlisting
cl_control (in host_no int, in op varchar, in new_value any := null)
```

This returns the value associated with cluster related settings. If a
new value is specified the old value is returned and the new value is
set.

The op specifies the setting. It is one of:

<div>

- cl_master_list - succession of master hosts as an array of host
  numbers. Read only.

- cl_host_list- Array of all host numbers. Read only.

- ch_group_list - List of host numbers of hosts which occur in the same
  group with host no. These are the hosts which share a partition with
  host no according to at least one create cluster statement. Read only.

- cl_host_map - String with a character per each host number up to the
  maximum existing host number. The character is represents the status
  as known by the host on which thus function is called. The new_value
  argument can be specified for changing this setting.

- ch_status - Returns/sets the status of host no as known by this host.

- cl_master_host - Return/set the host number used by this host for
  master only requests.

</div>

The status of a host is one of:

<div>

- 0 - online

- 1 - removed

- 2 - temporarily offline

- 4 - pending roll forward

- 7 - host number is not used

</div>

<div>

<div>

<div>

<div>

#### Cluster Control Utility

</div>

</div>

</div>

A Virtuoso cluster does not per se require a separate administration
utility. It will be online and usable when all the constituent servers
are online. In the event of using fault tolerance, the
<span class="emphasis">*clctl utility*</span> should however be used for
managing servers going offline and rejoining the cluster. This is needed
in order to ensure that the operation sequences for marking a server
process as failed and for bringing a failed server process back online
are correctly carried out. In the following section, we use the word
host to mean an individual database server process. Several of these may
exist on a single computer.

<span class="emphasis">*clctl*</span> has a configuration file named
<span class="emphasis">*cl.cfg*</span> , which it reads from its working
directory. This file describes the layout of the Virtuoso cluster being
managed.

This file can be filled in manually after the cluster has been set up.
It is only used by <span class="emphasis">*clctl*</span> .

Before using clctl, the cl.cfg file must be created, see the
<a href="faultfaulttoleradmapi.html#faultfaulttoleradmapiutilityconf"
class="link" title="The cl.cfg Configuration File">cl.cfg Configuration
File</a> section below. Note that ssh is used for executing commands on
remote machines. This requires ssh to be set up so as not to require
manual login.

The database file names for the database files of two hosts that are
each others' online replicas must be the same and there must be an equal
number of stripes.

<span class="emphasis">*Note*</span> :
<span class="emphasis">*clctl*</span> can presently be used only if the
database consists of a single file plus transaction log file in the same
directory. These must be named
<span class="emphasis">*virtuoso.db*</span> and
<span class="emphasis">*virtuoso.trx*</span> . The hostname and
directory is given separately for each host in
<span class="emphasis">*cl.cfg*</span> .

<span class="emphasis">*clctl*</span> has the following subcommands:

``` programlisting
clctl start
```

Starts all the hosts of the cluster.

``` programlisting
clctl start <host>
```

Starts all a given node of the cluster.

``` programlisting
clctl stop
```

Shuts down all the hosts of the cluster.

``` programlisting
clctl stop <host>
```

Shuts down a given node of the cluster.

``` programlisting
clctl status
```

Displays a one line status summary for each host.

``` programlisting
clctl ro <host>
```

Sets a node of the cluster in a read-only mode

``` programlisting
clctl rw <host>
```

Sets a node of the cluster in a read-write mode

``` programlisting
clctl disable <host>
```

This notifies the cluster that \<host\> identified by its number in the
cl.cfg file has failed and that the cluster will continue normal
operation without this host.

The host will have to be rebuilt based on the state of its replica
before it can rejoin the cluster. This is done with the clctl rebuild
command.

If there is a transient failure like an unplugged network cable or a
reboot, disabling the temporarily failed host does not always make sense
because rebuilding it may involve copying hundreds of GB of data which
can take significant time.

After the failure, the cluster is available for reading but is not
available for writing until the failed host is either back online or
disabled with this command.

<span class="emphasis">*Example:*</span>

``` programlisting
clctl disable 3
```

Means that Host3 as defined in cl.cfg is removed and will have to be
rejoined to the cluster with:

``` programlisting
clctl rebuild 3
```

``` programlisting
clctl rebuild <host>
```

Once a host has been removed from the cluster with clctl disable, it can
be brought back online with this command. The host is identified by its
number in the cl.cfg file. This command automates the following
operations:

<div>

- Make a log checkpoint on the online replica of the host being rebuilt.
  This allows the database files to be copied to serve as a basis of the
  database of the recovering host. During this copy the replica will not
  do log checkpoints, so that the database file copy is clean. During
  this time the cluster is available for writing.

- After the database files are copied, the recovering host is started.
  At this point, there is a read only window while the recovering host
  replays the transactions its online replica has accumulated while its
  database was being copied. When the replay of the replica's
  transaction log is complete, the recovering host is marked to be a
  part of the cluster and writing is re-enabled.

- To ensure integrity of the recovered cluster, these operations have to
  be performed in this exact sequence, hence the clctl utility should be
  used for this.

</div>

``` programlisting
clctl enable <host>
```

Enable a node of the cluster.

<div>

<div>

<div>

<div>

##### The cl.cfg Configuration File

</div>

</div>

</div>

The <span class="emphasis">*cl.cfg*</span> file contains a description
of the layout of the cluster. It specifies a remote exec command for
starting servers and gives the locations of database files used by these
servers. The database file locations are needed for copying the database
for restoring a failed host.

``` programlisting
[Global]
Exec     = ssh
# command for remote execution. ssh must be set up so that the machine
# from which clctl is run can connect without login prompt to the
# machines hosting the databases.

Copy     = rsync -zvP
# command for copying files between the hosts. This is executed on the
# host receiving the copy.

BinDir   = /usr/bin
# Directory for the isql and other Virtuoso commands on the host
# running clctl

Password = dba
# The Virtuoso password for the dba account. All hosts of the cluster
# have the same dba password since all login and user account information
# is replicated on all hosts. This is a Virtuoso account and no operating
# system account corresponds to it.

Master   = Host1
# The cluster master information as given in each cluster.ini file

Master2  = Host2
# Fallback master as given in each cluster.ini file.
```

For each host the following fields are given:

``` programlisting

[Host1]
Host      = localhost
# DNS Name of the machine hosting  the Virtuoso host in question

DBDir     = /home/v6/binsrc/tests/suite/clflt/cl1
# The absolute path of the directory containing the database files
# of this host

BinDir    = /home/v6/bin
# Absolute path of the Virtuoso binaries

SpareHost = 2
# Online replica of this host. The rebuild command uses this
# information to decide which database files to copy when
# rebuilding this host after failure.

SqlPort   = 1111
# Port for SQL listener of this host. Corresponds to the
# ServrPort setting in this host's virtuoso.ini file.
```

Below is a sample of a full cl.cfg file for a cluster of 4 hosts all on
the same machine (localhost):

<span class="emphasis">*Example:*</span>

``` programlisting
[Global]
Exec     = ssh
Copy     = rsync -zvP
BinDir   = /usr/bin
Password = dba
Master   = Host1
Master2  = Host2

[Host1]
Host      = localhost
DBDir     = /home/v6/binsrc/tests/suite/clflt/cl1
BinDir    = /home/v6/bin
SpareHost = 2
SqlPort   = 1111

[Host2]
Host      = localhost
DBDir     = /home/v6/binsrc/tests/suite/clflt/cl2
BinDir    = /home/v6/bin
SpareHost = 1
SqlPort   = 1311

[Host3]
Host      = localhost
DBDir     = /home/v6/binsrc/tests/suite/clflt/cl3
BinDir    = /home/v6/bin
SpareHost = 4
SqlPort   = 1312

[Host4]
Host      = localhost
DBDir     = /home/v6/binsrc/tests/suite/clflt/cl4
BinDir    = /home/v6/bin
SpareHost = 3
SqlPort   = 1313
```

</div>

</div>

</div>
