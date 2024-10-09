<div>

<div>

<div>

<div>

## 10.3. SQL Options

</div>

</div>

</div>

For purposes of debugging or writing stored procedures that are
specifically meant to work with local data only, it is useful to disable
cluster functionality.

This is done with the NO CLUSTER table option. This can be used in the
table option clause of a table in a FROM or in an update or delete.

Specially when writing procedures to be called with DAQ, see below, it
us necessary to ensure that the procedures will not access data outside
of the host running them.

<span class="emphasis">*Examples:*</span>

``` programlisting
select count (*) from x table option (no cluster);
update x table option (no cluster) set y = y + 1;
update x set y = 1 where current of cr option (no cluster)
insert into xx key xx option (no cluster) (c1, c2) values (1, 2);
```

Note that for positioned (where current of) deletes and updates the
option is at the end. For searched ones it is after the table. Use the
explain () function to see the compilation of statements to make sure
about the locus of execution. If a table is to be accessed across the
cluster, this is indicated in the output.

All other SQL options work as with single server databases.

<div>

<div>

<div>

<div>

### 10.3.1. Parallel INSERT Options

</div>

</div>

</div>

Searched updates and deletes can be parallelized as they are written.
However, inserts in loops are not as obviously parallelizable. Therefore
insert has an option for queueing multiple inserts into a queue for
partitioned parallel execution.

The format of the statement is:

``` programlisting
INSERT INTO table [KEY <key>] [OPTION (INTO <daq>) <column list> <values or select>
```

The DAQ is a distributed async queue object, see section on calling
procedures in cluster. Specifying the INTO daq option partitions the
insert, determining where each key should go and buffers the operation
into the DAQ. When the result of the DAQ is fetched, all the buffered
operations are sent in parallel, as a single message per node concerned.
This is easily tens or hundreds of times more efficient than inserting
row by row. The transactional behavior is controlled by the DAQ, see the
section on calling procedures in cluster. Inserts can mix with other
types of operations in the DAQ. If the DAQ is transactional, any failed
insert, as in the case of uniqueness violation, will make the
transaction uncommittable, preserving integrity.

<span class="emphasis">*Example*</span>

``` programlisting
create procedure ct_fill_daq (in n1 int, in n2 int, in st int := 1)
{
 declare daq any;
 declare ct int;
 daq := daq (1);
 for (ct := n1; ct < n2; ct:=ct+st)
 {
 insert into CT option (into daq) (ROW_NO, DT) values (ct, cast (ct as varchar) || ' xxxxxxxxxxxxxxx');
 }
 while (daq_next (daq));
}
```

</div>

</div>
