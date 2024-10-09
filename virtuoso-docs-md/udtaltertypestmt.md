<div>

<div>

<div>

<div>

### 9.2.2. ALTER TYPE Statement

</div>

</div>

</div>

``` programlisting
ALTER TYPE type_name
 (  ADD ATTRIBUTE type_member
 | DROP ATTRIBUTE identifier [ CASCADE | RESTRICT ]
 | ADD method_specification
 | DROP original_method_specification [ CASCADE | RESTRICT ]

type_name :
  [ [ identifier  .] [ identifier ] . ] identifier

type_member :
  identifier data_type [ DEFAULT literal ] [ EXTERNAL NAME string ] [ EXTERNAL TYPE string ]
    [ __SOAP_TYPE literal ] [ __SOAP_NAME literal ]

type_option : SELF AS REF | TEMPORARY | SOAP_TYPE literal

method_specification : original_method_specification | overriding_method_specification

original_method_specification :
  [ STATIC | INSTANCE ] METHOD identifier ( [ decl_parameter, ... ] )
    RETURNS data_type [ method_characteristics ]
  |
  CONSTRUCTOR METHOD identifier ( [ decl_parameter, ... ] )  [ method_characteristics ]

overriding_method_specification :
    OVERRIDING [ INSTANCE ] METHOD identifier ( [ decl_parameter, ... ] )
    RETURNS data_type

method_characteristics :
  [ EXTERNAL TYPE literal ] [ EXTERNAL NAME string | EXTERNAL VARIABLE NAME string ]

language_name : SQL | CLR | JAVA
```

The ALTER TYPE statements modifies a user defined type. It can be used
for adding or dropping methods and members of user defined types.

<div>

|                              |                                                |
|:----------------------------:|:-----------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                          |
|                              | The ALTER TYPE is an autocommitting statement. |

</div>

<div>

**Example 9.4. Altering User Defined Types**

<div>

This example uses a SQL implemented user defined type UDT_ALTER_TYPE
with no supertype defined as follows:

``` programlisting
create type UDT_ALTER_TYPE as (A integer default 1)
method m1 (I integer) returns integer;
create method M1 (in I integer) returns integer for UDT_ALTER_TYPE
{
 return I;
};
```

Then it adds an attribute B to it :

``` programlisting
alter type UDT_ALTER_TYPE Add attribute B integer default 2;
```

Then drops the original A attribute :

``` programlisting
alter type udt_ALTER_TYPE drop attribute A;
```

Now let's add a new method M2 to the type :

``` programlisting
alter type UDT_ALTER_TYPE Add method M2 (ID integer) returns integer;
create method M2 (in ID integer) returns integer for UDT_ALTER_TYPE
{
  return ID + 100;
};
```

And drop the M1 method :

``` programlisting
alter type UDT_ALTER_TYPE drop method M1 (ID integer) returns integer;
```

</div>

</div>

  

</div>
