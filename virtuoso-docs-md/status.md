<div>

<div>

<div>

<div>

### 21.7.5. Order Status

</div>

</div>

</div>

This transaction picks the last order of a given customer. It uses a
select in descending order to locate it.

This is a read only transaction. Note the use of SQL_CONCURRENCY in the
client code for specifying historical read mode. This eliminates
locking.

<div>

|                              |                                                                                                                                           |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                      |
|                              | The ORDER BY clause must list all key parts of the index to be used, all with either ASC or DESC ordering in order to specify that index. |

</div>

This transaction could be implemented in principle using the ORDERS
primary key, O_W_ID, O_D_ID, O_ID. This would read in descending order
until finding a row with a given C_IC. There being 3000 customers per
district this could cause an average 1500 lines to check before finding
the right one. Since the distribution of O_C_ID is not even the above is
not entirely correct but close enough. The other possibility is having a
separate index, O_W_ID, O_D_ID, O_C_ID, O_ID for this transaction. The
trade-off being 1500 serial reads against 10 random insert (10 new order
per one order status) we choose to have the extra index.

</div>
