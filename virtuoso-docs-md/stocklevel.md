<div id="stocklevel" class="section">

<div class="titlepage">

<div>

<div>

### 21.7.6. Stock Level

</div>

</div>

</div>

This is a complex read-only transaction. This finds all distinct items
which have been ordered within the last n orders from a district having
a stock level lower than a given threshold. The SQL statement:

``` programlisting
    SELECT
        COUNT (DISTINCT S_I_ID) INTO N_ITEMS
    FROM
        ORDER_LINE, STOCK
    WHERE
            OL_W_ID = W_ID
        AND OL_D_ID = D_ID
        AND OL_O_ID < LAST_O
        AND OL_O_ID >= LAST_O - 20
        AND S_W_ID = W_ID
        AND S_I_ID = OL_I_ID
        AND S_QUANTITY < THRESHOLD;
```

is the fastest way of getting this. Note that the ORDER_LINE is the
driving table of join (leftmost in FROM). Also not the use of historical
read in the client (SQL_CONCURRENCY option).

</div>
