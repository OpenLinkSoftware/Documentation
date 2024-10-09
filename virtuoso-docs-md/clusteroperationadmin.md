<div>

<div>

<div>

<div>

### 6.3.6. Administration

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### The cl_exec function

</div>

</div>

</div>

All administrative operations other than data definition take effect on
the node to which they are issued.

``` programlisting
cl_exec (in cmd varchar, in params any := NULL, in is_txn := 0)
```

The <a href="fn_cl_exec.html" class="link" title="cl_exec">cl_exec()</a>
SQL function can be used for executing things on all nodes of a cluster.

The cmd is a SQL string. If it contains parameter markers (?), the
params array is used for assigning values, left to right. If is_txn is
1, the cl_exec makes a distributed transaction and does not
automatically commit on locally on each node. Thus
<a href="fn_cl_exec.html" class="link" title="cl_exec">cl_exec()</a> can
be used as part of a containing distributed transaction.

<span class="emphasis">*Example*</span>

``` programlisting
cl_exec ('shutdown')
--will shut all nodes.

cl_exec ('dbg_obj_print (?)', vector ('hello'));
--will print hello to the standard output of all the processes of the cluster.
```

Any recovery, integrity checking, crash dump or similar can be done node
by node as with single processes.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="clusterstcnf.html" class="link"
title="2.14. Cluster Installation and Configuration">Cluster
Installation and Config</a></p></li>
<li><p><a href="clusterstcnfbackuprestore.html" class="link"
title="2.14.3. Backup and Restore">Backup and Restore
Example</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div>

<div>

<div>

<div>

#### Status Display

</div>

</div>

</div>

The status () function has a cluster line right below the database
version information. This line shows cluster event counts and statistics
between the present and previous calls to status. Calling status
('cluster') will show this line only. Calling status ('cluster_d') shows
this line and below it the same line with data on each individual host
in the cluster.

If cluster nodes are off-line, the nodes concerned are mentioned above
the cluster status line.

The line consists of the following fields.

``` programlisting
Cluster 4 nodes, 4 s. 9360 m/s 536 KB/s 117% cpu 0% read 44% clw threads 2r 0w 1i buffers 1939 766 d 0 w 0 pfs
Cluster 4 nodes, 4 s. 9360 m/s 536 KB/s
```

This first group gives the network status. The count of nodes online
(4), the measurement interval, number of seconds since the last status
command (4 seconds). The m/s is the messages per second, i.e. 9360
single messages sent for intra-cluster purposes per second over the last
4s. The KB/s is the aggregate throughput, i.e. the count of bytes sent
divided by the length of the measure,measurement interval. This allows
calculating an average message length. Only intra-cluster traffic is
counted, SQL client server and HTTP connections are not included.

``` programlisting
117% cpu 0% read 44% clw threads 2r 0w 1i
```

This group gives the process status. The CPU% is at 100% if one thread
is running at one full CPU. The maximum CPU% is 100 times the number of
CPU's in the cluster. Differences between CPU's are not considered. The
read % is the sum of real time spent waiting for disk divided by the
time elapsed. The maximum number is 100 times the peak number of threads
running during the interval. 500% would mean an average of five threads
waiting for disk times during the interval. The clw% is the sum of real
time a thread has waited for cluster request responses during the
period. The maximum is 100% times the peak number of threads running.

The threads section (2r 0w 1i) is a snapshot of thread state and means
that 2 threads are involved with processing, 0 of these is waiting for a
lock and 1 is waiting for network I/O.

``` programlisting
buffers 1939 766 d 0 w 0 pfs
```

This is a snapshot of the database buffers summed over all nodes. 1939
used for disk caching, 766 dirty 0 wired down.

The pfs number is the total number of page faults during the interval
summed over the cluster. This provides a warning about swapping and
should be 0 or close at ll times.

</div>

</div>
