<div>

<div>

<div>

<div>

### 9.22.4. Procedure Table Cost and Join Order

</div>

</div>

</div>

The \_\_cost declaration in a procedure definition can associate a cost
to a procedure. This declaration is then used for assessing different
join orders. Note that depending on the join order, some parameters of a
procedure table may or may not be available. It is of the form \_\_cost
(n1, n2,...), where each n is a literal number. The declaration can
figure anywhere in the procedure's body as a regular statement. At least
one number is required. The first number is the one-time cost of calling
the procedure. The second number is the number of result rows that will
be produced by the call, defaulting to 1. The numbers from third onwards
correspond to the parameters of the procedure from left to right. If a
parameter is NOT given or is NOT known because of join order, then the
cost of the single call and the result count will be multiplied by the
number corresponding to the parameter.

Consider the declaration \_\_cost (10, 3, 5);. The procedure will take
10 units of time per call and produce 3 rows if the first parameter is
known. Otherwise it will take 50 units and produce 15 rows. This is a
rough way to specify the selectivity of specifying a parameter versus
not specifying it. One may liken this to specifying or not specifying
conditions of a table's columns.

The unit of cost is an internal abstract unit. For purposes of scaling,
selecting a single row from a table of 1000 on an exact match of an
integer key is 3 units. The costs are shown by the explain function with
a second argument of -5.

</div>
