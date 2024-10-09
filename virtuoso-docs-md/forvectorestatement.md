<div>

<div>

<div>

<div>

### 11.7.15. FOR VECTORED Statement

</div>

</div>

</div>

Note: This feature only applies to Virtuoso 7.0 and later.

``` programlisting
FOR VECTORED
  ( {IN|OUT} <variable> <data_type> [ := <value>],
    ...
  )
  <compound_statement>
```

The FOR VECTORED statement allows executing a block of code on several
sets of variable bindings at once. The benefit of this is that any
database operations in such a block can be run on multiple sets of
parameters at once, allowing exploitation of locality and, in some
cases, running the operation on different bindings on different threads.
Additionally, if vectored procedures are called from inside such a
block, the call is made with multiple bindings for the parameters. The
input variables of FOR VECTORED are initialized from an array of scalar
values. The statements inside the body are then executed vectored, as if
the operation were first made on all the first values of the vectors,
then on the second values, and so forth. Operations combining values
from different places in the vectors are not possible in the FOR
VECTORED body, but, since vectored results can be seen as arrays after
the return of FOR VECTORED, any aggregation or comparison between values
in different positions of the same vector can be done after the FOR
VECTORED, simply accessing different elements of the arrays produced.

The FOR VECTORED statement communicates with its environment through a
list of input and output variables. The input variables are marked with
the syntax:

``` programlisting
IN <variable> <data_type> := <value>
```

The \<value\> must be an expression evaluating to an array. The data
type must correspond to the element type of the array. When multiple
input variables are specified, the arrays initializing each must be of
equal length.

An output variable is marked with:

``` programlisting
OUT <variable> := <value>
```

The variable must be declared in a context outside of the FOR VECTORED
statement. The value of the variable will be an array where each value
of the vectored expression \<value\> is represented as a separate value.

Variables declared outside of a FOR VECTORED statement are visible in
the body of FOR VECTORED and they appear as a single value for all rows
of the vectored section.

Consider the task of pair-wise adding the elements of two arrays:

``` programlisting
CREATE PROCEDURE a_add
  (
    IN  a1  INT ARRAY ,
    IN  a2  INT ARRAY
  )
  {
  DECLARE  res  INT ARRAY ;
  res := make_array (LENGTH (a1, ' any' );
  FOR (i := 0; i < LENGTH (a1); i := i + 1)
    res[i] := a1[i] + a2[i];
  RETURN res;
}
```

This can be expressed as:

``` programlisting
CREATE PROCEDURE a_add_v
  (
    IN  a1  INT ARRAY ,
    IN  a2  INT ARRAY
  )
  {
    DECLARE  res  INT ARRAY;
    FOR VECTORED
      ( IN   n1  INT  := a1 ,
        IN   i2  INT  := a2 ,
        OUT  res      := r
      )
      {
         DECLARE  r  INT ;
         r := i1 + i2 ;
      }
    RETURN res;
  }
```

The two procedures are identical in function. The second will make use
of vector instructions in the host CPU, if available, and will incur
less interpretation overhead, since the SQL run time will not need to
run a loop. In practice, substantial benefit, up to an order of
magnitude, can be had from vectored execution with database operations
exhibiting significant locality. Bulk loads and bulk lookups are a
typical example.

</div>
