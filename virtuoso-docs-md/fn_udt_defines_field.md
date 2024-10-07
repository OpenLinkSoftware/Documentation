<div id="fn_udt_defines_field" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

udt_defines_field — Determines whether a user defined type contains a
specified member.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_udt_defines_field" class="funcsynopsis">

|                                       |                                |
|---------------------------------------|--------------------------------|
| `integer `**`udt_defines_field`**` (` | in `udt ` any ,                |
|                                       | in `member_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_udt_defines_field" class="refsect1">

## Description

This function is used to determine whether the supplied member_name is a
member contained by the supplied udt.

</div>

<div id="params_udt_defines_field" class="refsect1">

## Parameters

<div id="id115882" class="refsect2">

### udt

A user defined type name as varchar or type instance.

</div>

<div id="id115885" class="refsect2">

### member_name

The requested member name.

</div>

</div>

<div id="ret_udt_defines_field" class="refsect1">

## Return Types

This function returns either 1 (true) or 0 (false). 1 (true) is returned
if the udt contains a member whose name is equal to the value of
member_name, or 0 otherwise.

</div>

<div id="examples_udt_defines_field" class="refsect1">

## Examples

<div id="ex_udt_defines_field" class="example">

**Example 24.425. Simple Use**

<div class="example-contents">

``` screen
select udt_defines_field (new SER_UDT(), 'A');
```

returns 1

``` screen
select udt_defines_field (new SER_UDT_SUB(), 'A');
```

returns 1

``` screen
select udt_defines_field (new SER_UDT(), 'B');
```

returns 0;

</div>

</div>

  

</div>

<div id="seealso_udt_defines_field" class="refsect1">

## See Also

<a href="fn_udt_get.html" class="link" title="udt_get"><code
class="function">udt_get() </code></a>

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
