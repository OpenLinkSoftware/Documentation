<div id="aggregates" class="section">

<div class="titlepage">

<div>

<div>

## 9.27. Standard and User-Defined Aggregate Functions

</div>

</div>

</div>

In addition to whole set of standard SQL aggregate functions, Virtuoso
provides a method to create application-specific aggregate functions to
create complex data structures inside SQL queries.

The most evident way to calculate some value that depend on number of
rows of a table is to write a stored procedure that opens a cursor, then
fetches row after row in a loop and repeatedly modifies some
intermediate values ("accumulators") inside the loop. When the fetch
operation signals that there are no more data, a final result is
calculated from values of "accumulators"

E.g. to find an average of all values in a table's column COL, one may
open a cursor to fetch values from the COL, then set two "accumulators"
TOTAL and CNT to zero, then fetch row after row adding 1 to CNT and
adding current value of COL to TOTAL. At the end of loop, an error
should be signalled if CNT is zero, otherwise the result is TOTAL
divided by CNT.

Obviously, a competent programmer will use built-in AVG() aggregate
function inside a single SELECT statement: the code is much more
readable and the use of aggregate reduces the overhead in filling in
result-set and fetching from it.

More important advantage of aggregate functions is the ability to
process many groups of records in parallel, performing one table scan
instead of many. SQL optimizer may use sophisticated heuristics to find
the fastest way of doing a complex query with aggregates but it cannot
optimize the code of a stored procedure.

<div id="aggcreateaggrstmt1" class="section">

<div class="titlepage">

<div>

<div>

### 9.27.1. Create Aggregate Statement

</div>

</div>

</div>

``` programlisting
CREATE AGGREGATE aggregate_name (parameter, parameter ...) [ RETURNS data_type ]
FROM
    init_procedure,
    acc_procedure,
    final_function
    [, merge_procedure ]

parameter : parameter_type name data_type

parameter_type : IN | INOUT
```

The create aggregate statement forces the SQL compiler to treat any call
of the declared aggregate_name as special routine similar to one used
for built-in aggregate functions, so the call produces a single value
for resultset instead of a separate value for every row of the
resultset.

Every occurrence of the aggregate_name in a select statement creates an
invisible "accumulator" column in resultset. The value of "accumulator"
is calculated by init_procedure, then every row of data causes a call of
acc_procedure that may modify the "accumulator" then the call of
final_function should get data from "accumulator" and return the total
result.

The init_procedure must have one inout parameter and return nothing. It
should set the parameter to the required initial value of the
"accumulator". (The SQL query compiler will use the declared data type
of the parameter as the data type of the "accumulator" so no casting
problem may occur) equal to

The acc_procedure must have at least one inout parameter, one or more
parameters of any sort and must return nothing. It should get the
previously calculated value of the "accumulator" from its first
parameter, calculate a new value and set the result back to the first
parameter.

The final_function must have one in or inout parameter and return a
value. It should get the value of the "accumulator" from its parameter
and return the calculated result.

The optional merge_procedure must have two inout parameters that accept
values of two "accumulators". If defined, it may be used by SQL
optimizer to split the table scan into two or more scans through parts
of the table. When every 'children' scan iterates some part of the
table, a separate "accumulators" is used for every part. merge_procedure
gets two accumulators and adds the content of the second accumulator to
the content of the first. If merge_procedure is not defined, no such
tricky optimization is used. This optimization is never tried if the
database resides on less than four disks, if the number of CPUs is less
than four and if the query contains any call of user-defined aggregate
with no merge_procedure defined; thus you will probably never need to
write such a function.

The declaration of aggregate is persistent. If create aggregate
statement is successful the text is stored into the SYS_PROCEDURES
table. This table is read at startup so user-defined aggregates are thus
always available for use and need be defined only once.

</div>

</div>
