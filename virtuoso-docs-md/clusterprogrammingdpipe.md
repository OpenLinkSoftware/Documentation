<div id="clusterprogrammingdpipe" class="section">

<div class="titlepage">

<div>

<div>

## 10.6. Distributed Pipe

</div>

</div>

</div>

A distributed pipe is a single construct that can be used for map-reduce
and stream transformation. It is a further development of the DAQ.

A dpipe is an object which accepts a series of input rows and generates
an equal amount of output rows. It may or may not preserve order and it
may or may not be transactional. The input row of a dpipe is a tuple of
values. To each element of the tuple corresponds a transformation. The
transformation is expressed as a partitioned SQL function, basically a
function callable by daq_call, with arguments specifying the partition
where it is to be run. The output row is formed by gathering together
the transformation results of each element of the input tuple.

Conceptually, this is like a map operation, like running several DAQ's,
one for each column of the dpipe. A transformation function does not
always need to produce a value. It may also produce a second partitioned
function call with new arguments which will be partitioned and scheduled
by the dpipe. Since the second function is independently partitioned,
this may be used for implementing a reduce phase. This phase may then
return a value and/or further functions to be called.

Ultimately, the dpipe functions are all expected to return a value. When
each function of the input row has returned a value, the output row is
ready and can be retrieved. Returning a value is a way for the
application to synchronize with the operation of the dpipe. The dpipe
can be used for mapping values or side effects or both.

The dpipe object is created with the dpipe SQL function. This takes a
set of flags and a list of previously declared dpipe transformation
names. A dpipe transformation is declared by specifying a SQL procedure,
a partitioning key and a set of flags.

The dpipe is fed data with the dpipe_input function. This takes the
dpipe object and one value per transformation specified when the dpipe
was made. The values can be arrays, so that a transformation function
can logically have multiple arguments. The results of the dpipe are
retrieved with the dpipe_next function,. This returns a new result row
at each subsequent call until one row has been returned for each input
row. Depending on flags, these may be returned as they become available
or in the original order. Each input is substituted with the
transformation result in the output row. Some transformation can be
identity so as to preserve a row id for correlating inputs and outputs
if they are not processed in order.

After this, the dpipe can be reused. The dpipe is freed when there are
no longer references to it.

Finally, since transformations may, in addition to producing values,
also produce other functions to be called for their effects, dpipe_reuse
is called to make sure that all these functions are run until no more
operations are left.

<div id="clusterprogrammingdpipesqloptimz" class="section">

<div class="titlepage">

<div>

<div>

### 10.6.1. SQL optimization and Dpipe

</div>

</div>

</div>

Calls to SQL functions in queries can be translated to dpipe operations
if a dpipe equivalent is declared. Consider a select statement returning
the values of a user defined function of some column selected in the
query. If this function itself accesses the database, possibly specially
if the data accessed is partitioned, calling the function for each row
and waiting for the result before processing the next row would have a
catastrophic performance impact. The dpipe mechanism allows the
functions to be partitioned by the SQL run time and sent to the
appropriate cluster nodes as large batches. This applies to any
operation that can be expressed as a sequence of steps which will each
run within a single partition.

We take a trivial example:

``` programlisting
create table ct (row_no int primary key, dt varchar);
alter index CT on CT partition (ROW_NO int (255));

create procedure CT_DT_PIPE (in n int)
{
 return vector ((select dt from ct table option (no cluster) where row_no = n), 1);
}

dpipe_define ('CT_DT', 'DB.DBA.CT', 'CT', 'DB.DBA.CT_DT_PIPE', 0);
```

We can now use statements like:

``` programlisting
select sum (length (ct_dt (row_no))) from ct;
```

This is equivalent to:

``` programlisting
select sum (length (b.dt))
  from ct a, ct b
  where a.row_no = b.row_no;
```

The point is that the function call will be mapped into the dpipe
operation of the same name defined in the dpipe_define. This means that
a large batch of row_no's is retrieved and for each, the partition where
to invoke the dpipe function is calculated. Then the function calls are
sent in concurrent batches to each of these places, running the function
in parallel, each on the node that has the data of interest. Getting the
value of a column of a partitioned table is a trivial example but any
complex computation might be substituted for this, including ones that
updated the state on the node, with the proviso that they should not
access data from outside the host on which they run.

Further, because the results are summed into an aggregate, the results
can be processed in the order they come, thus improving parallelism.

</div>

</div>
