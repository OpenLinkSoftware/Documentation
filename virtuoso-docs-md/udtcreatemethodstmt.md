<div>

<div>

<div>

<div>

### 9.2.4. CREATE METHOD Statement

</div>

</div>

</div>

``` programlisting
CREATE [ INSTANCE | STATIC | CONSTRUCTOR ] METHOD identifier
     ( parameter, .... ) [ RETURNS data_type ] FOR type_name
     {
       .....
     }

  parameter : { IN | OUT | INOUT } identifier data_type
```

For the SQL user defined types every method should be defined in order
to be callable. It is an error to call CREATE METHOD for a non-SQL
type's methods (as the methods are implemented in some other non-SQL
language).

There is no DROP METHOD as each CREATE METHOD will override the current
method definition (if any). The method name, parameter types and the
return type should match exactly the method declaration
(method_specification in CREATE TYPE).

The method name for the constructors is the name of the type (without
the qualifier and the owner).

For the constructor and instance methods there is a variable named
`SELF` (in scope for the compound statement defining the method)
representing the current type instance.

The method members and other methods are not in scope in the method's
compound statement. They should be accessed through the `SELF` variable.

<div>

**Example 9.6. Simple method demonstration**

<div>

This example defines the two parameter constructor for the UDT_TEST
type. It sets the values for the type members A and B to the values of
the constructor parameters. This example uses the SQL200n syntax for
method mutators (see below).

``` programlisting
create constructor method UDT_TEST (in _a integer, in _b integer)
  for UDT_TEST
{
  SELF := A(SELF, _a);
  SELF := B(SELF, _b);
  return SELF;
};
```

This defines the static method \_ADD for the type UDT_TEST. Note that it
does not use SELF - it would be a syntax error to do so.

``` programlisting
create static method _ADD (in a1 integer, in a2 integer)
  for UDT_TEST
{
  return a1 + a2;
};
```

</div>

</div>

  

</div>
