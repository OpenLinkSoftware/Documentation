<div id="tpccusingtestprg" class="section">

<div class="titlepage">

<div>

<div>

## 21.2. Using the Test Program

</div>

</div>

</div>

The tpcc program simulates one user making random transactions according
to the specified mix of:

``` screen
10 new order transactions, each with 10 order lines
10 payment transactions, 60% by name
1 delivery transaction
1 stock level transaction
1 order status transaction, 60% by name.
```

Each instance of the test program has a home warehouse on which it does
most of its operations. If there are more than one operation the test
program will give a supply warehouse different from the local warehouse
to 10% of new order lines.

The test is started with:

``` screen
tpcc <database> <username> <password> r
    <n-10-new-order-sets> <local warehouse> <n warehouses>
```

e.g.

``` screen
./tpcc 1111 dba dba r 10
```

for 10 sets of the transaction mix on warehouse 1 in a 1 warehouse
database or,

``` screen
./tpcc 1111 r 100 12 100
```

to perform 100 sets of transactions on warehouse 12 in a 100 warehouse
database.

The program reports a tpmC rate after performing each set of 10 new
orders and the related support transactions. A statistic will be printed
every 10 sets of 10 new orders showing the time spent on each of the
benchmark transactions done during the last run of 100 new orders, 100
payments 10 deliveries, stock levels and order status queries.

The throughput will increase during the first minutes of the run to
level off at the attained rate.

</div>
