<div id="delivery" class="section">

<div class="titlepage">

<div>

<div>

### 21.7.4. Delivery

</div>

</div>

</div>

The delivery transaction reads and deletes a line from NEW_ORDER and
updated the corresponding ORDERS and ORDER_LINE rows. The rules allow
committing the transaction after processing each order. The client calls
this procedure ten times with a different d_id parameter once every ten
new orders. It is better to have the 1 to 10 loop in the client in order
to keep locks on for the least time possible.

We use a cursor to read NEW_ORDER. Note the open no_cur (exclusive,
prefetch 1). The prefetch 1 means we only intend to get one row. This
prevents the cursor from prefetching more rows, which would be useless
here.

Otherwise the transaction does not leave room for optimization.

</div>
