<div id="fn_udt_instance_of" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

udt_instance_of — returns the type name of supplied type or compares two
input types.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_udt_instance_of" class="funcsynopsis">

|                                     |                    |
|-------------------------------------|--------------------|
| `varchar `**`udt_instance_of`**` (` | in `udt ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_udt_instance_of1" class="funcsynopsis">

|                                     |                     |
|-------------------------------------|---------------------|
| `integer `**`udt_instance_of`**` (` | in `udt1 ` any ,    |
|                                     | in `udt2 ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_udt_instance_of" class="refsect1">

## Description

This function returns information about the supplied type(s). There are
two versions of this function, one returns the name of the type of the
supplied argument, and the other than compares two supplied arguments
for matching types. An error will be signalled if either of the types is
not defined.

</div>

<div id="params_udt_instance_of" class="refsect1">

## Parameters

<div id="id116042" class="refsect2">

### udt, udt1, udt2

Varchar or type instance.

</div>

</div>

<div id="ret_udt_instance_of" class="refsect1">

## Return Types

`udt_instance_of(udt) ` returns the fully qualified name of the type
represented by the udt argument.

`udt_instance_of(udt1, udt2)` returns 1 (true) if udt1 is of the same
type or a subtype of udt2. Otherwise it returns o (false).

</div>

<div id="examples_udt_instance_of" class="refsect1">

## Examples

<div id="ex_udt_instance_of" class="example">

**Example 24.428. Using udt_instance_of()**

<div class="example-contents">

``` screen
select udt_instance_of ('SER_UDT')
```

returns `DB.DBA.SER_UDT` (if the `SER_UDT` type was created by DBA in
the DB database).

``` screen
select udt_instance_of (new SER_UDT())
```

returns `DB.DBA.SER_UDT` (if the `SER_UDT` type was created by DBA in
the DB database).

``` screen
select udt_instance_of ('SER_UDT_SUB', 'SER_UDT');
```

Returns 1

``` screen
select udt_instance_of (new SER_UDT(), 'SER_UDT_SUB');
```

Returns 0;

</div>

</div>

  

</div>

<div id="seealso_udt_instance_of" class="refsect1">

## See Also

<a href="fn_udt_get.html" class="link" title="udt_get"><code
class="function">udt_get() </code></a>

<a href="fn_udt_defines_field.html" class="link"
title="udt_defines_field"><code
class="function">udt_defines_field() </code></a>

<a href="fn_udt_implements_method.html" class="link"
title="udt_implements_method"><code
class="function">udt_implements_method() </code></a>

<a href="fn_udt_set.html" class="link" title="udt_set"><code
class="function">udt_set() </code></a>

</div>

</div>
