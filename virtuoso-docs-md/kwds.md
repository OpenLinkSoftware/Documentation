<div>

<div>

<div>

<div>

### 11.7.4. Keyword and Optional Procedure Arguments

</div>

</div>

</div>

Normally arguments in a procedure call are bound to formal parameters
from left to right, as is the default behavior in any programming
language. If a default value is specified for a parameter in the
procedure definition this parameter is optional and the default value
will be assigned to it if the caller does not specify a value. A call
may consist of zero or more positional arguments followed by zero or
more keyword arguments. A positional argument is any scalar expression.
A keyword argument is marked with the syntax:

``` programlisting
NAME => scalar_exp
```

This notation specifies that the expression is to be bound to the
parameter NAME in the procedure declaration. The names are matched
case-insensitively in all case modes. After all leading positional
arguments have been bound to the matching formal parameters in the
procedure definition, each keyword argument is bound to the parameter of
the same name. After this all unbound formal parameters are assigned to
their default values. If a parameter with no default remains unbound an
error is signalled. OUT and INOUT parameters are always required,
regardless of the mode of calling.

An expression can be passed as INOUT or OUT, but in that case the output
value assigned by the procedure is not accessible in the caller. The
output value is only accessible if the actual parameter is a variable or
parameter.

Arguments of procedures are always evaluated left to right.

``` programlisting
create procedure kwd (in k1 int := 111, inout k2 int, in k3 int := 333)
{
  result_names (k1, k2, k3);
  result (k1, k2, k3);
}

kwd (1,1+1,3);
-- results 1,2,3

kwd ();
-- error because inout parameters are always required

kwd (k2=>1);
-- error because a constant is not a suitable value for an inout parameter.

kwd (k2=>1+2);
-- result 111, 2, 333

kwd (k3=>3, k1=>1,k2=>1+1);
-- result 1, 2, 3

kwd (1, k2=>1+1);
-- result 1, 2, 333
kwd (1);
-- error, k2 is required
kwd (badkey=>2, k2=>2+1);
-- error, badkey not a parameter of the function

create procedure kwd2 (in k1 int , in k2 int, in k3 int)
{
  result_names (k1, k2, k3);
  result (k1, k2, k3);
}

kwd2 (k1=>1, k2=>2, k3=>3);
-- result 1, 2, 3
kwd2 (1,2,3);
-- result 1, 2, 3
```

</div>
