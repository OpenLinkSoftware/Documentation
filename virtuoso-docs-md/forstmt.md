<div id="forstmt" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.11. FOR Select Statement

</div>

</div>

</div>

``` programlisting
<for statement> ::=
     FOR <query exp> DO statement
```

The FOR statement provides a compact notation for iterating over the
result set of a cursor. The body is executed once for each row in the
query expression's result set. The result columns produced by the query
expression are accessible as variables of the same name inside the body.
All result columns do therefore have to be named with the AS declaration
if they are not simple columns, in which case the name defaults to the
column's name.

The body can be exited in mid loop with a goto. The cursor of the FOR
does not have to be specifically closed or opened. FOR statements can be
freely nested. If a WHENEVER NOT FOUND declaration is in effect before
the FOR it will be canceled by it, so that it is not in effect after the
loop's body.

<div id="id35698" class="example">

**Example 11.2. Examples**

<div class="example-contents">

``` programlisting
for select C_NAME, sum (O_VALUE) as value  from CUSTOMER, ORDER group by C_NAME DO
  {
    result (C_NAME, value);
  })
```

The equivalent code is

``` programlisting
declare C_NAME, value any;
whenever not found goto done;
declare cr cursor for select ....;
open cr;
while (1) {
  fetch cr into C_NAME, value;
  whenever not found default;
  ...
}
done: ;
```

</div>

</div>

  

The cursor and end label names are generated to be unique by the FOR
expansion.

</div>
