<div>

<div>

<div>

<div>

## 9.32. Transitivity in SQL

</div>

</div>

</div>

Virtuoso SQL supports tree and graph data structures represented with
SQL relations through the use of transitive subqueries.

A derived table, i..e. a select inside a from clause, can be declared to
be transitive. This is done by putting the TRANSITIVE modifier after the
SELECT keyword, at the place where a DISTINCT or TOP modifier would go.

The syntax of this is:

``` programlisting
transitive_decl ::= TRANSITIVE <trans_option>[, ...]

trans_opt :: =
        | T_MIN (INTNUM)
        | T_MAX (INTNUM)
        | T_DISTINCT
        | T_EXISTS
        | T_NO_CYCLES
        | T_CYCLES_ONLY
        | T_NO_ORDER
        | T_SHORTEST_ONLY
        | T_IN <position_list>
        | T_OUT ( <position_list )
        | T_END_FLAG  (INTNUM)
        | T_FINAL_AS NAME
        | T_STEP ( <position_or_path_spec> )
        | T_DIRECTION (INTNUM)

position_list ::=  INTNUM [,...]

position_or_path_spec ::= INTNUM | 'step_no' | 'path_id'
```

A transitive derived table has a selection that may consist of four
different types of columns. These are input, output, step data and
special columns. When a transitive derived table occurs in a query, the
enclosing query must specify an equality condition for either all input,
all output columns or both. The designation of input and output columns
is for convenience only. The order of query execution will be generally
decided by the optimizer, unless overridden with the T_DIRECTION option.

Consider a simplified social network application:

``` programlisting
create table knows (p1 int, p2 int, primary key (p1, p2))
alter index knows on knows partition (p1 int);
create index knows2 on knows (p2, p1) partition (p2 int);

insert into knows values (1, 2);
insert into knows values (1, 3);
insert into knows values (2, 4);
```

All persons have single integer identifiers. There is a row in the knows
table if person p1 claims to know person p2.

The most basic query is to find all the people that a given person knows
either directly or indirectly.

``` programlisting
select * from (select transitive t_in (1) t_out (2) t_distinct  p1, p2 from knows) k where k.p1 = 1;
```

The transitive derived table simply selects from the knows table. The
enclosing top level query gives an initial value for the input column of
the transitive select. This leaves the output column P2 unbound, so the
query will iterate over the possible values of P2. Initially, the query
loops over the people directly known by 1. In the next stage, it takes
the binding of P2 and uses it as a new value of the input column P1 to
look for people the first degree contact knows and so on, until no new
values are found.

The basic meaning of the transitive modifier is that given initial
values for input column(s), the subquery is evaluated to produce values
for the output columns. Then these values are fed back as values of
input columns and so forth, until some termination condition is reached.
If there are equality conditions for columns designated as output but no
conditions for columns designated as input, then the same process runs
from output to input. The terms input and output do not imply execution
order. If there are bindings for both input and output columns in the
enclosing query, then the transitive derived table looks for ways of
connecting the input and output bindings. If no such way is found, the
subquery is empty and causes the whole enclosing query to also have no
result. A transitive derived table cannot be the right side of an outer
join directly but can be wrapped in a derived table that is. In this
way, an outer join usage is also possible, whether finding a path is
optional.

The result set of a transitive subquery can be thought of as a set of
paths. A path consists of one or more consecutive bindings for the input
columns and is ordered. In our example, a path is p1=1, p1=2, p1=4. This
is the path connecting persons 1 and 4. If there are columns in the
select that are neither input or output, they too are recorded for each
step of the path. The result set may include just the ends of a path,
i.e. one row where the input columns have the beginning and the output
columns the end of the path. This means there is one row per distinct
path. The result set may also include a row for each step on each path.

In this example, we bind both ends of the transitive subquery and ask
how person 1 and 4 are connected. Since the columns p1 and p2 have an
equality condition, each row of the result set has these at values 1 and
4 respectively.

``` programlisting
select * from (select transitive t_in (1) t_out (2) t_direction 3 t_distinct t_shortest_only  p1, p2, t_step (1) as via, t_step ('path_id') as path , t_step ('step_no') as step from knows) k where p1 = 1 and p2 = 4;

P1       P2       VIA                                                                               PATH                                                                              STEP

1        4        1                                                                                 0                                                                                 0
1        4        2                                                                                 0                                                                                 1
1        4        4                                                                                 0                                                                                 2
```

The three rightmost columns allow returning information in the
intermediate steps of the transitive evaluation. t_step (1) means the
value of the column at position 1 at the intermediate step. The t_step
('step_no) is the sequence number of the step returned. The t_step
('path_id') is a number identifying the connection path, since there may
be many paths joining persons 1 and 4.

In this situation, the result set has one row per step, including a row
for the initial and final steps. While the evaluation order may vary
internally, the result set is presented as if the query were evaluated
from input to output, i.e. looking for people known by 1, finding 2 and
3, then looking for people they know, finding that 2 knows 4, which is a
solution, since p2 = 4 was specified in the outer select. If the outere
query had p1 = 4 and p2 = 1, there would be an empty result set since
there is no path from 4 to 1.

For example, if tables have multipart keys, there can be many input and
output columns but there must be an equal number of both, since the
engine internally feeds the output back into the input or vice versa.
The transitive derived table may be arbitrarily complex.

We may have an application that returns extra information about a step.
This could for example be a metric of distance. In such a case, a column
which is neither designated as input nor output and is not a t_step ()
function call, will simply be returned as is.

The result set of a transitive subquery will either have one row for
each state reached, or it may have one row for each step on the path to
each state reached.

The first example returns only the ends of the paths, i.e. directly and
indirectly known person id's. It does not return for each returned id
how this person is known, through which set of connections. The second
example returns a row for each step on each path. Steps will be returned
if the selection has t_step () calls or columns that are neither input
or output.

The forms of t_step are:

``` programlisting
t_step (<column number>)
```

This returns the value that the column, one of the columns designated as
input, has at this step. The input or output columns themselves, if
there is a condition on them, look equal to the condition. This allows
seeing intermediate values of input columns on a path.

``` programlisting
```

t_step ('step_no')

This returns the ordinal number of the step on the path. Step -0
corresponds to the input variables being at the value seen in the
enclosing query. Step 1 is one removed from this. Step numbering is
assigned as if evaluating from input to output.

Consider this:

``` programlisting
select * from (select transitive t_in (1) t_out (2) t_min (0) t_distinct   p1, p2, t_step (1) as via, t_step ('path_id') as path , t_step ('step_no') as step from knows) k where p1 = 1 ;
P1       P2       VIA                                                                               PATH                                                                              STEP

1        1        1                                                                                 0                                                                                 0
1        3        1                                                                                 1                                                                                 0
1        3        3                                                                                 1                                                                                 1
1        2        1                                                                                 2                                                                                 0
1        2        2                                                                                 2                                                                                 1
1        4        1                                                                                 3                                                                                 0
1        4        2                                                                                 3                                                                                 1
1        4        4                                                                                 3                                                                                 2
```

This returns four paths, all starting at 1: the paths. The path from 1
to 1, the path from 1 to 2, the path from 1 to 3 and the path from 1 to
2 to 4. The path_id column has values from 0 to 3, distinguishing the
four different paths returned. The p1 column is the start of the path,
thus always 1 since this is given in the outer query. The p2 column is
the end of the path. The via column is the value of p1 at the
intermediate step. The step number where via is equal to p1 is 0. The
next step number is 1. At the highest step number of each path, p2 and
via are the same.

Now, let us do this in reverse:

``` programlisting
select * from (select transitive t_in (1) t_out (2) t_min (0) t_distinct   p1, p2, t_step (1) as via, t_step ('path_id') as path , t_step ('step_no') as step from knows) k where p2 = 4 ;
P1       P2       VIA                                                                               PATH                                                                              STEP

4        4        4                                                                                 0                                                                                 0
2        4        2                                                                                 1                                                                                 0
2        4        4                                                                                 1                                                                                 1
1        4        1                                                                                 2                                                                                 0
1        4        2                                                                                 2                                                                                 1
1        4        4                                                                                 2                                                                                 2
```

We give an initial value to p2 and leave p1 free. Now we get three
paths, the path from 4 to 4, from 2 to 4 and from 1 to 2 to 4. We
enumerate the steps as if counting from input to output, albeit
internally the evaluation order is the reverse. Again, step number 0 has
the via column equal to p1 and the highest numbered step has via equal
to p2.

Now we may look more formally at the meaning of the transitive options:

<div>

- T_MIN (INTNUM) - This means that paths shorter than the number are not
  returned. In the examples above, we had min at 0, so that a path of
  zero length was also returned, i.e. where the first output equals the
  outer conditions for the inputs.

- T_MAX (INTNUM) - This gives a maximum length of path. Paths longer
  than this many steps are not returned. A value of 1 means that the
  subquery is evaluated once, i.e. the outputs of the first evalyuation
  are not fed back into the inputs. Specifying a minimum of 0 and a
  maximum of one means an optional join. Specifying min and max both to
  1 means an ordinary derived table.

- T_DISTINCT - This means that if a binding of input columns is produced
  more than once, only the first is used. Id est, the same point is not
  traversed twice even if many paths lead to it.

- T_EXISTS - Only one path is generated and returned.

- T_NO_CYCLES - If a path is found that loops over itself, i.e. a next
  step has the input values equal to the input values of a previous step
  on the path, the binding is ignored.

- T_CYCLES_ONLY - Only paths that have a cycle, i.e. input values of a
  subsequent step equal the input values of a previous step on the same
  path, are returned.

- T_SHORTEST_ONLY - If both ends of the path are given, the evaluation
  stops at the length of path where the first solution is found. If many
  paths of equal length are found, they are returned but longer paths
  are not sought.

- T_IN (column_positions) - This specifies which columns are called
  input.

- T_OUT (column_positions) - This specifies which columns are called
  output.

- T_DIRECTION INTNUM - A value of 0 (default) means that the SQL
  optimizer decides which way the transitive subquery is evaluated. 1
  means from input to output, 2 from output to input, 3 from both ends.
  Supposing we are looking at how two points are related, it makes sense
  to start expanding the transitive closure at both ends. in the above
  example, this would be going from p1 to p2 on one side and from p2 to
  p1 on the other.

</div>

<div>

|                            |                                                                              |
|:--------------------------:|:-----------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                    |
|                            | <a                                                                           
                              href="rdfsparqlimplementatiotrans.html#rdfsparqlimplementatiotransexamples"   
                              class="link"                                                                  
                              title="Collection of Transitivity Option Demo Queries for SPARQL">Collection  
                              of Transitivity Option Demo Queries for SPARQL.</a>                           |

</div>

</div>
