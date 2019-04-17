# SQL Reference

# Datatypes

  - CHARACTER  
    CHARACTER
    
    VARCHAR
    
    VARCHAR'('INTNUM')'
    
    NVARCHAR
    
    NVARCHAR'('INTNUM')'
    
    CHAR'('INTNUM')'

  - NUMERIC  
    NUMERIC
    
    NUMERIC'('INTNUM')'
    
    NUMERIC'('INTNUM','INTNUM')'

  - DECIMAL  
    DECIMAL
    
    DECIMAL'('INTNUM')'
    
    DECIMAL'('INTNUM','INTNUM')'

  - INTEGER  
    INT
    
    INTEGER
    
    SMALLINT

  - FLOAT  
    FLOAT
    
    FLOAT'('INTNUM')'

  - REAL  
    REAL
    
    DOUBLE PRECISION

  - LONG VARCHAR  
    BLOB data

  - VARBINARY \[( precision )\]  
    Binary data

  - LONG VARBINARY  
    Binary BLOB data

  - TIMESTAMP  
    TIMESTAMP
    
    DATETIME
    
    TIME
    
    DATE

  - \<UDT\>  
    User Defined Type with varbinary-like size properties.

  - LONG \<UDT\>  
    User Defined Type with LONG varbinary-like size properties.

  - LONG XML  
    LONG XML BLOB-like data type.

> **Note**
> 
> User Defined Types can be created from native or external types,
> composites or classes from any hosted language such as Java or .Net.
> Any User Defined Type can be used to define a column in a CREATE TABLE
> statement.

## Date Literals

Virtuoso does not support date literals or the DATE reserved keyword.
Literal dates should be enclosed in a conversion function such as
`stringdate()` , as in this example:

    select * from demo.demo.orders o
      where o.orderdate between stringdate('1994-01-01') And stringdate('1997-12-31')

Alternatively type casts can be used to explicitly instruct Virtuoso to
assume a string as a date, see below.

## Casting

Blob types can be cast to varchars. This will produce a string of up to
16 MB in length and an error for longer blobs.

Nothing can be cast to a blob type. Blobs only come from selecting blob
columns and are created by assigning values to such columns.

Converting non-integer values to integers rounds towards 0.

Any data type can be converted to binary with the VARBINARY target data
type. The result may or may not be meaningful. Specifically datetime can
be converted to binary and back.

    cast_expression :
            CAST '(' scalar_exp AS data_type [COLLATE collation_name ] ')'
    
    collation_name :
        identifier
        | owner '.' identifier
        | qualifier '.' owner '.' identifier

The CAST expression converts the type of the scalar\_exp into the
data\_type, if possible. If the conversion is not meaningful, as from a
float to a date, an error is signalled.

CAST is the recommended way of converting between data types, including
any conversion between strings, different number types and datetime
types.

    select cast ('2000-1-3' as date);
    
    select cast (cast ('2000-1-3' as date) as varchar);
        = 2000-01-03 00-00-00 000000

## Time & Date Manipulation

The SQL92 standard functions for time and date queries are available.
These are mapped to Virtuoso internal functions as follows:

CURRENT\_DATE

\-

curdate()

CURRENT\_TIME

\-

curtime()

CURRENT\_TIMESTAMP

\-

curdatetime()

The results of the above functions can also be obtained using the
[`now()`](#fn_now) function and casting to the appropriate target type.

Dates and times should be input or compared as literals in a standard
format. The following table describes the proper methods available:

| Datatype           | ODBC Syntax                         | SQL92 Casting                                    |
| ------------------ | ----------------------------------- | ------------------------------------------------ |
| Date               | {d 'yyyy-mm-dd'}                    | cast('yyyy-mm-dd' as date)                       |
| Time               | {t 'hh:mm:ss'}                      | cast('hh:mm:ss' as time)                         |
| Datetime/timestamp | {ts 'yyyy-mm-dd hh:mm:ss\[.f...\]'} | cast('yyyy-mm-dd hh:mm:ss\[.f...\]' as datetime) |

Time & date syntax

    select datecol from table
      where datecol > cast('1900-01-01' as date)
        and datecol < cast(now() as date);

now() is cast for explicit compatibility although not required.

## Declaring Collations of Expressions

A collation can be declared with CAST for string expressions. Suppose
insensitive\_ascii were a collation name specifying case insensitive
comparison of ASCII strings, the predicate:

    CAST 'foo' as varchar collate insensitive_ascii) = CAST 'FOO as varchar collate insensitive_ascii)

would be true.

This will alter the semantic of string comparison and can be used to
define a collation where the collation would otherwise be default, for
instance when comparing results of expressions or constants. This can
also alter the default collation implied by the collation declaration in
column options in CREATE TABLE.

# User Defined Types

A user-defined type is a schema object, identified by a user-defined
type name. The definition of a user-defined type specifies a number of
components, including in particular a list of attribute definitions. The
representation of a user-defined type is expressed as a list of
attribute definitions.

The definition of a user-defined type may include a method specification
list consisting of one or more method specifications. A method
specification is either an original method specification or an
overriding method specification. Each original method specification
specifies the method name, the SQL parameter declaration list, the
returns data type, the \<language clause\>, the language (if the
language is not SQL), and whether it is a STATIC or CONSTRUCTOR method.

Each overriding method specification specifies the method name, the SQL
parameter declaration list and the RETURNS data type. For each
overriding method specification, there must be an original method
specification with the same method name and SQL parameter declaration
list in some proper supertype of the user-defined type. Every
SQL-invoked method in a schema must correspond to exactly one original
method specification or overriding method specification associated with
some user-defined type existing in that schema. A method `M` that
corresponds to an original method specification in the definition of a
structured type `T1` is an original method of `T1` . A method `M` that
corresponds to an overriding method specification in the definition of
`T1` is an overriding method of `T1` . A method `M` is a method of type
`T1` if one of the following holds:

M

is an original method of

T1

M

is an overriding method of

T1

There is a proper supertype

T2

of

T1

such that

M

is an original or overriding method of

T2

and such that there is no method

M3

such that

M3

has the same method name and SQL parameter declaration list as

M

and

M3

is an original method or overriding method of a type

T3

such that

T2

is a proper supertype of

T3

and

T3

is a supertype of

T1

.

A user defined type can be a direct subtype of one (and only one) user
defined type. The user defined type cannot be a subtype of itself.

A type `Ta` is a direct subtype of a type `Tb` if `Ta` is a proper
subtype of `Tb` and there does not exist a type `Tc` such that `Tc` is a
proper subtype of `Tb` and a proper supertype of `Ta` .

A type `Ta` is a subtype of type `Tb` if one of the following pertains:

Ta

is a direct subtype of

Tb

; or

Ta

is a subtype of some type

Tc

and

Tc

is a direct subtype of

Tb

.

By the same token, `Tb` is a supertype of `Ta` and is a direct supertype
of `Ta` in the particular case where `Ta` is a direct subtype of `Tb` .
If `Ta` is a subtype of `Tb` , then `Ta` is proper subtype of `Tb` and
`Tb` is a proper supertype of `Ta` . A type cannot be a proper supertype
of itself. A type with no proper supertypes is a maximal supertype. A
type with no proper subtypes is a leaf type.

Let `Ta` be a maximal supertype and let `T` be a subtype of `Ta` . The
set of all subtypes of `Ta` (which includes `Ta` itself) is called a
subtype family of `T` or (equivalently) of `Ta` . A subtype family is
not permitted to have more than one maximal supertype. Every value in a
type `T` is a value in every supertype of `T` . A value `V` in type `T`
has exactly one most specific type `MST` such that `MST` is a subtype of
`T` and `V` is not a value in any proper subtype of `MST` . The most
specific type of value need not be a leaf type. For example, a type
structure might consist of a type `PERSON` that has `STUDENT` and
`EMPLOYEE` as its two subtypes, while `STUDENT` has two direct subtypes
`UG_STUDENT` and `PG_STUDENT` . The invocation `STUDENT( )` of the
constructor function for `STUDENT` returns a value whose most specific
type is `STUDENT` , which is not a leaf type. If `Ta` is a subtype of
`Tb` , then a value in `Ta` can be used wherever a value in `Tb` is
expected. In particular, a value in `Ta` can be stored in a column of
type `Tb` , can be substituted as an argument for an input SQL parameter
of data type `Tb` , and can be the value of an invocation of an
SQL-invoked function whose result data type is `Tb` . A type `T` is said
to be the minimal common supertype of a set of types `S` if `T` is a
supertype of every type in `S` and a subtype of every type that is a
supertype of every type in `S` .

> **Note**
> 
> Because a subtype family has exactly one maximal supertype, if two
> types have a common subtype, they must also have a minimal common
> supertype. Thus, for every set of types drawn from the same subtype
> family, there is some member of that family that is the minimal common
> supertype of all of the types in that set.

A user-defined type is declared by a user-defined type [CREATE TYPE
statement](#udtcreatetypestmt) .

## CREATE TYPE Statement

    CREATE TYPE type_name
       [ UNDER type_name ]
       [ LANGUAGE language_name [ EXTERNAL NAME literal ] ]
       [ AS (type_member, ...) ]
       [ type_option [type option ] .... ]
       [ method_specification, ... ]
    
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

The CREATE TYPE statements declares a user defined type. Generally
speaking the user defined types can be in two states:
forward-referenced, declared and instantiable.

A type is in forward reference state if it's name is quoted in some
other CREATE TYPE statement (as a supertype, member type or a method
parameter type or return type). When a type is in forward reference
state it's instances can be copied, passed as parameter values and
returned by functions, but it cannot be instantiated, no type members
can be accessed and no type methods can be called. Forward references
are temporary objects and they disappear at server shutdown.

A type moves to the declared state when a CREATE TYPE is executed for
it. In that state type methods can be called, type members can be
accessed, but the type cannot be instantiated.

A type goes into instantiable state from declared state when it has no
supertype or it's supertype is also in instantiable state. The server
tries to move the defined types to instantiable state on every CREATE
TYPE statement.

Normally the type definitions are stored into the
DB.DBA.SYS\_USER\_TYPES system table.

This has the following layout:

    CREATE TABLE SYS_USER_TYPES
    (
     UT_NAME VARCHAR,
     UT_PARSE_TREE LONG VARCHAR,
     UT_ID integer identity,
     UT_MIGRATE_TO integer,
     primary key (UT_NAME));

UT\_NAME

\- the fully qualified user defined type name.

UT\_PARSE\_TREE

\- the user defined type definition (in machine readable form).

UT\_ID

\- the ID of the type (used in persisting type instances to/from
network/storage).

UT\_MIGRATE\_TO

\- reserved for future use.

If a TEMPORARY type\_option is specified, the CREATE TYPE does not write
the type definition into the table - it declares the type only in
server's memory. TEMPORARY types are not persistable. They disappear
when the server is restarted. A TEMPORARY type cannot be a supertype or
a subtype of a non-TEMPORARY type.

The `SELF AS REF` option directs the server to return a reference to the
type's instance when instantiating the type, as opposed to returning the
instance itself. The references are explained in more detail in the
`NEW` operator.

> **Note**
> 
> The CREATE TYPE is an autocommitting statement.

This example creates a SQL implemented user defined type UDT\_TEST with
no supertype. It has two members : A and B, two constructor methods, a
static method \_ADD, an ADDIT method taking either zero or two arguments
and an instance method SUB\_IT.

    create type UDT_TEST
      as (A integer default 1, B integer default 2)
      CONSTRUCTOR METHOD UDT_TEST(_a integer, _b integer),
      CONSTRUCTOR METHOD UDT_TEST(),
      STATIC METHOD _ADD(_xx integer, _yy integer) returns integer specific DB.DBA.static_add,
      METHOD ADDIT() returns integer,
      METHOD ADDIT(c integer) returns integer,
      METHOD SUB_IT () returns integer;

This creates a subtype of UDT\_TEST named UDT\_TEST\_SUB. UDT\_TEST\_SUB
extends the static method \_ADD of UDT\_TEST so it can also take 4
arguments, overrides the method ADDIT from UDT\_TEST and defines a new
instance method MULTIPLY\_IT.

    create type UDT_TEST_SUB under UDT_TEST
      as (C integer default 12, _D integer default 32)
      STATIC METHOD _ADD(_xx integer, _yy integer, _zz integer, _qq integer) returns integer,
      OVERRIDING METHOD ADDIT() returns integer,
      METHOD MULTIPLY_IT () returns integer;

This is a SQL wrapper for a public Java type testsuite\_base (see
testsuite\_base.java).

    create type testsuite_base language java external name 'testsuite_base'
    as (
        protected_I integer external name 'protected_I' external type 'I',
        private_I integer external name 'private_I' external type 'I',
        sZ smallint external name 'Z' external type 'Z',
        sfalseZ smallint external name 'falseZ' external type 'Z',
        sB smallint external name 'B' external type 'B',
        sC smallint external name 'C' external type 'C',
        sS smallint external name 'S' external type 'S',
        sI int external name 'I' external type 'I',
        sJ int external name 'J' external type 'J',
        sF real external name 'F' external type 'F',
        sD double precision external name 'D' external type 'D',
        sL any external name 'L' external type 'Ljava/lang/Short;',
        sAI any external name 'AI' external type '[I',
        sAL any external name 'AL' external type '[Ljava/lang/Short;',
        sstr nvarchar external name 'str' external type 'Ljava/lang/String;',
        sdat datetime external name 'dat' external type 'Ljava/util/Date;',
    
        tF real external name 'F',
        "F" real,
    
        non_existant_var integer external name 'non_existant_var' external type 'I'
       )
        static method get_static_ro_I ()
        returns integer external type 'I' external variable name 'static_ro_I',
        static method get_static_I ()
        returns integer external type 'I' external variable name 'static_I',
        static method get_protected_static_I ()
        returns integer external type 'I' external variable name 'protected_static_I',
        static method get_private_static_I ()
        returns integer external type 'I' external variable name 'private_static_I',
    
        static method test_bool (x integer external type 'I')
        returns smallint external type 'Z' external name 'test_bool',
    
        constructor method testsuite_base (),
        constructor method testsuite_base (i integer external type 'I'),
    
        static method echoDouble (a double precision external type 'D')
        returns any external type 'Ljava/lang/Double;' external name 'echoDouble',
        static method getObjectType (a any external type 'Ljava/lang/Object;')
        returns varchar external type 'Ljava/lang/String;' external name 'getObjectType',
        static method echoThis (a testsuite_base external type 'Ltestsuite_base;')
        returns integer external type 'I' external name 'echoThis',
        static method static_echoInt (a integer external type 'I')
        returns integer external type 'I' external name 'static_echoInt',
    
        static method change_it (a testsuite_base)
        returns integer external type 'I' external name 'change_it',
    
        method "overload_method" (i integer external type 'I')
        returns integer external type 'I',
    
        method echoInt (a integer external type 'I')
        returns integer external type 'I' external name 'echoInt',
    
        method echoInt (a double precision external type 'D')
        returns integer external type 'I' external name 'echoInt',
    
        method protected_echo_int (a integer external type 'I')
        returns integer external type 'I' external name 'protected_echo_int',
    
        method private_echo_int (a integer external type 'I')
        returns integer external type 'I' external name 'private_echo_int',
    
        method "echoDbl" (a double precision)
        returns double precision,
    
        method non_existant_method (a integer external type 'I')
        returns integer external type 'I' external name 'non_existant_method',
    
        static method non_existant_static_var (a integer external type 'I')
        returns integer external type 'I' external variable name 'non_existant_static_var';

## ALTER TYPE Statement

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

The ALTER TYPE statements modifies a user defined type. It can be used
for adding or dropping methods and members of user defined types.

> **Note**
> 
> The ALTER TYPE is an autocommitting statement.

This example uses a SQL implemented user defined type UDT\_ALTER\_TYPE
with no supertype defined as follows:

    create type UDT_ALTER_TYPE as (A integer default 1)
    method m1 (I integer) returns integer;
    create method M1 (in I integer) returns integer for UDT_ALTER_TYPE
    {
     return I;
    };

Then it adds an attribute B to it :

    alter type UDT_ALTER_TYPE Add attribute B integer default 2;

Then drops the original A attribute :

    alter type udt_ALTER_TYPE drop attribute A;

Now let's add a new method M2 to the type :

    alter type UDT_ALTER_TYPE Add method M2 (ID integer) returns integer;
    create method M2 (in ID integer) returns integer for UDT_ALTER_TYPE
    {
      return ID + 100;
    };

And drop the M1 method :

    alter type UDT_ALTER_TYPE drop method M1 (ID integer) returns integer;

## DROP TYPE Statement

    DROP TYPE type_name

This statement reverses the effect of CREATE TYPE statement. If the type
has methods defined they are deleted as well. Note that forward
references cannot be dropped by a DROP TYPE.

The DROP TYPE statement can be used only for dropping types that are not
referenced in another type's UNDER statement.

Dropping the subtype from the previous section.

    drop type UDT_TEST_SUB;

## CREATE METHOD Statement

    CREATE [ INSTANCE | STATIC | CONSTRUCTOR ] METHOD identifier
         ( parameter, .... ) [ RETURNS data_type ] FOR type_name
         {
           .....
         }
    
      parameter : { IN | OUT | INOUT } identifier data_type

For the SQL user defined types every method should be defined in order
to be callable. It is an error to call CREATE METHOD for a non-SQL
type's methods (as the methods are implemented in some other non-SQL
language).

There is no DROP METHOD as each CREATE METHOD will override the current
method definition (if any). The method name, parameter types and the
return type should match exactly the method declaration
(method\_specification in CREATE TYPE).

The method name for the constructors is the name of the type (without
the qualifier and the owner).

For the constructor and instance methods there is a variable named
`SELF` (in scope for the compound statement defining the method)
representing the current type instance.

The method members and other methods are not in scope in the method's
compound statement. They should be accessed through the `SELF` variable.

This example defines the two parameter constructor for the UDT\_TEST
type. It sets the values for the type members A and B to the values of
the constructor parameters. This example uses the SQL200n syntax for
method mutators (see below).

    create constructor method UDT_TEST (in _a integer, in _b integer)
      for UDT_TEST
    {
      SELF := A(SELF, _a);
      SELF := B(SELF, _b);
      return SELF;
    };

This defines the static method \_ADD for the type UDT\_TEST. Note that
it does not use SELF - it would be a syntax error to do so.

    create static method _ADD (in a1 integer, in a2 integer)
      for UDT_TEST
    {
      return a1 + a2;
    };

## Type Instances

Every user defined type can have zero or more instances. Every instance
knows it's type. The instances are SQL values. They are copyable.
Instances for SQL types contain placeholders for the type's members.
Instances for non-SQL types contain a reference to the real instance in
type's hosted environment. (Java VM for JAVA and the CLR virtual machine
for CLR). So copying an instance is different for SQL and non-SQL types.
When a SQL type's instance is copied a new set of members placeholders
is created and all members values are copied. This way the copy does not
hold any link to it's original and they can be considered as two
different instances. This means that changing members' value in the copy
will not affect the original.

The non-SQL types instances hold only a reference to the real instance.
So copying such an instance is equivalent of making another reference to
the foreign object. Thus changing the member's value in the copy WILL
affect the original. Usually the foreign virtual machines have a means
of explicitly copying an instance, but they are not used by the Virtuoso
server when copying the SQL values.

As with the other SQL values, an instance gets destroyed when it is no
longer referenced.

## Instance References

Because the SQL types instances cannot be referenced by more than one
variable/type member Virtuoso PL implements instance references. The
references are created for the types marked with `SELF AS REF
type_option` (see [CREATE TYPE](#udtcreatetypestmt) ). For such types
the constructor(s) make a SQL value of reference type in addition to
making the instance itself. The engine places the instances in a
connection specific cache of instances and returns a SQL value of type
reference which points to that instance. Copying the reference value
will not cause copying the instance into the cache, so a `SELF AS REF`
type will behave as a hosted class with respect to changing values in
the copy. A new instance in the cache will be created only when the
constructor for the type is called again. The server will accept a SQL
reference value in every place where an instance value is expected. When
a reference is serialized, as in when storing into a column of a table,
the server will serialize the instance data, not the reference itself.

The connection's instance cache is cleared after the completion of the
current server operation, i.e. completion of the top level state,
statement invoked by a client or the completion of processing an HTTP
request. The cache will thus survive multiple transactions if these are
transacted within a single client initiated operation.

## NEW Operator

    [ NEW ] type_name ( [ parameter_value, .... ] )

This returns an instance (or reference to an instance) of the user
defined type type\_name. It will try to match a constructor by
calculating the parameter types at compile time and matching the so
produced signature to the closest constructor signature (see below:
[finding methods](#udtfindingmethods) ). The SQL types have an implicit
constructor with no parameters that assigns the DEFAULT values to the
type members (if any, otherwise NULL). When a SQL constructor is called
it will have the `SELF` set-up to the result of calling the implicit
constructor. The NEW operator is a scalar expression and can be used
wherever the SQL syntax allows scalar expressions.

## Finding Methods - Method Signatures Generation & Comparison

A method of a user defined type is identified uniquely by the
combination of the following:

the method name

number of the method's parameters

the method's parameter types

the method's return type

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

Consider a method `m1` of type `t1` taking an INTEGER parameter and
returning an integer value:

    CREATE METHOD m1 (in x integer)
      for t1 returns integer
    { return x + 10; };

Now consider calling the method as follows (in a Virtuoso/PL procedure):

    ...
    declare p float;
    declare ret integer;
    declare t1i t1;
    
    t1i := new t1();
    p := 1;
    
    ret := t1i.m1(p);
    ....

This will yield a compilation error explaining that there is no method
`m1` of user defined type `t1` . It will do that because p has a compile
time type of FLOAT.

The following will also fail to compile:

    ...
    declare p integer;
    declare ret float;
    declare t1i t1;
    
    t1i := new t1();
    p := 1;
    
    ret := t1i.m1(p);
    ....

This time the `ret` has a declared type of FLOAT and there is no method
in t1 taking 1 INTEGER parameter and returning FLOAT.

The most consistent way of specifying the compile time type of a scalar
expression is to enclose it in a CAST statement, as follows:

    ...
    declare p float;
    declare ret integer;
    declare t1i t1;
    
    t1i := new t1();
    p := 1;
    
    ret := t1i.m1(CAST (p as integer));
    ....

This will compile and execute correctly.

## Getting & Setting Member Values of Type Instances (member observers & mutators)

Let `T` be a user defined type that has a member `A` of type `AT` . Let
`IT` be an instance of type `T` .

### Member Observers (Getting Values)

There are two alternative syntaxes (both scalar expressions):

    SQL200n :  A(<scalar_exp>)
    Virtuoso extension :  <scalar_exp>.A

Both of the above will return a copy of the member's value of the
instance in \<scalar\_exp\> when the scalar expression \<scalar\_exp\>
has a compile time type of `T` . If the compile time type is not
determined to be a user defined type `T` the first one will be compiled
as a call to the SQL function `A` and the second will either generate a
syntax error or the server will consider it as reference to a scope
variable (depending on the type of \<scalar\_exp\>).

These are also scalar expressions and have a compile time type `AT` .

To specify an explicit type of the scalar expression there is a third
syntax:

    (<scalar_exp> as T).A

This will force the server to compile a reference to the member `A` in
user defined type `T` . Whether the \<scalar\_exp\> is indeed of type
`T` will be checked at runtime.

### Member Mutators (Setting Values)

There are two alternative syntaxes (both scalar expressions):

    SQL200n :  A(<scalar_exp>, <new_value_scalar_exp>)
    Virtuoso extension :  <scalar_exp>.A := <new_value_scalar_exp>

Both of the above will set the member's value of the instance in
\<scalar\_exp\> to a copy of \<new\_value\_scalar\_exp\> when the scalar
expression \<scalar\_exp\> has a compile time type of `T` . If the
compile time type is not determined to be a user defined type `T` the
first one will be compiled as a call to the SQL function `A` and the
second will either generate a syntax error or the server will consider
it as reference to a scope variable (depending on the type of
\<scalar\_exp\>).

These are also scalar expressions and have a compile time type `T` and
return a copy of the \<scalar\_exp\>. To specify an explicit type of the
scalar exp there is a third syntax:

    (<scalar_exp> as T).A := <new_value_scalar_exp>

This will force the server to compile a reference to the member `A` in
user defined type `T` . Whether the \<scalar\_exp\> is indeed of type
`T` will be checked at runtime.

This will make a new object of type `UDT_FR_BASE` by calling it's two
int parameters constructor and will return the member `B` value of the
instance stored in member `UDT_M` of `UDT_FR_BASE` .

    select new UDT_FR_BASE (1, 2).UDT_M.B;

## Calling Static Methods

Let `T` be a user defined type that has a static method `SM` .

    T::SM ( [ parameter, .... ] )

This will call the static method of `SM` of `T` and will return whatever
the static method returns.

    select UDT_TEST::_ADD (1, 2);

## Calling Instance Methods

Let `T` be a user defined type that has an instance method `IM` . Let
`IT` be a scalar expression having a compile time type of `T` .

    IT.IM ( [ parameter, .... ] )

This will call the instance method `IM` of `T` and will return whatever
the `IM` returns.

Similarly to member observers/mutators the compile time type of `IT` can
be specified explicitly:

    (IT as T).IM ( [ parameter, .... ] )

This syntax however has an additional property in that it will call the
method of the type regardless of whether it is overloaded in a subtype
or not. Let `ST` be a subtype of `T` and `ST` that has the method `IM`
overloaded. Let `IST` be a scalar expression that represents an instance
of `ST` .

Then:

    (IST as T).IM ( [ parameter, ... ] )

will call the method `IM` as defined in `T` , whereas

    IST.IM ( [ parameter, ... ] )

will call the method `IM` as defined in `ST` .

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

This will return:

    IMPLICIT        EXPLICIT
    ----------------------------
    2           1

This is done so the overloaded methods can call the base type methods.

## Serializing & Deserializing Type Instances

Virtuoso allows serializing and deserializing of non TEMPORARY type
instances. This means that the instances can be saved as a column value
and can be used with the serialize/deserialize SQL functions.

This creates a type SER\_UDT, a table UDT\_TABLE with a DATA column
capable of storing SER\_UDT instances, stores an instance of SER\_UDT
into the table and demonstrates some selects using the stored instance.

    create type SER_UDT as (A integer default 12)
      method NEGATE () returns integer;
    
    create method NEGATE () returns integer for SER_UDT
    {
      return SELF.A * -1;
    }
    
    create table UDT_TABLE (ID integer primary key, DATA SER_UDT);
    
    insert into UDT_TABLE (ID, DATA) values (1, new SER_UDT ());
    
    select C.DATA.A from UDT_TABLE C where C.ID = 1;
    
    select C.ID from UDT_TABLE C where C.DATA.A > 10;
    
    select C.ID from UDT_TABLE C where C.DATA.NEGATE() < -10;

Note that the table alias is mandatory here.

    select ID from UDT_TABLE where DATA.A > 10;

and

    select ID from UDT_TABLE where DATA.NEGATE() < -10;

will both yield a syntax error.

The columns of a certain type allow storing subtype instances as well.
The subtype instances will not be converted to the their supertype when
stored.

If we define the type `SER_UDT_SUB` as:

    create type SER_UDT_SUB under SER_UDT
      as (B integer default 13);

then we can do:

    insert into UDT_TABLE (ID, DATA) values (2, new SER_UDT_SUB ());
    
    select (C.DATA as SER_UDT_SUB).B from UDT_TABLE C where C.ID = 2;

Type instances can be stored into an ANY column:

    create table ANY_TABLE (ID integer primary key, DATA any);
    
    insert into ANY_TABLE (ID, DATA) values (1, new SER_UDT());
    
    select (C.DATA as SER_UDT).A from ANY_TABLE C where C.ID = 1;

    select (DESERIALIZE (SERIALIZE (new SER_UDT ())) as SER_UDT).A;

The SERIALIZE VSE can be used to store larger type instances into LONG
VARCHAR columns. For example:

    create table LOB_TABLE (ID integer primary key, LOB_DATA LONG VARCHAR);
    
    insert into LOB_TABLE (ID, LOB_DATA) values (1, SERIALIZE (new SER_UDT()));
    
    select (DESERIALIZE (BLOB_TO_STRING (LOB_DATA)) as SER_UDT).A
      from LOB_TABLE where ID = 1;

The serialization/deserialization for the non-SQL type instances is done
by the means of the hosted language (Java Object serialization API and
CLR Binary serialization API). So to be serialized/deserialized
correctly the Java classes must implement the java.io.Serializable
interface and the CLR classes should have the \[Serializable\] attribute
set. For details refer to the respective API documentation.

## User Defined Types Utility Functions

Virtuoso implements the following user defined types utility functions:

udt\_instance\_of()

udt\_defines\_field()

udt\_implements\_method()

udt\_get()

udt\_set()

## Hosted Foreign Objects in Virtuoso

### Java VM Hosted Objects

A special build of Virtuoso hosts a Java VM and allows manipulation of
Java classes through the SQL user defined types.

In order to access the Java class instances they have to be defined as
Virtuoso types using CREATE TYPE and specifying LANGUAGE JAVA. Java
classes have to be in the CLASSPATH of the hosted Java VM.

Java (Point.java):

    public class Point implements java.io.Serializable
    {
      public double x = 0;
      public double y = 0;
    
      public Point (double new_x, double new_y)
      {
        x = new_x;
        y = new_y;
      }
    
      public double distance (Point p)
      {
        return Math.sqrt ((p.x - this.x) * (p.x - this.x) + (p.y - this.y) * (p.y - this.y));
      }
    }

This Java class should be compiled and the corresponding Point.class
should be placed in the hosted VM's classpath. Then a Virtuoso user
defined type should be created as follows:

    create type Point language java external name 'Point'
     as (
      x double precision external name 'x',
        y double precision external name 'y'
    )
    
    constructor method Point (new_x double precision, new_y double precision),
    method distance (Point p) returns double precision external name 'distance';

From now on the SQL Point type can be used to create instances of the
Java Point class, access it's members, call it's methods and store it
into tables (since the Java Point class implements the
`java.io.Serializable` interface).

For the hosted Java objects a LANGUAGE JAVA should be specified. The
format of EXTERNAL NAME is:

the full name of the Java class for classes (ex. 'java.lang.Class')

the name of the methods/instance members

Since Java has static members and the Virtuoso SQL types do not,
Virtuoso allows read-only access to static members through static
observer functions with EXTERNAL VARIABLE NAME instead of EXTERNAL NAME.

    java (stat.java) :
    public class stat
    {
      static stat_m double;
    }

Virtuoso SQL:

    create type stat language java external name 'stat'
    static method observe_stat_m ()
      returns double precision external variable name 'stat_m';

Virtuoso does automatic mapping between the Virtuoso SQL data types and
the Java data types. Since Java data types are much more primitive than
Virtuoso types it is safe to explicitly specify the Java type of an
instance member, method parameter or method return value. This is done
by using the Type Signatures format described in the Java Native
Interface Specification (chapter 3 : JNI Types and Data Structures :
Table 3.2). The signatures are supplied as string values to EXTERNAL
TYPE clause.

To facilitate the creation of the wrapper SQL types Virtuoso uses the
Java Reflection API to get the description of the class in XML form.
This XML is then transformed using an XSL stylesheet to makes the CREATE
TYPE statements required automatically. In the process it preserves the
superclass/subclass relationships of the specified Java classes and
represents them as a supertypes/subtypes in SQL. The
[`jvm_ref_import()`](#fn_jvm_ref_import) procedure is used to create the
XML by calling the Java Reflection API.

The function [`import_jar()`](#fn_import_jar) takes the same parameters
as `jvm_ref_import()` but will automatically create and execute the
create type statements within the Virtuoso server.

| Java Type/Class  | Virtuoso Internal Type |
| ---------------- | ---------------------- |
| boolean          | smallint               |
| byte             | smallint               |
| char             | smallint               |
| short            | integer                |
| int              | integer                |
| long             | integer                |
| float            | real                   |
| double           | double precision       |
| byte\[\]         | binary                 |
| java.lang.String | NVARCHAR               |
| java.util.Date   | DATETIME               |
| \[\]             | vector                 |

Java Type to Virtuoso Type Conversions

| Virtuoso Internal Type | Java Type/Class  |
| ---------------------- | ---------------- |
| smallint               | short            |
| integer                | integer          |
| real                   | float            |
| double precision       | double           |
| varchar                | java.lang.String |
| nvarchar               | java.lang.String |
| datetime               | java.util.Date   |
| timestamp              | java.util.Date   |
| binary                 | byte\[\]         |

Virtuoso Type to Java Type Conversions

For all the other types encountered in the signatures of the Java
methods/members it makes a forward reference to a Virtuoso/PL user
defined type based on the java class name, replacing the dot ('.') with
the underscore ('\_') character.

For example:

`'java.lang.System'` becomes `'java_lang_System'`

In order to correctly map a java superclass/subclass relationship
between class A and class B when importing, it is necessary to include
A, B and all the intermediate classes in the superclass/subclass chain
in a single `import_jar()` call.

To implement serialization/deserialization for Java object the Virtuoso
needs the \_\_virt\_helper Java class. This class contains utility
functions implementing serialization/deserialization. This class must be
in the CLASSPATH.

The Java VM hosted inside the Virtuoso binary is not started at startup,
but when first needed. It's startup is marked by a message in the
Virtuoso log file. An application can control the initialization of the
Java VM by explicitly initializing the Java VM (preferably on server
startup) by calling the VSE: [`java_vm_attach()`](#fn_java_vm_attach)

### CLR Hosted Objects

A special virtuoso build is available to allow SQL types integration
with the CLR (Common Language Runtime) on Windows. This is achieved by
providing COM server in C\# (virtclr.dll) that is called from the native
code through COM.

The virtclr.dll library should be registered into the CLR's Global
assembly cache.

The semantics of CLR hosted objects are largely the same as those
described for Java hosted objects. As before, native objects need SQL
Type wrappers, but with LANGUAGE CLR clause specified.

To automatically create the SQL Type wrappers based on the CLR
Reflection API the Virtuoso CLR binary has a system stored procedure:
[`import_clr()`](#fn_import_clr)

There are three forms for specifying the EXTERNAL NAME of a CLR class:

  - a) `<Assembly public name>/<namespace-prefixed-class-name>` Here the
    Virtuoso CLR host issues Assembly.Load with `<Assembly public
                name>` to find the assembly. After finding it, it looks for
    `<namespace-prefixed-class-name>` in it.

  - b) `<namespace-prefixed-class-name>` Here the Virtuoso CLR host
    issues Assembly.Load with `<namespace-prefixed-class-name>` . After
    finding it, it looks for `<namespace-prefixed-class-name>` in it.

  - c) `<path-to-the-assembly-binary>/<namespace-prefixed-class-name>`
    Here the Virtuoso CLR host issues Assembly.LoadFrom with
    `<path-to-the-assembly-binary>` . After finding it, it looks for
    `<namespace-prefixed-class-name>` in it.

The Virtuoso CLR host does the above when creating an instance of the
type, accessing static methods or properties.

However when it deserializes an serialized CLR instance it calls the CLR
deserialization class BinaryFormatter. The BinaryFormatter.Deserialize
calls internally Assembly.Load to find the serialized class description.
So although the classes defined with EXTERNAL name as in c) above are
otherwise accessible (and serializable) they will possibly not
deserialize correctly (as the assembly binary may not be findable
through the Assembly.Load). To avoid that CLR limitation it is advisable
to use the EXTERNAL NAME forms a) and b) wherever possible.

The Assembly.Load process of finding Assemblies is very well documented
on the [MSDN](#) . Note that if an assembly was loaded through
Assembly.LoadFrom it is not considered as "already loaded" by the
Assembly.Load. The Virtuoso CLR is a CLR runtime host. As such it can
use the normal CLR configuration files. It also is able of using private
assemblies.

> **Tip**
> 
> The [Create Assembly](#createassembly) Syntax

### ASPX Hosting Using the Hosted CLR

Virtuoso CLR hosting allows ASPX pages to be executed through the
Virtuoso HTTP server inside the hosted CLR Virtual machine. To enable
this support an additional library (virt\_http.dll) needs to be
registered with the Global Assembly cache. Having achieve this and
copying ASPX project files under the Virtuoso HTTP server's root allows
direct execution of the ASPX page. See the sample ASPX pages in the
Virtuoso distribution.

If the ASPX project files reside in a WebDAV directory they are copied
into a temporary file system directory under a special temporary
directory (configurable by the TempASPXDir INI parameter in
\[HTTPServer\] section of [virtuoso ini](#virtini) file) before
executed. In order to be execute correctly from WebDAV the ASPX files
should have Execute WebDAV permission set them. The execution of ASPX is
also controlled by the EnableDavVSP INI parameter in the \[HTTPServer\]
as with any active content within WebDAV.

> **Tip**
> 
> [Deploying ASP.Net Web Applications](#rthwritaspxapps)
> 
> Runtime Hosting

### Expressing Hosted Language Supertype/Subtype Dependencies With Virtuoso/PL User-Defined-Types

It is also possible to represent the tree or in-part of Java or the
CLR's superclass/subclass hierarchy with Virtuoso user defined type
mappings.

Consider the following sample Java code:

    class g1 { public int g1_value; public int mtd_g1 (int x) { return g1_value; } };
    class g2 extends g1 { public int g2_value; public int mtd_g2 (int x) { return g2_value; } };
    class g3 extends g2 { public int g3_value; };
    class g2_sib extends g1 { public int g2_sib_value; };
    
    class uses_types {
      public static g3 mtd (int x) { return new g3 (); }
    }

One can create SQL user defined types for `g1` , `g2` and `g3` to
represent the `g1` /`g2` / `g3` Java class hierarchy if calling `mtd_g1`
and `mtd_g2` is needed:

    create type sql_g1 language java external name 'g1' as (
        g1_value int)
    method mtd_g1 (x integer) returns integer;
    
    create type sql_g2 under sql_g1 language java external name 'g2' as (
        g2_value int)
    method mtd_g2 (x integer) returns integer;
    
    create type sql_g3 under sql_g2 language java external name 'g3' as (
        g3_value int)
    method mtd_g3 (x integer) returns integer;
    
    create type uses_types language java external name 'uses_types'
     static method mtd (x integer) returns sql_g3;

provided with the above, one can call `uses_types.g3 ()` method and call
`mtd_g1 ()` on the returned instance in Virtuoso/PL as follows:

    select uses_types::mtd (12).mtd_g1 (10);

Sometimes it is not desirable or necessary to mirror the full
supertype/subtype hierarchy from Java to Virtuoso/PL.

For the above example only `sql_g2` and `sql_g3` can be defined if the
goal was to call `mtd_g2()` instead of `mtd_g1()` .

When creating instances of the Virtuoso/PL user defined types to
represent the data returned by the hosted code, Virtuoso tries to find
the closest common ancestor of the hosted instance's class and the ones
defined in Virtuoso as user defined types.

For example if in the above example a Java function returns an instance
of `g3` and there is a `sql_g3` defined inside virtuoso the `g3` Java
instance will be wrapped into an `sql_g3` Virtuoso/PL instance. Note
that that will not depend on the presence or absence of `sql_g1` and
`sql_g2` definitions - i.e. Virtuoso will favor the exact match.

If, however `sql_g3` is not defined, but `sql_g2` and `sql_g1` are, then
the `g3` instance will be wrapped up in an `sql_g2` instance when
returned.

Similarly, if an instance of the `g2_sib` is to be returned in
Virtuoso/PL and `sql_g1` to `sql_g3` are defined, Virtuoso will wrap the
`g2_sib` Java instance into an `sql_g1` SQL instance.

## Using User Defined Types to Represent SOAP Structures

The Virtuoso SOAP server is capable of using user defined types (both
native and hosted) to represent structures in SOAP requests/responses.
Normally a SOAP exposed procedure would have references to defined
schema types (\_\_SOAP\_TYPE for it's return type and for it's argument
types). When such a schema type represents a structure (see the SOAP RPC
encoding) the Virtuoso SOAP server will map the structure to an array of
name/value pairs for it's members (the type of value returned by the
soap\_box\_structure VSE). The user defined types however are better
suited for representing such data. In order for a user defined type to
be usable in SOAP, it must have a default constructor (no arguments).
For native types that is always true (since they have the implicit
constructor setting up the member's values to the respective DEFAULT
values from the user defined type declaration). The Virtuoso SOAP
implementation supports two ways of specifying how a SOAP value XML
fragment should be materialized as a user defined type instance, as
follows.

### Using Schema Fragments

The [`SOAP_DT_DEFINE()`](#fn_soap_dt_define) function is used to map a
particular schema fragment describing a composite schema type for SOAP
usage. This now takes an additional optional argument to establish a
link to a user defined type name:

    create type SO_S_30
      as (
          "varString" nvarchar,
          "varInt" integer,
          "varFloat" real,
          "processingResult" nvarchar,
          "vmVersion" nvarchar)
      constructor method SO_S_30 (),
      method process_data () returns nvarchar;
    
    soap_dt_define ('',
    '<complexType name="SOAPStruct"
       xmlns:enc="http://schemas.xmlsoap.org/soap/encoding/"
       xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
       xmlns="http://www.w3.org/2001/XMLSchema"
       targetNamespace="services.wsdl"
       xmlns:tns="services.wsdl">
      <all>
        <element name="varString" type="string" nillable="true"/>
        <element name="varInt" type="int" nillable="true"/>
        <element name="varFloat" type="float" nillable="true"/>
        <element name="processingResult" type="string" nillable="true"/>
        <element name="vmVersion" type="string" nillable="true"/>
      </all>
    </complexType>', 'SO_S_30');

The CREATE TYPE statement defines the user defined type SO\_S\_30 as
having 5 data members, a no-parameters constructor and a processing
method. The `soap_dt_define()` call maps the SO\_S\_30 to a schema type
SOAPStruct which also has 5 data members and makes that schema type
available to SOAP. Now we create a SOAP exposed stored procedure:

    create procedure echoSOAPStructSch (
        in sst SO_S_30 __soap_type 'services.wsdl:SOAPStruct')
    returns SO_S_30 __soap_type 'services.wsdl:SOAPStruct'
    {
      declare processingResult nvarchar;
      processingResult := sst.process_data ();
      return sst;
    };

When processing the SOAP request for calling that stored procedure, the
SOAP server will call the default constructor for SO\_S\_30 (require to
create the empty instance) and will fill up the values from the incoming
XML fragment for the sst parameter to the members of the newly created
SO\_S\_30 instance. Then it will pass that instance as a value for the
sst parameter of the echoSOAPStructSch function. As a result
echoSOAPStructSch will correctly execute the member function
process\_data. Then it will return the (possibly) modified SO\_S\_30
instance to the SOAP server. The SOAP server will make the XML fragment
for the return value based on the SOAPStruct schema fragment using the
values from the SO\_S\_30 members.

This approach allows easy migration for the existing SOAP services using
structures. To upgrade a SOAP service procedure to use user defined
types one should define the types and add the additional argument to
`SOAP_DT_DEFINE()` .

For developing new SOAP services, however, it is redundant to create the
schema fragment in addition to creating the user defined type to hold
the SOAP structure.

For this reason, Virtuoso offers a second approach in using user defined
types in SOAP.

### Using the User Defined Type Definition

Consider the altered definition of SO\_S\_30 as follows:

    create type SO_S_30
      as (
          varString nvarchar __soap_type 'string' __soap_name 'varString',
          "varInt" integer __soap_type 'int',
          "varFloat" real __soap_type 'float',
          "processingResult" nvarchar __soap_type 'string',
          "vmVersion" nvarchar)
      __soap_type 'services.wsdl:SOAPStruct'
      constructor method SO_S_30 (),
      method process_data () returns nvarchar;

and the procedure echoSOAPStructSch as:

    create procedure echoSOAPStructSch (in sst SO_S_30) returns SO_S_30
    {
      declare processingResult nvarchar;
      processingResult := sst.process_data ();
      return sst;
    };

Now all we have to do is expose the echoSOAPStructSch in a SOAP service.
The SOAP server will take into account the fact that the sst type and
the return type are user defined types and automatically make the WSDL
description (including the schema fragments) and will correctly process
the incoming XML.

The SOAP names and data type names inside the user defined type
definition are optional and default to the SQL member's name for names
and employ a straight mapping of the PL types to the SOAP types for data
types.

## Consuming Third-Party SOAP Services via User Defined Types

Virtuoso provides function for acting as a SOAP client called
[`SOAP_CLIENT()`](#fn_soap_client) . Embedding SOAP Web Service methods
in Virtuoso/PL procedures using this function, however, is not suitable
in most cases, especially if the services contained a large number of
parameters of different type, the procedure could become very complex,
the encoding may also vary. Thus direct SOAP\_CLIENT() invocation in
some cases in non-trivial and may lead to errors that are hard to debug.

To aid development of Web based applications written in PL that use the
SOAP protocol, Virtuoso introduces two new approaches for consuming a
Web service:

generate SOAP proxy wrappers encapsulated in a PL Module

generate a User Defined Type (UDT) for SOAP proxy encapsulation.

Please note that both methods of making a SOAP proxy-wrapper requires a
WSDL description. If some SOAP service does not have a corresponding
WSDL, neither of these methods can be used.

The first approach can be achieved using the SOAP\_WSDL\_IMPORT()
function. This will make a PL module utilizing the SOAP\_CLIENT()
function that will import the complex types and pass appropriate
parameters. But it has one significant problem in that it will return
the result as a parsed XML entity. The result should then be processed
in the application code, which requires prior knowledge of the return
parameters.

The second approach consists of creating a UDT encapsulation of the SOAP
wrappers using the [`WSDL_IMPORT_UDT()` .](#fn_wsdl_import_udt)

> **Tip**
> 
> The [`SOAP_WSDL_IMPORT()`](#fn_soap_wsdl_import) function.
> 
> The [`WSDL_IMPORT_UDT()`](#fn_wsdl_import_udt) function.

The import function `WSDL_IMPORT_UDT()` has two phases:

retrieve and expand the WSDL file (expansion will be done if import is
specified)

compile the result and make SQL script with UDT definition

The following points will hold true for this method of SOAP
encapsulation:

  - Any XML Schema types, required for calling the target SOAP service
    will be imported in database.

  - A UDT will be created for each service defined within the WSDL
    description.

  - The UDT will have members: url, request, response, and debug.
    
      - the 'url' member designate the endpoint for SOAP invocation
    
      - debug is a flag to manage wrappers to return wire dumps if
        needed
    
      - request and response members will contain wire dumps if 'debug'
        is equal to 'true' (integer 1).

  - for each method defined in the WSDL description there will be UDT's
    method.

  - each method of UDT will contain:
    
      - a number IN/OUT/INOUT parameters (depending on the target
        method)
    
      - no return value, SOAP does not define explicitly return values.
    
      - call to the SOAP\_CLIENT () function with appropriate arguments
    
      - XPATH over the result and transform with SOAP validation
        functions to ensure value of OUT and INOUT parameters.

> **Tip**
> 
> The Virtuoso Administration Interface provides a web based interface
> for importing WSDL definitions and creating UDTs and procedures. This
> can be found in the [Visual Server Administration
> Interface](#admiui.wsdl) Chapter.

## UDT Security

Security of UDTs is maintained through normal SQL GRANT and REVOKE
statements via a simple extension. You can define the level of access to
both native and externally hosted UDTs.

Grants for persistent user defined types are persisted into the
SYS\_GRANTS table. Grants on temporary user defined types are in-memory
only and are lost (together with the temporary user defined type
definition) when the server is restarted.

There are two GRANT/REVOKE types for UDTs as follows:

EXECUTE

\- all methods and members of a class are accessible to the grantee.

UNDER

\- the grantee can create subclasses of the class.

    GRANT/REVOKE EXECUTE on <user_defined_type>
    GRANT/REVOKE UNDER on <user_defined_type>

> **Note**
> 
> SQL modules, user defined types and SQL stored procedures are exposed
> to GRANT/REVOKE in the same namespace, therefore care must be taken
> avoid inadvertently granting to multiple objects at the same time.

# XML Column Type

Virtuoso allows for native XML storage in a database table column using
the `LONG XML` type. This data type is a variation of `LONG VARCHAR`
that can have plain text or XML entities, persistent or non-persistent
values, but will always return an XML entity when selected.

Since ODBC does not support an XML entity type this column will appear
as a LONG VARCHAR when selected from ODBC based clients.

    CREATE TABLE xml_col_test (
      id INTEGER,
      txt VARCHAR,
      xmltxt LONG XML
      )
      ;
    
      INSERT INTO xml_col_test (id, txt, xmltxt)
        VALUES (1, 'test', '<xml><test>test</test><test>test2</test></xml>');
    
      INSERT INTO xml_col_test (id, txt, xmltxt)
        VALUES (2, 'test', xml_tree_doc('<xml><test>test</test><test>test2</test></xml>'));
    
      select * from xml_col_test;
    id          txt               xmltxt
    INTEGER     VARCHAR           LONG VARCHAR
    ____________________________________________________________________________
    
    1           test              <xml><test>test</test><test>test2</test></xml>
    2           test              <xml><test>test</test><test>test2</test></xml>

> **Tip**
> 
> The [`xml_tree_doc()`](#fn_xml_tree_doc) also returns an XML entity
> and describes other functions that work with it.

# Identifier Case & Quoting

Virtuoso can operate with different identifier case conventions. The
CaseMode setting in the virtuoso.ini file controls this, see the
[virtuoso.ini configuration](#virtini) section of the documentation.

The default files supplied with Virtuoso specify a CaseMode of 2, which
is a case insensitive mode that preserves the declaration case of
identifiers.

A CaseMode of 1 specifies the upper case mode, which is most commonly
used in SQL databases, e.g. Oracle. In the upper case mode, all unquoted
identifiers are converted to upper case by the SQL parser. If
identifiers are not quoted, the case in which they are entered is
irrelevant.

The identifier quote character is the double quote ("). Quoted
identifiers are processed in the case they are written in and are thus
case sensitive.

SQL reserved words are case insensitive in all case modes.

If CaseMode is 0 or absent, identifiers will be treated as case
sensitive in all situations, whether quoted or not.

If an identifier's name is equal to a SQL reserved word, e.g. TABLE, it
must be quoted ("TABLE") in order to be used as an identifier.

If an identifier contains non-alphanumeric characters, e.g. space, '-'
etc. it must be quoted regardless of CaseMode.

Although CaseMode can be changed at any time it should only be set at
database creation. Changing the CaseMode may result in view or procedure
code becoming invalid if it relies on specific case conventions.

# Wide Character Identifiers

All Virtuoso schema columns are confined to 8-bit character fields. This
will remain for backwards compatibility and performance reasons,
however, there are two options available for support of non-ASCII
identifier names as follows:

  - Maintain an 8-bit system. Pass all 8-bit codes that enter the system
    and read them back according to the current database character set.
    This has the convenience of a 1-to-1 correspondence between the
    character lengths of an identifier and their representation, so it's
    a subject to like single character wildcards etc.
    
    This works well only for languages that do have single bit encodings
    (like western-european languages and cyrillic). But this does not
    work at all for the far-east languages. It also depends on the
    database character set and does not allow identifiers to be composed
    from multiple character sets.

  - Store all identifiers as UTF-8 encoded unicode strings. This would
    allow seamless storage and retrieval of ANY character within the
    unicode character space. This, however, has the disadvantage of the
    varying character length representation which should be taken into
    account when comparing identifier names with LIKE.

Virtuoso supports the above cases which are switchable through the
"SQL\_UTF8\_EXECS" = 1/0 flag in the \[Client\] section of the Virtuoso
INI file. Setting SQL\_UTF8\_EXECS = 1 enables UTF-8 identifier storage
and retrieval, whereas setting SQL\_UTF8\_EXECS = 0 disables it. The
default setting is 0: disabled for backwards compatible option.

> **Note**
> 
> Once a non-ASCII identifier gets stored using a particular setting for
> the "SQL\_UTF8\_EXECS" flag and the flag is subsequently changed this
> will make the stored identifiers unreadable by normal means (but can
> be read by special means).

When an SQL statement comes into the driver(s) it is expanded into
unicode (using either the current database character set if it is a
narrow string like in SQLExecDirect, or taking it verbatim as in
SQLExecDirectW). The unicode string is then encoded into UTF-8 passed to
the SQL parser. The SQL parser knows that it will receive UTF-8 so it
takes that into account when parsing the national character literals
(N'\<literal\>') and the "normal" literals ('\<literal\>'). It will
however return identifier names in UTF-8, these will then get stored
into the DBMS system tables or compared against them depending on the
type of statement.

All returned identifiers will be translated from UTF-8 to Unicode when
returned to the client, so the client should never actually see the
UTF-8 encoding of the identifiers.

Representing a string in UTF-8 will not change the identifier parsing
rules or the SQL applications logic since the SQL special characters -
like dot, quote, space etc - are ASCII symbols and they will get
represented as a single byte sequence in UTF-8.

The upper/lower functions should be used with care when applied to
identifiers: they will get narrow strings in UTF-8, so applying an
upper/lower to them may cause damage to the UTF-8 encoding. That is why
the identifiers should be converted explicitly to wide strings using the
charset\_recode function, changed to upper or lower case and then
translated back to UTF-8 using the charset\_recode function again.

Using single character LIKE patterns against identifiers stored as
narrow strings in system tables will generally not work, as a single
character may be represented with up to 6 bytes in UTF-8. An exception
to that is when using single character pattern to match an ASCII
character.

## UTF-8 Implementation Notes For ODBC

All wide functions which do return an identifier, like SQLDescribeColW
and friends, will return the correct wide literal. For their narrow
counterparts, such as SQLDescribeCol, the UTF-8 string will first be
converted to a wide string and then to a narrow string using the current
database character set. However, an extension to the ODBC standard has
been implemented instructing all result set returning meta-data
functions, such as SQLTables and SQLTablesW, to return SQL\_NVARCHAR
instead of SQL\_VARCHAR columns. This is not a problem for most
applications since all they do is to map the result to SQL\_C\_CHAR on
retrieval which will convert the wide string to the appropriate narrow
string inside the driver using the current database character set. This
will cause problems with narrow applications like MS Query, trying to
get identifiers not representable in the current narrow character set,
because all they will get is the "untranslatable char" mark (currently a
question mark).

## UTF-8 Implementation Notes In JDBC

Since JAVA is all unicode there are no unavoidable deviations from the
JDBC standard. However when printing the Java strings to the screen or a
file or getting their byte representation, the usual JAVA conversion
rules apply. The types of the meta data result set columns in JDBC are
somewhat debatable, but since they are usually retrieved with
Resultset.getString() the Virtuoso JDBC driver will return the raw wide
string instead of trying to make it VARCHAR before returning it to the
application.

# Qualified Names

## Qualifiers and Owners

Virtuoso supports multiple namespaces for tables and procedures. A table
or procedure is uniquely identified by a three part name consisting of
qualifier, owner and name separated by dots.

Each connection has a current qualifier which is used as the default
qualifier for if a name does not specify a qualifier. The owner can be
omitted from a name if the qualifier and name uniquely identify the
object, e.g. DB..SYS\_KEYS.

Initially, all system objects have the qualifier DB and owner DBA.

The default current qualifier of all connections is DB unless otherwise
specified using db.dba.user\_set\_qualifier.

A user can be assigned a default qualifier set as current qualifier upon
login. This is done with the stored procedure
db.dba.user\_set\_qualifier.

    user_set_qualifier  (in user varchar, in qualifier varchar)

## Default Qualifiers

The default qualifier of the user is set to be the qualifier. The names
are strings and thus case sensitive.

Example:

    db..user_set_qualifier ('U1', 'U1DATA');

## USE Statement, USE identifier

This sets the default qualifier for the connection in question. The
identifier cannot be an expression. The identifier is subject to
whatever case conversions may be in effect.

> **Tip**
> 
> [CaseMode Configuration parameter](#catidentifiers) .

A quoted identifier will always pass in the case it is entered. An
unquoted identifier will be converted to upper case if CaseMode so
specifies.

# Literals, Brace Escapes

## Strings

String literals are delimited with single quotes. A double single quote
is an escape notation for a single quote character inside a string
literal. Additionally, standard C language escapes are supported.
Support of C escapes can be turned off for compatibility with other SQL
databases by using the SQL\_NO\_CHAR\_C\_ESCAPE option in the
configuration file or as an ODBC connection option.

    Literal         meaning
    ''          <empty>
    ''''            '
    ''''''          ''
    '\t\r\n\\'      tab, carriage return, newline, backslash
    '\012'          Character 012 octal, i.e. newline

## Numbers

An integer constant consist of an optional minus sign followed by
decimal digits. Integer literals are of the C type long, 32 bit.

Numeric literals with a decimal point literal are internally of the
DECIMAL SQL type, a variable length decimal floating point type. The
Following are examples of decimal literals:

    123.456
    -16.0

Numeric literals which specify an exponent, e.g. 1.2e11 or 2e-3 are read
as C doubles, (64 bit IEEE binary floating point). This is potentially
less precise than the DECIMAL SQL type.

Integer literals outside of the 32-bit range are interpreted as DECIMAL.

## ODBC Brace Escapes

The Virtuoso SQL parser supports the following ODBC brace escape
notations:

    {fn function (argument, ..) }       fm (arguments .)
    call procedure a1, ... }
    
    {d 'yyyy.mm.dd'}
    
    {t 'hh:mm.ss' }
    
    {ts 'yyyy.mm.dd hh:mm.s fraction' }
    
    {oj  }      -- outer join

## Hexadecimal Literals

Hexadecimal values can be specified literally in two ways, prefixing the
plain value with '0x' or enclosed with single quotes prefixed with 'X'.
The case is not important. Hex characters should always be pairs,
representing a single byte, and should be at least on pair. Here are
some examples:

    X'beef'   - valid
    0xbeef    - valid
    
    X'abeef'  - not valid
    X'0abeef' - valid
    X''   - not valid

`X'<value>'` is equivalent to `0x<value>`

## Binary Literals

Binary strings can be specified as literals prefixed with 'B' and
enclosed with single quotes. The string should not be empty and should
contain only 1's or 0's. Binary strings are read from the end to
beginning forming bytes on each 8-th bit:

    B'1'    = 0x01
    B'1111'   = 0x0F
    B'111111111'  = 0x01FF
    B'100000001'  = 0x0101
    B'', X'' and 0x return binary literals.

# CREATE TABLE Statement

## Syntax

``` 
    base_table_def: CREATE TABLE new_table_name '(' base_table_element_commalist ')'
                  | CREATE TABLE new_table_name as query_exp opt_with_data

base_table_element_commalist: base_table_element
                           | base_table_element_commalist ',' base_table_element

base_table_element: column_def
                  | table_constraint_def

column_def: column column_data_type column_def_opt_list

opt_referential_triggered_action: /* empty */
                                | referential_rule
                                | referential_rule referential_rule

referential_rule: ON UPDATE referential_action
                | delete_referential_rule

delete_referential_rule: ON DELETE_L referential_action

opt_on_delete_referential_rule: /* empty */
                              | delete_referential_rule

referential_action: CASCADE
                  | SET NULLX
                  | SET DEFAULT

references: REFERENCES q_table_name opt_column_commalist opt_referential_triggered_action

column_def_opt_list: /* empty */
                   | column_def_opt_list column_def_opt

identity_opt: START_L WITH signed_literal
            | INCREMENT_L BY INTNUM

identity_opt_list: identity_opt
                 | identity_opt_list ',' identity_opt

column_def_opt: NOT NULLX
              | NULLX
              | IDENTITY
              | IDENTITY '(' identity_opt_list ')'
              | PRIMARY KEY
              | DEFAULT signed_literal
              | COLLATE q_table_name
              | references
              | IDENTIFIED BY column
              | CHECK '(' search_condition ')'
          | WITH SCHEMA column_xml_schema_def
              | UNIQUE

table_constraint_def: UNDER q_table_name
                    | opt_constraint_name PRIMARY KEY '(' index_column_commalist ')' opt_index_option_list
                    | opt_constraint_name FOREIGN KEY '(' column_commalist ')' references
                    | opt_constraint_name CHECK '(' search_condition ')'
                    | opt_constraint_name UNIQUE '(' column_commalist ')'

opt_constraint_name: /* empty */
                   | CONSTRAINT identifier

column_commalist: column
                | column_commalist ',' column

index_column_commalist: column opt_asc_desc
                      | index_column_commalist ',' column opt_asc_desc

index_option: CLUSTERED
            | UNIQUE
            | OBJECT_ID

index_option_list: index_option
                 | index_option_list index_option

opt_index_option_list: /* empty */
                     | index_option_list

column_xml_schema_def
    : '(' STRING ',' STRING ')'
    | '(' STRING ',' STRING ',' STRING ')'

opt_with_data
: /* empty */
| WITH DATA
| WITHOUT DATA
```

The CREATE TABLE statement creates a new table. The table is identified
by a new\_table\_name, which consists of an optional qualifier, an
optional owner and the name. If the qualifier is not supplied then it
defaults to the current qualifier, and likewise if the table owner is
not specified then this will default to the login name of the user
issuing the statement.

Following the new\_table\_name is a list of table elements that are
either column definitions or table constraints. A column must have a
unique name within the table and possible super tables. The only
necessary attribute of a column is a data type.

The UNDER q\_table\_name constraint specifies an optional supertable.
The table being created will inherit all columns, indices, constraints
from the supertable, specifically including the primary key. Hence the
under and primary key constraints cannot be specified together. If the
table being created will be owned by a non-dba user, the supertable must
be owned by the same user.

The AS query\_exp opt\_with\_data causes the table to be created based
on the compile time types of columns of the SELECT expression
query\_exp. If WITH DATA is specified then the resultset returned by the
query\_exp is fed into the new table. Otherwise (if WITHOUT DATA or not
specified) only the table is created.

## NOT NULL

Optionally a column can be declared NOT NULL. Any attempts to insert
NULL into column declared NOT NULL will result in an error and the
insert rejected.

## IDENTITY (Auto Increment)

The IDENTITY keyword causes the columns to be automatically incremental,
meaning that each successive insert into the table will automatically
assign a value greater than any previous row of the table. These columns
are often referred to as "autoincrement columns". The assigned values
are normally consecutive integers. There may be gaps in the sequence if
some transactions that reserve a number fail to commit.

An autoincrement column may or may not be part of the primary key or of
any index.

The [`identity_value()`](#fn_identity_value) function returns the
identity column value most recently assigned on the current connection.
This can be used inside procedures or from clients. See also the ODBC
statement option SQL\_GETLASTSERIAL.

The [`set_identity_column()`](#fn_set_identity_column) function allows
you to change the identity column sequence value.

The IDENTITY keyword supports the SQL 3 optional clause that allows you
to specify a starting value and/or step value in the table creation
statement. The syntax is:

``` 
      IDENTITY (START WITH <N>, INCREMENT BY <Y>)
```

    CREATE TABLE DB.DBA.AI (
        AI INTEGER IDENTITY,
        XX VARCHAR,
        PRIMARY KEY (AI)
      )
    ;

Creates a table with an autoincrement primary key column AI.

    set_identity_column("DB"."DBA"."AI", "AI", 11);

will cause the next row to be inserted into AI to have the AI column
equal to 11.

    CREATE TABLE DB.DBA.AI (
        AI INTEGER IDENTITY (START WITH 100),
        XX VARCHAR,
        PRIMARY KEY (AI)
      )
    ;

Creates a table with an autoincrement primary key column AI, whose first
value will be 100 and will auto-increment from there upwards.

> **Tip**
> 
> [Sequence Objects](#sequenceobjects)

## DEFAULT

This option specifies a constant default value given to the column by an
INSERT that does not specify a value for the column. The constant must
be compatible with the column's data type. An IDENTITY or TIMESTAMP
column cannot have a default value.

## PRIMARY KEY Constraint

This declares a column combination that will uniquely identify each row
in the table. This automatically defines an index on these columns and
clusters the physical rows of the table together with the index entry
for this primary key index. Always specify a primary key if there is a
uniquely identifying column combination on the table. This is the case
for any normalized database. Hence virtually all tables should have the
primary key constraint. This is substantially more efficient than
defining the primary key as a unique index with CREATE INDEX. The
primary key constraint exists for the purpose of guaranteeing uniqueness
of a row and hence should be respected. A unique index is not a primary
key and should never substitute one.

This example shows how to create a table with a primary key defined in
full as a named primary key table constraint

    CREATE TABLE demo_table (
      id INTEGER NOT NULL,
      txtdata VARCHAR(20),
      CONSTRAINT demo_table_pk PRIMARY KEY (id)
      )
    ;

PRIMARY KEY is a shorthand for the PRIMARY KEY (column) table constraint
which is specified in the column definition. SQL-89 required that you
specify NOT NULL PRIMARY KEY but SQL-92 does not because primary keys
columns do not permit NULL values. This means that no members of a
combination of columns that constitute a primary key can have a NULL
value.

This example shows how to create a table with a primary key defined
using shorthand:

    CREATE TABLE demo_table (
      id INTEGER NOT NULL PRIMARY KEY,
      txtdata VARCHAR(20),
      )
    ;

Or shorter still:

    CREATE TABLE demo_table (
      id INTEGER PRIMARY KEY,
      txtdata VARCHAR(20),
      )
    ;

If a table definition has no PRIMARY KEY clause, Virtuoso will generate
a default primary key column called "\_IDN".

> **Important**
> 
> Always declare a primary key using the primary key table constraint.
> This is always more efficient than the default primary key.

You could allow Virtuoso to generate the primary key if you simply want
an IDENTITY primary key column, however this is considered lazy and, of
course, not portable. If you already have a column or combination of
columns that could be a candidate for a primary key, taking the default
primary key from Virtuoso will reduce the overall efficiency because an
extra column will be used per row that would be redundant to the data
itself.

In the absence of a PRIMARY KEY definition:

    CREATE TABLE SAMPLE (
      THING VARCHAR
      )
    ;

will be expanded into:

    CREATE TABLE SAMPLE (
      THING VARCHAR,
      _IDN INTEGER IDENTITY,
        PRIMARY KEY (_IDN)
      )
    ;

Tables with generated default primary keys will appear as if they have
no primary key defined. The default primary key (\_IDN) column will not
appear in the ODBC catalog calls `SQLColumns()` , `SQLStatistics()` ,
`SQLPrimaryKeys()` , `SQLColumnPrivileges()` . The column can be
explicitly referenced in SQL statements just as any other. The SQL
"SELECT \* ..." statement will omit the \_IDN column. The "INSERT INTO
TABLE VALUES (.)" statement does not expect a value for the \_IDN
column. `SQLSpecialColumns()` with the `SQL_BEST_ROWID` option is the
only catalog call that will return the \_IDN column.

The PRIMARY KEY option may not coexist with UNDER in a CREATE TABLE
statement because a subtable always inherits the supertable's primary
key.

> **Tip**
> 
> [CREATE INDEX](#createindex) for the index options.

## UNDER

This allows the user to create a table as a sub-table of an existing
table. A sub-table will inherit all columns and constraints of its
super-table, most importantly the primary key. Primary keys shall be
unique in the set of rows belonging to any direct or indirect sub-table
of one super-table. A select from a super-table will see all rows,
including those of any sub-tables, but not vice versa. Rows inserted
directly into the super-table will not be visible to sub-tables.

The primary key option may not coexist with UNDER, since a subtable
always inherits the supertable's primary key.

Here a subtable will be created for the demo\_table defined earlier.
Both definitions are listed for convenience. Notice that the select over
the sub-table (demo\_sub\_table) lists all columns whereas the select
from super-table does not, however rows inserted into the super-table,
demo\_table, will not be seen in a select from the sub-table, but rows
inserted into the sub-table will be shown in a select from the
super-table.

    CREATE TABLE demo_table (
      id INTEGER PRIMARY KEY,
      txtdata VARCHAR(20),
      )
    ;
    
    CREATE TABLE demo_sub_table (
      new_col VARCHAR(10),
      UNDER demo_table
      )
    ;
    
    SQL> select * from demo_table;
    id                txtdata
    INTEGER NOT NULL  VARCHAR
    ____________________________________________________________________
    
    0 Rows. -- 20 msec.
    
    SQL> select * from demo_sub_table;
    id                txtdata               new_col
    INTEGER NOT NULL  VARCHAR               VARCHAR
    ____________________________________________________________________
    
    0 Rows. -- 10 msec.

## FOREIGN KEY Constraint

A FOREIGN KEY is a column of combination of columns used to retrieve a
related row from a related table. These reference constraints are
automatically enforced, unless explicitly disabled. This declaration can
be accessed by client applications using the `SQLForeignKeys()` ODBC
function. This is used by some tools to display dependencies between
tables. Foreign keys are there to maintain referential integrity within
the database. This constraint will ensure that rows in one table will
have corresponding rows in another table, so that your orders are not
made for products that do not exist, for example.

Forward references are not permitted in FOREIGN KEY. Also a table
referenced in a foreign key constraint of another table cannot be
dropped. It is usual to list the columns in the referenced table
corresponding to the columns in the referencing table, however, this
list can be omitted, in which case the set of primary key columns of the
referenced table is used automatically by default. The referenced and
referencing column lists must be of equal length. To declare two
mutually referencing tables, ALTER TABLE must be used after both tables
are defined.

Foreign key constraints are enforced by default. It is sometimes
practical to disable constraint checks for performance or for
convenience when importing data or making bulk updates. To disable or
enable checking for foreign key constraints you can use the
[`fk_check_input_values()`](#fn_fk_check_input_values) function. This
function changes the foreign key checking behavior globally across the
database so it is very important to remember to enable foreign key
constraint checking again afterwards.

Columns can be defined as having foreign keys and a default value,
however, the default value must not violate the constraint at the time
of insert or update as this will be rejected in the normal way.

First the Primary key table must be defined before it can be referenced:

    CREATE TABLE T1 (
      Id INTEGER NOT NULL PRIMARY KEY,
      Dt VARCHAR
      )
    ;

Now the foreign key table can be created referencing the table above:

    CREATE TABLE T2 (
      Act INTEGER NOT NULL,  -- will refer to Id in T1
      Retr DATETIME,
      Description VARCHAR,
      CONSTRAINT FK1 FOREIGN KEY (Act) REFERENCES T1 (Id) -- the fk constraint
      )
    ;

The statement above creates the foreign key constraint in separate line
of the create table statement. This can be also be written in short form
with the column definition it applies to:

    CREATE TABLE T2 (
      Act INTEGER NOT NULL REFERENCES T1 (Id),  -- refer to Id in T1
      Retr DATETIME,
      Description VARCHAR
      )
    ;

This CREATE TABLE statement was used for creating part of Demo database.
This statement does not describe the columns to be used as foreign keys
on the referred tables. Since the referred tables in each case have a
single Primary Key (Orders.OrderID and Products.ProductID) they need not
be mentioned and will be assumed when this statement is processed.

    CREATE TABLE Order_Details(
      OrderID INTEGER,
      ProductID INTEGER,
      UnitPrice DOUBLE PRECISION,
      Quantity SMALLINT,
      Discount REAL,
      PRIMARY KEY (OrderID, ProductID),
      FOREIGN KEY (OrderID) REFERENCES Orders,
      FOREIGN KEY (ProductID) REFERENCES Products
      )
    ;

### Foreign Key Constraint Actions

Foreign key constraint actions allow the user to define what action data
should take when the data they are related to by way of a foreign key is
updated or deleted. The two activities that can be programmed are:

ON DELETE

ON UPDATE

The actions available for both types of activity are:

CASCADE - automatically perform the same action on the referenced data.

SET NULL - set the referenced data to NULL.

SET DEFAULT - sets the referenced data to whatever was defined as its
default value.

NO ACTION - to not perform any action at all.

Now, the foreign key table defined again, but this time with referential
rules which control how data is managed when rows are updated or deleted
in the primary key table:

    CREATE TABLE T3 (
      Act INTEGER NOT NULL DEFAULT 99,  -- will refer to Id in T1
      Retr DATETIME,
      Description VARCHAR,
      CONSTRAINT Fk1 FOREIGN KEY (Act) REFERENCES T1 (Id)
        ON UPDATE CASCADE ON DELETE SET DEFAULT
      )
    ;

## The CHECK Constraint

The CHECK constraint allows you specify and wide range of rules that
will dictate whether an insert of update will be permitted. The syntax
is as follows:

    CHECK (search-condition)

The search condition can be simple and comparative, or quite complicated
involving regular expressions.

Here a simple table will be created with two CHECK constraints. One the
check constraints is a simple comparison ensuring participants are over
18, the other complicated constraint verifies that the email address is
correct using a regular expression. Samples SQL statements follow that
will demonstrate the effectiveness of the check constraints.

    CREATE TABLE test_check (
      name VARCHAR,
      age INTEGER
        CHECK (age > 18),
      email VARCHAR
        CHECK (regexp_like(email, '^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+\$'))
      )
      ;
    
    INSERT INTO test_check (name, age, email) VALUES ('Jack', 18, 'jack@foo.bar');
      -- will cause: *** Error 22023: ... SR363: CHECK constraint violated
    
    INSERT INTO test_check (name, age, email) VALUES ('Jill', 19, 'up@thehill.com');
      -- will be insert correctly.
    
    INSERT INTO test_check (name, age, email) VALUES ('Jack and Jill', 37, 'ouch/!^^!!@@');
      -- will cause: *** Error 22023: ... SR363: CHECK constraint violated, also.

> **Tip**
> 
> [`regexp_like()`](#fn_regexp_like)

## The WITH SCHEMA Constraint

The WITH SCHEMA constraint allows you force values of an XML column to
match a particular schema. The syntax is as follows:

    WITH SCHEMA (namespace-uri, top-element-name [, optional-dtd-configuration])

To use this feature, you should make load an XMLSchema to the server by
a [CREATE XML SCHEMA](#createxmlschema) statement. As soon as schema is
loaded, its target namespace URI can be used in WITH SCHEMA constraint
to validate every new value of the column against this schema. In
addition, the constraint ensures that the document is a well-formed XML
document (not a well-formed generic XML entity) and checks if the name
of the top level element of the document is equal to one specified in
the constraint.

Depending on document size and the complexity of the schema, schema
validation may be a time- and memory- consuming operation. An
application can win a lot if every stored value is validated only once
and avoid repeating validations on every read of the stored data, but it
also may loose if the validation is actually redundant (e.g. if the data
always comes from sources which produce valid content).

The parameter "optional-dtd-configuration" lets an application to
specify how strict the validation should be. In real life, documents may
match the schema in general, but not in minor details that are not
important for a particular application. If specified, the parameter must
be a string in the format described in [Configuration Options of the DTD
Validator](#dtd_config) . The default value is suitable for most of
applications and forces the validator to check well-formedness of the
document, nesting of elements, presence of all "required" attributes,
syntax of values of typed elements and attributes; it also will check
referential integrity of ID and IDREF attributes.

Here a simple table will be created with a WITH SCHEMA constraint.
Sample SQL statements follow that will demonstrate the effectiveness of
the check constraints.

    CREATE XML SCHEMA '<?xml version="1.0" encoding="utf-8" ?>
    <xs:schema targetNamespace="http://www.example.com/parts"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:p="http://www.example.com/parts">
       <xs:element name="Part">
          <xs:complexType>
             <xs:choice minOccurs="0" maxOccurs="unbounded">
           <xs:element ref="p:Part"/>
         </xs:choice>
             <xs:attribute name="ID" type="xs:string" use="required" />
             <xs:attribute name="Count" type="xs:int" use="optional" />
             <xs:attribute name="Type" type="xs:string" use="optional" />
          </xs:complexType>
       </xs:element>
    </xs:schema>';
    
    create table SPARE_PARTS (
      PACK_ID integer primary key,
      CONTENT XMLType with schema ('http://www.example.com/parts', 'Part')
      );
    
    insert into SPARE_PARTS values (1, '
    <p:Part xmlns:p="http://www.example.com/parts"
    xml:id="keyboard">
      <p:Part Count="101"/>
      <p:Part
    xml:id="body"/>
    </p:Part>')
    
    *** Error 42000: [Virtuoso Driver][Virtuoso Server]XML parser detected an error:
        ERROR  : Only 0 out of 1 required attributes are defined for element <p:Part>, e.g. the element has no attribute 'ID'
    at line 3 column 25 of '(value to be placed in column DB.DBA.SPARE_PARTS of CONTENT)'
      <p:Part Count="101"/>
    -----------------------^
    
    insert into SPARE_PARTS values (2, '
    <p:Part xmlns:p="http://www.example.com/parts"
    xml:id="keyboard_01">
      <p:Part
    xml:id="key" Count="101"/>
      <p:Part
    xml:id="body_01"/>
    </p:Part>')
    
    select * from SPARE_PARTS
    PACK_ID           CONTENT
    INTEGER NOT NULL  LONG VARCHAR
    _______________________________________________________________________________
    
    2
    <n0:Part xmlns:n0="http://www.example.com/parts"
    xml:id="keyboard_02">
      <n0:Part
    xml:id="key_01" Count="101" />
      <n0:Part
    xml:id="body_02" />
    </n0:Part>
    
    1 Rows. -- 00000 msec.

ALTER TABLE ... MODIFY COLUMN statement does not support changes of WITH
SCHEMA constraint. Double check your XMLSchema and carefully test it on
real data used by an application before using this constraint. If you
can't test your schema this way then calling of
[`xml_validate_schema()`](#fn_xml_validate_schema) in triggers may be
safer than using the constraint: such triggers will be slower than the
constraint but you can drop triggers without re-creating the table.

> **Tip**
> 
> [CREATE XML SCHEMA Statement](#createxmlschema)
> 
> [`xml_validate_schema()`](#fn_xml_validate_schema)

# DROP TABLE Statement

    drop_table
        : DROP TABLE q_table_name
        ;

This statement drops a table. This requires dba privileges or ownership
of the table. Any subtables are automatically dropped. Supertables are
not affected.

# CREATE INDEX Statement

    index_column_commalist
        : column opt_asc_desc
        | index_column_commalist ',' column opt_asc_desc
        ;
    
    index_option
        : CLUSTERED
        | UNIQUE
        ;
    
    index_option_list
        : index_option
        | index_option_list index_option
        ;
    
    opt_index_option_list
        : /* empty */
        | index_option_list
        ;
    
    create_index_def
        : CREATE opt_index_option_list INDEX index
            ON new_table_name '(' index_column_commalist ')'
        ;

This creates an index on a table. Index names must be unique across a
qualifier. The ascending / descending column attributes are recognized
for compatibility but do not have any effect. The index is defined and
populated at the execution of the statement. Pre-existing stored
procedures and prepared statements will make use of the new index when
appropriate.

The UNIQUE attribute enforces uniqueness of the specified columns across
the table and subtables where the index is visible.

The CLUSTERED attribute is not recommended. It will cause keys to be
unprefixed by key id, thus causing the key entries to be intermixed with
entries of other CLUSTERED indices with adjacent values of key parts.

> **Tip**
> 
> See the [Free Text](#freetext) section on creating free text indices.

# DROP INDEX Statement

    drop_index
        : DROP INDEX NAME opt_table
        ;
    
    opt_table
        : /* empty */
        | q_table_name
        ;

This will drop an index, dba privileges or table ownership are required.
A table's primary key which has the same name as the table can not be
dropped.

Optionally, a table name can be given if the index name is not unique.
The table name may be qualified.

# ALTER TABLE Statement

    add_column:
                ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
              | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
              | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def
    
    add_col_column_def_list: column_def
                           | add_col_column_def_list &apos;,&apos; column_def
    
    add_col_column_list: column
                       | add_col_column_list &apos;,&apos; column
    
    table_rename:
                ALTER TABLE q_table_name RENAME new_table_name
    
    alter_constraint:
                ALTER TABLE q_table_name constraint_op opt_table_constraint_def
    
    constraint_op: ADD
                 | DROP
                 | MODIFY
    
    opt_drop_behavior: /* empty */
                     | CASCADE
                     | RESTRICT
    
    opt_table_constraint_def: CONSTRAINT identifier opt_drop_behavior
                            | table_constraint_def
    
    view_query_spec: query_exp
                   | query_no_from_spec
    
    alter_table
        : ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
    
        | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
    
        | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def
    
        | ALTER TABLE q_table_name RENAME new_table_name
    
        | ALTER TABLE <table> ADD | DROP | MODIFY <constraint> [<constraint-name>]
    
    <constraint> ::=
        : PRIMARY KEY '(' <column list> ')'
        | FOREIGN KEY '(' <column list> ')' <references>
        | CHECK ( search-condition )
    
    <references> ::=
       REFERENCES <table> ['(' <column list> ')' ] <OPTIONS>
    
    <OPTIONS>  ::=
       [ON UPDATE OPT_ACTION] [ON DELETE OPT_ACTION]

The ALTER TABLE statement adds or drops columns and renames tables.

Adding or dropping a column of a table will create a new version of the
table's schema entry. The rows of the altered table will be changed to
conform to the new definition when next updated. All newly inserted rows
will be in the new row layout. This means that ALTER TABLE itself
executes in fixed time without locking the table. The time to update the
actual data will be spread over subsequent updates.

An added column will have a NULL value on those rows where the new
column has not been set. A possible default will only apply to newly
inserted rows.

When dropping a column one can execute a statement of the form UPDATE
\<table\> SET \<key\> = \<key\> to force the physical change, causing
space associated with the dropped column to be freed.

The column\_def in the ADD clause may specify any column options, except
PRIMARY KEY.

If the table name is not fully qualified it is completed as in any table
reference. The new name in the RENAME clause is defaulted to the current
qualifier and user account, as in a CREATE TABLE.

A primary key may only be modified, never dropped or added. Tables
always have exactly one primary key.

The first unique index of an empty table becomes the primary key. This
may thereafter not be dropped.

The primary key of an attached table may not be changed.

Foreign keys can be added. Dropping a foreign key will drop all foreign
keys between the foreign key and primary key tables.

ALTER TABLE cannot be applied to an attached table.

    ALTER TABLE DISTRICT
        add D_SALES_MGR integer not null references EMPLOYEES (E_ID);
    
    ALTER TABLE idt MODIFY PRIMARY KEY (K1, K2);
    
    ALTER TABLE idt ADD FOREIGN KEY (d) REFERENCES idt (d);
    
    ALTER TABLE idt ADD FOREIGN KEY (k2, k1) REFERENCES idt;
    
    ALTER TABLE idt DROP FOREIGN KEY (d) REFERENCES idt (d);

## Adding a CHECK Constraint

A CHECK constraint can be added to a table after it has been created and
populated providing that none of the tables contents would violate the
constraint.

    CREATE TABLE test_add_check (
      name VARCHAR,
      age INTEGER
      )
    ;
    
    ALTER TABLE test_add_check ADD CONSTRAINT chkage CHECK (age > 18);

> **Tip**
> 
> [The CHECK constraint](#sqlrefcreattablecheck)

# CREATE VIEW Statement

    <view definition> ::=
        CREATE VIEW <table name> [ <left paren> <view column list>
                                      <right paren> ]
          AS <query expression>

# CREATE XML SCHEMA Statement

    <xml schema definition> ::=
        CREATE XML SCHEMA <text of schema>

Virtuoso supports registering XML Schemas for use in [WITH
SCHEMA](#sqlrefcreattablewithschema) constraint for column values. The
statement contains the whole text of the schema as a string constant,
i.e. enclosed in single quotes. This is not the best possible syntax,
because single quotes inside the text of schema should be carefully
quoted, but this is de-facto standard. If the schema contains number of
single quotes (e.g. attributes are in single quotes instead of typically
used double quotes), try a system stored procedure

    DB.DBA.SYS_CREATE_XML_SCHEMA (text_of_schema);

that will have the same effect, but is not portable.

In principle, you can register any valid XMLSchema, but some features
can cause prohibitive loss of performance. It is strongly advised to
compose the schema as a "standalone" document that has no references to
external DTDs or external generic entities. It is also strongly advised
to avoid xs:include and xs:import directives. The only sort of external
references that does not affect performance is xs:include or xs:import
of a registered "sibling" schema. They say that a schema X is a
"sibling" of schema Y if their target namespace URIs have identical
protocol names and host names and differs only in local path, and schema
X imports Y using relative (not absolute\!) URI that contain only
relative path, (no protocol and no host).

Two sibling schemas are registered here. First statement registers an
XMLSchema for "http://www.example.com/parts" target namespace. Second
statement registers an XMLSchema for "http://www.example.com/jobs"
target namespace that imports the first schema using relative URI. The
rest of statements demonstrate a single WITH SCHEMA constraint that
inspect elements of these two target namespaces.

    CREATE XML SCHEMA '<?xml version="1.0" encoding="utf-8" ?>
    <xs:schema targetNamespace="http://www.example.com/parts"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:p="http://www.example.com/parts">
       <xs:element name="Part">
          <xs:complexType>
             <xs:choice minOccurs="0" maxOccurs="unbounded">
           <xs:element ref="p:Part"/>
         </xs:choice>
             <xs:attribute name="ID" type="xs:string" use="required" />
             <xs:attribute name="Count" type="xs:int" use="optional" />
             <xs:attribute name="Type" type="xs:string" use="optional" />
          </xs:complexType>
       </xs:element>
    </xs:schema>'
    
    CREATE XML SCHEMA '<?xml version="1.0" encoding="utf-8" ?>
    <xs:schema targetNamespace="http://www.example.com/jobs"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:p="http://www.example.com/parts"
      xmlns:j="http://www.example.com/jobs">
       <xs:import schemaLocation="parts" />
       <xs:element name="Job">
          <xs:complexType>
             <xs:sequence>
           <xs:element ref="p:Part"/>
         </xs:sequence>
             <xs:attribute name="JobID" type="xs:string" use="required" />
          </xs:complexType>
       </xs:element>
    </xs:schema>'
    
    create table JOBS (
      PACK_ID integer primary key,
      CONTENT XMLType with schema ('http://www.example.com/jobs', 'Job')
      )
    
    insert into JOBS values (1, '
    <j:Job xmlns:j="http://www.example.com/jobs" xmlns:p="http://www.example.com/parts" JobID="asmkeyboard">
      <p:Part xmlns:p="http://www.example.com/parts"
    xml:id="keyboard_03">
        <p:Part Count="101"/>
        <p:Part
    xml:id="body_03"/>
      </p:Part>
    </j:Job>')
    
    *** Error 42000: [Virtuoso Driver][Virtuoso Server]XML parser detected an error:
        ERROR  : Only 0 out of 1 required attributes are defined for element <p:Part>, e.g. the element has no attribute 'ID'
    at line 4 column 27 of '(value to be placed in column DB.DBA.JOBS of CONTENT)'
        <p:Part Count="101"/>
    -------------------------^
    
    insert into JOBS values (2, '
    <j:Job xmlns:j="http://www.example.com/jobs" xmlns:p="http://www.example.com/parts" JobID="asmkeyboard">
      <p:Part xmlns:p="http://www.example.com/parts"
    xml:id="keyboard_04">
        <p:Part
    xml:id="key_02" Count="101"/>
        <p:Part
    xml:id="body_04"/>
      </p:Part>
    </j:Job>');

> **Note**
> 
> There is no way to change a registered schema if it is used in some
> WITH SCHEMA constraint. Double-check any schema before using it,
> because it may be hard to fix the error later.

# DROP XML SCHEMA Statement

    <xml schema removal> ::=
        DROP XML SCHEMA <target URI>

This reverts the effect of [CREATE XML SCHEMA](#createxmlschema) .

The \<target URI\> should be a string constant that is equal to the
value of "targetNamespace" attribute of "xs:schema" element of a
previously declared XML schema.

The statement signals an error if the XMLSchema to be dropped is used in
some WITH SCHEMA constraint.

# Sequence Objects

Virtuoso supports sequence objects. These can be used to generate
sequential numbers which can be used as unique identifiers. A sequence
object is guaranteed never to give the same number twice. Each sequence
has a name and a state. The state of a sequence is stored in the
database at checkpoint time. Between checkpoints sequence states are
logged so that a possible roll forward recovery will not lose
information.

The SQL functions `sequence_next` () and `sequence_set` () are used to
access and set the state of sequences. These take the name of the
sequence as argument. This is a server/wide unique string. There are no
restrictions on the length or character set of the sequence

Sequences do not have to be separately created. A sequence object will
automatically be generated when first referenced by `sequence_next` ()
or sequence\_set.

    sequence_next (in name varchar) returns integer

    sequence_set (in name varchar, in state integer, in mode integer)
            returns integer

Function `sequence_next` () returns the current state of the specified
sequence and atomically increments it by one. The next call will thus
return a number one greater than the previous. The sequence is shared
between all connections and all transactions. Using a sequence never
involves locking.

Function `sequence_set` () sets and returns the state of a sequence
object. The next call to `sequence_next` () will return this same
number. If mode equals 0, the state is set regardless of the previous
state. If mode is non-zero, the state is set only if the new state is
greater then the previous state. Calling sequence\_set ('sequence'' , 0,
1) will always return the sequence's state without changing it.

Each autoincrement column corresponds to an internal sequence object.
The name of the sequence object is'DB.DBA.' plus the concatenation of
the table's qualifier, owner, table name and column name, e.g.
'DB.DBA.db.dba.my\_table.ai\_column'. The user does not normally need to
know about the sequence associated with an autoincrement column unless
he or she wishes to change the sequence values using the
`sequence_set()` function and the sequence objects name.

See the section on identity columns under create table and the function
identity\_value and the related ODBC statement option SQL\_GETLASTSERIAL
for more.

# INSERT Statement

``` 
    insert_statement
        : INSERT insert_mode table priv_opt_column_commalist values_or_query_spec
        ;

    insert_mode
        : INTO
        | REPLACING
        | SOFT

    priv_opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

        ;

    values_or_query_spec
        : VALUES '(' insert_atom_commalist ')'
        | query_spec
        ;

    insert_atom_commalist
        : insert_atom
        | insert_atom_commalist ',' insert_atom
        ;

    insert_atom
        : scalar_exp
        ;

    column_commalist
        : column
        | column_commalist ',' column
        ;

    query_spec
        : SELECT opt_all_distinct selection table_exp
        ; ... See the SELECT statement next.
```

New rows (or records) are entered into a database using the INSERT
statement.

If you have to enter a NULL you can simply use the keyword NULL, as you
would a normal value. Since NULL is a special keyword you do not need to
enclose it in single quotes.

You can specify the columns that you are inserting values into in the
insert statement. One should always specify the columns that you are
inserting into, in case the order of columns in the database are not as
expected, or you are not inserting values into every column.

If a value is not specified for a column on insert, then the default
value will be used for that column. If no default value has been
specified either by a CREATE or MODIFY TABLE statement then NULL will be
used.

## INSERT SOFT

*INSERT SOFT* can be used in place of *INSERT INTO* if you are unsure
whether the value to be inserted into a primary key column will violate
that constraint. If the row with this primary key already exists, then
the new row is not inserted.

    SQL> create table insert_test(id integer primary key, txt varchar);
    Done. -- 90 msec.
    SQL> insert into insert_test(id, txt) values(1, 'test');
    Done. -- 0 msec.
    SQL> insert into insert_test(id, txt) values(1, 'test');
    
    *** Error 23000: [Virtuoso ODBC Driver][Virtuoso Server]SR197:
      Non unique primary key on DB.DBA.insert_test. at line 4 (4) of Top-Level:
      insert into insert_test(id, txt) values(1, 'test')
    
    SQL> insert soft insert_test(id, txt) values(1, 'testsoft');
    
    Done. -- 0 msec.
    SQL> select * from insert_test;
    id                txt
    INTEGER NOT NULL  VARCHAR
    _______________________________________________________________________________
    
    1                 test
    
    1 Rows. -- 60 msec.

## INSERT REPLACING

*INSERT REPLACING* can be used in place of *INSERT INTO* if you are
unsure whether the value to be inserted into a primary key column will
violate that constraint. If the row with this primary key already
exists, then the new row will be inserted replacing the old values.

    SQL> create table insert_test(id integer primary key, txt varchar);
    Done. -- 90 msec.
    SQL> insert into insert_test(id, txt) values(1, 'test');
    Done. -- 0 msec.
    SQL> insert into insert_test(id, txt) values(1, 'test');
    
    *** Error 23000: [Virtuoso ODBC Driver][Virtuoso Server]SR197:
      Non unique primary key on DB.DBA.insert_test. at line 4 (4) of Top-Level:
      insert into insert_test(id, txt) values(1, 'test')
    
    SQL> insert replacing insert_test(id, txt) values(1, 'testreplacing');
    
    Done. -- 0 msec.
    SQL> select * from insert_test;
    id                txt
    INTEGER NOT NULL  VARCHAR
    _______________________________________________________________________________
    
    1                 testreplacing
    
    1 Rows. -- 0 msec.

# UPDATE Statement

Existing rows (or records) are changed in the database using the UPDATE
statement.

NULL values can be utilized using the `NULL` keyword without any quotes.
Since NULL is a special keyword you do not need to enclose it in single
quotes, doing so will cause it be read as a string-literal.

The update statement is made up by selecting the table to update, the
search condition that identifies which rows you want to update, and the
`column=value` of each column you wish to change.

A table can be updated using:

    update demo.dba.employees e
      set username = 'thing'
      where email_address = 'thing@thingdom.com'
      ;

It is possible to update one table based on a select from another table.
Ensure that the selection is properly conditioned to update.

    update demo.dba.employees e
        set username = (select U_NAME from DB.DBA.SYS_USERS u where u.U_EMAIL = e.email_address)
        ;

# SELECT Statement

## Syntax

    < select statement: single row > ::= SELECT [ < set quantifier > ] < select list >
    
          INTO < select target list >
    
          < table expression >
    
    < select target list > ::=
          < target specification > [ { < comma > < target specification > }... ]
    
    < query expression > ::=
          < non-join query expression >
    
        | < joined table >
    
    < non-join query expression > ::=
          < non-join query term >
    
        | < query expression > UNION  [ ALL ]
              [ < corresponding spec > ] < query term >
    
        | < query expression > EXCEPT [ ALL ]
              [ < corresponding spec > ] < query term >
    
    < non-join query term > ::=
          < non-join query primary >
    
        | < query term > INTERSECT [ ALL ]
              [ < corresponding spec > ] < query primary >
    
    < non-join query primary > ::=
          < simple table >
    
        | < left parent > < non-join query expression > < right parent >
    
    < simple table > ::=
          < query specification >
        | < table value constructor >
        | < explicit table >
    
    < query specification > ::=
        SELECT [ < set quantifier > ] < select list > < table expression >
    
    < select list > ::=
          < asterisk >
        | < select sublist > [ { < comma > < select sublist > }... ]
    
    < select sublist > ::=
          < derived column >
        | < qualifier > < period > < asterisk >
    
    < derived column > ::= < value expression > [ < as clause > ]
    
    < as clause > ::= [ AS ] < column name >
    
    < table expression > ::=
        < from clause >
        [ < where clause > ]
        [ < group by clause > ]
        [ < having clause > ]
    
    < from clause > ::= FROM < table reference >
        [ { < comma > < table reference > }... ]
    
    < table reference > ::=
          < table name > [ [ AS ] < correlation name >
              [ < left parent > < derived column list > < right parent > ] ]
        | < derived table > [ AS ] < correlation name >
              [ < left parent > < derived column list > < right parent > ]
        | < joined table >
    
    < derived column list > ::= < column name list >
    
    < derived table > ::= < table subquery >
    
    < table subquery > ::= < subquery >
    
    < joined table > ::=
          < cross join >
        | < qualified join >
        | < left parent > < joined table > < right parent >
    
    < cross join > ::=
        < table reference > CROSS JOIN < table reference >
    
    < qualified join > ::=
        < table reference > [ NATURAL ] [ < join type > ] JOIN
          < table reference > [ < join specification > ]
    
    < join type > ::=
          INNER
        | < outer join type > [ OUTER ]
        | UNION
    
    < outer join type > ::=
          LEFT
        | RIGHT
        | FULL
    
    < join specification > ::=
    
          < join condition >
        | < named columns join >
    
    < join condition > ::= ON < search condition >
    
    < named columns join > ::=
        USING < left parent > < join column list > < right parent >
    
    < join column list > ::= < column name list >
    
    < where clause > ::= WHERE < search condition >
    
    < group by clause > ::=
        GROUP BY < grouping column reference list >
    
    < grouping column reference list > ::=
    
        < grouping column reference >
            [ { < comma > < grouping column reference > }... ]
    
    < grouping column reference > ::=
    
        < column reference > [ < collate clause > ]

## Description

The SELECT statement is the principal means of information retrieval in
SQL. A SELECT can retrieve information from one or more tables with
arbitrary search criteria. SELECT's can also be nested to have the
output of one serve as an input or search condition for another. Several
SELECT's can be combined into one query with the UNION, INTERSECTION and
EXCEPT operators.

The SELECT syntax consists of the following parts:

    SELECT [DISTINCT] scalar_exp {, scalar_exp}
        FROM table {, table}
        WHERE < search condition >
        GROUP BY < column list >
        HAVING < search condition >
        ORDER BY < ordering spec list >
        FOR UPDATE

All parts are optional. If one or more of the clauses appear they must
appear in the above order. All parts do not need to be specified, e.g.
SELECT A FROM T FOR UPDATE is valid but SELECT A FROM T ORDER BY a WHERE
\< \< 10 is not.

> **Note**
> 
> A select without a FROM clause is allowed.
> 
> This is useful for returning values of expressions to the client. Such
> a select always returns one row, with the values listed as columns.
> Typically only useful from interactive SQL.
> 
> Example:
> 
> select 1 + 2 as three;

A table reference in the FROM clause can either be a simple table name,
another SELECT expression of the form described above or a join
expression. A SELECT inside a FROM is called a derived table. This means
that the rows selected by the derived table expression are treated as if
they constituted a table. This is similar to a VIEW reference and a
derived table can be thought of as an unnamed in-line VIEW declaration.

A join expression combines table references, which are either simple,
derived or joined tables themselves into different joins.

A join is an operation that retrieves for each row of one table zero or
more rows from another table. The join condition specifies how the rows
are matched. The result of a join is a set of rows containing selected
columns from both joined tables. Joins are by default so called INNER
joins, which means that for a row to be in the result there must be a
row matching the left table in the right table as specified by the join
condition. An OUTER join is a join that will produce a result row even
if there is no row in the right table for the row in the left table. The
columns that would have come from the right table are then just set to
NULL's.

    table_ref ::=
        < table name > [< correlation name >]
      | / query expression ) < correlation name >
      | < table ref > < [NATURAL] join > < table ref > < join condition >
    
    join ::=
        < empty >
      | CROSS
      | INNER
      |     LEFT [OUTER]
      |     RIGHT [OUTER]
    
    join condition ::=
        < empty >
      | ON < search condition >
      | USING '(' < column > {, column} ')'

The \< correlation name \> is an identifier that is used to identify the
table in a column reference if the same table appears many times in the
query expression, e.g. is joined with itself.

The CROSS join has no join condition. This means that for each row in
the left table all rows in the right table are included in the result.

## Column Aliasing - AS Declaration

Virtuoso supports the AS operator in the selection list of a SELECT
statement. This notation allows declaring a name and optionally a type
and precision for a statement's output column.

The syntax is:

    as_exp:
    Scalar_exp AS NAME opt_data_type

For instance, one can write:

    SELECT COUNT (*) AS NUMBEROFROWS FROM XX;
    SELECT COUNT (*) AS NUMBEROFROWS INTEGER (2) FROM XX;
    SELECT CONCATENATE (COL1, COL2) AS RESULTSTRING VARCHAR (50) FROM XX;

The AS expression tells the client to return specified values in the
SQLDescribeCol, SQLColAttribute or equivalent calls. The semantics of
statements is not otherwise affected. An AS expression can appear
anywhere a scalar expression can but the only place where it has an
effect is the selection list of a SELECT statement.

If a data type is given and contains a precision, that precision is
returned to the client as the precision of the column in question.

## Join examples

The following three statements produce an identical result.

    select Orders.OrderID, ProductID
        from Orders natural join Order_Details using (OrderID)
    select Orders.OrderID, ProductID
        from Orders join Order_Details on Orders.OrderID = Order_Details.OrderID
    select Orders.OrderID, ProductID
        from Orders,  Order_Details where Orders.OrderID = Order_Details.OrderID

> **Note**
> 
> In all these cases if there exists no Order\_Details row matching the
> Orders row there will no no result row corresponding to the Orders
> row. An outer join can can be used to also retrieve left table records
> for which there is no matching right table record.

    select Orders.OrderID, ProductID
        from Orders natural left outer join Order_Details using (OrderID)

will produce a result identical to the above sample if for each Orders
row there is at least one Order\_Details row. If there is none however,
the OrderID column from Orders will appear together with a NULL
ProductID from the non-existent Order\_Details.

A right outer join is like a left outer join with the left and right
tables reversed.

## Ordering and Grouping

The result rows of a query can be ordered based on their column values.
The ORDER BY phrase allows specifying an ascending or descending sort
order for a any column. The SQL interpreter will use an index if there
is an index whose order reflects the order in the ORDER BY clause. If
there is no appropriate index or if ascending and descending order is
combined for columns of the same table the SQL interpreter will first
evaluate the query and then sort the results before returning them.

> **Tip**
> 
> Optimizations below for more information.

``` 
 select * from Employees order by BirthDate;
```

will list all employees, oldest first, in ascending order of birth date.

The GROUP BY clause allows computing functions over repeating groups.
Without the GROUP by clause set functions (AVG, MIN, MAX, SUM, COUNT)
may not be mixed with normal columns in a selection list. If set
functions and columns are mixed, all the columns must appear in the
GROUP BY section. Such a query will produce as many rows as there are
distinct value combinations of the grouping columns. The set functions
will be computed for each distinct column combination.

    select OrderID, sum (UnitPrice * Quantity)
       from Order_Details group by OrderID
       having sum (UnitPrice * Quantity) > 5000  order by 2 desc;

Produces the OrderID and total value of the order in decreasing order of
order value. The HAVING clause specifies that only orders with a value
\> 5000 will be counted. Note that the sum expression in having must be
written identically to the same expression in the SELECT left.

The 2 in the order by refers to the second column of the select, which
has no name, it being a function reference.

### CUBE and ROLLUP

Virtuoso database offers a way to increase efficiency of SQL summary
queries and simplify the operations. By using the options `ROLLUP` and
`CUBE` in `GROUP BY` , can be executed more comprehensive summary
operations. The produced result sets could be also produced without
using these option but rahter with additional coding and queries.

The options `ROLLUP` and `CUBE` extend the result set of `GROUP BY` :

  - `ROLLUP` : builds a consequence of subtotal aggregates on every
    queried level including the grand total.

  - `CUBE` : this option is an extension of
    
    `ROLLUP` . It builds all possible subtotal aggregates combinations
    for given
    
    `GROUP BY` .

For example:

``` 
  SELECT j, grouping (j), k, grouping (k), t, grouping (t), SUM (i)
    FROM MyDemo
GROUP BY ROLLUP (j,k,t);

  SELECT j, grouping (j), k, grouping (k), t, grouping (t), SUM (i)
    FROM MyDemoCube
GROUP BY CUBE (j,k,t);
```

The `grouping(param)` procedure returns "1" if the column "param" is not
in the dynamic GROUP BY set, and returns "0" otherwise.

The result set of:

``` 
  SELECT j, k, t, SUM (i)
    FROM MyDemo
GROUP BY ROLLUP (j,k,t) ;
```

is equivalent of the accumulated result sets of:

``` 
  SELECT j, k, t, SUM (i)
    FROM MyDemo
GROUP BY j,k,t;

  SELECT NULL, k, t, SUM (i)
    FROM MyDemo
GROUP BY k,t;

  SELECT NULL, NULL, t, SUM (i)
    FROM MyDemo
GROUP BY t;

  SELECT NULL, NULL, NULL, SUM (i)
    FROM MyDemo;
```

The result set of:

    SELECT t,s, SUM (i) FROM MyDemo GROUP BY CUBE (t,s);

is equivalent of the accumulated result set of:

``` 
  SELECT t,s, SUM (i)
    FROM MyDemo
   GROUP BY t,s;

  SELECT t,NULL, SUM (i)
    FROM MyDemo
GROUP BY t;

  SELECT s,NULL, SUM (i)
    FROM MyDemo
GROUP BY s;

  SELECT NULL,NULL, SUM (i)
    FROM MyDemo;
```

## Grouping Sets

The grouping sets variant of group by allows specifying exactly which
combinations of groupings are needed. `CUBE` and `ROLLUP` are shorthands
that expand into a grouping sets specification. This is useful for
applications like faceted search where there are separate group by's on
properties of interest.

The grouping function behaves identically to `CUBE` and `ROLLUP` .

The syntax is:

    GROUP BY grouping sets (<grouping set>[,...])

The grouping set is a list of grouping columns in parentheses or `()` to
denote an aggregate without grouping.

For example:

``` 
  SELECT key_table, key_is_main, COUNT (*)
    FROM SYS_KEYS
GROUP BY grouping sets ((key_table), (key_is_main), ());
```

This shows for each table the number of indices, then the number of
primary key and non-primary key indices across all tables and finally
the total number of indices in the schema. A `CUBE` would produce these
same groupings but it would further add the `key_table` , `key_is_main`
grouping.

As an extension to SQL 99 OLAP extensions, the Virtuoso grouping sets
specification also supports an `ORDER BY` with optional top. In the
place of a grouping set one can write:

    ORDER BY [top k] (<column> [,...])

In this way a single query can produce a set of ordered result rows and
different grouped aggregates on the columns in the result set.

## Derived Tables

A SELECT expression may be used in the place of a table in a FROM
clause. This provides control over where DISTINCT and ORDER BY
operations are evaluated.

    select ProductName, UnitsInStock
        from (select distinct ProductID from Order_Details) O,
            Products where Products.ProductID = O.ProductID;

This retrieves the name and quantity of products that have been ordered.

An equivalent phrasing would be

    select distinct ProductName, UnitsInStock
       from Order_Details O, Products where Products.ProductID = O.ProductID;

The difference is that the latter retrieves a Products row for each
order line whereas as the first retrieves a products row for each
distinct product in the order lines. The first is therefore faster to
evaluate. Also note that the rows in the DISTINCT buffer in the first
example only consist of the product id whereas they are much longer in
the second example.

Note that a correlation name is required for derived tables since the
derived table is as such anonymous.

## Query Expressions

    < non-join query expression > ::=
          < non-join query term >
        | < query expression > UNION  [ ALL ]
              [ < corresponding spec > ] < query term >
        | < query expression > EXCEPT [ ALL ]
              [ < corresponding spec > ] < query term >
    
    < corresponding spec > ::=
        CORRESPONDING [ BY < left parent >
            < corresponding column list > < right parent > ]

Queries can be combined by set operators UNION, INTERSECTION and EXCEPT
(set difference). The ALL keyword will allow duplicate rows in the
result set. The CORRESPONDING BY clause allows specifying which columns
will be used to determine the equality of rows from the left and right
operands.

``` 
 select OrderID from Orders except
    corresponding by (OrderID) select OrderID from Order_Details
```

will produce the OrderID's of orders that have no Order\_Details. This
is equivalent to: select OrderID from Orders a where not exists (select
1 from Order\_Details b where a.OrderID = b.OrderID)

Note that the queries, although to a similar effect are executed quite
differently. There may be significant differences in performance.

## LIKE Predicate & Search Patterns

The *LIKE* predicate expects a pattern to be applied to a varchar or
nvarchar column to qualify the results to be returned from a query.

If the pattern does not begin with an at-sign (@) or with two asterisks
(\*\*), then we test the equality of the string and pattern with
ordinary wildcard matching, which behaves approximately like the
filename pattern matching in the Unix shell. (But not like the regular
expression matching in utilities like grep and sed).

The following characters have special significance in the pattern:

? Matches any single character.

\* Matches zero or more of any characters.

\[ \] (Called a group-expression here) Matches any one of the enclosed
characters, unless the first character following the opening \[ is ^,
then matches only if the character (in the datum string) is not any one
of those specified after the ^. (i.e. the ^ negates the meaning of this
expression.)

You can use character ranges like 0-9 (shorthand for 0123456789) inside
the brackets, in which case the character in the datum string must be
lexically within the inclusive range of that pair (of course the
character at the left side of hyphen must be lexically (that is, its
ASCII value) less than the character at the right side).

The hyphen can be included in the character set by putting it as the
first or last character. The right bracket (\]) can be included by
putting it as the first character in the expression, i.e. immediately
after the opening bracket (\[) or the caret (^) following it.

    [abc]          Matches any of the letters a, b and c.
    [^0123456789]  Matches anything, except digits. (same as [^0-9])
    [[]            Matches [
    []]            Matches ]
    [][]           Matches ] and [
    [^]]           Matches anything except ]
    [A-Za-z0-9]    Matches all the alphanumeric characters.
    [-*+/]         Matches the four basic arithmetic operators.
    [-]            Matches to single hyphen.
    []-]           Matches to ] or -
    [-[] or [[-]   Matches to - or [

That is, the hyphen indicates a range between characters, unless it is
the first or the last character in the group expression, in which case
it matches just to itself.

*@* Matches the character last matched to ? or group-expression. For
example ?\*@ matches to all strings which begin with the same character
they end. However, if there is neither ? nor \[\] expression at the left
side of @ in the pattern, then @ matches just to itself. (e.g. \*@\*
should match to all e-mail addresses).

Any other characters match ONLY to themselves, that is, not even to the
upper- or lowercase variants of the same letter. Use expression like
\[Wo\]\[Oo\]\[Rr\]\[Dd\] if you want to find any mixed-case variant of
the word "word", or use the substring search explained below.

However, if the pattern begins with an at-sign (@) then we compare the
rest of pattern to string with the fuzzy matching, allowing differences
of few characters in quality and quantity (length). If there is more
than one @ in the beginning of pattern they are all skipped, and so many
additional liberties are given for the match function. The more @-signs
there are in the beginning, the more fuzzy (liberal) is the search. For
example: pattern "@Johnson" will match to string "Jonsson" and pattern
"@@Johnson" will match also to "Jansson".

If the pattern begins with two asterisks, then we do diacritic- and case
insensitive substring search, trying to find the string given in the
rest of pattern from the datum string.

"\*\*escort" will match to "Ford Escort vm. 1975".

If there are any ISO8859.1 diacritic letters (e.g. vowels with accents
or umlaut-signs, or letters like the Spanish n with \~ (tilde)) present
in the datum string, then the plain unaccented (7-bit ASCII) variant of
the same letter in the pattern string will match to it. But if there are
any diacritic letter specified in the pattern string, then it will match
only to the upper- or lowercase variant of exactly the same diacritic
letter.

The rationale behind this is that the people entering the information to
database can use the exact spelling for the word, for example writing
the word "Citroen" with the umlaut-e (e with two dots above it), as it
is actually written in French, and the people who search for the
Citroens can still find it without need to remember the exact
orthography of the French, by just giving a word "citroen". And this
allows also the people who have just plain 7-bit ASCII keyboards to
search for the words like Ra"a"kkyla" (place in Finland, a" means
umlaut-a, i.e. a with two dots above it), just by entering the word
raakkyla.

So the following holds with the substring searches:

1\) Any non-alphabetic character in the pattern matches just to itself
in the datum string (e.g. ? to ? and 3 to 3).

2\) Any 7-bit ASCII letter (A-Z and a-z without any diacritic signs) in
the pattern matches to any diacritic variant of the same letter (as well
as to same 7-bit ASCII letter) in the datum string, either in the upper-
or lowercase.

3\) Any diacritic letter (8-bit ISO8859.1 letter) in the pattern matches
only to the same letter (in the upper- or lowercase) in the datum
string.

> **Note**
> 
> because the internal matching functions use macros which consider also
> the characters like: @, \[, \\, \], and ^ to be letters, they will
> match against characters \`, {, |, }, and \~ respectively, which is
> just all right, because in some older implementations of European
> character sets those characters mark the uppercase and lowercase
> variants of certain diacritic letters.

It is generally better to match too liberally and so maybe sometimes
give something entirely off the wall to the user, than to miss something
important because of too strict criteria.

Of course, when searching from the data which contains text in some
wide-character format (like certain coding systems for Japanese and
Chinese where one character is coded with two bytes) neither fuzzy
matching function nor nc\_strstr function presented here should be used,
as they would often match on entirely spurious cases.

## The TOP SELECT Option

    query_term :  SELECT opt_top selection ....
    
    opt_top :  opt_all_distinct [ TOP INTNUM ]
        |  opt_all_distinct [ TOP SKIPINTNUM, INTNUM ]
        |  opt_all_distinct [ TOP (num_scalar_exp) ]
        |  opt_all_distinct [ TOP (skip_num_scalar_exp, num_scalar_exp) ]
    opt_all_distinct : [ ALL | DISTINCT ]

The TOP n phrase can follow an optional ALL or DISTINCT keyword in a
SELECT, either at top level or inside a query term of an expression or
subquery. The query with the TOP option will generate at most the
indicated number of result rows.

The scope of TOP is the query in question. For example

    select top 3 row_no from t1 best union select top 3 row_no + 1 from t1;

Will always return 4 rows assuming there are at least 3 rows in T1.

The optional SKIPINTNUM parameter lets you offset the selection by
SKIPINTNUM number of rows. If you have a ten-row table and `select top 2
from this_table` you get the first two rows, `select top 2, 2 from
this_table` will return the third and fourth rows only, instead.

## CASE, NULLIF, COALESCE, CAST Value Expressions

### The CASE Expression

There are many situations where you might find it useful to alter the
the data returned by a SQL query based on a few rules. For example, you
may want to display Customers gender as 'Male' or 'Female' based on
whether their title is 'Mr' or one of 'Miss', 'Mrs' or 'Ms'. The CASE
expression can easily accommodate this.

The Syntax of CASE is:

    CASE
      WHEN <search-condition> THEN <output>
      WHEN <search-condition> THEN <output>
      ...
      ELSE <output>
    END

When a \<search-condition\> is met the corresponding \<output\> is
returned. If no conditions are met then the \<output\> after is ELSE is
returned as a default value.

    SELECT Title, CustomerName,
      CASE
        WHEN Title = 'Mr' THEN 'Male'
        WHEN Title = 'Mrs' THEN 'Female'
        WHEN Title = 'Miss' THEN Female'
        WHEN Title = 'Ms' THEN 'Female'
        ELSE 'Unknown'
      END as Gender,
      Company
      FROM Customers

May return values such as:

    Title   Gender  CustomerName        Company
    VARCHAR VARCHAR VARCHAR             VARCHAR
    ___________________________________________________________
    
    Mr      Male    Thomas Hardy        Around the Horn
    Miss    Female  Christina Berglund  Berglunds shop
    Mrs     Female  Hanna Moos          Blauer See Delikatessen
    Mr      Male    Laurence Lebihan    Bon app

There is also a short hand notation for the CASE expression as follows:

    CASE <search-parameter>
      WHEN <search-value> THEN <output>
      WHEN <search-value> THEN <output>
      ...
      ELSE <output>
    END

This short hand is best demonstrated by the rewrite of the above example
as follows:

    SELECT Title, CustomerName,
      CASE Title
        WHEN 'Mr' THEN 'Male'
        WHEN 'Mrs' THEN 'Female'
        WHEN 'Miss' THEN Female'
        WHEN 'Ms' THEN 'Female'
        ELSE 'Unknown'
      END as Gender,
      Company
      FROM Customers

In both cases the ELSE keyword is optional. If ELSE is unspecified then
ELSE NULL is implicit.

### The NULLIF Expression

The NULLIF expression is a short hand implementation of a special case
of the CASE expression for a popular demand. Consider the following CASE
expression:

    CASE col1
      WHEN 'something' THEN NULL
      ELSE col1
    END

This is replaced by the NULLIF expression which achieves the same result
using the following, much shorter expression:

    NULLIF (col1, 'something')

This is often useful in situations where you have a code to denote a
value as unspecified for whatever reason, but in many applications you
would rather this was NULL.

### The COALESCE Expression

The COALESCE expression is another application of the CASE expression to
suit another frequent requirement. The syntax of COALESCE is as follows:

    COALESCE (value-1, value-2, ..., value-n)

COALESCE returns the first non-NULL parameter. This is equivalent to

    CASE
      WHEN value-1 IS NOT NULL THEN value-1
      WHEN value-2 IS NOT NULL THEN value-2
      ...
      ELSE value-n
    END

### The CAST Expression

SQL has always been considered a strongly typed language, meaning that
you cannot have expressions that contain arbitrary data types. Casting
is invaluable for comparing values that are obviously compatible but
their data types are not, such as `1 = '1'` . This attempts compares an
integer with a char which would not work unless one of the values was
cast as follows:

    cast('1' as integer) = 1

> **Tip**
> 
> The [CASTING](#dtcasting) section for more information.

## SELECT BREAKUP

Virtuoso extends the select statement with a breakup option. This option
allows a single row selected by a derived table to be seen as multiple
rows by the enclosing query.

This is specially useful when translating relation tables to RDF. Using
breakup, one can do a single pass over a table and generate multiple
triples, each presented as a separate result row.

The syntax is:

    SELECT BREAKUP breakup_term [, ...] FROM ....
    breakup_term ::=
    
    scalar_exp [, scalar_exp...] [WHERE search_condition]

Each breakup term is a list of comma separated expressions with an
optional search condition at the end. Each list is treated as a select
list in a union, i.e. they must be of equal length and the leftmost list
must provide a name for each column. This means that an AS declaration
is needed if the expression is not a column.

If a breakup tern has the optional WHERE clause, the condition is
evaluated in the scope of the select, i.e. all that is defined by the
FROM. If the condition is true, the row represented by the breakup term
is added to the result set of the breakup select, otherwise it is
ignored.

A breakup select is only allowed in a derived table or a union or other
set operator term inside a derived table. A top level breakup select is
not allowed. To have a breakup select as the topmost select, simply
write:

    select * from (select breakup .... from ...) f;

Breakup cannot be mixed with distinct, top, group by or order by. Again,
to combine these, use nested derived tables.

Breakup operates equally well on local and remote tables. Breakup is
never passed on to a remote but the FROM of a breakup select can consist
of tables from any source.

    select * from (select breakup (a.row_no, b.fi2) (b.row_no, a.fi3 where a.fi3 is not null)
    from r1..t1 a, r1..t1 b
    where a.row_no < 10 and b.row_no = a.row_no)f;

This produces 2 rows for each result of the join, except if fi3 is null,
in which case only the first term of the breakup is returned in the
result set.

# COMMIT WORK, ROLLBACK WORK Statement

These statements reset the current transaction. COMMIT WORK leaves all
the changes made by the current transaction in effect whereas ROLLBACK
work reverses them.

In both cases, the transaction will be in a fresh state, having no locks
and no changes that could be rolled back. The rollback operation always
succeeds, as any change is always reversible until committed. COMMIT
WORK may fail if the transaction had been marked to be canceled before
the COMMIT WORK operation started. A failed commit has the effect of a
rollback but it will signal a SQL STATE descriptive of the error, e.g.
40001 (deadlock).

These operations are typically not needed, since the SQLTransact ODBC
call and the ODBC autocommit mode are used instead for transaction
control. The only use for these statements is within stored procedures,
where it may be practical to break a long sequence of operations into
several transactions to reduce lock contention.

These can also be used together with the WHENEVER declaration to
automate retry upon deadlock inside stored procedures.

Triggers should not normally use these statements. The exception is the
case where a trigger detects a state violating application consistency
rules and decides to abort the transaction. This can be done by ROLLBACK
WORK, typically followed by a call to the signal function for notifying
the application.

    create procedure retry (in x integer)
    {
      whenever sql state '40001' goto deal;
     again:
      -- action
      return;
     deadl:
       rollback work;
       goto again;
    }
    
    create trigger sal_negative on "Employee" after update ("Salary")
    {
      if ("Salary" < 0) {
        rollback work;
        signal ('A0001', 'Salary cannot be negative');
      }
    }

> **Tip**
> 
> [txn\_error](#fn_txn_error) , [txn\_killall](#fn_txn_killall) ,
> [signal](#fn_signal)

# CHECKPOINT, SHUTDOWN Statement

    admin_statement
        : SHUTDOWN opt_log
        | CHECKPOINT opt_log
        | BACKUP opt_log
        ;

The checkpoint is a point in the history of a database where all the
state is written on disk as a single, consistent image that contains all
the state committed so far and no uncommitted state. A transaction log
starts after a checkpoint and contains the information to allow the
recreation of the effect of transactions committed since the checkpoint.
The checkpoint state and the transaction log together allow recovering
the database up to the last committed transaction.

The CHECKPOINT statement forces a checkpoint to be made. Making the
checkpoint allows starting a new transaction log. If no new log name is
specified the old log is truncated to length 0 and reused for logging
transactions. If the CheckpointAuditTrail option is enabled in
virtuoso.ini a new log will be started even if no new log is specified
in the checkpoint or shutdown statement.

The SHUTDOWN statement performs a CHECKPOINT, and terminates the server
upon completion.

BACKUP is an alternate notation for backup().

    checkpoint 'new.log';
    backup 'bak.log';
    shutdown 'new2.log';

The above sequence of commands makes a checkpoint and starts logging
subsequent transactions into new.log. The backup statement makes
bak.log, which represents the state prior to starting new.log. The
shutdown statement makes a new checkpoint and marks new2.log as the log
file to be used for logging transactions after the database restarts.
The database server exits at the completion of the SHUTDOWN statement.

    replay ('bak.log');
    replay ('new.log');

These statements executed on an empty database will recreate the state
in effect after the last transaction to commit before the SHUTDOWN
statement of the previous example.

> **Tip**
> 
> The [Backup section](#backup) for more backup and recovery
> information.

    create procedure log_test ()
    {
      -- disable the transaction logging
      log_enable (0);
    
      -- action code, for ex.:
      delete from TAG_REL_INX;
      insert into TAG_REL_INX (TR_T1, TR_T2, TR_COUNT) select TR_T1, TR_T2, TR_COUNT from TAG_REL;
    
      exec('checkpoint');
    
      -- enable the transaction logging
      log_enable (1);
    };

## Checkpoint & Page Remapping

In concept, making a checkpoint consists of writing the last committed
state of a page on the read-only pre-checkpoint state. This is in case
the page existed before the previous checkpoint. If the page was created
after the last checkpoint, making the checkpoint consists of just
writing it to disk. Now if the number of pages modified between
checkpoints largely exceeds the amount of RAM, the checkpoint will be a
disk-to-disk copy process which takes a time proportional to the number
of modified pages. This can take a long time. Virtuoso offers a
mechanism called checkpoint remap. This allows making a committed state
persistent, i.e. safe, without copying all the delta collected since the
last checkpoint over the pre-checkpoint state.

The checkpoint remap mechanism means that a page, say number 12 get
remapped to 15 when updated. Suppose now that the page were written to
disk. Now we have the pre-checkpoint page on 12 and the committed post
checkpoint state on 15. If a checkpoint now takes place, instead of
copying 15 over 12, which may involve reading the page, we just write
that 12 is actually on 15. This speeds up the checkpoint but causes one
page to take the space of 2. Now suppose 12 were modified again, now we
would see that the pre checkpoint page is 15 and that the original 12 is
free. The page now gets mapped to 12. The next checkpoint now will mark
that 12 is 12, which was the original condition and 15 is free.

The mechanism is actually more complex but this is the basic idea. By
allowing a page to occupy two pages in some situations we dramatically
cut down on atomic checkpoint time and improve availability.

Now we may argue that this destroys locality since pages that were
created contiguous are no longer that after an update. This is why there
is also a mechanism called unremap. and there is an upper limit to
checkpoint remaps. If every page were updated between checkpoints, they
would alternately be in their original place or in a remote place from
which the next update-checkpoint combination would return them to the
original. Now this is not always the case. Also there is not always
enough space to keep up to three copies of each page. Therefore there is
an unremap mechanism and an upper limit to checkpoint remaps.

The `MaxCheckpointRemap` parameter in the [virtuoso.ini](#virtini) file
controls how many pages may be stored on a page other than their logical
page. The `UnremapQuota` parameter in the [virtuoso.ini](#virtini) file
controls how many previously remapped pages are unremapped each time a
checkpoint is made.

Having an unlimited MaxCheckpointRemap and zero UnremapQuota will cause
a checkpoint to consist exclusively of a flush of dirty buffers. The
downside is that a page can take the space of two for an unlimited
period of time and that original locality is not maintained. Setting the
maximum checkpoint remap to zero in such a situation causes the next
checkpoint to unremap all checkpoint remapped pages, restoring physical
sequence and freeing disk space.

> **Tip**
> 
> The TPC C Benchmark chapter for examples of checkpoint remapping in
> use on test environments.

# Stored Procedures as Views & Derived Tables

Virtuoso allows using a stored procedure result set in place of a table.
A view may also be defined as a stored procedure. This provides smooth
integration to external procedural logic in queries.

When a procedure appears as a table, the procedure is called and its
result set is inserted into a temporary space. Processing continues from
that point on as if the data came from a table.

Queries involving procedure views or derived tables are subject to
normal join order selection. For this purpose it is possible to
associate a cost to a procedure used in a procedure view or derived
table. If the option (order) clause is given at the end of the select,
joins are done left to right. If a procedure is in the leftmost position
in the from it will be called once for the query, if it is in the second
position it will be called once for every row of the leftmost table that
passes selection criteria applicable to it and so on.

Procedures used as tables can get parameters from the query. These
parameters are expressed in the containing select's where clause as
column = expression, where column is a parameter name of the procedure
table.

A procedure derived table is of the form:

    q_table_name '(' column_commalist ')' '(' column_def_commalist ')' alias

The first column commalist is the parameter list. The second
column\_def\_list is a description of the result set, as in a CREATE
TABLE statement. The correlation name alias is required if the procedure
occurs as a derived table, with no view definition.

A procedure view is declared as follows:

    CREATE procedure VIEW new_table_name
        AS q_table_name '(' column_commalist ')' '(' column_def_commalist ')'

The columns in the column definition list should correspond to the
procedure's result set columns. The columns are explicit in the view so
as to be able to interpret the view definition and to be able to compile
procedures and queries using the view before the procedure itself is
defined. Thus the procedure need be defined only at time of execution,
not at time of definition.

The meta-data returned by ODBC catalog calls for a procedure view will
show the columns as they were declared, just like a regular view.
Procedure views are never updatable.

## Procedure Table Parameters

If there is a condition that is in the top level set of AND'ed
conditions in the table expression's WHERE clause and if it is an
equality condition and if it references a parameter of a procedure table
and if the other side of the equality does not reference the procedure
table or a table to the right of it, then this condition is considered a
parameter. This means that the condition is not actually evaluated but
rather that the other side of the equality is evaluated before calling
the procedure and that the value returned is passed to the procedure as
an input parameter in the position indicated by the name in the
parameter list of the view or derived table.

If the procedure table is referenced in an explicit join, as in outer or
inner join syntax, only equalities in the join condition (ON clause) are
eligible to specify a parameter. Equalities in the enclosing query's
WHERE phrase will be considered tests on the results, not parameters.

The parameter names in the procedure view's or derived table's parameter
list do not have to be names in the output columns, although this will
often be the case. The number of parameters in the parameter list in the
view or derived table must match that in the procedure definition but
the names do not have to be the same. Only input parameters are
supported.

If a parameter is specified but no applicable predicate is found, a NULL
value is passed.

## Procedure Table Result Sets

The result set is declared in the derived table or view. This should
match the result\_names in the procedure but the former will take
precedence on the latter. If an actual result row is shorter than the
declared set, the missing columns will default to NULL.

## Procedure Tables & Security

Accessing a procedure as a table requires execute privileges on the
procedure. Privileges declared on the view are not checked.

## Procedure Table Cost and Join Order

The \_\_cost declaration in a procedure definition can associate a cost
to a procedure. This declaration is then used for assessing different
join orders. Note that depending on the join order, some parameters of a
procedure table may or may not be available. It is of the form \_\_cost
(n1, n2,...), where each n is a literal number. The declaration can
figure anywhere in the procedure's body as a regular statement. At least
one number is required. The first number is the one-time cost of calling
the procedure. The second number is the number of result rows that will
be produced by the call, defaulting to 1. The numbers from third onwards
correspond to the parameters of the procedure from left to right. If a
parameter is NOT given or is NOT known because of join order, then the
cost of the single call and the result count will be multiplied by the
number corresponding to the parameter.

Consider the declaration \_\_cost (10, 3, 5);. The procedure will take
10 units of time per call and produce 3 rows if the first parameter is
known. Otherwise it will take 50 units and produce 15 rows. This is a
rough way to specify the selectivity of specifying a parameter versus
not specifying it. One may liken this to specifying or not specifying
conditions of a table's columns.

The unit of cost is an internal abstract unit. For purposes of scaling,
selecting a single row from a table of 1000 on an exact match of an
integer key is 3 units. The costs are shown by the explain function with
a second argument of -5.

## Limitations

There is no limitation to the number of rows in a procedure result set.
The temporary storage takes place in the database similarly to a sorted
ORDER BY. Number of columns is limited to the maximum number of columns
in a real table. Total row size limit for tables and ORDER BY
intermediate results applies. Blobs are allowed and do not count towards
the row length limit.

## Procedure Table Examples

    create procedure n_range (in first integer, in  last integer)
    {
      declare n, n2 integer;
      n := first;
      result_names (n, n2);
      while (n < last){
        result (n, 2 * n);
        n := n + 1;
      }
    }
    
    select n, n2 from n_range (first, last) (n int, n2 int) n
        where first = 2 and last = 12;

This returns a set of numbers from 2 to 11 and from 4 to 22.

    select a.n, b.n from n_range (first, last) (n int, n2 int) a,
        n_range (f2, l2) (n int, n2 int) b
      where first = 2 and last = 12 and f2 = a.n - 2 and l2 = a.n + 2;

Here we join the second call to the procedure to the first, effectively
passing the output of the left call as parameters to the right call.

    create procedure view n_range as n_range (first, last) (n1 int, n2 decimal);

This defines the procedure as a view, so that it can be referenced like
a table.

    select * from n_range a, n_range b where a.first = 1 and a.last = 11
            and b.last = a.n1 + 2 and b.first = a.n1 - 2;

This is the previous join but now using the view.

# GRANT, REVOKE Statement

    privilege_def
        : GRANT ALL PRIVILEGES TO grantee
        | GRANT privileges ON table TO grantee_commalist opt_with_grant_option
        | GRANT grantee_commalist TO grantee_commalist opt_with_admin_option
        ;
    
    privilege_revoke
        : REVOKE ALL PRIVILEGES FROM grantee_commalist
        | REVOKE privileges ON table FROM grantee_commalist
        | REVOKE grantee_commalist FROM grantee_commalist
        ;
    
    opt_with_grant_option
        : /* empty */
        | WITH GRANT OPTION
        ;
    
    opt_with_admin_option
        : /* empty */
            | WITH ADMIN OPTION
        ;
    
    privileges
        : ALL PRIVILEGES
        | ALL
        | operation_commalist
        ;
    
    operation_commalist
        : operation
        | operation_commalist ',' operation
        ;
    
    operation
        : SELECT priv_opt_column_commalist
        | INSERT
        | DELETE
        | UPDATE priv_opt_column_commalist
        | REFERENCES opt_column_commalist
        | EXECUTE
        | REXECUTE
        | role_name
        ;
    
    grantee_commalist
        : grantee
        | grantee_commalist ',' grantee
    
        ;
    
    grantee
        : PUBLIC
        | user
        ;
    
    user
        : IDENTIFIER
    
    role_name
        : IDENTIFIER

The GRANT and REVOKE statements are used to define privileges on
resources to users and user groups (roles). A resource is a table, view
or stored procedure. A grantee can be PUBLIC, meaning any present or
future user accounts or a user name. Granting a privilege to a user name
means that this user AND any users which have this user as their user
group have the privilege.

Only a granted privilege can be revoked. The sequence:

    grant select on employee to public;
    revoke select (e_review) from joe;

Is invalid because the privilege being revoked was not granted, instead
it was implied by the select on all column to public.

Any role name created by the CREATE ROLE statement is a valid grantee
and a valid grantable operation.

The term 'effective privilege of a user' means the set of privileges
given to a user by virtue of 1. granting them to public 2. granting them
to a role which is granted to the user or to a role either directly or
indirectly granted to the user or 3. granting them, to the specific
user. The dba user and all users whose group is 'dba' have all
privileges.

The phrase

    GRANT ALL PRIVILEGES TO user;

is synonymous with setting the user's group to 'dba'.

The effective privileges inside a trigger are those of the owner of the
table whose trigger is executing. The privilege of executing a trigger
is derived from the privilege of performing the trigger action, e.g.
update of a specific column.

The effective privilege inside a stored procedure is that of the owner
of the procedure. The privilege to execute a given procedure is granted
with the EXECUTE clause.

> **Note**
> 
> The grantee names are identifiers. This means that their case can be
> converted to upper case unless they are quoted. The identifier case
> conversion depends on the global CaseMode setting.

A user may grant or revoke privileges on resources of which he/she is
the owner. A user with effective dba privileges may manipulate any
privileges.

    grant update ("Salary") on "Employees" to "Manager";
    
    grant execute on "SalesReport" to "Accounting";

*GRANT REFERENCES* is a privilege required by a user on a table so that
this user can create new tables referencing such tables in foreign keys
where he/she would otherwise be restricted.

**Remote SQL Data Sources.**

To provide further consistent security to remote data, only the DBA
group is permitted to use the `rexecute()` , unless explicitly granted.
Caution is required here since any user granted use of `rexecute()` has
full control of the remote data source set-up by the DBA, however
limited to the overall abilities of the remote user on the remote data
source.

Users can be granted and denied access to `rexecute()` using the
following syntax:

    GRANT REXECUTE ON '<attached_dsn_name>' TO <user_name>
    REVOKE REXECUTE ON '<attached_dsn_name>' FROM <user_name>

**UDTs.**

Security of UDTs is maintained through normal SQL GRANT and REVOKE
statements via a simple extension. You can define the level of access to
both native and externally hosted UDTs. Grants for persistent user
defined types are persisted into the SYS\_GRANTS table. Grants on
temporary user defined types are in-memory only and are lost (together
with the temporary user defined type definition) when the server is
restarted.

There are two GRANT/REVOKE types for UDTs as follows:

EXECUTE

\- all methods and members of a class are accessible to the grantee.

UNDER

\- the grantee can create subclasses of the class.

    GRANT/REVOKE EXECUTE on <user_defined_type>
    GRANT/REVOKE UNDER on <user_defined_type>

> **Note**
> 
> SQL modules, user defined types and SQL stored procedures are exposed
> to GRANT/REVOKE in the same namespace, therefore care must be taken
> avoid inadvertently granting to multiple objects at the same time.

> **Tip**
> 
> [Virtual Database Procedures & Functions](#vdbstoredprocs)

# SET Statement

## ISOLATION

This allows setting a transaction isolation in a stored procedure or
trigger body. The values are:

uncommitted

committed

repeatable

serializable

These are case insensitive strings.

This takes effect dynamically until replaced by another SET ISOLATION
setting. The effect never persists over the return of the containing
procedure or trigger. The effect does extend into procedures or triggers
called from after executing the SET ISOLATION statement.

    set isolation='serializable';

The initial isolation comes from the SQL\_TXN\_ISOLATION statement
option in the ODBC API (SQLSetConnectOption). The default isolation is
repeatable read.

## LOCK\_ESCALATION\_PCT

This controls the escalation from row locking to page locking. A set of
row locks can be converted into one page lock if: (a) All the row locks
on the page belong to the same transaction, or, (b) No other transaction
waits for any of these locks. The value of this parameter is the
percentage of rows on a page that must be held by the transaction before
the locking goes to page level. The default is 50, meaning that for a
page of 120 rows the 61st row lock will escalate the lock if all the
previous locks belong to the same transaction and there is no wait
pending on any. A value of -1 means that locking is always at page level
if there is more than one lock on the page. A value in excess of 100
causes lock escalation to be turned off. The effect of this setting is
global and persists until the server is restarted. This setting does not
affect the semantic of locking.

## transaction\_timeout

This allows setting a timeout for the current transaction. The value
must be an integer count of milliseconds from the beginning of the
transaction. The transaction is deemed to begin when the first client
statement executes inside it or, if the transaction starts from a commit
work or rollback work statement in PL, from the time of this statement.
If the transaction does not commit or rollback within so many
milliseconds of its beginning, it is liable to get terminated, which is
signalled to any code running inside the transaction as a SQL state
S1T00. When this is signalled the transaction is set into an
uncommittable state and must be rolled back. When the timeoutg elapses,
all locks and uncommitted state belonging to the transaction are freed.

This setting remains in effect until the transaction terminates. Any
timeout for a next transaction must be set separately. This feature can
be used for enforcing maximum running times on operations. The timeout
will take effect also if the transaction holds no locks. This setting
corresponds to the Virtuoso ODBC extension SQL\_TXN\_TIMEOUT statement
option.o

## PARAM\_BATCH

This sets the batch size used by the virtual database array parameter
optimization batch size. This causes several consecutive executes of the
same statement to be grouped as a single ODBC operation with array
parameters. This optimizes joins of tables on different servers and
searched updates, inserts and deletes on attached tables. Most ODBC
drivers do not support array parameters. A value of 1 or 0 disables the
optimization. This should be done if there is a driver which falsely
claims to support array parameters. If a given driver returns an error
when setting array parameters the VDB will detect this and will not try
to use them.

The effect of this setting is global and persists until the server is
restarted. The default value comes from the ArrayParameters
configuration parameter.

# Anytime Queries

Starting with version 6, Virtuoso offers a partial query evaluation
feature that guarantees answers to arbitrary queries within a fixed
time. This is intended for use in publicly available SPARQL or SQL end
points on large databases. This enforces a finite duration to all
queries and will strive to return meaningful partial results. Thus this
provides the same security as a transaction timeout but will be more
user friendly since results will generally be returned, also for
aggregate queries. Outside of a public query service, this may also be
handy when exploring a large data set with unknown properties.

The feature is activated with the statement

    set result_timeout == <expression>;

The expression should be a count of milliseconds. The scope of the
setting is the connection, thus it remains in effect past the return of
the calling procedure. Setting the timeout to 0 returns to the default
state of having no limit on query run time and always returning complete
results. The initial value of the timeout is 0. On a web server thread,
the timeout is reset to 0 at the start of processing each new request
header.

After a query or cursor has exceeded the running time, it is reset. In
the event of the reset occurring inside an aggregation, the part of the
query that produces rows for the aggregation is terminated, the timeout
is reset and the query continues by using the aggregated results that
were obtained before the first timeout. If there is again a timeout, the
present aggregation is reset and the query gets another lease on life
for processing the results accumulated so far. Thus, a query which has a
select, a group by and an order by can consume at most three timeouts.
One for producing the aggregated rows, another for sorting them and
finally a third for returning them to a client or iterating over them in
a stored procedure.

If the timeout occurs outside an aggregation, the result set is simply
truncated.

The fact of a query returning partial results is indicated by the result
set ending with a S1TAT SQL state. If the result set is read to end
without this state being signalled, the results are complete and the
query was not interrupted. If the result set is not consumed to end, the
client cannot be sure of its completeness.

The error message associated with the S1TAT state contains the human
readable version of the output of db\_activity () for the query. If
result\_timeout is non-zero, the opening of a cursor or execution of a
query on a client connection or with the exec () function will reset the
client resource consumption counters automatically. This is done so as
to have the resource consumption statistics for the error message scoped
to the query. To get the exact counts, the application may call
db\_activity (1) in the same procedure. If this is called on a client
server connection with the timeout on, the counts will be reset before
db\_activity () is called.

The resolution of the timeout is fairly low, timeouts are checked every
two seconds with default settings.

A query cannot set a timeout from inside itself. Only a stored procedure
or a top level statement on a client connection can do this.

A request to SPARQL web service endpoint may specify the timeout as an
additional *\&timeout=\<milliseconds\>* parameter. The parameter value
should be equal to or greater than 1000, otherwise it will be ignored.
If *SPARQL* Virtuoso configuration file contains *MaxQueryExecutionTime*
parameter and its value is greater than or equal to 1000 then the actual
"anytime" timeout is the minimum of the requested value and the value in
the configuration file.

The current standard of SPARQL protocol does not provide any support for
partial results. When a SPARQL query ends with S1TAT state, the returned
HTTP header contains four additional rows, *X-SQL-State:* ,
*X-SQL-Message:* , *X-Exec-Milliseconds:* and *X-Exec-DB-Activity:* ;
the returned document is formatted according to the requested MIME type
as if the result is complete.

# Best Effort Union

Virtuoso offers a SQL extension for an error tolerant UNION operation.
The idea is that when querying multiple remote data sources in a single
union construct some of the participating data sources may be allowed to
fail while still returning a result for the successfully queried data
sources.

The construct is introduced by the BEST keyword before UNION or UNION
ALL. If a query expression of multiple unions has a single BEST keyword
the entire union chain is considered as a best effort union. It is
however recommended to have the BEST keyword in FROM of all the UNION
keywords.

When a run time error occurs during the evaluation of a term in a best
effort union the evaluation of the term is interrupted and the union
continues with the next term. The partial result set that may have been
generated by the failed term is considered when making the result.

Aliasing constant columns selected in the terms of the union by the
names \_\_SQLSTATE, \_\_MESSAGE and \_\_SET\_NO retrieve individual
error messages. If these are present and a union term encounters an
error an extra row is generated for the term with all NULLs and the
\_\_SQLSTATE, \_\_MESSAGE and \_\_SET\_NO columns set to the SQL state,
SQL message and the union term number respectively. If neither of these
is specified and a union term fails without producing any result rows
the error will not be visible.

> **Note**
> 
> No error encountered during a best effort union will be signalled in
> the normal fashion.

If a term of a best effort union meets the criteria for a pass through
query on a specific remote database and a transaction error occurs when
evaluating it, the transaction on the VDB is not aborted as would
normally happen as a result of a VDB transaction error.

Thus if a pass through term dies of deadlock on its data source the
query continues normally for other data sources referenced in the best
effort union. The VDB will however get the transaction error when
attempting to commit the transaction where the best effort union took
place since the remote transaction branch will still be deadlocked.

    select 2222, 1 / 0 from sys_users best union all select key_id, 1 / (1000 - key_id)  from sys_keys;

The first term will immediately hit the /0 error and will produce no
rows. The second term will produce a few rows for system tables but will
hit /0 when getting to key\_id 1001.

To see the errors one can write:

    select '00000' as __sqlstate, '' as __message, 2222, 1 / 0 from sys_users best union
    all select '00000' as __sqlstate, '', key_id, 1 / (1001 - key_id)  from sys_keys;

> **Note**
> 
> The columns are named by the first term, hence the AS declaration in
> the second term is optional.

The BEST keyword does not affect the ALL or CORRESPONDING BY options of
UNION.

# Standard and User-Defined Aggregate Functions

In addition to whole set of standard SQL aggregate functions, Virtuoso
provides a method to create application-specific aggregate functions to
create complex data structures inside SQL queries.

The most evident way to calculate some value that depend on number of
rows of a table is to write a stored procedure that opens a cursor, then
fetches row after row in a loop and repeatedly modifies some
intermediate values ("accumulators") inside the loop. When the fetch
operation signals that there are no more data, a final result is
calculated from values of "accumulators"

E.g. to find an average of all values in a table's column COL, one may
open a cursor to fetch values from the COL, then set two "accumulators"
TOTAL and CNT to zero, then fetch row after row adding 1 to CNT and
adding current value of COL to TOTAL. At the end of loop, an error
should be signalled if CNT is zero, otherwise the result is TOTAL
divided by CNT.

Obviously, a competent programmer will use built-in AVG() aggregate
function inside a single SELECT statement: the code is much more
readable and the use of aggregate reduces the overhead in filling in
result-set and fetching from it.

More important advantage of aggregate functions is the ability to
process many groups of records in parallel, performing one table scan
instead of many. SQL optimizer may use sophisticated heuristics to find
the fastest way of doing a complex query with aggregates but it cannot
optimize the code of a stored procedure.

## Create Aggregate Statement

    CREATE AGGREGATE aggregate_name (parameter, parameter ...) [ RETURNS data_type ]
    FROM
        init_procedure,
        acc_procedure,
        final_function
        [, merge_procedure ]
    
    parameter : parameter_type name data_type
    
    parameter_type : IN | INOUT

The create aggregate statement forces the SQL compiler to treat any call
of the declared aggregate\_name as special routine similar to one used
for built-in aggregate functions, so the call produces a single value
for resultset instead of a separate value for every row of the
resultset.

Every occurrence of the aggregate\_name in a select statement creates an
invisible "accumulator" column in resultset. The value of "accumulator"
is calculated by init\_procedure, then every row of data causes a call
of acc\_procedure that may modify the "accumulator" then the call of
final\_function should get data from "accumulator" and return the total
result.

The init\_procedure must have one inout parameter and return nothing. It
should set the parameter to the required initial value of the
"accumulator". (The SQL query compiler will use the declared data type
of the parameter as the data type of the "accumulator" so no casting
problem may occur) equal to

The acc\_procedure must have at least one inout parameter, one or more
parameters of any sort and must return nothing. It should get the
previously calculated value of the "accumulator" from its first
parameter, calculate a new value and set the result back to the first
parameter.

The final\_function must have one in or inout parameter and return a
value. It should get the value of the "accumulator" from its parameter
and return the calculated result.

The optional merge\_procedure must have two inout parameters that accept
values of two "accumulators". If defined, it may be used by SQL
optimizer to split the table scan into two or more scans through parts
of the table. When every 'children' scan iterates some part of the
table, a separate "accumulators" is used for every part.
merge\_procedure gets two accumulators and adds the content of the
second accumulator to the content of the first. If merge\_procedure is
not defined, no such tricky optimization is used. This optimization is
never tried if the database resides on less than four disks, if the
number of CPUs is less than four and if the query contains any call of
user-defined aggregate with no merge\_procedure defined; thus you will
probably never need to write such a function.

The declaration of aggregate is persistent. If create aggregate
statement is successful the text is stored into the SYS\_PROCEDURES
table. This table is read at startup so user-defined aggregates are thus
always available for use and need be defined only once.

## Drop Aggregate Statement

    DROP AGGREGATE aggregate_name

The drop aggregate statement removes the declaration of aggregate\_name
from SYS\_PROCEDURES table but does not drop or change any declarations
of functions previously listed in create aggregate statement.

The syntax of the 'call' operator is the same for 'plain' and
'aggregate' functions. If an aggregate name is used in the text of
stored procedure before the aggregate is actually created then it is
compiled as plain function call and causes run-time errors. In order to
prevent such confusion, keyword AGGREGATE may be placed right before the
name of aggregate function.

## Examples of User-Defined Aggregates

### Aggregate for Composing URIs

Consider a table USER\_ATTRIBUTES that contains configuration data for
users of some remote web-service. Every user have a number of parameters
that should be passed to that service as a part of URI when HTTP PUT is
used. Every row of USER\_ATTRIBUTES contain a name and a value of some
parameter for some type of users.

    create table USER_ATTRIBUTES    (
        ID      integer not null primary key,
        ATTR_NAME   varchar,
        USER_TYPE   char(4),
        ATTR_VALUE  varchar );
    
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (1, 'key1', 't1', 'val1');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (2, 'key3', 't1', 'val3');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (3, 'key4', 't1', 'val4');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (4, 'key5', 't2', 'val5');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (5, 'key6', 't2', 'val6');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (6, 'key2', 't1', 'val2');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (7, 'key8', 't3', 'val8');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (8, 'key7', 't2', 'val7');
    insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (9, 'key9', 't4', 'val9');

The application contains number of places where the resulting URI for a
user should be calculated. The URI is either an empty string (if no
attributes are set) or a string that starts from '?' char and consists
of tokens like "attribute\_name=attribute\_value" delimited by "&"
character.

    create function ATTR_URI_INIT (inout _env any)
    {
      _env := string_output(); -- The "accumulator" is a string session. Initially it is empty.
    }
    
    create function ATTR_URI_ACC (
      inout _env any,       -- The first parameter is used for passing "accumulator" value.
      in _attrname varchar,     -- Second parameter gets the value passed by first parameter of aggregate call.
      in _attrvalue varchar )   -- Third parameter gets the value passed by second parameter of aggregate call.
    {
      if (_attrname is null)    -- Attributes with NULL names should not affect the result.
        return;
      -- The non-NULL name of attribute is appended to "accumulator"
      http ('&', _env);
      http_url (_attrname, null, _env);
      http ('=', _env);
      if (_attrvalue is null)   -- NULL values of attributes are not printed.
        return;
      -- The non-null value of attribute is appended to "accumulator"
      http_url (_attrvalue, null, _env);
    }
    
    create function ATTR_URI_FINAL (inout _env any) returns varchar
    {
      declare _res varchar;
    -- For empty groups in the resultset,  the initialization may be bypassed
    -- so the value of "accumulator" remains NULL.
    -- Finalization function should always handle such case
    -- by signalling an error (like built-in AVG function) or
    -- by returning some default value (like this function)
      if (_env is null)
        return '';
      _res := string_output_string (_env);
      if (_res = '')
        return '';
    -- In nonempty lists of URI attributes, the first '&' should be replace with '?'
      aset (_res, 0, 63);
      return _res;
    }
    
    create aggregate ATTR_URI (in _key varchar, in _val varchar) returns varchar
      from ATTR_URI_INIT, ATTR_URI_ACC, ATTR_URI_FINAL;

Now we are ready to run some tests. Let's try the typical case:

    select ATTR_URI (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='t1';
    URI
    VARCHAR
    _______________________________________________________________________________
    ?key1=val1&key2=val2&key3=val3&key4=val4
    1 Rows. -- 0 msec.

Now let's try the case of empty set of rows to aggregate:

    select ATTR_URI (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='nosuchtype';
    URI
    VARCHAR
    _______________________________________________________________________________
    
    1 Rows. -- 0 msec.

OK, we've got an empty string. Now let's try the final case:

``` 

select ATTR_URI (ATTR_NAME, NULL) as URI from USER_ATTRIBUTES;
URI
VARCHAR
_______________________________________________________________________________
?key1=&key2=&key3=&key4=&key5=&key6=&key7=&key8=&key9=
1 Rows. -- 0 msec.
```

The created aggregate is very fast but unusable if intermediate results
should be saved in a temporary table. It may happen if the SQL statement
contains clauses such as DISTINCT, ORDER BY, GROUP BY, especially if the
grouping columns are not the first columns of the primary key, or if SQL
optimizer thinks that it is the fastest way to calculate a join. The
following version produces the same results and may work with grouping,
but may be a bit slower because concatenation of long strings is slower
than writing to a string session:

    create procedure ATTR_URI2_INIT (inout _env varchar)
    {
      _env := ''; -- The "accumulator" is a string. Initially it is empty.
    }
    
    create procedure ATTR_URI2_ACC (
      inout _env varchar,  in _attrname varchar,  in _attrvalue varchar ){
      if (_attrname is null)-- Attributes with NULL names should not affect the result.
        return;
      if (_attrvalue is null)-- NULL values of attributes are not printed.
        _env := concat (_env, sprintf('&amp;%U', _attrname));
      else -- The non-null value of attribute is appended to "accumulator"
        _env := concat (_env, sprintf('&amp;%U=%U', _attrname, _attrvalue));
    }
    
    create function ATTR_URI2_FINAL (inout _env any) returns varchar
    {
    -- For empty groups in the result set,  the initialization may be bypassed
    -- so the value of "accumulator" remains NULL.
    -- Finalization function should always handle such case
    -- by signaling an error (like built-in AVG function) or
    -- by returning some default value (like this function)
      if (_env is null)
        return '';
      if (_env = '')
        return '';
    -- In nonempty lists of URI attributes, the first '&amp;' should be replace with '?'
      aset (_env, 0, 63);
      return _env;
    }
    
    create aggregate ATTR_URI2 (in _key varchar, in _val varchar) returns varchar
      from ATTR_URI2_INIT, ATTR_URI2_ACC, ATTR_URI2_FINAL;
    
    select ATTR_URI2 (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='t1'
    URI
    VARCHAR
    _______________________________________________________________________________
    ?key1=val1&key3=val3&key4=val4&key2=val2
    1 Rows. -- 0 msec.
    
    select USER_TYPE, ATTR_URI2 (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES group by USER_TYPE
    USER_TYPE  URI
    VARCHAR  VARCHAR
    _______________________________________________________________________________
    t2       ?key5=val5&key6=val6&key7=val7
    t1       ?key1=val1&key3=val3&key4=val4&key2=val2
    t4       ?key9=val9
    t3       ?key8=val8
    4 Rows. -- 0 msec.

### Aggregate for Composing XMLs

Virtuoso offers variety of ways to place relational data into XML
documents, and two best of them are select statements with FOR XML
clause and XML views. But in some rare cases you may prefer to compose
XML as an output of plain select statement, e.g. to get a few percent
faster code.

Among other things, the CREATE XML VIEW statement creates set of
Virtuoso/PL functions that return various XML trees. Those functions use
special 'node building' vectors to store intermediate results. NODEBLD
(which stands for 'Node Building vector') stores a partially built XML
tree. A xte\_nodebld() function returns a new empty NODEBLD that may be
converted into an element of XML tree in the future. xte\_nodebld\_acc()
appends new children to an existing NODEBLD. xte\_node\_from\_nodebld()
converts NODEBLD into ready-to-use XML tree. xte\_nodebld\_final() may
work either as xte\_node\_from\_nodebld() or as a finalization function
of user defined aggregate.

    create aggregate XTE_NODEBLD (in _child any) returns any
      from xte_nodebld_init, xte_nodebld_acc, xte_nodebld_final;

The use of this aggregate is not as easy as creating XML views, but it
avoids creating persistent objects:

    select
      xml_tree_doc (
        xte_node_from_nodebld (
          xte_head ('UserAttributes'),
          XTE_NODEBLD (
        xte_node (xte_head ('Row', 'Id', ID, 'UserType', USER_TYPE),
          xte_node (xte_head ('Attr', 'Name', ATTR_NAME),
            ATTR_VALUE ) )
          ) ) )
      from USER_ATTRIBUTES;
    callret
    VARCHAR
    _______________________________________________________________________________
    <UserAttributes>
    <Row
    xml:id="1" UserType="t1"><Attr Name="key1">val1</Attr></Row>
    <Row
    xml:id="2" UserType="t1"><Attr Name="key2">val2</Attr></Row>
    <Row
    xml:id="3" UserType="t1"><Attr Name="key3">val3</Attr></Row>
    <Row
    xml:id="4" UserType="t1"><Attr Name="key4">val4</Attr></Row>
    <Row
    xml:id="5" UserType="t2"><Attr Name="key5">val5</Attr></Row>
    <Row
    xml:id="6" UserType="t2"><Attr Name="key6">val6</Attr></Row>
    <Row
    xml:id="7" UserType="t2"><Attr Name="key7">val7</Attr></Row>
    <Row
    xml:id="8" UserType="t3"><Attr Name="key8">val8</Attr></Row>
    <Row
    xml:id="9" UserType="t4"><Attr Name="key9">val9</Attr></Row>
    </UserAttributes>
    1 Rows. -- 0 msec.

The function xml\_tree\_doc() is used because there is no standard way
to print an XML tree without making a complete XML entity whose
underlying XML document consists of the given XML tree.

    select
      xml_tree_doc (
        xte_node_from_nodebld (
          xte_head ('AttrStatistics'),
          XTE_NODEBLD (
        xte_node (xte_head ('Row', 'UserType', groups.type, 'AttrCount', groups.cnt))
      ) ) )
      from
        (select USER_TYPE as type, COUNT (*) as cnt from USER_ATTRIBUTES group by USER_TYPE) groups;
    callret
    VARCHAR
    _______________________________________________________________________________
    <AttrStatistics>
    <Row UserType="t2" AttrCount="3" />
    <Row UserType="t1" AttrCount="4" />
    <Row UserType="t4" AttrCount="1" />
    <Row UserType="t3" AttrCount="1" />
    </AttrStatistics>
    1 Rows. -- 0 msec.

# Virtuoso SQL Optimization

Virtuoso provides a cost based SQL optimizer which performs the
following types of query transformation:

Join Order

Loop Invariants

Opening derived tables

Migrating enclosing predicates into derived tables or unions

Dropping unreferenced columns or results

Detection of identically false predicates

Index selection

Grouping of co-located remote tables into single remote statements

Selection of join algorithm

Virtuoso evaluates various permutations of joined tables against its
cost model and determines the best fit, from which it generates a query
graph. This query graph can be returned as a result set by the
[`explain()`](#fn_explain) SQL function. The cost model is based on
table row counts, defined indices and uniqueness constraints, and column
cardinalities, i.e. counts of distinct values in columns. Additionally,
histograms can be made for value distribution of individual columns.

Virtuoso automatically maintains statistics about tables in the local
database. When tables are attached from known types of remote DBMS's,
Virtuoso also attempts to retrieve statistics information if available.
The sys\_stat\_analyze or sys\_db\_stat stored procedures can be used to
force an update of statistics, also recompiling all SQL statements or
procedures depending on these statistics. Once this is done, this
overrides the automatic statistics. The values of automatic statistics
can be seen in the SYS\_COL\_AUTO\_STAT table.

The stored procedure:

[` DB.DBA.SYS_STAT_ANALYZE
(in full_table_name

varchar, in prec

integer, 
)
 `](#fn_sys_stat_analyze)

constructs the basic table statistics and feeds it into the
DB.DBA.SYS\_COL\_STAT system table. The
[DB.DBA.SYS\_DB\_STAT](#fn_sys_db_stat) stored procedure performs this
operation on the entire database.

The stored procedure:

[` DB.DBA.SYS_STAT_HISTOGRAM
(in full_table_name

varchar, in full_column_name

varchar, in n_buckets

integer, in prec

integer, 
)
 `](#fn_sys_stat_histogram)

constructs table column histogram and feeds it into the
DB.DBA.SYS\_COL\_HIST system table. The default value of prec, in both
cases, is 5, which implies that a five percent sample of the table will
be used. A percentage of 0 means that the whole table will be read.

The following script is intended for use with the ISQL program as the
user dba, in the DB qualifier. The foreach statement is a special
feature of the ISQL utility.

    create table "DB"."DBA"."DTTEST" ("ID" integer primary key);
    foreach integer between 1 10 insert into "DB"."DBA"."DTTEST" ("ID") values (?);
    sys_stat_analyze ('DB.DBA.DTTEST');
    select * from DB.DBA.SYS_COL_STAT;
    sys_stat_histogram ('DB.DBA.DTTEST', 'ID', 2);
    select * from DB.DBA.SYS_COL_HIST;

That yields:

    Resultset 1 (from DB.DBA.SYS_COL_STAT)
    ----------------------------------------
    CS_TABLE         CS_COL           CS_N_DISTINCT CS_MIN  CS_MAX  CS_N_VALUES CS_N_ROWS
    VARCHAR NOT NULL VARCHAR NOT NULL INTEGER       VARCHAR VARCHAR INTEGER     INTEGER
    _______________________________________________________________________________
    
    DB.DBA.DTTEST    ID               10            1       10      10          10
    
    Resultset 2 (from DB.DBA.SYS_COL_HIST)
    ---------------------------------------
    CH_TABLE          CH_COL            CH_NTH_SAMPLE     CH_VALUE
    VARCHAR NOT NULL  VARCHAR NOT NULL  INTEGER NOT NULL  VARCHAR
    _______________________________________________________________________________
    
    DB.DBA.DTTEST     id                0                 1
    DB.DBA.DTTEST     id                5                 6
    DB.DBA.DTTEST     id                10                0

## Optimization Techniques

### Join Order

The SQL compiler constructs permutations of tables in the FROM clause of
a query. The qualified inner join (x inner join y on p syntax) does not
dictate a join order but the outer join syntax does. Otherwise join
order is subject to change by the compiler's decision. This can be
disabled with the OPTION (ORDER) global query option, see sections
below.

The first order tried by the optimizer is the initial left to right
order of the FROM clause. The compiler remembers its best result so far
attained in trying various compilations, so it will not explore branches
of the table permutation tree which, while incomplete, exceed the cost
of the best complete result so far. Thus a good guess of initial table
order by the programmer may save compilation time.

### Loop Invariants

The compiler will evaluate all expressions and predicates as early as
possible.

Consider the query:

    select count (*) from item where i_price > (select avg (i_price) from item);

The compiler will detect that the sub query is data-independent from the
main from and thus will compute the average price before starting the
select for the count. Thus the above query executes in time linear to
the item table count instead of quadratic time, as it would without the
removal of the invariant.

### Opening Derived Tables & Views

Views are initially opened into equivalent derived tables. If a derived
table in a FROM clause is sufficiently simple, i.e. has no distinct,
top, group by, and is not a multiple query expression such as a union,
it can be in-lined.

    create view i as select * from item;
    
    select i_id from i;

becomes

    select i_id from (select * from item) xx;

which becomes

    select i_id from item;

In joins involving views representing joins, the in-lining of a derived
table will add degrees of freedom to join order selection, since the
tables joined in the view will not have to be laid out contiguously.

### Migrating Enclosing Predicates

When there is a derived table or view expansion which cannot be
in-lined, i.e. it has a group by or is a union or such, predicates of
the enclosing WHERE phrase are migrated into the derived table itself.
The set of predicates that may be thus migrated will be a function of
the join order, thus different combinations will be tried.

    select i_id from (select * from item1 union all select * from item2) f where i_id = 11;

becomes

    select i_id from (select i_id from item1
      where i_id = 11 union all select i_id from item2 where i_id = 11) f;

### Dropping Unreferenced Columns or Results

It may happen as a result of view expansion that columns get introduced
into derived table selection which are nowhere referenced in the actual
query. The compiler will detect this and will not compile code accessing
these. (see above for example)

### Detection of Identically False Predicates

It is possible that view expansions introduce predicates that are never
simultaneously true with predicates of the enclosing query. This is
recognized and can result in an empty query being produced or in union
terms being dropped.

The rules for combining predicates are as follows:

    - a < b and a < c -> a < min (a, b)

And similarly for \<=, \>, and \>=.

    a in (constant1) and a in (constant2)

becomes identically false if the intersection of the constant lists is
empty.

    - a = b and a = c

becomes identically false if b and c are different constants.

This can lead to transformations such as

    select * from (select * from item where i_type = 2 union all
      select * from item where i_type = 3) xx where i_type = 2;

becomes

    select * from (select * from item where i_type = 2 ) xx where i_type = 2;

### Index Selection

Once a join order is hypothesized, the compiler picks various indices to
use for accessing tables. The predicates applicable to the table in the
specific join order being considered, as well as a possible ORDER BY
clause affect the index choice. If there is an ORDER BY and there is an
index which can be used to directly satisfy this, the compiler tries
this index as well as the index which seems best in the light of the
available predicates. Thus having an applicable ORDER BY does not always
imply index selection. If there is a restrictive index for row selection
and an order by which could be done by following an index for which
there are no predicates, the restrictive index plus sorting will be
preferred.

The general rules for index selection based on predicates are:

Primary key is preferred if 2 equally good choices exist.

Equality conditions are preferred over all others.

Uniqueness of an index is a plus.

### Grouping Co-Located Tables

In queries involving distributed data the principal cost factor is often
the RPC latency between the participating databases. In a local area
network environment with no other load we estimate one RPC to be about 5
times longer than the selection of a single row on primary key from a
table of 1 million, not counting disk I/O. In wide area contexts and
with effective load the difference is still more marked. Thus when
considering a loop join between a local and a remote table, it becomes
obvious that the remote table should be the outer loop, unless there are
extremely restrictive criteria on the local table. The cost model takes
such considerations into account.

The best case of remote statement compilation is when the statement can
be passed through as is to the remote. This is first checked for the
whole query and subsequently for each sub query or derived table. The
pass-through is not possible if:

The expression involves tables from multiple remotes or local and remote
ones.

The expression involves predicates or functions or SQL constructs which
do not exist on the remote.

Even if a derived table or sub query can be passed through the normal
SQL optimization applies, thus Virtuoso will import predicates and
suggest a join order for these cases, so that the query gets rewritten
with the suggested join order left to right in the text.

If one join has multiple tables from the same remote but also other
tables, the optimizer will attempt to group the co-located tables
together.

    select * from r1 join t1 on r1.k = t1.k join r2 on r1.k = r2.k;

will preferentially be compiled as

    select * from (select r1.k as r1_k, ... from r1, r2
      where r1.k = r2.k) xx, t1 where r1_k = t1.k;

Note that above the join order is meant left to right and that the
derived table of r1, r2 is passed through as a unit. This becomes the
leading loop in the join because fewer RPC's are likely to be needed
then due to row prefetch. As for placing function calls, the general
rule is to place them where the arguments are, thus passed through to
the remote if they are defined there. On the other hand, if these are
invariant they are always computed locally. The explain function can be
used to see the details of the compilation. If a function is described
as being defined on the particular remote database, this information is
taken into account when compiling.

### Join Type Selection

Starting with Virtuoso 3.0, hash joins are used where appropriate. A
hash join is about three to four times faster for a local table than
with a loop join using an exact match of primary key, thus the gain is
substantial.

A hash join works by scanning the shorter of two joined tables and
making a hash table from the join columns. This is only possible for
joins involving equality, but most joins tend to have equalities in
practice.

> **Note**
> 
> A hash join does not need indices to be defined and the hash table
> constructed for one hash join may be reused by another if the table is
> not modified in-between.

A hash join will be preferred if there is a sufficient number of
estimated accesses to the joined table in the query. If a table is
expected to be accessed only once, there is less point in making the
temporary hash table.

The hash join temporary structures are disk based and reside in the
temporary side of the database. They do not survive a database restart
but will be ad hoc reused if such are left over from earlier queries and
there is no change in the base table between the construction of the
hash and its reuse.

A hash join may be specially beneficial if a remote table is on the
inner loop of a loop join. The n random accesses can then be replaced
with a single sequential scan of the remote table.

The selected join type can be seen in the explain output. The WITH
keyword can be used to explicitly specify a join type for a table, see
query options below.

## Query Options

These are effective from Virtuoso 3.0 onwards.

    <sql_option>:
        TABLE OPTION (<table option>,...)
    
    <table option>:
        HASH | LOOP | INDEX index_name | INDEX PRIMARY KEY | INDEX TEXT KEY
    
    <option clause>:
        OPTION (<query_option>,...)
    
    <query_option>:
        ORDER

The TABLE OPTION clause can follow a table's correlation name in a FROM
clause. The OPTION clause can appear at the end of the query, after all
ORDER BY and FOR specifications.

The INDEX table option is used to control which index is chosen by the
optimized SQL compiler for a given table (when you want to override the
one chosen automatically).

INDEX index\_name - selects a named table index (unprefixed - same name
as in create index).

INDEX PRIMARY KEY - selects the primary key

INDEX TEXT KEY - selects the free-text index as a driving one if there's
a free-text condition over that table in the statement.

    select count (*) from t1 a, t1 b table option  (hash) where .row_no = b.row_no option(order)

This forces the a, b join order and specifies that the join will be a
hash join.

Sometimes statements of the form

    select col from t1 where t1.key in (select key from t2)

get optimized into a loop over t2 and a nested lookup on t1, as in

    select .... from (select distinct key from t2) f, t1 where t1.key = f.key.

This optimization is mostly done when there is an index on t1.key and
the IN subquery selects fewer rows than the other conditions on t1 would
select.

In some cases the developer may wish to explicitly force this
optimization to be made or not to be made. This is done with the LOOP
EXISTS query option, as follows:

    select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2) option (loop exists)

will force the IN subquery to become a joined derived table.

    select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2) option (do not loop exists)

    select row_no from t1 where row_no in (select row_no from t1 where fi2 = 2 option (do not loop exists))

will prevent this optimization. Note that the option (do not loop
exists) can be either in the subquery or in the enclosing query.

The same logic applies to IN predicates in searched update or delete
statements.

## Query Optimization Diagnostics

Queries involving a large number of possible plans may run out of memory
during optimization. There are a number of settings that influence query
optimization memory utilization.

These are set in the virtuoso.ini file or can be altered on a running
system with [`__dbf_set`](#fn_dbf_set) function:

| INI section | INI parameter name           | \_\_dbf\_set function name             | \_\_dbf\_set function description                                                                                                                                                                                                |
| ----------- | ---------------------------- | -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Parameters  | MaxMemPoolSize               | *sqlo\_max\_mp\_size*                  | Controlls the size limit in bytes for transient memory consumption. Increasing this may help. The given value should be over 10M, increasing this over 100M is seldom useful but can be tried.                                   |
| Parameters  | MaxOptimizeLayouts           | *sqlo\_max\_layouts*                   | Decreasing will reduce the number of plans tried, hence save memory. Reasonable values are 0 for no limit or somewhere in excess of 500 for a limit.                                                                             |
| Parameters  | StopCompilerWhenXOverRunTime | *sqlo\_compiler\_exceeds\_run\_factor* | Setting to 1 will stop optimization once the best plan is expected to take less time and the amount of time spent optimizing so far.                                                                                             |
| Flag        | enable\_joins\_only          | *enable\_joins\_only*                  | When set, will cause the optimizer to only consider next plan candidates that are connected by a join to the existing partial plan. In other words, no cartesian products will be considered. This may save some space and time. |

When reporting issues with query optimization it will be useful to
include statistics from the database in order to facilitate reproducing
the effect. The function [`stat_export()`](#fn_stat_export) produces a
statistics summary that can be read back into another database with the
[`stat_import()`](#fn_stat_import) function.

To export statistics:

    string_to_file('stat.dv', serialize(stat_export()), -2);

To load exported statistics into a database:

    stat_import (deserialize (file_to_string ('stat.dv')));

When exporting statistics as part of bug reporting, make sure to first
run the queries exhibiting the problem then only export the stats. The
queries drive statistics gathering.

## ANY ORDER

When applied to a select with no aggregation or order by, this causes
the select to produce results in an order that may vary between
consecutive executions and may not correspond to the order of any index.
In a cluster situation, running a query in this manner may be up to
several times more efficient. This is not the default since SQL and
SPARQL require that two consecutive executions of a query return the
same results in the same order even if no order by is specified. Selects
that contain aggregation or order by evaluate the part which generates
input to the aggregation or order in this manner automatically. This
option affects the select at the end of which it occurs and all selects
inside it.

example:

    select a.row_no from t1 a, t1 b wherea.row_no = 1 + b.row_no option (any order);

## VDB Statistics for the SQL Compiler Collection

In order to correctly estimate the cost of the VDB operations overhead
the optimized SQL compiler should have information for the time it takes
to make a "round trip" - send message and receive response from a given
remote database.

Virtuoso will automatically collect such information when you first
attach a table from the remote data source. The information will be
cached in the `DS_CONN_STR` field of the `SYS_DATA_SOURCE` system table.

Sometimes it may be desirable to update that values manually, for
example when you change the network connection etc. Virtuoso provides,
for the purpose, the stored procedure:

[`vd_statistics (in _dsn

varchar := '%',in vd_table_mask

varchar := '%')`](#fn_vd_statistics)

The `_dsn` parameter is a LIKE-mask for the name of the DSN as stored in
DS\_DSN column of SYS\_DATA\_SOURCE system table. Its default value is
'%' having the effect to update the "round trip" times for all the
remote data sources.

The `vd_table_mask` parameter is a LIKE mask for the name of the table ,
as stored in RT\_NAME column of SYS\_DATA\_SOURCE system table. Its
default value of '%' means update all tables.

The current round trip time can be recalculated using the function:

[`vdd_measure_rpc_time (in _dsn

varchar)`](#fn_vdd_measure_rpc_time)

This will return the estimated round-trip time in milliseconds. Calling
this function will not alter the cached statistics for the datasource.

Before collecting statistics data by querying the (potentially very
large) remote tables the Virtuoso VDB will try to collect the statistics
in various less resource extensive ways.

Generally speaking some of the statistics the SQL compiler needs in
order to do cost based optimization are available through one of the
following channels (in order of preference):

by querying the remote DBMS statistics system tables: This will provide
a varying amount of information depending on the remote and the mapping
function.

through SQLStatistics() ODBC call CARDINALITY column : A platform/remote
independent way. This will provide information for the row count only.

by querying the remote table to collect various aggregate functions
values (like COUNT (\*), AVG() etc) : most complete, but may be very
slow for large remote tables.

Unfortunately the first method is DBMS dependent. Therefore some extra
setup is to be done before this can return meaningful data. This is
supported off the shelf for Oracle and Virtuoso.

The [`SYS_STAT_ANALYZE()`](#fn_sys_stat_analyze) Virtuoso function will
do a lookup of the remote DBMS name and version (as returned by
SQL\_DBMS\_NAME and SQL\_DBMS\_VER SQLGetInfo () ODBC call) in the
system table DB.DBA.SYS\_STAT\_VDB\_MAPPERS to find a Virtuoso/PL stored
procedure to call for that DBMS to retrieve the statistics data from the
remote DBMS'es system tables in DBMS dependent way.

The DB.DBA.SYS\_STAT\_VDB\_MAPPERS has the following layout:

    create table SYS_STAT_VDB_MAPPERS (
       SVDM_TYPE varchar,
       SVDM_PROC varchar not null,
       SVDM_DBMS_NAME_MASK varchar not null,
       SVDM_DBMS_VER_MASK varchar not null,
       primary key (SVDM_TYPE, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK))

SVDM\_TYPE is the type of the statistics returned by the procedure.
Currently only 'SYS\_COL\_STAT' is supported.

SVDM\_PROC is the Fully-qualified-name of the Virtuoso/PL stored
procedure to be called.

SVDM\_DBMS\_NAME\_MASK is the LIKE kind of mask used to check the
SQL\_DBMS\_NAME SQLGetInfo() returned string (in uppercase).

SQL\_DBMS\_VER\_MASK is the LIKE kind of mask use to check the
SQL\_DBMS\_VER SQLGetInfo() returned string (in uppercase)

The [`SYS_STAT_ANALYZE()`](#fn_sys_stat_analyze) will use the first
matching row in the order of the primary key.

The procedure that collects the remote DBMS statistics (usually by doing
rexecute() against the remote) has the following signature:

    create procedure DB.DBA.__VIRTUOSO_SYS_COL_STAT (
        in DSN varchar,
        in RT_NAME varchar,
        in RT_REMOTE_NAME varchar
    )

Here:

DSN is the Virtuoso dsn name.

RT\_NAME is the local Virtuoso table name of the attached table (as in
the RT\_NAME of SYS\_REMOTE\_TABLE system table).

RT\_REMOTE\_NAME is the name of the attached table in the remote DBMS
(as in RT\_REMOTE\_NAME of SYS\_REMOTE\_TABLE system table).

The procedure may return a resultset that will be written into the
SYS\_COL\_STAT system table. The resultset has to have a row for each
attached table column and the following layout:

CS\_COL - this is the column name

CS\_N\_DISTINCT - the number of distinct non-null values in that column

CS\_MIN - minimum value

CS\_MAX - maximum value

CS\_AVG\_LEN - average data length

CS\_N\_VALUES - number of non-null values

CS\_N\_ROWS - total number of rows

Virtuoso predefines two such procedures - one for another virtuoso as a
remote and the second for an Oracle DBMS. Other DBMSes can be freely
added.

    create procedure DB.DBA.__ORACLE_SYS_COL_STAT (in DSN varchar, in RT_NAME
    varchar, in RT_REMOTE_NAME varchar)
    returns ANY
    {
      declare _meta, _res any;
    
      rexecute (DSN,
        'select c.COLUMN_NAME, c.NUM_DISTINCT, NULL, NULL, c.AVG_COL_LEN, t.NUM_ROWS - c.NUM_NULLS, t.NUM_ROWS ' ||
        ' from ALL_TABLES t, ALL_TAB_COLUMNS c where t.TABLE_NAME = c.TABLE_NAME and t.OWNER = c.OWNER and ' ||
        '  t.OWNER = ? and t.TABLE_NAME = ?',
        NULL, NULL, vector (name_part (RT_REMOTE_NAME, 1, NULL), name_part(RT_REMOTE_NAME, 2, NULL)), NULL, _meta, _res);
    
      if (isarray (_res) and length (_res) > 0 and isarray (_res[0]) and isarray(_meta) and isarray (_meta[0]))
        {
          declare _inx, _len integer;
          _inx := 0;
          _len := length (_res);
          exec_result_names (_meta[0]);
          while (_inx < _len)
            {
              exec_result (_res[_inx]);
              _inx := _inx + 1;
            }
        }
      return NULL;
    };

    create procedure DB.DBA.__VIRTUOSO_SYS_COL_STAT (in DSN varchar, in RT_NAME
    varchar, in RT_REMOTE_NAME varchar)
    returns ANY
    {
      declare _meta, _res any;
    
      rexecute (DSN,
        'select CS_COL, CS_N_DISTINCT, encode_base64 (serialize (CS_MIN)), encode_base64 (serialize (CS_MAX)), ' ||
        ' CS_AVG_LEN, CS_N_VALUES, CS_N_ROWS from ALL_COL_STAT where CS_TABLE = complete_table_name (?, 1)',
        NULL, NULL, vector (RT_REMOTE_NAME), NULL, _meta, _res);
    
      if (isarray (_res) and length (_res) > 0 and isarray (_res[0]) and isarray(_meta) and isarray (_meta[0]))
        {
          declare _inx, _len integer;
          _inx := 0;
          _len := length (_res);
          exec_result_names (_meta[0]);
          while (_inx < _len)
            {
              declare _res_row any;
              _res_row := _res[_inx];
              _res_row[2] := deserialize (decode_base64 (_res_row[2]));
              _res_row[3] := deserialize (decode_base64 (_res_row[3]));
              exec_result (_res_row);
              _inx := _inx + 1;
            }
        }
      return NULL;
    };

And here are the respective registration INSERT statements for the above
procedures:

    insert soft SYS_STAT_VDB_MAPPERS (SVDM_TYPE, SVDM_PROC, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK)
     values ('SYS_COL_STAT', 'DB.DBA.__ORACLE_SYS_COL_STAT', '%ORACLE%', '%');
    
    insert soft SYS_STAT_VDB_MAPPERS (SVDM_TYPE, SVDM_PROC, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK)
     values ('SYS_COL_STAT', 'DB.DBA.__VIRTUOSO_SYS_COL_STAT', '%VIRTUOSO%', '%');

In order to facilitate the access to statistics in Virtuoso the
following four views are created with SELECT granted to PUBLIC:

ALL\_COL\_STAT - subset of SYS\_COL\_STAT (same row layout) but only
returning data for the tables the user has access to.

USER\_COL\_STAT - subset of SYS\_COL\_STAT (same row layout) but returns
rows only for the user-owned tables

ALL\_COL\_HIST - subset of SYS\_COL\_HIST (same row layout) but only
returning data for the tables the user has access to.

USER\_COL\_HIST - subset of SYS\_COL\_HIST (same row layout) but returns
rows only for the user-owned tables

# SQL Inverse Functions

Many virtual database application scenarios require performing various
conversions on data in legacy tables. An example of this is currency
conversions, conversions between British and metric units, replacing
complex composite keys with single numeric row id's and so forth.

SQL views are the normal way of implementing such conversions. However,
when making queries with selection criteria referencing the results of
these conversions we often need to first convert and then test, possibly
having to bring data from the source system to the virtual database.
Further, we will not be able to use indices that may exist on the legacy
system if we first have to convert and only then test the value of a
column.

Virtuoso introduces an SQL extension for dealing with these issues.
Virtuoso allows the definition of two SQL functions that are inverses of
each other, for example `dollar_to_euro` and `euro_to_dollar` would be
examples of inverse functions.

Thus, when we define a view like:

    create view euro_item as Select I_id, dollar_to_euro (I_price) as I_price, I_name from item;

We can further declare:

    db..sinv_create_inverse ('euro_to_dollar', 'dollar_to_euro', 1);

and perform the query:

    select * from euro_item where I_price > 100;

Normally, this would internally perform the query:

    select * from item where dollar_to_euro (I_price) > 100;

Now however it will make use of the inverse function information and we
get:

    select * from item where I_price > euro_to_dollar (100)

The second form is substantially more efficient since only one function
call needs to be done for the whole query, not to mention the fact that
if the currency conversion function were only defined on the vdb and the
item table were linked from another server, all data would have to be
brought over to the vdb for the conversion.

Now if the conversion function were defined only on the vdb, the amount
of euros would be converted to dollars and then passed as a parameter to

    Select * from item where I_price > ?

Many simple conversions can be efficiently handled by this method. For
most unit and data type conversions, the conversion preserves collation
order. Amount a will be greater than amount b whether a and b be
expressed in euros or dollars, as long as both a and b are in the same
currency. Some other conversions such as compression, encryption, hashes
and mappings of arbitrary unique ids to another set of ids do not
preserve collation. Whether a particular mapping preserves collation is
indicated by the third argument of
[`sinv_create_inverse`](#fn_sinv_create_inverse) . In the above example
we see a value of 1, meaning that collation is preserved. Zero specifies
that collation is not preserved.

Sometimes it will be desirable to map multi-part keys into a single key
for convenience of querying or for compatibility with another database
schema.

We will use the orders and customer tables from the TPC C benchmark
schema to illustrate the feature. Both tables have a primary key
consisting of three parts, a warehouse id, a district id and then a
customer or order id. The order references the customer with a foreign
key consisting of its own warehouse and district id and of a customer
id.

Now we may wish to simplify the situation and make a one-column order id
and a one column foreign key reference to customer for presenting the
system to an outside reporting application. We will do this completely
without touching the original database, all logic taking place on the
virtual database.

In this case, the original keys consist of three numbers: n digits of
warehouse id, 2 digits of district id and 9 digits of order or customer
id. We can simply concatenate these numbers into a single decimal. To do
this, we define the following functions:

    create function num_truncate (in n numeric)
    {
      return cast (cast (n as numeric) - 0.5 as numeric (40, 0));
    }
    
    create function num_mod (in x numeric, in y numeric)
    {
      return (x - num_truncate (cast (x as numeric) / y) * y);
    }
    
    /* This function takes the three key parts and returns a numeric where each occupies a fixed range of digits. */
    
    create function o_iid (in w_id int, in d_id int, in o_id int) returns numeric
    {
      return (w_id * 100000000000 + d_id * 1000000000 + o_id);
    }
    
    /* The below three functions retrieve each of the fields encoded in the numeric produced by o_iid */
    
    create function o_iid_w_id (in iid numeric) returns int
    {
      return cast (num_truncate (iid / 100000000000) as int);
    }
    
    create function o_iid_d_id (in iid numeric) returns int
    {
      return cast (num_mod (num_truncate (iid / 1000000000), 100) as int);
    }
    
    create function o_iid_o_id (in iid numeric)
    {
      return cast (num_mod (iid, 1000000000) as int);
    }
    
    db..sinv_create_inverse ('O_IID', VECTOR ('O_IID_W_ID', 'O_IID_D_ID', 'O_IID_O_ID'), 0);

The [`sinv_create_inverse`](#fn_sinv_create_inverse) now defines an
accessory for each of the arguments of o\_iid. The first function in the
vector retrieves the first argument of a call to o\_iid, the second the
second and so forth. Since we are talking about mapping a set of values
into one value it does not make sense to speak of preserving a
collation, thus the last argument is 0. When making this declaration we
also assert that for each distinct combination of arguments of o\_iid,
we get a distinct value from which all the original arguments can be
retrieved using the functions mentioned.

Now we define the same functions for constructing a synthetic one-part
customer id. The functions are exactly the same as for the order id.

    create function c_iid (in w_id int, in d_id int, in c_id int) returns numeric
    {
      return (w_id * 100000000000 + d_id * 1000000000 + c_id);
    }
    
    create function c_iid_w_id (in iid numeric) returns int
    {
      return cast (num_truncate (iid / 100000000000) as int);
    }
    
    create function c_iid_d_id (in iid numeric) returns int
    {
      return cast (num_mod (num_truncate (iid / 1000000000), 100) as int);
    }
    
    create function c_iid_c_id (in iid numeric)
    {
      return cast (num_mod (iid, 1000000000) as int);
    }
    
    db..sinv_create_inverse ('C_IID', VECTOR ('C_IID_W_ID', 'C_IID_D_ID', 'C_IID_C_ID'), 0);

Now we have defined functions for producing the synthetic keys we wish
to use. Now we bind these functions to the original database using
views. We assume that the original orders and customer tables are
attached from a remote database under the names orders and customer.

    create view  orders_2 as select o_iid (o_w_id, o_d_id, o_id) as o_iid numeric, c_iid (o_w_id, o_d_id, o_c_id) as o_c_iid numeric, * from orders;
    
    create view customer_2 as select c_iid (c_w_id, c_d_id, c_id) as c_iid numeric, * from customer;

As a simple test, let us get the synthetic o\_c\_iid from an order using
the synthetic o\_iid key.

    SQL> select o_c_iid from orders_2 where o_iid = 102000000002;
    
    returns________
    
    102000000935

The order \#2 in district \#2 of warehouse \#1 refers to customer \#935
or district \#2 of warehouse \#1.

    SQL> explain ('select o_c_iid from orders_2 where o_iid = 102000000002');
    
    returns
    
    {
    
    Precode:
          0: $25 "callret" := Call O_IID_O_ID (<constant (102000000002)>)
          7: $26 "callret" := Call O_IID_D_ID (<constant (102000000002)>)
          14: $27 "callret" := Call O_IID_W_ID (<constant (102000000002)>)
          21: BReturn 0
    Remote  SELECT "t2"."O_C_ID", "t2"."O_D_ID", "t2"."O_W_ID" FROM "DBA"."ORDERS" "t2"  where "t2"."O_ID" = ? and "t2"."O_D_ID" = ? and "t2"."O_W_ID" = ?
    Params ($25 "callret", $26 "callret", $27 "callret")
    Output ($29 "t1.O_C_ID", $30 "t1.O_D_ID", $31 "t1.O_W_ID")
    
    After code:
          0: $40 "O_C_IID" := Call C_IID ($31 "t1.O_W_ID", $30 "t1.O_D_ID", $29 "t1.O_C_ID")
          7: BReturn 0
    Select ($40 "O_C_IID")
    }

In this query execution plan we see that the virtual database first
decomposes the synthetic o\_iid into its component parts, passes these
to a query run on the remote database, retrieves the components of the
synthetic o\_c\_iid and finally assembles this and returns it to the
client.

We may also use this mapping in more complex queries:

    select count (*) from orders_2, customer_2 where o_c_iid = c_iid;

This uses the synthetic foreign and primary keys for joining. Normally,
since the functions for making these keys are only defined on the vdb
side, each order would have to be retrieved and then the corresponding
customer fetched. Now however we can take advantage of the inverse
declaration and decompose the comparison of the synthetic keys into
comparisons of each of their arguments:

    SQL> explain ('select count (*) from orders_2, customer_2 where o_c_iid = c_iid');
    
    returns
    
    {
    Remote  SELECT COUNT ( *) FROM "DBA"."ORDERS" "t2" , "DBA"."CUSTOMER" "t4"  where "t4"."C_ID" = "t2"."O_C_ID" and "t4"."C_D_ID" = "t2"."O_D_ID" and "t4"."C_W_ID" = "t2"."O_W_ID"
    Output ($26 "aggregate")
    Select ($26 "aggregate")
    }

We see that the SQL compiler decomposed the comparison of the c\_iid's
into a comparison of the original arguments of the function. This can be
done because we earlier asserted that each distinct argument combination
would produce a unique result of the function.

The examples covered thus far are simple in that there is a clear way of
mapping the data back and forth using SQL functions. This is not always
possible, for example if we wish to generate unique numeric id's from
keys consisting of arbitrary strings.

To this effect, Virtuoso provides a mechanism for automatically
generating mapping functions, which take a combination of n arguments of
an arbitrary searchable data type and generate a unique id for each
distinct combination. The ids are assigned as needed and the mapping is
persisted in an automatically generated table.

We could have generated the o\_iid, o\_iid\_w\_id, o\_iid\_d\_id and
o\_iid\_o\_id functions with the following single call:

    db..sinv_create_key_mapping ('O_IID', vector ('W_ID', 'int', 'D_ID', 'int', 'O_ID', 'int'));

The first argument is the name of the mapping function to generate. The
following vector lists the arguments of this function and their data
types. The name of each argument is appended to the name of the mapping
function, separated by an underscore for forming the inverse functions,
one for each argument. Thus the functions are named exactly as in the
previous example where we defined them manually.

Internally, this generates a table for keeping the w\_id, d\_id and
o\_id for each allocated o\_iid. The o\_iid's come from a sequence
object. The functions manage this table automatically, without requiring
developer intervention. The name of the sequence is the same as that of
the mapping, thus sequence\_set can be used for setting the sequence
counter. Note that sequence names are case sensitive.

When a new combination of w\_id, d\_id, o\_id is seen by o\_iid, it
inserts a row in the mapping table and assigns this a new unique number.
This update of the mapping table is committed at the same time the
enclosing transaction commits. The table is normally read with read
committed isolation and updated with serializable isolation. This
guarantees that when a single w\_id, d\_id, o\_id combination is seen at
the same time on two threads the result will be the same id being given
on both threads.

Any value returned by the mapping function may at all times be used for
the inverse functions. The inverse functions will return NULL if given a
value that was at no time returned by the mapping function.

The table created for the mapping is named MAP\_\<name of the mapping
function\>. The system does not define an automatic cleanup function for
removing established mappings because the efficient way of implementing
this is quite application dependent. Such a function can however be
easily written by the developer if one is needed.

Because comparison of mapping functions is reduced into pair-wise
comparison of their arguments, the query

    select count (*) from orders, customer where o_c_iid = c_iid

Will work even if all orders or customers have not been assigned a
mapping on the vdb side. If a virtual database application wishes to
retrieve rows from a remote database using a synthetic key made by
functions defined with
[`sinv_create_key_mapping`](#fn_sinv_create_key_mapping) , any value
returned by the mapping function in a transaction that was successfully
committed is valid and will retrieve the data intended.

## Updating through Inverses

A view that selects calls to functions, which have inverses, is
updateable. This means that the SQL compiler will use the inverse
function on the value being assigned before assigning the column. This
is done for both insert and update operations. No special declaration is
needed. If the function with inverse has multiple arguments, all of
which are columns, then assigning the function will assign all the
argument columns, having called the appropriate inverse for getting each
of the separate argument values.

For example:

    SQL> insert into orders_2 (o_iid) values (1102000000003);
    
    Done. -- 1 msec.
    SQL> select * from orders_2 where o_w_id = 11;
    O_IID            O_C_IID          O_ID              O_D_ID            O_W_ID            O_C_ID      O_ENTRY_D   O_CARRIER_ID  O_OL_CNT    O_ALL_LOCAL
    DECIMAL          DECIMAL          INTEGER NOT NULL  INTEGER NOT NULL  INTEGER NOT NULL  INTEGER     DATE        INTEGER     INTEGER     INTEGER
    _______________________________________________________________________________
    
    1102000000003    NULL             3                 2                 11                NULL        NULL        NULL        NULL        NULL
    
    1 Rows. -- 1 msec.
    SQL> update item_euro set i_price = 120 where i_id = 1234;

> **Note**
> 
> The examples in this document used tables attached from remote
> databases because the features discussed here are most likely to be
> useful in such contexts. Also the query execution plans clearly show
> which operations take place where. The inverse function mechanism is
> however in no way limited to virtual database applications. All the
> examples will work equally well with local tables.

# SQL Grammar

``` 
    sql_list
        : sql ';'

        | sql_list sql ';'

        ;

    sql
        : schema_element_list
        | view_def
        ;

    schema_element_list
        : schema_element
        | schema_element_list schema_element
        ;

    schema_element
        : base_table_def
        | create_index_def
        | drop_table
        | drop_index
        | add_column
        | table_rename
        | privilege_def
        | privilege_revoke
        | create_user_statement
        | delete_user_statement
        | set_pass
        | set_group_stmt
        ;

    base_table_def
        : CREATE TABLE new_table_name '(' base_table_element_commalist ')'

        ;

    base_table_element_commalist
        : base_table_element
        | base_table_element_commalist ',' base_table_element
        ;

    base_table_element
        : column_def
        | table_constraint_def
        ;

    column_def
        : column data_type column_def_opt_list
        ;

    references
        : REFERENCES q_table_name opt_column_commalist
        ;

    column_def_opt_list
        : /* empty */
        | column_def_opt_list column_def_opt
        ;

    column_def_opt
        : NOT NULLX
        | IDENTITY
        | NOT NULLX PRIMARY KEY opt_index_option_list
        | DEFAULT literal
        | references
        ;

    table_constraint_def
        : UNDER q_table_name
        | PRIMARY KEY '(' index_column_commalist ')' opt_index_option_list
        | FOREIGN KEY '(' column_commalist ')' references
        ;

    column_commalist
        : column
        | column_commalist ',' column
        ;

    index_column_commalist
        : column opt_asc_desc
        | index_column_commalist ',' column opt_asc_desc
        ;

    index_option
        : CLUSTERED
        | UNIQUE
        ;

    index_option_list
        : index_option
        | index_option_list index_option
        ;

    opt_index_option_list
        : /* empty */
        | index_option_list
        ;

    create_index_def
        : CREATE opt_index_option_list INDEX index
            ON new_table_name '(' index_column_commalist ')'

        ;

    drop_index
        : DROP INDEX NAME opt_table
        ;

    opt_table
        : /* empty */
        | q_table_name
        ;

    drop_table
        : DROP TABLE q_table_name
        ;

    add_col_column_def_list
        : column_def
        | add_col_column_def_list ',' column_def
        ;

    add_col_column_list
        : column
        | add_col_column_list ',' column
        ;

    add_column
        : ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
        | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
        | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def
        ;

    table_rename
        : ALTER TABLE q_table_name RENAME new_table_name
        ;

    view_def
        : CREATE VIEW new_table_name opt_column_commalist
            AS query_exp opt_with_check_option
        ;

    opt_with_check_option
        : /* empty */
        | WITH CHECK OPTION
        ;

    opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

        ;

    priv_opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

        ;

    privilege_def
        : GRANT ALL PRIVILEGES TO grantee
        | GRANT privileges ON table TO grantee_commalist opt_with_grant_option
        | GRANT grantee_commalist TO grantee_commalist opt_with_admin_option
        ;

    privilege_revoke
        : REVOKE ALL PRIVILEGES FROM grantee_commalist
        | REVOKE privileges ON table FROM grantee_commalist
        | REVOKE grantee_commalist FROM grantee_commalist
        ;

    opt_with_grant_option
        : /* empty */
        | WITH GRANT OPTION
        ;

    opt_with_admin_option
        : /* empty */
        | WITH ADMIN OPTION
        ;

    privileges
        : ALL PRIVILEGES
        | ALL
        | operation_commalist
        ;

    operation_commalist
        : operation
        | operation_commalist ',' operation
        ;

    operation
        : SELECT priv_opt_column_commalist
        | INSERT
        | DELETE
        | UPDATE priv_opt_column_commalist
        | EXECUTE
        ;

    grantee_commalist
        : grantee
        | grantee_commalist ',' grantee
        ;

    grantee
        : PUBLIC
        | user
        ;

    set_pass
        : SET PASSWORD NAME NAME
        ;

    create_user_statement
        : CREATE USER user
        | CREATE ROLE user
        ;

    delete_user_statement
        : DELETE USER user [CASCADE]
        | DROP ROLE user
        ;

    set_group_stmt
        : SET USER GROUP user user
        ;

    cursor_def
        : DECLARE NAME CURSOR FOR query_spec
        ;

    opt_order_by_clause
        : /* empty */
        | ORDER BY ordering_spec_commalist
        ;

    ordering_spec_commalist
        : ordering_spec
        | ordering_spec_commalist ',' ordering_spec
        ;

    ordering_spec
        : INTNUM opt_asc_desc
        | column_ref opt_asc_desc
        | function_ref opt_asc_desc
        ;

    opt_asc_desc
        : /* empty */
        | ASC
        | DESC
        ;

    sql
        : manipulative_statement
        ;

    manipulative_statement
        : query_exp
        | update_statement_positioned
        | update_statement_searched
        | insert_statement
        | delete_statement_positioned
        | delete_statement_searched
        | call_statement
        | admin_statement
        | use_statement
        ;

    use_statement
        : USE NAME
        ;

    close_statement
        : CLOSE cursor
        ;

    delete_statement_positioned
        : DELETE FROM table WHERE CURRENT OF cursor
        ;

    delete_statement_searched
        : DELETE FROM table opt_where_clause
        ;

    fetch_statement
        : FETCH cursor INTO target_commalist
        ;

    insert_mode
        : INTO
        | REPLACING
        | SOFT

    insert_statement
        : INSERT insert_mode table priv_opt_column_commalist values_or_query_spec
        ;

    values_or_query_spec
        : VALUES '(' insert_atom_commalist ')'
        | query_spec
        ;

    insert_atom_commalist
        : insert_atom
        | insert_atom_commalist ',' insert_atom
        ;

    insert_atom
        : scalar_exp
        ;

    cursor_option
        : EXCLUSIVE
        | PREFETCH INTNUM
        ;

    cursor_options_commalist
        : cursor_option
        | cursor_options_commalist ',' cursor_option
        ;

    opt_cursor_options_list
        : /* empty */
        | '(' cursor_options_commalist ')'

        ;

    open_statement
        : OPEN cursor opt_cursor_options_list
        ;

    with_opt_cursor_options_list
        : /* empty */
        | WITH opt_cursor_options_list
        ;

    select_statement
        : SELECT opt_all_distinct selection table_exp
        | SELECT opt_all_distinct selection
            INTO target_commalist table_exp with_opt_cursor_options_list
        ;

    opt_all_distinct
        : /* empty */
        | ALL
        | DISTINCT
        ;

    update_statement_positioned
        : UPDATE table SET assignment_commalist WHERE CURRENT OF cursor
        ;

    assignment_commalist
        : /* empty */
        | assignment
        | assignment_commalist ',' assignment
        ;

    assignment
        : column COMPARISON scalar_exp
        ;

    update_statement_searched
        : UPDATE table SET assignment_commalist opt_where_clause
        ;

    target_commalist
        : target
        | target_commalist ',' target
        ;

    target
        : column_ref
        ;

    opt_where_clause
        : /* empty */
        | where_clause
        ;

    query_exp
        : query_term
        | query_exp UNION query_term
        | query_exp UNION ALL query_term
        ;

    query_term
        : query_spec
        | '(' query_exp ')'

        ;

    query_spec
        : SELECT opt_all_distinct selection table_exp
        ;

    selection
        : scalar_exp_commalist
        ;

    table_exp
        : from_clause opt_where_clause opt_group_by_clause opt_having_clause
            opt_order_by_clause opt_lock_mode
        ;

    from_clause
        : FROM table_ref_commalist
        ;

    table_ref_commalist
        : table_ref
        | table_ref_commalist ',' table_ref
        ;

    table_ref
        : table
        | '(' query_exp ')' NAME
        | joined_table
        ;

    table_ref_nj
        : table
        | subquery NAME
        ;

    opt_outer
        : /* empty */
        | OUTER
        ;

    jtype
        : LEFT
        ;

    joined_table
        : table_ref jtype opt_outer JOIN table_ref_nj ON search_condition
        | BEGIN_OJ_X table_ref jtype opt_outer JOIN table_ref_nj
          ON search_condition ENDX
        ;

    where_clause
        : WHERE search_condition
        ;

    opt_group_by_clause
        : /* empty */
        | GROUP BY ordering_spec_commalist
        ;

    opt_having_clause
        : /* empty */
        | HAVING search_condition
        ;

    opt_lock_mode
        : /* empty */
        | FOR UPDATE
        ;

    search_condition
        : /* empty */
        | search_condition OR search_condition
        | search_condition AND search_condition
        | NOT search_condition
        | '(' search_condition ')'

        | predicate
        ;

    predicate
        : comparison_predicate
        | between_predicate
        | like_predicate
        | test_for_null
        | in_predicate
        | all_or_any_predicate
        | existence_test
        | scalar_exp_predicate
        ;

    scalar_exp_predicate
        : scalar_exp
        ;

    comparison_predicate
        : scalar_exp COMPARISON scalar_exp
        | scalar_exp COMPARISON subquery
        ;

    between_predicate
        : scalar_exp NOT BETWEEN scalar_exp AND scalar_exp
        | scalar_exp BETWEEN scalar_exp AND scalar_exp
        ;

    like_predicate
        : scalar_exp NOT LIKE scalar_exp opt_escape
        | scalar_exp LIKE scalar_exp opt_escape
        ;

    opt_escape
        : /* empty */
        | ESCAPE atom
        | BEGINX ESCAPE atom ENDX
        ;

    test_for_null
        : column_ref IS NOT NULLX
        | column_ref IS NULLX
        ;

    in_predicate
        : scalar_exp NOT IN subquery
        | scalar_exp IN subquery
        | scalar_exp NOT IN '(' scalar_exp_commalist ')'

        | scalar_exp IN '(' scalar_exp_commalist ')'

        ;

    all_or_any_predicate
        : scalar_exp COMPARISON any_all_some subquery
        ;

    any_all_some
        : ANY
        | ALL
        | SOME
        ;

    existence_test
        : EXISTS subquery
        ;

    subquery
        : '(' SELECT opt_all_distinct selection table_exp ')'

        ;

    scalar_exp
        : scalar_exp '+' scalar_exp
        | scalar_exp '-' scalar_exp
        | scalar_exp '*' scalar_exp
        | scalar_exp '/' scalar_exp
        | '+' scalar_exp %prec UMINUS
        | '-' scalar_exp %prec UMINUS
        | atom
        | column_ref
        | function_ref
        | '(' scalar_exp ')'

        | '(' scalar_exp ',' scalar_exp_commalist ')'

        | function_call
        | as_expression
        | assignment_statement
        | cvt_exp
        ;

    cvt_exp
        : CONVERT '(' data_type ',' scalar_exp ')'

        ;

    as_expression
        : scalar_exp AS NAME data_type
        | scalar_exp AS NAME
        ;

    opt_scalar_exp_commalist
        : /* empty */
        | scalar_exp_commalist
        ;

    function_call
        : q_table_name '(' opt_scalar_exp_commalist ')'

        | BEGIN_FN_X NAME '(' opt_scalar_exp_commalist ')' ENDX
        | BEGIN_FN_X USER '(' opt_scalar_exp_commalist ')' ENDX
        | BEGIN_FN_X CHARACTER '(' opt_scalar_exp_commalist ')' ENDX
        | CALL '(' scalar_exp ')' '(' opt_scalar_exp_commalist ')'

        ;

    obe_literal
        : BEGINX NAME atom ENDX
        ;

    scalar_exp_commalist
        : scalar_exp
        | scalar_exp_commalist ',' scalar_exp
        ;

    atom
        : parameter_ref
        | literal
        | USER
        | obe_literal
        ;

    parameter_ref
        : parameter
        | parameter parameter
        | parameter INDICATOR parameter
        ;

    function_ref
        : AMMSC '(' '*' ')'

        | AMMSC '(' DISTINCT scalar_exp ')'

        | AMMSC '(' ALL scalar_exp ')'

        | AMMSC '(' scalar_exp ')'

        ;

    literal
        : STRING
        | INTNUM
        | APPROXNUM
        | NULLX
        ;

    q_table_name
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.'  '.' NAME
        ;

    new_table_name
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.'  '.' NAME
        ;

    table
        : q_table_name
        | q_table_name AS NAME
        | q_table_name NAME
        ;

    column_ref
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.' NAME '.' NAME '.' NAME
        | NAME '.' '.' NAME '.' NAME
        | '*'
        | NAME '.' '*'
        | NAME '.' NAME '.' '*'

        | NAME '.' NAME '.' NAME '.' '*'

        | NAME '.' '.' NAME '.' '*'

        ;

    data_type
        : CHARACTER
        | VARCHAR
        | VARCHAR '(' INTNUM ')'

        | CHARACTER '(' INTNUM ')'

        | NUMERIC
        | NUMERIC '(' INTNUM ')'

        | NUMERIC '(' INTNUM ',' INTNUM ')'

        | DECIMAL
        | DECIMAL '(' INTNUM ')'

        | DECIMAL '(' INTNUM ',' INTNUM ')'

        | INTEGER
        | SMALLINT
        | FLOAT
        | FLOAT '(' INTNUM ')'

        | REAL
        | DOUBLE PRECISION
        | LONG VARCHAR
        | LONG VARBINARY
        | TIMESTAMP
        | DATETIME
        | TIME
        | DATE
        | OWNER
        ;

    column
        : NAME
        ;

    index
        : NAME
        ;

    cursor
        : NAME
        ;

    parameter
        : PARAMETER
        ;

    user
        : NAME
        ;

    opt_log
        : /* empty */
        | scalar_exp
        ;

    comma_opt_log
        : /* empty */
        | ',' scalar_exp
        ;

    admin_statement
        : CHECKPOINT opt_log
        | SHUTDOWN opt_log
        | SET REPLICATION atom
        | LOG OFF
        | LOG ON
        ;

    sql
        : routine_declaration
        | trigger_def
        | drop_trigger
        ;

    routine_declaration
        : CREATE routine_head new_table_name rout_parameter_list
        opt_return compound_statement
        ;

    routine_head
        : FUNCTION
        | PROCEDURE
        ;

    opt_return
        : /* empty */
        | RETURNS data_type
        ;

    rout_parameter_list
        : '(' parameter_commalist ')'

        ;

    parameter_commalist
        : rout_parameter
        | parameter_commalist ',' rout_parameter
        ;

    rout_parameter
        : parameter_mode column_ref data_type
        ;

    parameter_mode
        : IN
        | OUT
        | INOUT
        ;

    routine_statement
        : select_statement
        | update_statement_positioned
        | update_statement_searched
        | insert_statement
        | delete_statement_positioned
        | delete_statement_searched
        | close_statement
        | fetch_statement
        | open_statement
        | commit_statement
    */
        | ';'

        ;

    compound_statement
        : BEGINX statement_list ENDX
        ;

    statement_list
        : statement_in_cs
        | statement_list statement_in_cs
        ;

    statement_in_cs
        : local_declaration ';'

        | compound_statement
        | routine_statement ';'

        | control_statement
        | NAME ':' statement
        ;

    statement
        : routine_statement ';'

        | control_statement
        | compound_statement
        ;

    local_declaration
        : cursor_def
        | variable_declaration
        | handler_declaration
        ;

    variable_declaration
        : DECLARE variable_list data_type
        ;

    variable_list
        : NAME
        | variable_list ',' NAME
        ;

    condition
        : NOT FOUND
        | SQLSTATE STRING
        ;

    handler_declaration
        : WHENEVER condition GOTO NAME
        | WHENEVER condition GO TO NAME
        ;

    control_statement
        : call_statement ';'

        | return_statement ';'

        | assignment_statement ';'

        | if_statement
        | goto_statement ';'

        | while_statement
        ;

    assignment_statement
        : lvalue EQUALS scalar_exp
        ;

    lvalue
        : column_ref
        ;

    if_statement
        : IF '(' search_condition ')' statement opt_else
        ;

    opt_else
        : /* empty */
        | ELSE statement
        ;

    call_statement
        : CALL q_table_name '(' opt_scalar_exp_commalist ')'

        | function_call
        ;

    goto_statement
        : GOTO NAME
        | GO TO NAME
        ;

    return_statement
        : RETURN scalar_exp
        | RETURN
        ;

    while_statement
        : WHILE '(' search_condition ')' statement
        ;

    trigger_def
        : CREATE TRIGGER NAME action_time event ON q_table_name
                opt_old_ref compound_statement
        ;

    action_time
        : BEFORE
        | AFTER
        ;

    event
        : INSERT
        | UPDATE
        | DELETE
        ;

    opt_old_ref
        : /* empty */
        | REFERENCING old_commalist
        ;

    old_commalist
        : old_alias
        | old_commalist ',' old_alias
        ;

    old_alias
        : OLD AS NAME
        | NEW AS NAME
        ;

    drop_trigger
        : DROP TRIGGER q_table_name
        ;
```

# Bitmap Indices

A bitmap index is a special type of index that is tailored for being
efficient for key columns with relatively few distinct values, i.e. low
cardinality key columns. A bitmap index is created with the normal
create index statement by putting the bitmap keyword in front of index,
as follows:

    create table customer (c_id int primary key, c_state char (2), c_gender char (1), .... );
    
    create bitmap index c_gender on customer (c_gender);
    create bitmap index c_state on customer (c_state);

Bitmap indices offer space savings of up to 1000 x in some cases and
specially for large tables the savings in I/O can be very significant.

A bitmap index can only be used on tables with an integer primary key or
in other situations where the last effective key part of the index is an
integer. This is understandable since a bitmap index uses a bitmap for
representing the values of the last key part, thus having one bitmap for
each distinct combination of leading key parts. In the above example,
the customer table has an integer c\_id column as primary key and a
character for the customer's gender and a 2 character field for the
state where the customer is located. Thus, to count all the male
customers in Massachusetts, one will take the males bitmap and the MA
bitmap and perform a bitwise AND of the two. This will have a 1 bit
corresponding to the c\_id of each male customer in Massachusetts.

We also note that in order to do the count, the customer table itself
does not even have to be referenced, as the bitmaps hold all the
information. Even if the table did have to be referenced, for example
for adding up the outstanding credit of all male customers in
Massachusetts, the bitwise AND could be done first and only the relevant
rows would have to be retrieved from the table itself.

Virtuoso's implementation of bitmap indices is designed to work
efficiently even when the leading key parts have relatively high
cardinality, i.e. many distinct values, causing there to be a large
number of mostly empty bitmaps. Of course, if each bitmap has only one
bit set, for example if every customer is in a different state, there is
no benefit to bitmap indices. On the other hand, there is also almost no
penalty, only 6 bytes more per index entry than for a regular index.
Therefore, for any non-unique key where bitmap indices are applicable,
even if there are only a few repeated values, bitmap indices are a safe
choice. If there are at least 2 times more rows than distinct values of
the keys, space savings are certain.

A bitmap index may have any number of key parts of any type, provided
that the last effective part is an integer or and IRI id. The last key
parts of an index are those primary key parts that do not occur
elsewhere in the key. Thus, if the primary key is a single integer,
bitmap indices are always applicable. However, supposing the primary key
were an integer plus a string, it would be possible to make a bitmap
index where the string were first, followed by the integer. This would
make sense and save space if the string were not unique by itself. As
another example, the RDF\_QUAD system table, the default location of the
Virtuoso RDF triple store, has the columns P, G, O and S, where all are
IRI ID's, except for O which is ANY. Thus, The primary key is the
concatenation of all columns, by default in the order GSPO. There is
another key in the order PGOS which can be implemented as a bitmap index
because S is an IRI ID, hence integer-like for purposes of bitmap
indices.

## Bitmap Indices and Transactions

The minimum locking unit is the row. In the case of a bitmap index, one
row holds a bitmap which most often refers to many rows. Locking is
therefore less granular than with regular indices. Thus, if multiple
threads insert rows with bitmap indices, more waits may occur than if
the index were not bitmapped. A single row of a bitmap index references
maximally 8192 other rows, most often however the count is much less.

In all other respects, locking and transactional behavior are identical
with other indices.

## Performance Implications

The main advantage of a bitmap index is more compact size, reflected in
less I/O. Inserting an entry takes on the average 10% longer than for
another type of index, likewise for random lookups with exact key
values. Sequential access is usually faster. Space savings and thereby
improved working set behavior can produce dramatic gains for large
tables.

## Physical Structure and Overheads

Bitmap indices divide the range of signed 64 bit integer values into
ranges holding 8192 (8K) values. Each such range where at least one bit
is set is represented by a compression entry (CE). Multiple CE's can be
on the same row. CE's having one bit set take 4 bytes, CE's with 512 or
less bits set take 4 bytes plus 2 bytes per bit, CE's with over 512 bits
set take 1K byte regardless of how many bits are set.

A bitmap index where the bitmap holds only one bit takes 6 bytes more
than the corresponding non-bitmap index entry. A second value, if it
falls in the same 8K range adds 2 bytes, 4 bytes if it does not fall
within in the same 8K range. If more than 512 values fall within the
same 8K range, the bits are represented as a 1K byte bitmap and adding
subsequent values takes no extra space.

Virtuoso supports bitmap indices since version 4.5.2919.

Bitmap Indices

# Transitivity in SQL

Virtuoso SQL supports tree and graph data structures represented with
SQL relations through the use of transitive subqueries.

A derived table, i..e. a select inside a from clause, can be declared to
be transitive. This is done by putting the TRANSITIVE modifier after the
SELECT keyword, at the place where a DISTINCT or TOP modifier would go.

The syntax of this is:

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

A transitive derived table has a selection that may consist of four
different types of columns. These are input, output, step data and
special columns. When a transitive derived table occurs in a query, the
enclosing query must specify an equality condition for either all input,
all output columns or both. The designation of input and output columns
is for convenience only. The order of query execution will be generally
decided by the optimizer, unless overridden with the T\_DIRECTION
option.

Consider a simplified social network application:

    create table knows (p1 int, p2 int, primary key (p1, p2))
    alter index knows on knows partition (p1 int);
    create index knows2 on knows (p2, p1) partition (p2 int);
    
    insert into knows values (1, 2);
    insert into knows values (1, 3);
    insert into knows values (2, 4);

All persons have single integer identifiers. There is a row in the knows
table if person p1 claims to know person p2.

The most basic query is to find all the people that a given person knows
either directly or indirectly.

    select * from (select transitive t_in (1) t_out (2) t_distinct  p1, p2 from knows) k where k.p1 = 1;

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

    select * from (select transitive t_in (1) t_out (2) t_direction 3 t_distinct t_shortest_only  p1, p2, t_step (1) as via, t_step ('path_id') as path , t_step ('step_no') as step from knows) k where p1 = 1 and p2 = 4;
    
    P1       P2       VIA                                                                               PATH                                                                              STEP
    
    1        4        1                                                                                 0                                                                                 0
    1        4        2                                                                                 0                                                                                 1
    1        4        4                                                                                 0                                                                                 2

The three rightmost columns allow returning information in the
intermediate steps of the transitive evaluation. t\_step (1) means the
value of the column at position 1 at the intermediate step. The t\_step
('step\_no) is the sequence number of the step returned. The t\_step
('path\_id') is a number identifying the connection path, since there
may be many paths joining persons 1 and 4.

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
which is neither designated as input nor output and is not a t\_step ()
function call, will simply be returned as is.

The result set of a transitive subquery will either have one row for
each state reached, or it may have one row for each step on the path to
each state reached.

The first example returns only the ends of the paths, i.e. directly and
indirectly known person id's. It does not return for each returned id
how this person is known, through which set of connections. The second
example returns a row for each step on each path. Steps will be returned
if the selection has t\_step () calls or columns that are neither input
or output.

The forms of t\_step are:

    t_step (<column number>)

This returns the value that the column, one of the columns designated as
input, has at this step. The input or output columns themselves, if
there is a condition on them, look equal to the condition. This allows
seeing intermediate values of input columns on a path.

``` 
```

t\_step ('step\_no')

This returns the ordinal number of the step on the path. Step -0
corresponds to the input variables being at the value seen in the
enclosing query. Step 1 is one removed from this. Step numbering is
assigned as if evaluating from input to output.

Consider this:

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

This returns four paths, all starting at 1: the paths. The path from 1
to 1, the path from 1 to 2, the path from 1 to 3 and the path from 1 to
2 to 4. The path\_id column has values from 0 to 3, distinguishing the
four different paths returned. The p1 column is the start of the path,
thus always 1 since this is given in the outer query. The p2 column is
the end of the path. The via column is the value of p1 at the
intermediate step. The step number where via is equal to p1 is 0. The
next step number is 1. At the highest step number of each path, p2 and
via are the same.

Now, let us do this in reverse:

    select * from (select transitive t_in (1) t_out (2) t_min (0) t_distinct   p1, p2, t_step (1) as via, t_step ('path_id') as path , t_step ('step_no') as step from knows) k where p2 = 4 ;
    P1       P2       VIA                                                                               PATH                                                                              STEP
    
    4        4        4                                                                                 0                                                                                 0
    2        4        2                                                                                 1                                                                                 0
    2        4        4                                                                                 1                                                                                 1
    1        4        1                                                                                 2                                                                                 0
    1        4        2                                                                                 2                                                                                 1
    1        4        4                                                                                 2                                                                                 2

We give an initial value to p2 and leave p1 free. Now we get three
paths, the path from 4 to 4, from 2 to 4 and from 1 to 2 to 4. We
enumerate the steps as if counting from input to output, albeit
internally the evaluation order is the reverse. Again, step number 0 has
the via column equal to p1 and the highest numbered step has via equal
to p2.

Now we may look more formally at the meaning of the transitive options:

  - T\_MIN (INTNUM) - This means that paths shorter than the number are
    not returned. In the examples above, we had min at 0, so that a path
    of zero length was also returned, i.e. where the first output equals
    the outer conditions for the inputs.

  - T\_MAX (INTNUM) - This gives a maximum length of path. Paths longer
    than this many steps are not returned. A value of 1 means that the
    subquery is evaluated once, i.e. the outputs of the first
    evalyuation are not fed back into the inputs. Specifying a minimum
    of 0 and a maximum of one means an optional join. Specifying min and
    max both to 1 means an ordinary derived table.

  - T\_DISTINCT - This means that if a binding of input columns is
    produced more than once, only the first is used. Id est, the same
    point is not traversed twice even if many paths lead to it.

  - T\_EXISTS - Only one path is generated and returned.

  - T\_NO\_CYCLES - If a path is found that loops over itself, i.e. a
    next step has the input values equal to the input values of a
    previous step on the path, the binding is ignored.

  - T\_CYCLES\_ONLY - Only paths that have a cycle, i.e. input values of
    a subsequent step equal the input values of a previous step on the
    same path, are returned.

  - T\_SHORTEST\_ONLY - If both ends of the path are given, the
    evaluation stops at the length of path where the first solution is
    found. If many paths of equal length are found, they are returned
    but longer paths are not sought.

  - T\_IN (column\_positions) - This specifies which columns are called
    input.

  - T\_OUT (column\_positions) - This specifies which columns are called
    output.

  - T\_DIRECTION INTNUM - A value of 0 (default) means that the SQL
    optimizer decides which way the transitive subquery is evaluated. 1
    means from input to output, 2 from output to input, 3 from both
    ends. Supposing we are looking at how two points are related, it
    makes sense to start expanding the transitive closure at both ends.
    in the above example, this would be going from p1 to p2 on one side
    and from p2 to p1 on the other.

> **Tip**
> 
> [Collection of Transitivity Option Demo Queries for
> SPARQL.](#rdfsparqlimplementatiotransexamples)

# Fast Phrase Match Processor

An "annotation phrase" is a keyword or key phrase associated with some
application specific data and a uniform "annotation phrase set" may map
dictionary words to their descriptions or ICAO codes to airport names
and co-ordinates or geographical names to maps or Wikipedia topics to
links to Wikipedia pages. An application may need to scan a given text
and find all occurrences of phrases from given phrase set, for various
purposes, e.g., to improve the resource with additional hyperlinks, to
replace technical codes with user-friendly names, or to suggest
appropriate tags and keywords. Virtuoso has built-in phrase match
processor that is fast enough to deal with long documents and big phrase
sets in interactive applications.

## Phrases, Phrase Sets and Phrase Classes

An annotation phrase is a pair of a key (a string that is supposed to be
a word or phrase of some natural language) and a value (of any type if
its serialization is shorter than 2 kilobytes or a string shorter than
10 megabytes). The key phrase will be divided into words and normalized
by language-specific functions used by free text search; after
normalization it should contain from one to four words. The associated
value may be very long in principle, but it will add noticeable
overheads related to memory allocation and copying so it is recommended
to keep it short if performance is somehow important. It is usual to
make the value as short as an ID in some external "detailed" table, not
only for speed but to support multiple synonyms for one thing or names
of a thing in different languages.

Annotation phrases are grouped in "phrase sets" and every "phrase set"
belongs to some "phrase class".

Phrase classes are enumerated in a DB.DBA.SYS\_ANN\_PHRASE\_CLASS table.

    create table DB.DBA.SYS_ANN_PHRASE_CLASS
    (
      APC_ID integer not null primary key,
      APC_NAME varchar(255) unique,     -- unique name for use in API/UI
      APC_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
      APC_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
      APC_CALLBACK varchar,
      APC_APP_ENV any
      )
    ;

Phrase sets and phrase classes may contain confidential information.
E.g., a phrase set may be used to check that a given outgoing document
does not mention titles of confidential projects or names of persons
that should act anonymously for public. So any application may specify
access restrictions when a phrase class is created. The application
usually sets APC\_CALLBACK to name of some of its functions (but it may
be any string) and APC\_APP\_ENV to value of any type (application may
pass it to the APC\_CALLBACK function as one of arguments). Phrase match
processor only keeps these data in memory, unchanged, and returns to the
application as a part of text processing report, so they can be used for
any purpose.

Phrase class describes an access to some application-specific callback,
but it does not mention any phrases at all. Individual phrases are
grouped into phrase sets. Each phrase set belongs to exactly one phrase
class and is restricted to one language handler. It does not necessarily
mean that it should consist of phrases of one natural language, because
many language handlers support mix of languages, but it may apply some
restrictions.

Phrase sets are enumerated in a DB.DBA.SYS\_ANN\_PHRASE\_SET table.

    create table DB.DBA.SYS_ANN_PHRASE_SET
    (
      APS_ID integer not null primary key,
      APS_NAME varchar(255) unique,     -- unique name for use in API/UI
      APS_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
      APS_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
      APS_APC_ID integer not null,      -- references SYS_ANN_PHRASE_CLASS (APC_ID)
      APS_LANG_NAME varchar not null,   -- name of language handler that is used to split texts of phrases
      APS_APP_ENV any,
      APS_SIZE any,             -- approximate number of phrases inserted in the set (actual or estimate for future)
      APS_LOAD_AT_BOOT integer not null -- flags whether phrases should be loaded at boot time.
      )
    ;

APS\_APP\_ENV can be of any type (application may pass it to the
APC\_CALLBACK function as one of arguments). Like APC\_APP\_ENV, phrase
match processor only keeps it in memory and returns in a text processing
report.

The APS\_SIZE tweaks the amount of memory consumed by a phrase set when
it's loaded. The average "price" of placing a phrase to a set is 2 bytes
per phrase. Memory amounts are less than a kilobyte while APS\_SIZE is
below 256, less than 64 kilobytes while APS\_SIZE grow up to 32
thousands of phrases and reaches its maximum of 64 megabytes when
APS\_SIZE reaches its practical limit of 32 million phrases. Only rough
similarity to the actual number of inserts is needed, say, same order of
magnitude. The exaggerated value of APS\_SIZE will allocate a bit more
memory and may slightly improve the speed. It is not practical to set
APS\_SIZE much smaller than it should be because it will cause frequent
table lookups and disk buffers in use will overweight any memory savings
in the phrase match processor. If there are numerous phrase sets that
are used only occasionally, do not decrease APS\_SIZE, instead set
APS\_LOAD\_AT\_BOOT to zero for them.

Note that if phrase set is edited intensively during server run then the
number of inserted phrases is important, an effect of phrase removal is
visible only after server restart. E.g. if a phrase set is frequently
cleaned and refilled with new phrases then it is much better to delete
an obsolete set and create a new one.

Individual annotation phrases are stored in a table
DB.DBA.SYS\_ANN\_PHRASE, that should not be modified by applications
directly by data manipulation statements. The content of the table is
used to build special search structures in memory and SQL operations
like INSERT and DELETE can not keep in-memory structures in sync with
the content of the table. DBA may read the table but should not update;
in case of occasional update all phrase sets that contain edited phrases
may become unusable until server restart.

    create table DB.DBA.SYS_ANN_PHRASE
    (
      AP_APS_ID integer not null,       -- references SYS_ANN_PHRASE_SET (APS_ID),
      AP_CHKSUM integer,            -- phrase check-sum
      AP_TEXT varchar,          -- original text
      AP_LINK_DATA any,         -- Associated data about links etc.
      AP_LINK_DATA_LONG long varchar,   -- Same as AP_LINK_DATA but for long content, one of two is always NULL
      primary key (AP_APS_ID, AP_CHKSUM, AP_TEXT)
      )
    ;

The "almost direct" way of writing to the table is via BIF
[`ap_add_phrases`](#fn_ann_phrase_class_add) . It gets two arguments,
the integer ID of annotation phrase set and a vector of descriptions of
phrases that should be edited in that phrase set. Every item of vector
of descriptions is in turn vector of one or two values; first value is
the text of the phrase, second value is associated application specific
data, the absence of second value indicates that the phrase should be
removed. If same text of phrase appears in the vector of description
more than once, and associated data differ then any version of data can
be stored for future use; it is the roll of dice because the vector is
reordered for faster processing.

## Phrase Set Configuration API

  - [`DB.DBA.ANN_PHRASE_CLASS_ADD`](#fn_ann_phrase_class_add)

  - [`DB.DBA.ANN_PHRASE_CLASS_DEL`](#fn_ann_phrase_class_del)

  - [`AP_BUILD_MATCH_LIST`:](#fn_ap_build_match_list) The report R is a
    vector of 6 elements:
    
    1.  R\[0\] vector of all distinct phrase classes for phrase sets of
        found phrases; every pair of items represents one phrase class:
        first item is an integer APC\_ID of a class, second item is a
        description of phrase class as vector of APC\_NAME,
        APC\_CALLBACK and APC\_APP\_ENV;
    
    2.  R\[1\] vector of all distinct phrase sets of found phrases;
        every pair of items represents one phrase set: first item is an
        integer APS\_ID of a class, second item is a vector of
        APS\_NAME, APS\_APC\_ID, index of phrase class description in
        R\[0\] and APS\_APP\_ENV;
    
    3.  R\[2\] vector of all distinct found phrases; every item
        represents a phrase as a vector of AP\_APS\_ID, index of phrase
        set description in R\[1\], AP\_TEXT and application-specific
        data from AP\_LINK\_DATA or AP\_LINK\_DATA\_LONG;
    
    4.  R\[3\] vector of all composed arrows for the text; every item
        represents one place in a text, as an "arrow" described below;
    
    5.  R\[4\] vector of indexes of arrows that point to words in the
        text; every item is an integer that is index in R\[3\];
    
    6.  R\[5\] vector of descriptions of occurrences of annotation
        phrases in text; every item represents one occurrence as vector
        of index of first word in R\[3\], index of last word in R\[3\],
        index of found phrase in R\[2\], index of previous occurrence of
        same phrase in R\[5\].
    
    7.  Every "arrow" A is vector of length 5 or 6, it is longer when
        arrow points inside occurrence of some annotation phrase.
        
        1.  A\[0\] integer that indicates type of text fragment:
            
              - 0 is for plain word (only this type occurs in reports
                for plain text),
            
              - 1 is for text of opening tag,
            
              - 2 is for text of closing tag,
            
              - 3 is something exceptional like unrecoverable HTML
                syntax error
        
        2.  A\[1\] integer offset of the first byte of a fragment in the
            text
        
        3.  A\[2\] integer offset of the first byte after the end of a
            fragment
        
        4.  A\[3\] integer that is a bit-mask of opened but not yet
            closed tags
        
        5.  A\[4\] integer index of the arrow of the innermost tag that
            is opened but not yet closed where the arrow begins
        
        6.  A\[5\] may absent, if presents then it is a vector of
            indexes in R\[2\] of all containing phrases.
    
    8.  Bit mask of opened but not yet closed tags consists of the
        following bits:
        
            0x00000001  PCDATA containers (such as OPTION, TEXTAREA, XBODY, XHEAD)
            0x00000002  Inlined highlight tags (such as ABBR, ACRONYM, B, BDO, BIG, CITE, CODE, DFN, EM, FONT, I, KBD, Q, S, SAMP, SMALL, SPAN, STRIKE, STRONG, SUB, SUP, TT, U)
            0x00000004  Tag A
            0x00000008  Tag LABEL
            
            0x00000010  Inlined content (such as ADDRESS, APPLET, H1-H6, LABEL, LEGEND, P, PRE, and all blocks of content except MAP)
            0x00000020  Blocks (such as BLOCKQUOTE, BUTTON, DD, DIV, DL, DT, FIELDSET, FORM, IFRAME, LI, NOFRAMES, NOSCRIPT, OBJECT, TABLE, TBODY, TD, TFOOT, TH, THEAD, TR, XBODY, XHEAD)
            
            0x00000100  Tags of list and ordered list (MENU, OL, UL)
            0x00000200  Tag LI
            0x00000400  Tag DL
            0x00000800  Tags DD and DT
            
            0x00001000  Tag FORM
            0x00002000  Tag SELECT
            0x00004000  Tag OPTGROUP
            0x00008000  Tag BUTTON
            
            0x00010000  Tag TABLE
            0x00020000  Tags inside TABLE but outside table rows (such as TBODY, TFOOT, THEAD)
            0x00040000  Tag TR
            0x00080000  Tags TH and TD
            
            0x00FFFFFF  Tags XBODY and XHEAD
            
            0x01000000  Tag HEAD
            0x02000000  Tag FRAMESET
            0x04000000  Tag NOFRAMES
            
            0x10000000  Tag HTML
            0x20000000  Tag BODY
            0x40000000  Tags INS and DEL
            0x80000000  Tag XMP
        
        For long document, the report may be too long, esp. vectors
        R\[3\] and R\[4\]. A simple application may not need locations
        of every tag and every word of the document. The report\_flags
        argument is a bitmask, and some bits control the size of the
        report. If bit 1 is set then closing tags are excluded from
        report. If bit 2 is set then only words in found phrase are
        placed to the report, the rest of phrases is excluded.

## Advertisers and Advertisement Rules

Phrase sets are sufficient for many purposes but advertisement-specific
applications need more built-in functionality for maximum speed. This
functionality can be reused by any application that adds hyperlinks to
texts depending on content of the text.

Consider advertisers that want to show links to their resources near
phrases they choose as relevant, and one phrase can be chosen by many
advertisers. To make the processing easier, there exists special support
for phrase sets that store lists of links for phrases.

An advertiser is some very abstract "source" of annotation phrases. The
exact nature of an advertiser is application-specific, but each
advertiser has an identifiable account. All accounts are in one table:

    create table DB.DBA.SYS_ANN_AD_ACCOUNT (
      AAA_ID integer not null primary key,
      AAA_NAME varchar(255) unique,     -- unique name for use in API/UI
      AAA_OWNER_UID integer,        -- references SYS_USERS (U_ID), NULL if the record writable for any reader
      AAA_READER_GID integer,       -- references SYS_USERS (U_ID), NULL if the record is readable for public
      AAA_DETAILS long xml,         -- any details, e.g., in RDF
      AAA_APP_ENV any
      )
    ;

Advertisement links are stored in a separate table:

    create table DB.DBA.SYS_ANN_LINK (
      AL_ID integer primary key,
      AL_OWNER_UID integer,         -- references SYS_USERS (U_ID), NULL if the record writable for any reader; always readable for public
      AL_URI varchar,           -- URI template for A HREF
      AL_TEXT varchar,          -- text template for body of <A>
      AL_NOTE varchar,          -- text after the link (or around it)
      AL_TAGS any,              -- tags to add or remove
      AL_CALLBACK varchar,
      AL_APP_ENV any
      )
    ;

Advertisers, links and phrases are linked together by advertisement
rules. Each rule says that if a given phrase is found in some text then
a given link should be shown and a specified advertiser's account should
be charged.

    create table DB.DBA.SYS_ANN_AD_RULE (
      AAR_AAA_ID integer not null,      -- advertiser who pays for the ad
      AAR_APS_ID integer not null,      -- phrase set
      AAR_AP_CHKSUM integer not null,   -- phrase check-sum
      AAR_TEXT varchar not null,        -- original text
      AAR_AL_ID integer not null,       -- references SYS_ANN_LINK (AL_ID)
      AAR_APP_ENV any,
      primary key (AAR_AAA_ID, AAR_APS_ID, AAR_AP_CHKSUM, AAR_TEXT, AAR_AL_ID)
      )
    ;

When an annotation phrase is stored in its phrase set via advertisement
API, its application-specific data is always a vector, and vector's
length is divisible by three. When a new ad rule is added to the vector,
it gets three new items: value of AL\_ID of a link, value of
advertiser's AAA\_ID and AAR\_APP\_ENV of the ad rule.

Anyone can describe a link but can not edit other's descriptions:

    create function DB.DBA.ANN_LINK_ADD (
      in _owner_uid integer,
      in _uri varchar,      -- value for AL_URI
      in _text varchar,     -- value for AL_TEXT
      in _note varchar,     -- value for AL_NOTE
      in _tags any,         -- value for AL_TAGS
      in _callback varchar,
      in _app_env any) returns integer

So one user may create links in favor of other user even without
permission, but can not edit other's links. To edit or delete, one
should be an owner and pass authentication:

    create function DB.DBA.ANN_LINK_MODIFY (
      in _id integer,
      in _owner_uid integer,
      in _uri varchar,
      in _text varchar,
      in _note varchar,
      in _tags any,
      in _callback varchar,
      in _app_env any,
      in auth_uname varchar,
      in auth_pwd varchar) returns integer
    
    create function DB.DBA.ANN_LINK_DEL (
      in _id integer,
      in auth_uname varchar,
      in auth_pwd varchar) returns integer

A link can not be dropped even by its owner if it is used by some
advertiser.

    create function DB.DBA.ANN_AD_RULE_ADD (
      in aaa_name varchar,      -- Advertiser's name (or its integer AAA_ID key), to store as AAR_AAA_ID
      in aps_name varchar,      -- Name of a phrase set (or its integer APS_ID key), to store as AAR_APS_ID
      in _text varchar,     -- Text of the phrase, will be stored as AAR_TEXT and duplicated in an AP_TEXT if the phrase is new
      in _al_id integer,        -- ID of a link (AL_ID in DB.DBA.SYS_ANN_LINK), to store as AAR_AL_ID
      in _app_env any,      -- Application-specific data, will be stored in AAR_APP_ENV and become a part of AP_LINK_DATA of the phrase
      in _lang_name varchar,    -- Language name, for verification only; an error will be signalled if the value of argument is not equal to language name of the phrase set
      in auth_uname varchar,
      in auth_pwd varchar) returns integer

Application-specific data should be short, because for any given phrase,
sum of data from all advertisers should not exceed 2 kilobytes.
Fortunately, most of needed data are in DB.DBA.SYS\_ANN\_LINK row
already so AAR\_APP\_ENV is frequently a NULL.

    create function DB.DBA.ANN_AD_RULE_DEL (
      in aaa_name varchar,
      in aps_name varchar,
      in _text varchar,
      in _al_id integer,
      in _lang_name varchar,
      in auth_uname varchar,
      in auth_pwd varchar) returns integer

If a phrase set is edited by DB.DBA.ANN\_AD\_RULE\_ADD /
DB.DBA.ANN\_AD\_RULE\_DEL and by ap\_add\_phrases() then errors are
almost guaranteed (and not detected or recovered automatically in
current version). The function ap\_build\_match\_list() works fine with
mix of phrase sets managed by both methods because it is not sensitive
to the format of data in phrases.

## Example

The following example demonstrates managing phrases sets and data
associated with them:

    SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_CLASS (APC_ID, APC_NAME, APC_OWNER_UID, APC_READER_GID, APC_CALLBACK, APC_APP_ENV)
    values (3, 'Debug apc #3', http_dav_uid(), http_admin_gid(), 'DB.DBA.AP_DEBUG_CALLBACK', 'Debug apc #3 env')
    ;
    
    Done. -- 0 msec.
    
    SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
    values (5, 'Debug aps #5', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Debug aps #5 env', 10000, 0)
    ;
    
    Done. -- 0 msec.
    
    SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
    values (7, 'Debug aps #7', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Debug aps #7 env', 10000, 0)
    ;
    
    Done. -- 0 msec.
    
    SQL>ap_add_phrases (5,
      vector (
        vector ('Debug5', 'Debug5 env'),
        vector ('Debug5 one', 'Debug5 one env'),
        vector ('Debug5 two', 'Debug5 two env'),
        vector ('Debug5 three', 'Debug5 three env'),
        vector ('Debug5 twenty one', 'Debug5 twenty one env'),
        vector ('Debug5 twenty two', 'Debug5 twenty two env'),
        vector ('Debug5 twenty three', 'Debug5 twenty three env')
        ) )
    ;
    Done. -- 0 msec.
    
    SQL>ap_add_phrases (7,
      vector (
        vector ('Debug7', 'Debug7 env'),
        vector ('Debug7 one', 'Debug7 one env'),
        vector ('Debug7 two', 'Debug7 two env'),
        vector ('Debug7 three', 'Debug7 three env'),
        vector ('Debug7 twenty one', 'Debug7 twenty one env'),
        vector ('Debug7 twenty two', 'Debug7 twenty two env'),
        vector ('Debug7 twenty three', 'Debug7 twenty three env')
        ) )
    ;
    
    Done. -- 0 msec.
    
    SQL>ap_add_phrases (5,
      vector (
        vector ('Debug5 thirty one', 'Debug5 thirty one BAD env'),
        vector ('Debug5 thirty two', 'Debug5 thirty two BAD env'),
        vector ('Debug5 thirty three', 'Debug5 thirty three BAD env'),
        vector ('Debug5 one hundred', 'Debug5 one hundred BAD env')
        ) )
    ;
    
    Done. -- 0 msec.
    
    SQL>ap_add_phrases (5,
      vector (
        vector ('Debug5', 'Debug5 UPDATED env'),
        vector ('Debug5 thirty one', 'Debug5 thirty one NEW env'),
        vector ('Debug5 thirty two', 'Debug5 thirty two NEW env'),
        vector ('Debug5 thirty three', 'Debug5 thirty three NEW env'),
        vector ('Debug5 one hundred')
        ) )
    ;
    Done. -- 0 msec.
    
    SQL>create function ptext_1 ()
    {
      return '
        vector ''Debug5'', ''Debug5 env'',
        vector ''Debug5 one'', ''Debug5 one env'',
        vector ''Debug5 two'', ''Debug5 two env'',
        vector ''Debug5 three'', ''Debug5 three env'',
        vector ''Debug5 twenty one'', ''Debug5 twenty one env'',
        vector ''Debug5 twenty two'', ''Debug5 twenty two env'',
        vector ''Debug5 twenty three'', ''Debug5 twenty three env''
    ap_add_phrases 7,
      vector
        vector ''Debug7'', ''Debug7 env'',
        vector ''Debug7 one'', ''Debug7 one env'',
        vector ''Debug7 two'', ''Debug7 two env'',
        vector ''Debug7 three'', ''Debug7 three env'',
        vector ''Debug7 twenty one'', ''Debug7 twenty one env'',
        vector ''Debug7 twenty two'', ''Debug7 twenty two env'',
        vector ''Debug7 twenty three'', ''Debug7 twenty three env''
    ap_add_phrases 5,
      vector
        vector ''Debug5 thirty one'', ''Debug5 thirty one BAD env'',
        vector ''Debug5 thirty two'', ''Debug5 thirty two BAD env'',
        vector ''Debug5 thirty three'', ''Debug5 thirty three BAD env'',
        vector ''Debug5 one hundred'', ''Debug5 one hundred BAD env''
    ap_add_phrases 5,
      vector
        vector ''Debug5'', ''Debug5 UPDATED env'',
        vector ''Debug5 thirty one'', ''Debug5 thirty one NEW env'',
        vector ''Debug5 thirty two'', ''Debug5 thirty two NEW env'',
        vector ''Debug5 thirty three'', ''Debug5 thirty three NEW env'',
        vector ''Debug5 one hundred''
        ';
    }
    ;
    
    Done. -- 20 msec.
    
    SQL>create function ptext_2 ()
    {
      return '
        vector ''Debug5 twenty one''
        vector ''Debug7 twenty one''
        vector ''Debug5 thirty one''
        vector ''Debug5 thirty one''
        vector ''Debug5 one hundred''
        ';
    }
    ;
    Done. -- 10 msec.
    
    SQL>create function test_ptext_1()
    {
      declare ses any;
      ses := string_output();
      ap_debug_langhandler (ptext_1 (), 'x-any', vector (5, 7), ses );
      return string_output_string (ses);
    }
    ;
    Done. -- 10 msec.
    
    SQL>create procedure dump_match_list (in vect any, in path varchar := null)
    {
      declare VDATA varchar;
      if (path is null)
        {
          result_names (VDATA);
          path := '';
        }
      if (vect is null)
        {
          result (path || ' NULL');
          return;
        }
      if (193 <> __tag (vect))
        {
          result (path || ' ' || (cast (vect as varchar)));
          return;
        }
      declare l, ctr integer;
      l := length (vect);
      if (0 = l)
        {
          result (path || ' (empty vector)');
          return;
        }
      if (isinteger (vect [l - 1]))
        {
          declare ses any;
          ses := string_output ();
          for (ctr := 0; ctr < l; ctr := ctr + 1)
            {
          http (sprintf (' [%d]=%s', ctr, cast (vect[ctr] as varchar)), ses);
        }
          result (path || string_output_string (ses));
          return;
        }
      for (ctr := 0; ctr < l; ctr := ctr + 1)
        {
          dump_match_list (vect[ctr], sprintf ('%s[%d]', path, ctr));
        }
    }
    ;
    
    Done. -- 10 msec.
    
    SQL>select test_ptext_1();
    callret
    VARCHAR
    _______________________________________________________________________________
    
        (vector) '[[Debug5 UPDATED env]Debug5]]', '[[Debug5 UPDATED env]Debug5]] (env)', (vector) '[[Debug5 UPDATED env ; Debug5 one env]Debug5]] [[Debug5 one env]one]]', '[[Debug5 UPDATED env ; Debug5 one env]Debug5]] [[Debug5 one env ]one]] (env)',
        (vector) '[[Debug5 UPDATED env ; Debug5 two env]Debug5]] [[Debug5 two env]two]]', '[[Debug5 UPDATED env ; Debug5 two env]Debug5]] [[Debug5 two env ]two]] (env)', (vector) '[[Debug5 UPDATED env ; Debug5 three env]Debug5]] [[Debug5 three env]three]]', '[[Debug5 UPDATED env ; Debug5 three env]Debug5]] [[Debug5 three env]three]] (env)',
        (vector) '[[Debug5 UPDATED env ; Debug5 twenty one env]Debug5]] [[Debug5 twenty one env]twenty]] [[Debug5 twenty one env]one]]', '[[Debug5 UPDATED env ; Debug5 twenty one env]Debug5]] [[Debug5 twenty one env]twenty]] [[Debug5 twenty one env]one]] (env)',
        (vector) '[[Debug5 UPDATED env ; Debug5 twenty two env]Debug5]] [[Debug5 twenty two env]twenty]] [[Debug5 twenty two env]two]]', '[[Debug5 UPDATED env ; Debug5 twenty two env]Debug5]] [[Debug5 twenty two env]twenty]] [[Debug5 twenty two env]two]] (env)',
        (vector) '[[Debug5 UPDATED env ; Debug5 twenty three env]Debug5]] [[Debug5 twenty three env]twenty]] [[Debug5 twenty three env]three]]', '[[Debug5 UPDATED env ; Debug5 twenty three env]Debug5]] [[Debug5 twenty three env]twenty]] [[Debug5 twenty three env]three]] (env)' (ap)_(add)_(phrases) (7), (vector)
        (vector) '[[Debug7 env]Debug7]]', '[[Debug7 env]Debug7]] (env)', (vector) '[[Debug7 one env ; Debug7 env]Debug7]] [[Debug7 one env]one]]', '[[Debug7 one env ; Debug7 env]Debug7]] [[Debug7 one env]one]] (env)',
        (vector) '[[Debug7 two env ; Debug7 env]Debug7]] [[Debug7 two env]two]]', '[[Debug7 two env ; Debug7 env]Debug7]] [[Debug7 two env]two]] (env)',
        (vector) '[[Debug7 three env ; Debug7 env]Debug7]] [[Debug7 three env]three]]', '[[Debug7 three env ; Debug7 env]Debug7]] [[Debug7 three env]three ]] (env)',
        (vector) '[[Debug7 twenty one env ; Debug7 env
    
    1 Rows. -- 50 msec.
    
    SQL>dump_match_list (ap_build_match_list (vector (5, 7), ptext_2 (), 'x-any', 0, 0 ) );
    VDATA
    VARCHAR
    _______________________________________________________________________________
    
    [0][0] 3
    [0][1][0] Debug apc #3
    [0][1][1] DB.DBA.AP_DEBUG_CALLBACK
    [0][1][2] Debug apc #3 env
    [1][0] 5
    [1][1][0] Debug aps #5
    [1][1][1] 3
    [1][1][2] 1
    [1][1][3] Debug aps #5 env
    [1][2] 7
    .....
    139 Rows. -- 231 msec.
    
    SQL>dump_match_list (ap_build_match_list (vector (5, 7), ptext_2 (), 'x-any', 0, 3 ) );
    VDATA
    VARCHAR
    _______________________________________________________________________________
    
    [0][0] 3
    [0][1][0] Debug apc #3
    [0][1][1] DB.DBA.AP_DEBUG_CALLBACK
    [0][1][2] Debug apc #3 env
    [1][0] 5
    [1][1][0] Debug aps #5
    [1][1][1] 3
    [1][1][2] 1
    .....
    133 Rows. -- 231 msec.
    
    SQL>create procedure ap_make_js_menus (
      in ap_set_ids any, in source_UTF8 varchar, in lang_name varchar, in is_html integer)
    {
      declare res_out, script_out, match_list any;
      declare m_apc, m_aps, m_app, m_apa, m_apa_w, m_aph any;
      declare apa_w_ctr, apa_w_count integer;
      declare app_ctr, app_count integer;
      declare prev_end integer;
    
      match_list := ap_build_match_list ( ap_set_ids, source_UTF8, lang_name, is_html, 3); -- 3 is to have less garbage, hence better speed.
      m_apc := aref_set_0 (match_list, 0);
      m_aps := aref_set_0 (match_list, 1);
      m_app := aref_set_0 (match_list, 2);
      m_apa := aref_set_0 (match_list, 3);
      m_apa_w := aref_set_0 (match_list, 4);
      m_aph := aref_set_0 (match_list, 5);
      apa_w_count := length (m_apa_w);
      app_count := length (m_app);
      if (0 = app_count)
        {
          return source_UTF8;
        }
      res_out := string_output ();
      script_out := string_output ();
      http ('<script DEFER language="javescript"><!--', script_out);
      http ('\n  var v_descs = [', script_out);
      for (apa_w_ctr := 0; apa_w_ctr < apa_w_count; apa_w_ctr := apa_w_ctr + 1)
        {
          declare apa_idx integer;
          declare apa any;
          apa_idx := m_apa_w [apa_w_ctr];
          apa := aref_set_0 (m_apa, apa_idx);
          if (5 = length (apa))
            {
              declare apa_beg, apa_end, apa_hpctr, apa_hpcount integer;
              apa_beg := apa [1];
          apa_end := apa [2];
          apa_hpcount := length (apa[4]);
          http (subseq (source_UTF8, prev_end, apa_beg), res_out);
          http (sprintf ('<span
    xml:id="apjsm%d">', apa_idx), res_out);
          http (subseq (source_UTF8, apa_beg, apa_end), res_out);
          http ('</span>', res_out);
              prev_end := apa_end;
          if (apa_w_ctr > 0)
            http(',', script_out);
          http (sprintf ('\n\t["apjsm%d"\t, [', apa_idx), script_out);
          for (apa_hpctr := 0; apa_hpctr < apa_hpcount; apa_hpctr := apa_hpctr + 1)
                {
                  if (apa_hpctr > 0)
                http (',', script_out);
              http (cast (apa[4][apa_hpctr] as varchar), script_out);
                }
          http (']\t, [', script_out);
        -- todo: list service indexes. Do we need this in such a form?
          http ('\t]', script_out);
            }
        }
      http (subseq (source_UTF8, prev_end), res_out);
      http (' ];', script_out);
      http ('\n  var v_descs = [', script_out);
      -- todo list services. Do we need this in such a form?
      http (' ];', script_out);
      http ('\n  var v_links = [', script_out);
      for (app_ctr := 0; app_ctr < app_count; app_ctr := app_ctr + 1)
        {
          declare app any;
          app := m_app [app_ctr];
          if (app_ctr > 0)
            http(',', script_out);
          http (sprintf ('\n\t["%s"\t, "%s"\t, "%s"\t, "%s"\t]', app[3][0], app[3][1], app[3][2], app[3][3]), script_out);
        }
      http (' ];', script_out);
      http ('\n-->
    
    </script><script DEFER language="javascript" src="lookup.js"></script>', script_out);
      return
        replace (
          replace (
            string_output_string (res_out),
            '<body', '<body onload="makePopupDivs (v_descs, v_services, v_links)"' ),
          '</html>', string_output_string (script_out) || '</html>' );
    }
    ;
    
    Done. -- 0 msec.
    
    SQL>create function ptext_3 ()
    {
      return '<html>
      <head>
      <link href="gogo.css" rel="stylesheet" type="text/css" />
      </head>
      <body>
      <p>The OpenLink Virtuoso team has developers based in Bulgaria</p>
      </body>
    </html>';
    }
    ;
    
    Done. -- 10 msec.
    
    SQL>create function ptext_3 ()
    {
      return '<html>
      <head>
      <link href="gogo.css" rel="stylesheet" type="text/css" />
      </head>
      <body>
      <p>The OpenLink <strong>Virtuoso</strong> team has developers based in Bulgaria</p>
      </body>
    </html>';
    }
    ;
    
    Done. -- 0 msec.
    
    SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
    values (9, 'Gogo aps', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Gogo aps env', 10000, 0);
    
    Done. -- 0 msec.
    
    SQL>ap_add_phrases (9,
        vector (
          vector ('OpenLink'              , vector ('OpenLink'            , 'http://www.openlinksw.com'     , 'OpenLink Software'   , ' The industry leading provider of High Performance drivers'  )),
          vector ('OpenLink Virtuoso'   , vector ('OpenLink Virtuoso'   , 'http://virtuoso.openlinksw.com'  , 'OpenLink Virtuoso'   , ' OpenLink Universal Integration Middleware'          )),
        ) )
    ;
    
    Done. -- 0 msec.
    
    SQL>select ap_make_js_menus (vector (9), ptext_3(), 'x-any', 1);
    
    callret
    VARCHAR
    _______________________________________________________________________________
    
    <html>
      <head>
      <link href="gogo.css" rel="stylesheet" type="text/css" />
      </head>
      <body onload="makePopupDivs (v_descs, v_services, v_links)">
      <p>The OpenLink <strong>Virtuoso</strong> team has developers based in Bulgaria</p>
      </body>
    <script DEFER language="javescript"><!--
      var v_descs = [ ];
      var v_descs = [ ];
      var v_links = [
            ["OpenLink Virtuoso"    , "http://virtuoso.openlinksw.com"  , "OpenLink Virtuoso"   , " OpenLink Universal Integration Middleware"  ],
            ["OpenLink"     , "http://www.openlinksw.com"   , "OpenLink Software"   , " The industry leading provider of High Performance drivers"  ] ];
    -->
    
    </script><script DEFER language="javascript" src="lookup.js"></script></html>
    
    1 Rows. -- 0 msec.

# Geometry Data Types and Spatial Index Support

Virtuoso includes a spatial database capability from version 6.01.3126
onwards. This capability is specially geared towards geographical data
in RDF but can be used with SQL also. The functions implemented follow
the SQL MM spatial specification where applicable but the entire SQL MM
function set is not supported.

Spatial indexing is supported by a two dimensional R tree
implementation. The geometries supported may have from two to four
dimensions, with a choice of WGS 84 (or similar) latitude and longitude
coordinates with haversine distances or a flat 2 dimensional plane for
spatial reference system.

## Spatial References

The default reference system is WGS-84 with coordinates in degrees of
longitude and latitude on Earth. The SRID number for this is 4326 and is
assigned by default to all new geometries.
[`ST_Transform`](#fn_st_transform) can be used to re-calculate
coordinates of a shape from one spatial reference system to another.
[`ST_SetSRID`](#fn_st_setsrid) can be used for altering SRID without
altering coordinates.

Distances and precisions for "latitude-longitude" spatial reference
systems are in kilometers, as approximately calculated with the
haversine formula. For other systems they are in the same unit as the
coordinates.

## Geometric Objects

Virtuoso supports a wide variety of spatial features that can be
represented in WKT or SHP: BOX, BOX2D, BOX3D, BOXM, BOXZ, BOXZM
CIRCULARSTRING COMPOUNDCURVE CURVEPOLYGON EMPTY GEOMETRYCOLLECTION,
GEOMETRYCOLLECTIONM, GEOMETRYCOLLECTIONZ, GEOMETRYCOLLECTIONZM
LINESTRING, LINESTRINGM, LINESTRINGZ, LINESTRINGZM MULTICURVE
MULTILINESTRING, MULTILINESTRINGM, MULTILINESTRINGZ, MULTILINESTRINGZM
MULTIPOINT, MULTIPOINTM, MULTIPOINTZ, MULTIPOINTZM MULTIPOLYGON,
MULTIPOLYGONM, MULTIPOLYGONZ, MULTIPOLYGONZM POINT, POINTM, POINTZ,
POINTZM POLYGON, POLYGONM, POLYGONZ, POLYGONZM POLYLINE, POLYLINEZ RING,
RINGM, RINGZ, RINGZM

Some less popular types are not yet supported: CIRCULARSTRINGM,
CIRCULARSTRINGZ, CIRCULARSTRINGZM COMPOUNDCURVEM, COMPOUNDCURVEZ,
COMPOUNDCURVEZM CURVE, CURVEM, CURVEZ, CURVEZM CURVEPOLYGONM,
CURVEPOLYGONZ, CURVEPOLYGONZM GEOMETRY, GEOMETRYZ, GEOMETRYZM
MULTICURVEM, MULTICURVEZ, MULTICURVEZM MULTIPATCH MULTISURFACE,
MULTISURFACEM, MULTISURFACEZ, MULTISURFACEZM POLYHEDRALSURFACE,
POLYHEDRALSURFACEM, POLYHEDRALSURFACEZ, POLYHEDRALSURFACEZM POLYLINEM
SURFACE, SURFACEM, SURFACEZ, SURFACEZM TIN, TINM, TINZ, TINZM

For the sake of speed and scalability, spatial support has some
intentional restrictions, that will probably persist for long time.

\--- No support for circumpolar shapes. A ring with a pole inside it or
on the border of it may be treated as an error or result in wrong
calculations of spatial relations. E.g. the st\_intersects of two
triangles POLYGON((0 89, 120 89, 240 89, 0 89)) and POLYGON((0 88, 120
88, 240 88, 0 88)) may return FALSE. st\_intersects of two triangles
POLYGON((0 89, 60 90, 120 89, 0 89)) and POLYGON((120 88, 180 90, 240
88, 120 88)) may also return FALSE. Note that Equator is a circumpolar
shape.

\--- No support for long orthodromic or near-orthodromic arcs. The
implementation assumes that shapes reside inside their bounding boxes so
st\_intersects of two orthodromic arcs, LINE (0 1, 180 1) and LINE (90
1, 270 1) may return FALSE. However big shapes made of small segments
(such as a coastline of Eurasia) will be handled correctly. Shapes that
are close to 180 longitude get two sets of bounding boxes, shifted 360
one from another, so relations between Alaska and Chukotka will be
calculated correctly no matter what offset is used.

\--- In order to deal with weird data sources, the range for longitudes
is -270 to -540 and the range for latitudes is -90 to +90 for most cases
and -96 to +96 for some features such as bounding boxes. If the parsing
of a shape did not report range errors for co-ordinates then there's no
warranty that all points are in WGS ranges.

\--- Peculiarities like self-touch or self-intersection of polygons can
be detected, but no warranties are given.

\--- Arcstrings are poorly supported and their support will never be
optimized for speed. Each arc is supposed to be no longer than 180
degrees. As a result, ESRI circles that consist of two arcs 180+180 are
supported whereas ST\_Intersects on "ill" circles like 270+90 may return
wrong answers.

## Precision of Geometries

The internal precision of geometry operations is 64 bit IEEE floating
point. Normally, a geometry index for geography uses can be made with 32
bit floats for space efficiency, as these still give a precision of
about 2 meters on the surface of the Earth. A geometry object is stored
with all coordinates either as float or double depending on which data
type was supplied in creating the object. Note that the object itself
can have more precise coordinates than the representation of its
bounding box in the R tree index.

Bounding boxes for shapes can be calculated approximately as soon as
shape contain any arcs. In any case, bounding box of a shape is a bit
bigger than the shape itself in order to tolerate rounding errors.
Predicates for spatial relations accept an additional, non-standard,
argument for tolerance. If the tolerance is greater than zero, borders
of shapes are treated as wide lines with thickness is approximately
equal to the specified tolerance. That is useful for dealing with
inaccurate data such as amateur GPS/GLONASS tracks, coordinates rounded
to minutes when published in Dbpedia and the like.

## Predicates

    isgeometry (in x any)

Returns 1 if the argument is a geometry.

> **Tip**
> 
> [`isgeometry`](#fn_isgeometry)

## Querying Geometric Relations

The SQL MM predicates [`st_intersects`](#fn_st_intersects) ,
[`st_contains`](#fn_st_contains) and [`st_within`](#fn_st_within) can be
used to test whether two geometries overlap in different ways.

[`st_intersects`](#fn_st_intersects) means that the 1st and 2nd
arguments have at least one shared point,
[`st_contains`](#fn_st_contains) means that the 2nd argument is fully
contained in the 1st argument, [`st_within`](#fn_st_within) means that
the 1st argument is fully contained within the 2nd argument.

These functions are extended with a third argument which gives a
precision. The precision is a number that specifies a maximum distance
between two points such that the points will still be considered to
overlap. If both the 1st and 2nd arguments are points, then precision
can be interpreted as the maximum distance between them.

These do not require the presence of a geometry index but will use one
if one is present and one of the geometry arguments is a column on which
there is such an index.

## Defining a Geometry Index

The below sequence defines a table called geo and a geometry index on
its geo column.

    create table GEO (ID bigint, GEO any, primary key (ID))
     alter index geo on geo partition (id int);
    
    CREATE TABLE GEO_INX ( X real no compress,
                           Y real no compress,
                           X2 real no compress,
                           Y2 real no compress,
                           id bigint no compress,
                           primary key (X, Y, X2, Y2, id))
                           ALTER INDEX geo_inx ON geo_inx PARTITION (id int);
    
    INSERT INTO sys_vt_index ( vi_table,
                               vi_index,
                               vi_col,
                               vi_id_col,
                               vi_index_table,
                               vi_id_is_pk,
                               vi_options)
      VALUES ('DB.DBA.GEO',
              'GEO',
              'GEO',
              'ID',
              'DB.DBA.GEO_INX',
              1,
              'G');
    
    -- Reload the changed schema
    __ddl_changed ('DB.DBA.GEO');

A geometry index is a table of always five columns, the first 4 are the
lower x, y and higher x, y of the object's bounding box, id is the
identifier of the object, a foreign key into the table holding the
geometries. In a cluster setting the geometry index must be partitioned
on the id column. The columns of a geometry index must never be
compressed, hence the mandatory no compress declaration.

Geometry indices are declared in the sys\_vt\_index table, which also
declares text indices. The G in the options column declares that this is
a geometry index.

A geometry index will be used when appropriate. The table holding the R
tree with the bounding boxes should not normally be accessed directly.
Explicit selects from a geometry index table with conditions on the
columns will not generally work since the collation is not linear as in
a regular index. Inserts by means other than geo\_insert are not
allowed.

## Insert and Delete

    geo_insert (in tb any, in geo any, in id int);
    geo_delete (in tb any, in geo any, in id int);

These functions insert and delete a geometry from an R tree index. The
tb must be a fully qualified name of an R tree table.

These functions will typically be used from triggers on a geometry
column. The functions are transactional and make a transaction log
record of the action.

> **Tip**
> 
> [`geo_insert`](#fn_geo_insert)
> 
> [`geo_delete`](#fn_geo_delete)

## Using Geometries in Client Applications and SQL Procedures

In SQL procedures, a geometry is a member of the ANY data type. The
[`isgeometry ()`](#fn_isgeometry) function can be used for testing if an
object is a geometry. A geometry can only be stored in a column declared
to be of type ANY.

If a geometry would be returned to a client application as part of a
result set, it is returned as a string containing its WKT text
representation. For a client application to pass geometries to the
server, it must pass these either as a WKT string parameter to
st\_geomfromtext or as numeric coordinate values for st\_point or
related functions. This applies to all clients, ODBC, JDBC, .net and any
RDF frameworks.

> **Tip**
> 
> [RDF and Geometry](#rdfsparqlgeospat)

## Virtuoso 7.1+ Geo Spatial Data type and function enhancements

As of Virtuoso 7.1+ (open source and commercial) a number of major
enhancements in Geo Spatial support have been made to improve the
Geometry data types and functions supported, as well as improve
compliance with the emerging [GeoSPARQL](#) and [OGC](#) standards.

### Virtuoso Geo Spatial Geometry data types and sample queries

The table below outlines the common WKT (Well Known Text)
representations for several types of geometric objects used in RDF:

![Geo Spatial Geometry Data Types](ui/geosptypes.png)

The following queries "counts the number of items of each type whose
coordinates fall within a bounded box shape" for the various RDF
geometry data types now supported by Virtuoso. The links are to live
examples of the query running against the OpenLink LOD Cloud Server
instance.

#### BOX

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
       ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
       ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
       FILTER(bif:st_intersects(bif:st_geomfromtext("BOX(0.3412 43.5141, 9.3412 48.0141)"), ?p))
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### POLYGON

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2))" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### POLYGON WITH HOLE

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2), (3 3, 5 5, 6 2, 3 3))" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### MULTIPOLYGON

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTIPOLYGON(((1 2, 6 1, 9 3, 3 6, 1 2)), ((4 9, 7 6, 9 8, 4 9)))" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### GEOMETRY COLLECTION

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "GEOMETRYCOLLECTION( POINT(4 5), POINT(7 4), POINT(6 2), LINESTRING(4 5, 6 7, 7 4, 6 2), POLYGON((1 2, 6 1, 9 3, 8 5, 3 6, 1 2)) )" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### MULTI POINT

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTIPOINT(3 7, 4 2, 8 6)" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### LINE STRING

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "LINESTRING(1 2, 3 6, 9 4)" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### MULTI LINE STRING

    SELECT ?f AS ?facet COUNT(?s) AS ?cnt
    FROM <http://linkedgeodata.org>
    WHERE
      {
        ?s <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?f .
        ?s <http://www.w3.org/2003/01/geo/wgs84_pos#geometry> ?p .
        FILTER( bif:st_intersects( bif:st_geomfromtext( "MULTILINESTRING((1 8, 4 4), (4 9, 8 5, 6 2, 1 4))" ), ?p ) )
      }
    GROUP BY ?f
    ORDER BY DESC(?cnt)
    LIMIT 10

  - [View the SPARQL Query Definition via SPARQL Protocol URL;](#)

  - [View the SPARQL Query Results via SPARQL Protocol URL](#)

#### Supported types of shapes

    BOX, BOX2D, BOX3D, BOXM, BOXZ, BOXZM
    CIRCULARSTRING
    COMPOUNDCURVE
    CURVEPOLYGON
    EMPTY
    GEOMETRYCOLLECTION, GEOMETRYCOLLECTIONM, GEOMETRYCOLLECTIONZ,
    GEOMETRYCOLLECTIONZM
    LINESTRING, LINESTRINGM, LINESTRINGZ, LINESTRINGZM
    MULTICURVE
    MULTILINESTRING, MULTILINESTRINGM, MULTILINESTRINGZ, MULTILINESTRINGZM
    MULTIPOINT, MULTIPOINTM, MULTIPOINTZ, MULTIPOINTZM
    MULTIPOLYGON, MULTIPOLYGONM, MULTIPOLYGONZ, MULTIPOLYGONZM
    POINT, POINTM, POINTZ, POINTZM
    POLYGON, POLYGONM, POLYGONZ, POLYGONZM
    POLYLINE, POLYLINEZ
    RING, RINGM, RINGZ, RINGZM

#### Not yet supported types

    CIRCULARSTRINGM, CIRCULARSTRINGZ, CIRCULARSTRINGZM
    COMPOUNDCURVEM, COMPOUNDCURVEZ, COMPOUNDCURVEZM
    CURVE, CURVEM, CURVEZ, CURVEZM
    CURVEPOLYGONM, CURVEPOLYGONZ, CURVEPOLYGONZM
    GEOMETRY, GEOMETRYZ, GEOMETRYZM
    MULTICURVEM, MULTICURVEZ, MULTICURVEZM
    MULTIPATCH
    MULTISURFACE, MULTISURFACEM, MULTISURFACEZ, MULTISURFACEZM
    POLYHEDRALSURFACE, POLYHEDRALSURFACEM, POLYHEDRALSURFACEZ,
    POLYHEDRALSURFACEZM
    POLYLINEM
    SURFACE, SURFACEM, SURFACEZ, SURFACEZM
    TIN, TINM, TINZ, TINZM

### Virtuoso Geo Spatial geometry functions

The following Virtuoso Geo Spatial geometry functions are available for
use in both SQL and RDF Geo Spatial queries. The listed functions are
built-in SQL functions. As all built-in functions of Virtuoso,
geo-specific functions can be called from SPARQL with prefix `bif:` .
For example:

    bif:earth_radius()
    etc.

  - [`earth_radius()`](#fn_earth_radius) : returns geom.mean of radius
    of Earth in kilometers, 6367.43568

  - [`haversine_deg_km (lat1, long1, lat2,
    long2)`](#fn_haversine_deg_km) : returns distance between two points
    on Earth sphere, adjusting radius of sphere to latitudes.

  - [`dist_from_point_to_line_segment (Xpoint,
                                                    Ypoint, Xsegment1, Ysegment1,Xsegment2,
    Ysegment2)`](#fn_dist_from_point_to_line_segment) : returns the
    distance between a point and a segment on a plane.

  - [`st_point`](#fn_st_point) : returns a point with given coordinates
    in default SRID. z and/or m may be missing or equal to NULL,
    indicating the absence of co-ordinate.

  - [`st_linestring (item1, item2,..., itemN)`](#fn_st_linestring) :
    returns a linestring in default SRID, the coordinates of vertices
    are specified by arguments that are points, 2-, 3- or 4-item vectors
    of coordinates, linestrings, arcstrings or vectors of the above
    mentioned values. Repeating vertices are automatically removed,
    except the case of repeating vertices in the middle of a
    linestring/arcstring argument.

  - [`st_x()`](#fn_st_x) : returns X or longitude of a point.

  - [`st_y()`](#fn_st_y) : returns X or longitude of a point.

  - [`ST_XMin (shape)`](#fn_st_xmin) ,
    
    [`ST_YMin (shape)`](#fn_st_ymin) ,
    
    [`ST_XMax (shape)`](#fn_st_xmax) ,
    
    [`ST_YMax (shape)`](#fn_st_ymax) : return boundaries of a bounding
    box around a shape. Bounding boxes around arcs are calculated in
    assumption that no one arc is longer than a half of full circle.

  - [` st_intersects (shape1, shape2 [, proximity])
     `](#fn_st_intersects) : checks whether two shapes intersect or some
    of its points are within the specified proximity. Current version is
    not complete and does not support arcs of all sorts and rings of
    polygons, this is fixed in the next release.

  - `st_may_intersect (shape1, shape2 [, proximity])` : checks whether
    bounding boxes of two shapes intersect or some of its points are
    within the specified proximity. This is much faster than full
    
    [`st_intersects()`](#fn_st_intersects) check (actually that is the
    initial part of
    
    [`st_intersects()`](#fn_st_intersects) execution)

  - [`(haystack_shape, needle_shape [, proximity])`](#fn_st_contains) :

  - [` st_within (needle_shape, haystack_shape [, proximity])
     `](#fn_st_within) : checks whether `haystack_shape` contains the
    `needle_shape` . If proximity is specified, it is treated as an
    extra wide border around `haystack_shape` . In current version, only
    a combination of bounding box and a point is supported, the
    functionality will be extended in the next release.

  - [`st_distance (shape1, shape2)`](#fn_st_distance) : returns the
    distance in units of plane or in kilometers on sphere.

  - [` isgeometry (v)  `](#fn_isgeometry) : returns whether the given v
    is a spatial object.

  - [`st_astext (shape)`](#fn_st_astext) : returns EWKT representation
    of a shape.

  - [`ST_SRID (shape)`](#fn_st_srid) : returns SRID of shape's spatial
    reference system or 0 for shape on plane.

  - [`ST_SetSRID (shape, new_srid)`](#fn_st_setsrid) : replaces the SRID
    of a shape but does not transform the shape or its coordinates from
    old SRID to a new one.

  - [`st_geomfromtext (ewkt_text)`](#fn_st_geomfromtext) : Parses the
    string and returns the corresponding geometry.

  - [`st_ewkt_read (ewkt_text)`](#fn_st_ewkt_read) : Parses the giwen
    text as a EWKT and returns the parsed shape.

  - [`http_st_ewkt (shape, ses)`](#fn_http_st_ewkt) : Writes a EWKT
    representation of a shape to the given session, a fast replacement
    for
    
    [`st_astext (shape)`](#fn_st_astext) .

  - [`http_st_dxf_entity (shape, attrs, ses)`](#fn_http_st_dxf_entity) :
    writes a DXF (Data Exchange Format) representation of shape into the
    given output session.Attrs is a vector of arbitrary DXF properties
    in form (tag1, value1, tag2, value2...) where tags are integer codes
    according to DXF specification, related values are not validated and
    printed to the session as is. Current version does not support
    ARCSTRINGs, CURVEs and CURVEPOLYGONs. If shape is null, the function
    returns without writing anything to the shape.

  - [`st_get_bounding_box (shape)`](#fn_st_get_bounding_box) : returns
    BOX2D that is a bounding box of a shape.

  - [`GeometryType (shape)`](#fn_geometrytype) : returns EWKT type name
    of a shape.

  - [`ST_NumGeometries (shape)`](#fn_st_numgeometries) : returns number
    of members of a MULTI... or ...COLLECTION shape, 1 for other sorts
    of shapes.

  - [`ST_GeometryN (shape, idx)`](#fn_st_geometryn) : Given a 1-based
    index of a member of a MULTI... or ...COLLECTION shape, returns the
    member.

  - [`ST_ExteriorRing (polygon_shape)`](#fn_st_exteriorring) : Returns
    an external (the very first) ring of a polygon.

  - [`ST_NumInteriorRings (polygon_shape)`](#fn_st_numinteriorrings) :
    returns number of interior rings of the given polygon, NULL if shape
    is not a polygon.

  - [`ST_InteriorRingN (polygon_shape, idx)`](#fn_st_interiorringn) :
    Given a 1-based index of an interior ring of a polygon, returns the
    ring. Wrong index is not reported as an error and NULL is returned.

  - [`st_get_bounding_box_n (shape, idx)`](#fn_st_get_bounding_box_n) :
    Given a 1-based index of a member of a MULTI... or ...COLLECTION
    shape, returns the bounding box of a member. This is a fast
    equivalent of
    
    [`st_get_bounding_box (ST_GeometryN
    (shape,idx))`](#fn_st_get_bounding_box) .

  - [`ST_Translate (shape, dX, dY [, dZ])`](#fn_st_translate) : returns
    a copy of a shape with all coordinates shifted by the provided dX,
    dY and dZ.

  - [`ST_TransScale (shape, dX, dY, Xfactor,
    Yfactor)`](#fn_st_transscale) : returns a copy of a shape with all
    coordinates shifted by the provided dX, dY and then multiplied by
    Xfactor and Yfactor. In current version, differente values for
    Xfactor and Yfactor will result in distorted arcs.

  - [`st_transform_by_custom_projection (shape, algorithm_id,
    ...)`](#fn_st_transform_by_custom_projection) : Performs a custom
    projection of shape, using the specified algorithm and
    algorithm-specific arguments. Current version supports only one
    algorithm, [`st_transform_by_custom_projection (shape, 'OLAEAPS',
    long_of_center,
    lat_of_center)`](#fn_st_transform_by_custom_projection) for Oblique
    Lampert Azimuthal Equal-Area Projection System with the specified
    center point.

  - [`ST_Transform (shape, deST_SRID, [orig_proj4_string,
    dest_proj4_string])`](#fn_st_transform) : Transforms the given shape
    from its current spatial reference system to one specified by
    `deST_SRID` . Two optional arguments are for "cheating": the SRID of
    the resulting shape is set to `deST_SRID` but the conversion is done
    by proj4 using `origin_proj4_string` for projection of original
    shape and `dest_proj4_string` for the result. If `orig_proj4_string`
    or `dest_proj4_string` argument is passed but is NULL instead of
    string, the projection corresponding to original or destination SRID
    is used. [`ST_Transform`](#fn_st_transform) is provided by a
    separate plugin named v7proj4, as described below. When the plugin
    is loaded, functions like [`st_intersects()`](#fn_st_intersects)
    support pairs of arguments with different SRIDs by converting coords
    of second argument into the system of the first one, as required by
    OGC and GeoSPARQL.

  - [`postgis_proj_version()`](#fn_postgis_proj_version) : Returns the
    version of proj4 in use, as a string, for compatibility with
    PostGIS.

### v7proj4 plugin

The Virtuoso v7proj4 hosted plugin module is required for performing
transformation between different co-ordinates systems using the
[`ST_Transform()`](#fn_st_transform) function. The plugin is based on
[Frank Warmerdam's proj4](#) library and it's practical to have the
proj4 package installed on every box of Virtuoso cluster, even if the
build is performed on single machine or on different location at all.
The reason is that the plugin should load data about coordinate systems
to work and the simplest way to get the right data from a high-quality
source is to use the package.

#### Compiling open source v7proj4 plugin

The v7proj4 is currently available in the default develop/7 branch of
the "[v7fasttrack](#) " git repository and can be build as follows:

    git clone https://github.com/v7fasttrack/virtuoso-opensource.git
    cd virtuoso-opensource
    ./autogen.sh
    export CFLAGS="-msse4.2 -DSSE42"
    ./configure
    make -j 24
    make install

Note first the "proj.4" library must be installed on the system and can
be proj.4 download area, which the configure script will detect the
installation of enabling the v7proj4 plugin library to be built in
\~/libsrc/plugin/.libs:

    ls libsrc/plugin/.libs/v7proj4*
    libsrc/plugin/.libs/v7proj4.a
    libsrc/plugin/.libs/v7proj4.la
    libsrc/plugin/.libs/v7proj4.lai
    libsrc/plugin/.libs/v7proj4_la-import_gate_virtuoso.o
    libsrc/plugin/.libs/v7proj4_la-sql_v7proj4.o
    libsrc/plugin/.libs/v7proj4_la-v7proj4_plugin.o
    libsrc/plugin/.libs/v7proj4.so
    libsrc/plugin/.libs/v7proj4.ver

#### Installation and Configuration of v7proj4 plugin

When the plugin (v7proj4.so) is built, it needs to be added to the
\[Plugins\] section of Virtuoso configuration file (virtuoso.ini or the
like), also on every node of a cluster:

    [Plugins]
    LoadPath = ./plugins
    Load2    = plain, v7proj4

If everything is fine then the virtuoso.log file will contain something
like the following lines after the next startup:

    21:30:10 { Loading plugin 1: Type `plain', file `shapefileio' in `.'
    21:30:10   ShapefileIO version 0.1virt71 from OpenLink Software
    21:30:10   Shapefile support based on Frank Warmerdam's Shapelib
    21:30:10   SUCCESS plugin 1: loaded from ./plugins/shapefileio.so }
    21:30:10 { Loading plugin 2: Type `plain', file `v7proj4' in `.'
    21:30:11   plain version 3208 from OpenLink Software
    21:30:11   Cartographic Projections support based on Frank Warmerdam's
    proj4 library
    21:30:11   SUCCESS plugin 2: loaded from ./plugins/v7proj4.so }
    21:30:11 OpenLink Virtuoso Universal Server
    21:30:11 Version 07.10.3208-pthreads for Linux as of Mar 31 2014
    ...
    21:30:28 PL LOG: Initial setup of DB.DBA.SYS_V7PROJ4_SRIDS data from
    files in "/usr/share/proj"
    21:30:30 PL LOG: DB.DBA.SYS_V7PROJ4_SRIDS now contains 6930 spatial
    reference systems
    ...
    21:30:32 Server online at 1720 (pid 9654)

To store descriptions of coordinate systems, the plugin creates a table:

    create table DB.DBA.SYS_V7PROJ4_SRIDS (
     SR_ID integer,
     SR_FAMILY varchar not null,
     SR_TAG varchar,
     SR_ORIGIN varchar not null,
     SR_IRI IRI_ID_8,
     SR_PROJ4_STRING varchar not null,
     SR_WKT varchar,
     SR_COMMENT varchar,
     SR_PROJ4_XML any,
     primary key (SR_ID, SR_FAMILY) )
    ;

and fills it with data from files epsg, esri, esri.extra, nad83 and
nad27 of directory /usr/share/proj. Note these files must exist in the
/usr/share/proj directory otherwise a message will be reported in the
log file indicated the file could not be found. Every row of the table
is identified with name of "family" of coordinate systems and an integer
SRID. Different sources may assign same SRID to different reference
systems, however descriptions of well-known systems match exactly or the
difference is not noticeable for any practical application.

The loading process uses family names 'EPSG', 'ESRI', 'NAD83' and
'NAD27'. When the [`ST_Transform()`](#fn_st_transform) searches for a
coordinate system that corresponds to a given SRID then it returns first
record found while checking the following families in the following
order: 'PG', 'EPSG', 'ESRI','NAD83', 'NAD27'. Thus it is practical to
put all custom definitions in 'PG' family, thus they will get the
highest priority.

A sample [EPSG](#) file containing the mapping for the proj.4
[EPSG:4326](#) coordinate system is:

    $ cat /usr/share/proj/epsg
    <4326>+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs<>

    SQL> SELECT * FROM DB.DBA.SYS_V7PROJ4_SRIDS;
    SR_ID             SR_FAMILY          SR_TAG    SR_ORIGIN              SR_IRI    SR_PROJ4_STRING                                    SR_WKT    SR_COMMENT   SR_PROJ4_XML
    INTEGER NOT NULL  VARCHAR NOT NULL   VARCHAR   VARCHAR NOT NULL       VARCHAR   VARCHAR NOT NULL                                   VARCHAR   VARCHAR      VARCHAR
    _______________________________________________________________________________
    
    4326              EPSG               4326      /usr/share/proj/epsg   NULL      +datum=WGS84 +ellps=WGS84 +no_defs +proj=longlat             NULL         NULL
    
    1 Rows. -- 0 msec.
    SQL>

There are two procedures are available for loading more co-ordinate
systems:

1.  `DB.DBA.V7PROJ4_LOAD_SYS_SRIDS` : it is called at server startup if
    the v7proj4 plugin is loaded:
    
        DB.DBA.V7PROJ4_LOAD_SYS_SRIDS (
          in projdir varchar := '/usr/share/proj',
          in only_if_empty_table integer := 0
        )

2.  `DB.DBA.V7PROJ4_LOAD_INIT_FILE` : it is lower-level procedure:
    
        DB.DBA.V7PROJ4_LOAD_INIT_FILE (
          in path varchar,
          in _sr_family varchar
        )

The main part of `DB.DBA.V7PROJ4_LOAD_SYS_SRIDS()` is a sequence of:

    DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/epsg', 'EPSG');
    DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/esri', 'ESRI');
    DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/esri.extra', 'ESRI');
    DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/nad83', 'NAD83');
    DB.DBA.V7PROJ4_LOAD_INIT_FILE (projdir || '/nad27', 'NAD27');

Rows with same SRID but different `SR_FAMILY` may exist in the table,
however only one projection per SRID is used and `SR_FAMILY` defines the
priority. The internal search query for projection by SRID is:

    SELECT COALESCE
       (
         ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='PG'),
         ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='EPSG'),
         ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='ESRI'),
         ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='NAD83'),
         ( SELECT SR_PROJ4_STRING FROM DB.DBA.SYS_V7PROJ4_SRIDS WHERE SR_ID=:0 AND SR_FAMILY='NAD27')
       )

so for [`ST_Transform()`](#fn_st_transform) function 'PG' overrides
everything else, EPSG is the next highest priority, then ESRI, NAD83 and
NAD27. However custom queries and procedure may select whatever they
please, including sr families not listed here or strings from other
tables etc., and feed projection strings directly to
[`ST_Transform()`](#fn_st_transform) .

The co-ordinate systems can also be updated by direct manipulations on
`DB.DBA.SYS_V7PROJ4_SRIDS table` (the table it is readable for public
and writable for DBA only). When the table is edited, call function
"`Proj4 cache_reset()` " to prevent SQL runtime from using previously
prepared projections that might become obsolete after changes in the
table. Note that proj4 projections are for normalized data in radians
whereas Virtuoso stores shapes using numbers that come from WKT, i.e.
they're latitudes and longitudes in degrees for almost all cases.

The v7proj4 plugin automatically applies `RAD_TO_DEG` multiplier before
conversion and/or `RAD_TO_DEG` multiplier after conversion when source
and/or destination coordinate systems are latitude-longitude or
geocentric. Even if this conversion is done automatically, you should
remember that it happens, for the following reason. Many "how-to"
instructions for spatial data sets contain paragraphs like "how to
convert these data to WGS-84" and sample C/C++ code contains
transformations like `{ x *= RAD_TO_DEG; y *= RAD_TO_DEG; }` . These
transformations will probably be redundant in the corresponding
Virtuoso/PL code whereas proj4 strings can be used unchanged and passed
as 3rd and 4th arguments of [`ST_Transform()`](#fn_st_transform)
function. If degrees-to-radians conversion is made twice then the data
can be calculated as if the shape is located in a totally different
place of ellipsoid. If the post-transformation radians-to-degrees
conversion is also made twice, the resulting shape may look like the
real one but coordinates may be tens kilometers away from correct
values.

#### ST\_Transform() Example

Below are some example uses of the [`ST_Transform()`](#fn_st_transform)
function to transform some of the sample coordinate systems load into
Virtuoso:

    SQL> SELECT * FROM DB.DBA.SYS_V7PROJ4_SRIDS;
    SR_ID              SR_FAMILY          SR_TAG    SR_ORIGIN              SR_IRI    SR_PROJ4_STRING                                                                                                                                                                         SR_WKT    SR_COMMENT   SR_PROJ4_XML
    INTEGER NOT NULL   VARCHAR NOT NULL   VARCHAR   VARCHAR NOT NULL       VARCHAR   VARCHAR NOT NULL                                                                                                                                                                        VARCHAR   VARCHAR      VARCHAR
    _______________________________________________________________________________
    
    2005               EPSG               2005      /usr/share/proj/epsg   NULL      +ellps=clrk80 +k=0.9995000000000001 +lat_0=0 +lon_0=-62 +no_defs +proj=tmerc +units=m +x_0=400000 +y_0=0                                                                                          NULL         NULL
    2249               EPSG               2249      /usr/share/proj/epsg   NULL      +datum=NAD83 +ellps=GRS80 +lat_0=41 +lat_1=42.68333333333333 +lat_2=41.71666666666667 +lon_0=-71.5 +no_defs +proj=lcc +to_meter=0.3048006096012192 +x_0=200000.0001016002 +y_0=750000             NULL         NULL
    4326               EPSG               4326      /usr/share/proj/epsg   NULL      +datum=WGS84 +ellps=WGS84 +no_defs +proj=longlat                                                                                                                                                  NULL         NULL
    
    3 Rows. -- 1 msec.
    SQL> SELECT ST_Transform (st_geomfromtext ('POLYGON((-16 20.25,-16.1 20.35,-15.9 20.35,-16 20.25))'), 1, '+proj=latlong +ellps=clrk66', '+proj=merc +ellps=clrk66 +lat_ts=33');
    unnamed
    VARCHAR NOT NULL
    _______________________________________________________________________________
    
    SRID=1;POLYGON((-1495284.211473 1920596.789917,-1504629.737795 1930501.842961,-1485938.685152 1930501.842961,-1495284.211473 1920596.789917))
    
    1 Rows. -- 0 msec.
    SQL> SELECT ST_AsText(ST_Transform(ST_GeomFromText('POLYGON((743238 2967416,743238 2967450, 743265 2967450,743265.625 2967416,743238 2967416))',2249),4326)) AS wgs_geom;
    wgs_geom
    VARCHAR NOT NULL
    _______________________________________________________________________________
    
    POLYGON((-71.177685 42.390290,-71.177684 42.390383,-71.177584 42.390383,-71.177583 42.390289,-71.177685 42.390290))
    
    1 Rows. -- 1 msec.
    SQL>

# SQL Bulk Load, ELT, File Tables and Zero Load Operations

## File Tables

Virtuoso supports mapping files of comma separated values as tables from
version 7.00.3206. This makes bulk load of relational data
straightforward and very fast. This also makes it possible to query data
in files without any loading into the database. The latter is specially
convenient if data is queried just once, where loading and subsequently
dropping the data would be needless overhead. Also arbitrary ETL
transformations can be expressed in SQL, reading from a file table and
inserting into a database table. This includes the whole range of SQL
functionality, including intermediate aggregations and the like.

This feature deprecates the CSV load functions in previous versions,
e.g. csv\_load.

Queries can freely mix file tables and regular tables. Joins with file
tables make hash join plans where the smaller file is copied into a
memory resident hash table. For very large hash tables, partitioned hash
join can be used, thus arbitrary joining between files is possible, fast
and convenient.

A file table is declared with a regular create table statement. If the
table definition includes a primary key, the file is assumed to be
sorted as declared. In most cases a primary key should not be declared
when creating a file table. After the create table statement, the
procedure fs\_set\_file declares that the table is in fact a file. In a
cluster setting the file should be visible to all the server processes
via a shared file system.

For example, to bulk load the TPC-H part table:

    CREATE TABLE PART_F (
        P_PARTKEY     INTEGER NOT NULL,
        P_NAME        VARCHAR(55) NOT NULL,
        P_MFGR        CHAR(25) NOT NULL,
        P_BRAND       CHAR(10) NOT NULL,
        P_TYPE        VARCHAR(25) NOT NULL,
        P_SIZE        INTEGER NOT NULL,
        P_CONTAINER   CHAR(10) NOT NULL,
        P_RETAILPRICE double precision NOT NULL,
        P_COMMENT     VARCHAR(23) NOT NULL    );
    
    ft_set_file ('PART_F', 'src/part.tbl', delimiter => '|');
    
    -- turn off logging and set insert mode to auto committing, non-transactional
    log_enable (2);
    
    -- read the file and insert into the previously create part table
    insert into part select * from part_f;

The ft\_set\_file procedure takes the table name as first argument and a
file system path relative to the server's working directory as the
second argument. Optional arguments allow specifying a delimiter,
newline character and escape character.

``` 
    create procedure ft_set_file (in tb varchar, in fname varchar, in delimiter varchar, in newline varchar :=  '\n', in esc varchar := null)
```

Creating a file table requires dba group privileges and the file is
subject to the file system access limitations that apply to
file\_to\_string and other file system access functions.

The newline and escape characters need to be single character strings. A
newline or escape character following the escape character is added to
the parsed input without its special interpretation.

Each column in the CSV file is expected to end with the delimiter
character. A field of zero length is considered a SQL NULL value, i.e.
if two delimiters are adjacent or if a line begins with the delimiter,
the field is considered NULL. The text in the field is parsed according
to the data type declared for the column whose position in the create
table corresponds to the field position on the line. The parsing is as
by the SQL cast function from a varchar value. If the cast fails the
line is silently ignored.

When a table is declared as a file table, the file is sampled and
statistics are written into the sys\_col\_stat table. In this way the
system is capable of making correct query plans involving joins of file
tables. For this reason, the file should exist and have the relevant
content when the file table is created.

A file table will be read in parallel on multiple threads if a normal
table would be read in parallel in the same situation. In a single
server, the ThreadsPerQuery (enable\_qp in sys\_stat) setting controls
the number of threads used. In a cluster setting each elastic slice
corresponds to a fraction of the file. This is why the file is expected
to be visible from all the servers.

If a table had previous content and subsequently was declared a file
table, the previous content will no longer be visible. The file table
may cease to be a file table by the dba deleting the corresponding row
from sys\_file\_table and calling \_\_ddl\_changed on the file table. At
this point the previous, databases resident content of the table will be
visible again. However the statistics gathered from the file will still
shadow the statistics of the table.

It is often the case that many CSV files have the same structure. For
these cases it is sufficient to create a single table and attach it to
one of the files with ft\_set\_file. This file will provide the
statistics. In order to read a different file, one can use the FROM
clause in the TABLE OPTION clause of in the FROM clause of a select
statement, as follows:

    -- get the count of well formed part rows from the part.tbl file
    SELECT COUNT (*)
      FROM part_f;
    
    -- do the same from src/part.tbl.2
    SELECT COUNT (*)
      FROM part_f TABLE OPTION (FROM 'src/part.tbl.2');

The value of the FROM option can be an arbitrary expression, however it
must be independent of values bound by the containing statement. It may
depend on variables bound in an enclosing stored procedure or from
parameters but it cannot join to a column of another table in the same
select statement.

Arbitrary search conditions can be applied to file tables, for example:

    SELECT p_name, p_size, p_partkey
      FROM part_f
     WHERE p_name LIKE '%green%';

Joins are possible, for example:

    SELECT SUM (ps_availqty)
      FROM partsupp, part_f
     WHERE ps_partkey = p_partkey
       AND p_name LIKE '%green%';

This would join the partsupp table to the part file.

File tables are not cached by the DBMS, they are read from the OS every
time they are needed. A single query will not read the same file
multiple times, unless in the case of a partitioned (multtipass) hash
join. Nested loop joins are not applied to file tables. File tables
cannot be updated and no transaction control applies to them. Select
permissions can be granted as for any other table.

## Parallel Insert With File Tables and Transactions

A file table is copied into a database resident table with an INSERT...
SELECT statement. Such a statement executes in parallel if the session
is in auto commit mode, i.e. log\_enable (2) or log\_enable (3) has been
previously executed on the session.

A file can be loaded inside a transaction if the connection is not in
auto commit log\_enable (2) or 3. This will be multithreaded if
enable\_mt\_txn is 1 in the \[Flags\] section of the ini file or
\_\_dbf\_set ('enable\_mt\_txn', 1) has been executed previously. The
setting is global. Defaults vary according to server version. Use
sys\_stat ('enable\_nt\_txn') to read the value of the setting.

For long files the transaction is liable to run out of rollback space.
File table operations as such do not affect the transaction context.
Explicit commits may be interspersed in a select statement from a file
or other tables.

For example, the history keeping dimension updates from TPC DS can be
implemented as follows. The item table is a history keeping dimension
that has an index on the i\_item\_id business key and has a primary key
of item surrogate key, with a new value for each version of the item
record. The item record has a start and end date (i\_rec\_start\_date,
i\_rec\_end\_date) to mark the period of validity of the information. A
null value in item\_rec\_end\_date marks the currently applicable
record. When the item data is updated, the, a new item is inserted and
the previously current item record has its end date set to the current
date. These operations must occur atomically. Otherwise the
implementation may choose whether to update many item records in the
same transaction.

In the below listing most columns have been left out for brevity:

    CREATE PROCEDURE item_update (in i_id varchar,...)
    {
      vectored;
    
      UPDATE item
         SET i_rec_end_date = curdate
       WHERE i_id = i_id
         AND i_rec_end_date IS NULL;
    
      INSERT INTO item (i_ietm_sk, i_item_id, i_rec_end_date,...)
                VALUES (sequence_next ('item_sk_seq'), i_id, NULL,... )
      not vectored { COMMIT WORK};
    }
    
    SELECT COUNT (item_update (i_item_id,....)
      FROM item_f....;

The select statement call the item\_update procedure on a vector of item
ids and other columns. The procedure marks the expired record and
inserts the new record, assigning new surrogate keys from a sequence.
After each batch it performs one commit. The next batch of items are
updated in a separate transaction.

This should be run on a single thread. In a multithreaded transaction
the threads may not issue individual commits. The code could be
multithreaded by leaving out the commit from the stored procedure. Then
the commit would have to be after the completion of the select
statement.

The following isql script bulk loads a whole TPC-H database. We leave
out the create tables and ft\_set\_files for brevity, they are all as in
the part example above.

    log_enable (2); INSERT INTO lineitem SELECT * FROM lineitem_f &
    log_enable (2); INSERT INTO orders   SELECT * FROM orders_f &
    log_enable (2); INSERT INTO customer SELECT * FROM customer_f &
    log_enable (2); INSERT INTO part     SELECT * FROM part_f &
    log_enable (2); INSERT INTO partsupp SELECT * FROM partsupp_f &
    log_enable (2); INSERT INTO supplier SELECT * FROM supplier_f &
    log_enable (2); INSERT INTO nation   SELECT * FROM nation_f &
    log_enable (2); INSERT INTO region   SELECT * FROM region_f &
    
    wait_for_children;
    checkpoint;

A multithreaded, non-logged, non-transactional insert is started for
each table-file pair as a background task. The wait\_for\_children isql
command waits for all the background tasks to complete. The checkpoint
statement makes the state durable. Killing the server in before the
checkpoint would result in the server starting in a state with none of
the effects of the bulk load present, since the log\_enable(2) turns off
logging. The database is online during the bulk load and the progress
may be followed by periodically counting the tables, for example.
