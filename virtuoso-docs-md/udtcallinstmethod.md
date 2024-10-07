<div id="udtcallinstmethod" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.11. Calling Instance Methods

</div>

</div>

</div>

Let `T` be a user defined type that has an instance method `IM` . Let
`IT` be a scalar expression having a compile time type of `T` .

``` programlisting
IT.IM ( [ parameter, .... ] )
```

This will call the instance method `IM` of `T` and will return whatever
the `IM` returns.

Similarly to member observers/mutators the compile time type of `IT` can
be specified explicitly:

``` programlisting
(IT as T).IM ( [ parameter, .... ] )
```

This syntax however has an additional property in that it will call the
method of the type regardless of whether it is overloaded in a subtype
or not. Let `ST` be a subtype of `T` and `ST` that has the method `IM`
overloaded. Let `IST` be a scalar expression that represents an instance
of `ST` .

Then:

``` programlisting
(IST as T).IM ( [ parameter, ... ] )
```

will call the method `IM` as defined in `T` , whereas

``` programlisting
IST.IM ( [ parameter, ... ] )
```

will call the method `IM` as defined in `ST` .

<div id="ex_callinginstmethods" class="example">

**Example 9.10. Calling Overloaded Instance Methods**

<div class="example-contents">

``` programlisting
CREATE TYPE UDT_BASE
  method A () returns integer;

CREATE TYPE UDT_SUB under UDT_BASE
  OVERRIDING method A () returns integer;

create method A () returns integer for UDT_BASE
{
  return 1;
}

create method A () returns integer for UDT_SUB
{
  return 2;
}

select new UDT_SUB ().A() as IMPLICIT,
  (new UDT_SUB() as UDT_BASE).A() as EXPLICIT;
```

This will return:

``` programlisting
IMPLICIT        EXPLICIT
----------------------------
2           1
```

This is done so the overloaded methods can call the base type methods.

</div>

</div>

  

</div>
