<div>

<div>

<div>

<div>

### 9.2.8. Finding Methods - Method Signatures Generation & Comparison

</div>

</div>

</div>

A method of a user defined type is identified uniquely by the
combination of the following:

|                                   |
|-----------------------------------|
| the method name                   |
| number of the method's parameters |
| the method's parameter types      |
| the method's return type          |

This combination of a method attributes is called the method's
signature.

The Virtuoso Server must know the method's types of the parameter values
and the return type at compile time to calculate the method signature
and find exactly the method to call in the types method table. This is
different from the current practice in calling stored procedures,
because the compile types are not used to find the procedure.

The majority of the system functions are known at compile time to return
values of a certain SQL type (e.g.: LEFT is known to return VARCHAR,
ATOI returns INTEGER etc). But there are some (e.g.: AREF) that may
return values of more than one type. The Virtuoso server does type
arithmetic for scalar expressions at compile time already (to be able to
supply columns types of a result set to ODBC clients for example), but
so far the calculated type has only informative value and was not used
anywhere during the compilation. All of the type checks are done at
runtime. The method/constructor invocation breaks that practice by using
the calculated compile time types for the scalar expressions.

<div>

**Example 9.7. Method Signatures**

<div>

Consider a method `m1` of type `t1` taking an INTEGER parameter and
returning an integer value:

``` programlisting
CREATE METHOD m1 (in x integer)
  for t1 returns integer
{ return x + 10; };
```

Now consider calling the method as follows (in a Virtuoso/PL procedure):

``` programlisting
...
declare p float;
declare ret integer;
declare t1i t1;

t1i := new t1();
p := 1;

ret := t1i.m1(p);
....
```

This will yield a compilation error explaining that there is no method
`m1` of user defined type `t1` . It will do that because p has a compile
time type of FLOAT.

The following will also fail to compile:

``` programlisting
...
declare p integer;
declare ret float;
declare t1i t1;

t1i := new t1();
p := 1;

ret := t1i.m1(p);
....
```

This time the `ret` has a declared type of FLOAT and there is no method
in t1 taking 1 INTEGER parameter and returning FLOAT.

The most consistent way of specifying the compile time type of a scalar
expression is to enclose it in a CAST statement, as follows:

``` programlisting
...
declare p float;
declare ret integer;
declare t1i t1;

t1i := new t1();
p := 1;

ret := t1i.m1(CAST (p as integer));
....
```

This will compile and execute correctly.

</div>

</div>

  

</div>
