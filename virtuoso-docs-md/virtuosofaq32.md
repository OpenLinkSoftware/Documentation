<div>

<div>

<div>

<div>

### 1.4.32. Do you provide the ability to add a set of triples, respecting the isolation property (so concurrent accessors either see none of the triple values, or all of them)?

</div>

</div>

</div>

Yes. The reading client should specify serializable isolation and the
inserting client should perform the insert as a transaction, no row
autocommit mode.

</div>
