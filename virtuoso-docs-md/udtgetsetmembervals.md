<div>

<div>

<div>

<div>

### 9.2.9. Getting & Setting Member Values of Type Instances (member observers & mutators)

</div>

</div>

</div>

Let `T` be a user defined type that has a member `A` of type `AT` . Let
`IT` be an instance of type `T` .

<div>

<div>

<div>

<div>

#### Member Observers (Getting Values)

</div>

</div>

</div>

There are two alternative syntaxes (both scalar expressions):

``` programlisting
SQL200n :  A(<scalar_exp>)
Virtuoso extension :  <scalar_exp>.A
```

Both of the above will return a copy of the member's value of the
instance in \<scalar_exp\> when the scalar expression \<scalar_exp\> has
a compile time type of `T` . If the compile time type is not determined
to be a user defined type `T` the first one will be compiled as a call
to the SQL function `A` and the second will either generate a syntax
error or the server will consider it as reference to a scope variable
(depending on the type of \<scalar_exp\>).

These are also scalar expressions and have a compile time type `AT` .

To specify an explicit type of the scalar expression there is a third
syntax:

``` programlisting
(<scalar_exp> as T).A
```

This will force the server to compile a reference to the member `A` in
user defined type `T` . Whether the \<scalar_exp\> is indeed of type `T`
will be checked at runtime.

</div>

<div>

<div>

<div>

<div>

#### Member Mutators (Setting Values)

</div>

</div>

</div>

There are two alternative syntaxes (both scalar expressions):

``` programlisting
SQL200n :  A(<scalar_exp>, <new_value_scalar_exp>)
Virtuoso extension :  <scalar_exp>.A := <new_value_scalar_exp>
```

Both of the above will set the member's value of the instance in
\<scalar_exp\> to a copy of \<new_value_scalar_exp\> when the scalar
expression \<scalar_exp\> has a compile time type of `T` . If the
compile time type is not determined to be a user defined type `T` the
first one will be compiled as a call to the SQL function `A` and the
second will either generate a syntax error or the server will consider
it as reference to a scope variable (depending on the type of
\<scalar_exp\>).

These are also scalar expressions and have a compile time type `T` and
return a copy of the \<scalar_exp\>. To specify an explicit type of the
scalar exp there is a third syntax:

``` programlisting
(<scalar_exp> as T).A := <new_value_scalar_exp>
```

This will force the server to compile a reference to the member `A` in
user defined type `T` . Whether the \<scalar_exp\> is indeed of type `T`
will be checked at runtime.

<div>

**Example 9.8. Member Construction**

<div>

This will make a new object of type `UDT_FR_BASE` by calling it's two
int parameters constructor and will return the member `B` value of the
instance stored in member `UDT_M` of `UDT_FR_BASE` .

``` programlisting
select new UDT_FR_BASE (1, 2).UDT_M.B;
```

</div>

</div>

  

</div>

</div>
