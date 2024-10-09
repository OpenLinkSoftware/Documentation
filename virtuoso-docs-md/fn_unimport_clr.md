<div>

<div>

</div>

<div>

## Name

unimport_clr — This function automatically drops the SQL Type wrappers
based on the CLR Reflection API.

</div>

<div>

## Synopsis

<div>

|                              |                               |
|------------------------------|-------------------------------|
| `any `**`unimport_clr`**` (` | in `assemblies_vector ` any , |
|                              | in `classes_vector ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function automatically drops the SQL Type wrappers based on the CLR
Reflection API. If there is compiled Virtuoso/PL code that references
the type it will fail to execute (with a compilation error) when
executed or compiled.

</div>

<div>

## Parameters

<div>

### assemblies_vector

a vector of assembly names (as VARCHAR) to look into (or null).

</div>

<div>

### classes_vector

a vector of type names to create SQL type wrappers for (or null to mark
all the types in the assemblies specified by assemblies_vector. In that
case the `assemblies_vector ` cannot be NULL).

</div>

</div>

<div>

## Examples

<div>

**Example 24.430. Dropping an imported Class**

<div>

Now this library must be introduced to the Virtuoso Server. In ISQL use
the following commands to test the CLR:

``` programlisting
SQL> DB..unimport_clr (vector ('sanity'), vector ('sanity'));

Done. -- 300 msec.
SQL> select sanity::test('Rob');

*** Error 37000: [Virtuoso Driver][Virtuoso Server]UD041: No user defined type DB.DBA.sanity
at line 2 of Top-Level:
select sanity::test('Rob')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_import_clr.html" class="link"
title="import_clr">import_clr</a>

The Runtime Hosting Chapter

</div>

</div>
