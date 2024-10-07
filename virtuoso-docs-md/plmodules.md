<div id="plmodules" class="section">

<div class="titlepage">

<div>

<div>

## 11.19. Virtuoso PL Modules

</div>

</div>

</div>

Modules are packages of procedures which compile together. Procedure
names in module definitions are not fully qualified names, but consist
only of a single identifier that it is appended to the name of the
module (which is a 3-part name) to make the 4-part module procedure
name.

Module procedures do not appear in SQLProcedures output. Module names
are in the same domain as the procedure names, so it is not possible to
have a procedure with the same name as an existing module.

<div id="plmodsyntax" class="section">

<div class="titlepage">

<div>

<div>

### 11.19.1. Syntax

</div>

</div>

</div>

``` programlisting
CREATE MODULE
  m_name
{
  [PROCEDURE|FUNCTION] p_name1 (...) { ...};
  [PROCEDURE|FUNCTION] p_name2 (...) { ...};
  ...
  [PROCEDURE|FUNCTION] p_nameN (...) { ...};
}
```

``` programlisting
DROP MODULE m_name;
```

<div id="ex_plmod2" class="example">

**Example 11.15. Procedure Modules**

<div class="example-contents">

``` programlisting
create module
  DB.DBA.MOD
{
  function MOD1 () returns varchar {
    return ('MOD1');
  };

  procedure MOD2 () {
    return concat (MOD1(), 'MOD2');
  };
};
```

This example creates a module, MOD, with 2 procedures: MOD1 & MOD2.
Their fully-qualified names are DB.DBA.MOD.MOD1 and DB.DBA.MOD.MOD2.

Note the call to MOD1 in MOD2 - it is not fully qualified, but it
resolves to the module procedure MOD1, instead of any procedure external
to the module.

</div>

</div>

  

A single part procedure name in a call inside a module is first matched
against procedures defined in the module. If the above example were
executed by DBA (in the DB qualifier), then the below statements are
equivalent:

``` programlisting
select DB.DBA.MOD.MOD1()
select DB..MOD.MOD1()
```

The statement:

``` programlisting
select MOD.MOD1()
```

will result in calling the DB.DBA.MOD.MOD1() only if a function
DB.MOD.MOD1 does not exist. If it exists, it will be preferred over
DB.DBA.MOD.MOD1 when using this notation.

</div>

</div>
