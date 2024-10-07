<div id="fn_udt_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

udt_get — Retrieves a copy of the requested member from a user defined
type instance

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_udt_get" class="funcsynopsis">

|                         |                                |
|-------------------------|--------------------------------|
| `any `**`udt_get`**` (` | in `udt_inst ` any ,           |
|                         | in `member_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_udt_get" class="refsect1">

## Description

This function returns a copy of the member named member_name, if any,
for type instance udt_inst. It is the functional equivalent of member
observer.

</div>

<div id="params_udt_get" class="refsect1">

## Parameters

<div id="id115936" class="refsect2">

### udt_inst

a user defined type instance.

</div>

<div id="id115939" class="refsect2">

### member_name

the name of the requested member.

</div>

</div>

<div id="ret_udt_get" class="refsect1">

## Return Types

This function returns a copy of the requested member, if any.

</div>

<div id="examples_udt_get" class="refsect1">

## Examples

<div id="ex_udt_get" class="example">

**Example 24.426. Observing members**

<div class="example-contents">

This example simply fetches a member from a user defined type.

``` screen
....
declare inst SER_UDT;

inst := new SER_UDT ();
return udt_get (inst, 'A');
....
```

</div>

</div>

  

</div>

<div id="seealso_udt_get" class="refsect1">

## See Also

<a href="fn_udt_defines_field.html" class="link"
title="udt_defines_field"><code
class="function">udt_defines_field() </code></a>

<a href="fn_udt_implements_method.html" class="link"
title="udt_implements_method"><code
class="function">udt_implements_method() </code></a>

<a href="fn_udt_instance_of.html" class="link"
title="udt_instance_of"><code
class="function">udt_instance_of() </code></a>

<a href="fn_udt_set.html" class="link" title="udt_set"><code
class="function">udt_set() </code></a>

</div>

</div>
