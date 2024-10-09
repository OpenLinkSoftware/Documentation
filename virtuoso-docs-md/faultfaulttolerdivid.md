<div>

<div>

<div>

<div>

### 6.4.4. Dividing Virtuoso Hosts Over Physical Machines

</div>

</div>

</div>

This section describes how Virtuoso hosts should be placed on actual
machines for optimal balance and fault tolerance.

All hosts (Virtuoso processes) constituting a cluster should be of the
same size. This means that most importantly they should have an equal
amount of memory allocated in virtuoso.ini.

The situation is simplest if all physical machines are of the same spec.
This is not necessary though since a larger machine can host more
Virtuoso hosts (processes). For balanced resource use, the machines
should however have an equal amount of memory per core.

Naturally, all hosts mentioned in the same group clause in a create
cluster statement must reside on different physical hardware. This is
also true of the master host list in the cluster.ini file. Putting them
on the same machine or a different virtual machine on the same machine
defeats the whole point of fault tolerance. If VM's are automatically
balanced on a data center network, one should keep the above in mind. It
is recommended to use real machines with real network interfaces for
database.

In each host group, the first host gets some more load than the other
hosts. This is because serializable reading always must go to the first
in the group. Thus, the first hosts should be evenly spread over the
hardware, so do not put all the group firsts on the same machine.

Supposing 2 machines with 8 cores each, one would have hosts 1-16, 1-8
on the first, and 9-16 on the second. For analytics, have one core per
host, for OLTP, one can have two or four cores per host.

In this case, one would write the create cluster as follows:

``` programlisting
create cluster XX group ("Host1", "Host9"), group ("Host10", "Host2"), group ("Host3", "Host11"), group ("Host12", "Host4"),
  group ("Host5", "Host13"), group ("Host14", "Host6"), group ("Host7", "Host15"), group ("Host16", "Host8");
```

Both machines have 4 firsts and four seconds. One could vary the memory
allocation per process so as to have maybe 20% more RAM per host for a
first of group than for the others in the group. This may optimize the
situation when all are online and will not excessively penalize the
fallback position.

Varying the amount of memory depending on whether a host is first or
second makes sense only for read intensive workloads. Dividing firsts
and seconds evenly over the hardware makes sense for all workloads.

</div>
