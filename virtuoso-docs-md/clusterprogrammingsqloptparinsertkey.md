<div>

<div>

<div>

<div>

### 10.3.2. INSERT KEY Option

</div>

</div>

</div>

When indices are partitioned on different columns, indices pertaining to
a single row can be located on different nodes. In special situations,
for example when exploiting co-location of keys from different tables,
one may wish to insert a things index by index. This happens with the
use of partitioned functions with DAQ's. Inserting some indices and not
inserting others will make an inconsistent database, thus even if keys
are inserted separately, all keys should be inserted within the same
transaction or have some other guarantee of getting all inserted. Also,
application code will have to change if the indices change. This is not
considered good practice.

Consider a partition account table and a history table both partitioned
on the same key.

We could make a procedure updating the balance of the account and
recording the event.

``` programlisting
create table acct (id int, balance numeric);
alter index acct on acct partition (a_id int);
create table hist (h_id int, ts timestamp, note varchar, primary key (h_id, ts);
alter index hist on hist partition (h_id int);

create procedure evt (in a_id int, in delta numeric, in note varchar)
{
 update acct table option (no cluster) set balance = balance + delta where id = a_id;
 insert into hist key hist option (no cluster) (h_id, note) values (a_id, note);
)
```

Such a procedure would be called on a particular partition using a DAQ
In practice, the RDF store uses single key operations for atomically
reserving ID's for IRI's, for example..

</div>
