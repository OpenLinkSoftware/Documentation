<div>

<div>

<div>

<div>

## 10.4. Calling Procedures in Cluster

</div>

</div>

</div>

Normally, all interprocess communication in the cluster is transparent.
In special cases, the developer may wish to execute a given procedure on
a given host of the cluster. This is typically the case when there is
affinity between data and logic.

A regular stored procedure or trigger is executed on the host where it
is invoked. With the distributed async queue (DAQ) system one can
execute procedures on specified remote hosts.

Procedures invoked over DAQ are restricted to dealing with data that is
held on the host where they execute. Generic procedures or triggers may
use any data from anywhere.

The DAQ offers a mechanism corresponding to the map operation of the
map-reduce paradigm. The DAQ may or may not be transactional. In the
transactional mode, all the invocations are enlisted into a distributed
transaction. The transaction is to be committed separately. The
non-transactional DAQ will not enlist operations into a distributed
transaction and will automatically commit after each procedure that
executes without error and rollback after each procedure that terminates
in an error.

A DAQ is created with the SQL function daq ().

``` programlisting
daq (in is_txn int) returns any
```

This returns a DAQ object. The object may be passed by value or
reference but cannot be returned to a SQL client or passed to another
thread or persisted in a table. The DAQ object is a handle for making
remote procedure calls and getting their results.

``` programlisting
daq_call ( in daq any,
           in part_table varchar,
           in part_key varchar,
           in proc varchar,
           in args any,
           in is_update int) returns any
```

This function applies proc to the vectors of args on the host determined
by using the partitioning of part_key of part_table designated by args.

Let us suppose that the index part_key of part_table has its 1st and 2nd
key part as partitioning keys. Then the 1st element (index 0) of args
would be used as the value of the 1st key part and the 2nd element as
value of the 2nd key part for determining the relevant partition.

Thus the argument list must be congruent with the layout of the
partitioning key. The table or partition key is not referenced
otherwise, it is just used for deciding which host gets the call.

If the partition is stored in multiple places, the is_update flag
decides whether all will get the call or if only one is picked.

After the host(s) that will get the call are known, the call is queued
for execution. The daq_call function returns a vector of two elements.
The first is the sequence number of the call. This can be used for
associating results to calls. The second element is the list of hosts
that got the call.

Each call on each host will produce one or more results. These results
are accessed with the daq_next function.

``` programlisting
daq_next (in daq any) returns any
```

This function returns a result from one of the calls queued on the daq.

The return value can be one of the following:

<div>

- 0 - This means that all results have been returned and no more data is
  available.

- vector with request number, host number and response.

</div>

The response is one of:

<div>

- Vector with 1 as 0th element - The function returned a result set row.
  The row is a nested vector as next element.

- Vector with 2 as 0th element. The next element is the return value of
  the function, the function executed with no error.

- Vector with 3 as 0th element. The next element is a vector describing
  the SQL error that terminated the function. The error is a nested
  vector with the constant 3, the SQL state and the text of the message.

</div>

If the DAQ is transactional, the first error on the remote host
terminates processing. This makes the distributed transaction
uncommittable, thus rolling it back at the next transact.

If the DAQ is not transactional, all requests are processed and the
state is committed after each function call as a local single phase
commit on the processing host. if the function signals an error, the
transaction is locally rolled back.

There is no guaranteed order of execution. The calls are buffered until
the first call to daq_next. daq_next will return whatever data is first
available. If no data from cluster peers is available, it will execute
requests that were assigned to the local host. These are executed on the
calling thread.

<span class="emphasis">*Example*</span>

``` programlisting
create procedure daq_results (in daq any)
{
 declare row any;
 for (;;)
 {
 row := daq_next (daq);
 if (0 = row)
 return;
 dbg_obj_print (row);
 }
}

create procedure clexec_srv (in str varchar)
{
 exec (str);
}

create procedure clexec (in str varchar)
{
 declare d any;
 d := daq (0);
 daq_call (d, 'DB.DBA.SYS_COLS', 'SYS_COLS_BY_NAME', 'DB.DBA.CLEXEC_SRV', vector (str), 1);
 daq_results (d);
}
```

The clexec procedure will execute the given SQL string on all hosts of
the cluster. It returns after all have completed.

</div>
