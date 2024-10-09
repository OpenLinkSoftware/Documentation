<div>

<div>

<div>

<div>

### 11.7.14. Vectored Procedures

</div>

</div>

</div>

Note: This feature only applies to Virtuoso 7.0 and later.

A stored procedure may be declared vectored. This means that when called
from a statement operating on multiple values, a single call of the
procedure can take the whole batch of variable bindings the statement is
operating on in a single invocation. This saves invocation and
interpretation overhead, and, most importantly, allows running any SQL
statements inside the procedure on multiple values at once, creating
possibilities for parallelization and exploitation of locality. The
vectored declaration consists of the VECTORED reserved word at the start
of the procedure body.

Consider the example of a lookup table:

``` programlisting
CREATE TABLE person
  (
    p_id   INT PRIMARY KEY,
    p_name VARCHAR
  );

CREATE TABLE knows
  ( p1 INT REFERENCES PERSON,
    p2 INT REFERENCES PERSON,
    PRIMARY KEY ( p1, p2 )
  );

CREATE PROCEDURE p_name
  ( IN code INT )
  RETURNS VARCHAR
  {
    VECTORED;
    RETURN
      (
        SELECT p_name
          FROM person
         WHERE p_id  = id
      ) ;
  }

SELECT  p_name (p1)
  FROM  knows
 WHERE  p2 = 123;
```

This last statement is equivalent to:

``` programlisting
SELECT  p_name
  FROM  knows,
        person
 WHERE  p_id = p1
   AND  p2 = 123;
```

For non-trivial transformations, hiding the logic inside a procedure
makes sense, Running the procedure vectored makes it so that efficiency
is not lost. For example, if person 123 knows 1000 people, there will
not be 1000 random lookups in person for the names but rather a single,
vectored, merge-style lookup, accessing the rows in order of ID, saving
time if the IDs are nearby each other. Furthermore, if the lookup is in
READ COMMITTED isolation, the multiple lookups can be scheduled on
multiple threads.

The restrictions for vectored statement bodies also apply to function
bodies that are declared vectored.

A vectored procedure can be called from a non-vectored procedure. In
this case, the vectored procedure simply executes on a single set of
values, as if it were not vectored.

A vectored procedure can call a non-vectored procedure. When this
happens, the non-vectored procedure is called once for each set of
eligible values, i.e., once for the first values of the arguments, once
for the second values of the arguments, and so forth.

A vectored procedure, if called from vectored code, returns a return
value for each set of arguments.

A vectored procedure can have IN and OUT parameters. These have the same
semantics as in single-value execution. When calling a non-vectored
procedure with an OUT or INOUT parameter, the argument in the vectored
caller must be declared to be of a boxed data type. (See the section on
vectoring and data types below.)

</div>
