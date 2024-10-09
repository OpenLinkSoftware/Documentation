<div>

<div>

<div>

<div>

## 9.2. User Defined Types

</div>

</div>

</div>

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

|                                                                                                                                                                                                                                                                                                                                                                              |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `M` is an original method of `T1`                                                                                                                                                                                                                                                                                                                                            |
| `M` is an overriding method of `T1`                                                                                                                                                                                                                                                                                                                                          |
| There is a proper supertype `T2` of `T1` such that `M` is an original or overriding method of `T2` and such that there is no method `M3` such that `M3` has the same method name and SQL parameter declaration list as `M` and `M3` is an original method or overriding method of a type `T3` such that `T2` is a proper supertype of `T3` and `T3` is a supertype of `T1` . |

A user defined type can be a direct subtype of one (and only one) user
defined type. The user defined type cannot be a subtype of itself.

A type `Ta` is a direct subtype of a type `Tb` if `Ta` is a proper
subtype of `Tb` and there does not exist a type `Tc` such that `Tc` is a
proper subtype of `Tb` and a proper supertype of `Ta` .

A type `Ta` is a subtype of type `Tb` if one of the following pertains:

|                                                                            |
|----------------------------------------------------------------------------|
| `Ta` is a direct subtype of `Tb` ; or                                      |
| `Ta` is a subtype of some type `Tc` and `Tc` is a direct subtype of `Tb` . |

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

<div>

|                              |                                                                                                                                                                                                                                                                                                                            |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                      |
|                              | Because a subtype family has exactly one maximal supertype, if two types have a common subtype, they must also have a minimal common supertype. Thus, for every set of types drawn from the same subtype family, there is some member of that family that is the minimal common supertype of all of the types in that set. |

</div>

A user-defined type is declared by a user-defined type
<a href="udt_overview.html#udtcreatetypestmt" class="link"
title="9.2.1. CREATE TYPE Statement">CREATE TYPE statement</a> .

<div>

<div>

<div>

<div>

### 9.2.1. CREATE TYPE Statement

</div>

</div>

</div>

``` programlisting
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
```

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

Normally the type definitions are stored into the DB.DBA.SYS_USER_TYPES
system table.

This has the following layout:

``` programlisting
CREATE TABLE SYS_USER_TYPES
(
 UT_NAME VARCHAR,
 UT_PARSE_TREE LONG VARCHAR,
 UT_ID integer identity,
 UT_MIGRATE_TO integer,
 primary key (UT_NAME));
```

|                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*UT_NAME*</span> - the fully qualified user defined type name.                                   |
| <span class="emphasis">*UT_PARSE_TREE*</span> - the user defined type definition (in machine readable form).            |
| <span class="emphasis">*UT_ID*</span> - the ID of the type (used in persisting type instances to/from network/storage). |
| <span class="emphasis">*UT_MIGRATE_TO*</span> - reserved for future use.                                                |

If a TEMPORARY type_option is specified, the CREATE TYPE does not write
the type definition into the table - it declares the type only in
server's memory. TEMPORARY types are not persistable. They disappear
when the server is restarted. A TEMPORARY type cannot be a supertype or
a subtype of a non-TEMPORARY type.

The `SELF AS REF` option directs the server to return a reference to the
type's instance when instantiating the type, as opposed to returning the
instance itself. The references are explained in more detail in the
`NEW` operator.

<div>

|                              |                                                 |
|:----------------------------:|:------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                           |
|                              | The CREATE TYPE is an autocommitting statement. |

</div>

<div>

**Example 9.3. Creating User Defined Types**

<div>

This example creates a SQL implemented user defined type UDT_TEST with
no supertype. It has two members : A and B, two constructor methods, a
static method \_ADD, an ADDIT method taking either zero or two arguments
and an instance method SUB_IT.

``` programlisting
create type UDT_TEST
  as (A integer default 1, B integer default 2)
  CONSTRUCTOR METHOD UDT_TEST(_a integer, _b integer),
  CONSTRUCTOR METHOD UDT_TEST(),
  STATIC METHOD _ADD(_xx integer, _yy integer) returns integer specific DB.DBA.static_add,
  METHOD ADDIT() returns integer,
  METHOD ADDIT(c integer) returns integer,
  METHOD SUB_IT () returns integer;
```

This creates a subtype of UDT_TEST named UDT_TEST_SUB. UDT_TEST_SUB
extends the static method \_ADD of UDT_TEST so it can also take 4
arguments, overrides the method ADDIT from UDT_TEST and defines a new
instance method MULTIPLY_IT.

``` programlisting
create type UDT_TEST_SUB under UDT_TEST
  as (C integer default 12, _D integer default 32)
  STATIC METHOD _ADD(_xx integer, _yy integer, _zz integer, _qq integer) returns integer,
  OVERRIDING METHOD ADDIT() returns integer,
  METHOD MULTIPLY_IT () returns integer;
```

This is a SQL wrapper for a public Java type testsuite_base (see
testsuite_base.java).

``` programlisting
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
```

</div>

</div>

  

</div>

</div>
