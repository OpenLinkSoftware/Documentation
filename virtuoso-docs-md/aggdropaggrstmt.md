<div id="aggdropaggrstmt" class="section">

<div class="titlepage">

<div>

<div>

### 9.27.2. Drop Aggregate Statement

</div>

</div>

</div>

``` programlisting
DROP AGGREGATE aggregate_name
```

The drop aggregate statement removes the declaration of aggregate_name
from SYS_PROCEDURES table but does not drop or change any declarations
of functions previously listed in create aggregate statement.

The syntax of the 'call' operator is the same for 'plain' and
'aggregate' functions. If an aggregate name is used in the text of
stored procedure before the aggregate is actually created then it is
compiled as plain function call and causes run-time errors. In order to
prevent such confusion, keyword AGGREGATE may be placed right before the
name of aggregate function.

</div>
