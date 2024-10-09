<div>

<div>

<div>

<div>

### 6.4.6. Optimizing Schema for Fault Tolerance

</div>

</div>

</div>

Having the working set in memory is the single most important factor of
database performance. When storing partitions in duplicate, one in
principle also requires double the memory to keep adequate working set
during write operations.

However, most web and data warehouse workloads are read-intensive. In
this situation, the reading load can be balanced over the replicated
copies. If this balancing were done at random or round robin, all copies
would eventually maintain the same working set. In other words, 64G of
RAM spread over two machines would behave like 32G. If the data volune
is larger than memory, it makes sense to have the different replicas
cache different parts of the partition they share.

Consider, using the example of cluster DUP mentioned above:

``` programlisting
create table customer (c_id int primary key, c_name varchar, c_state varchar);
alter index customer on customer partition cluster DUP (c_id int (0hexffff0000));

create table orders (o_id int primary key, o_c_id  int, o_date datetime, o_value numeric);
alter index orders on orders partition cluster DUP (o_id int (0hexffff0000));
create index o_c_id on orders (o_c_id) partition cluster DUP (o_c_id (0hexffff0000));
```

This has the effect of saying that the 16 low bits of c_id or o_id do
not participate in the partition hash. The hash is made from bits 32-16.
Thus c_id 0-64K will be in one partition, 64K-128K in another, 128K-192K
in a third and so on, these partitions are then spread by hash over the
host groups listed in the create cluster.

Now, doing the join

``` programlisting
select sum (o_value) from customer, orders where c_state = 'MA' and c_id = o_c_id;
```

will take o_c_id's 0-32K from the first copy of the first partition,
id's 32K-64K from the second copy of the first partition, c_o_id's
64K-96K from the first copy of the second partition and so forth.

The load is split by applying range partition on the low bits of id's,
so that a system with 64G split over two replicas behaves like 64G RAM
for read committed reading but as 32G of RAM for writing. This is
enabled by leaving low bits of id's outside of the partition hash by
specifying a mask, as shown above.

</div>
