<div>

<div>

<div>

<div>

## 11.11. CREATE PROCEDURE Syntax - External hosted procedures

</div>

</div>

</div>

Virtuoso provides a syntax shortcut for calling static method from
hosted user defined types without first defining a Virtuoso external
hosted user defined type:

``` programlisting
CREATE (PROCEDURE|FUNCTION) <local_name> ([<arg_def1>, ...])
    [returns <sql_datatype>] LANGUAGE [JAVA|CLR] EXTERNAL NAME '<external_static_proc_name_literal>'

<arg_def> := [IN|OUT|INOUT] param_name <data_type_spec>

<external_static_proc_name_literal> = <external_type_name_literal>.<static_proc_name>
```

This compiles into an functional equivalent of :

``` programlisting
create procedure <local_name) ([<arg_def1>, ....])
{
  declare ret any;

  exec ('
    create type <local_name>
      temporary self as ref
        static method m1 ([<arg_def1>, ....])
           returns <datatype> EXTERNAL NAME ''<static_proc_name>''
   ');

  ret := <local_name>::m1 (....);

  exec ('drop type <local_name>');

  return ret;
  }
  
```

For more details see
<a href="udt_overview.html#udtcreatetypestmt" class="link"
title="9.2.1. CREATE TYPE Statement">CREATE TYPE</a> and Runtime hosting
chapters.

<div>

**Example 11.6. CREATE PROCEDURE for a Java method:**

<div>

Here is an example for CREATE PROCEDURE and the hosted Java VM:

``` programlisting
create procedure get_property (in x varchar) returns varchar language java external name 'java.lang.System.getProperty';
```

Here's how that procedure is called:

``` programlisting
SQL> select get_property ('java.vm.name');
callret
VARCHAR
_______________________________________________________________________________

Java HotSpot(TM) Client VM
```

</div>

</div>

  

<div>

**Example 11.7. CREATE PROCEDURE for a CLR method:**

<div>

Here is an example for CREATE PROCEDURE and the hosted CLR:

``` programlisting
create procedure curr_thr_id () returns integer language CLR external name 'mscorlib/System.AppDomain.GetCurrentThreadId';
```

Here's how that procedure is called:

``` programlisting
SQL> select curr_thr_id();
callret
INTEGER
_______________________________________________________________________________

2156
```

</div>

</div>

  

</div>
