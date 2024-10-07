<div id="fn_udt_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

udt_set

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_udt_set" class="funcsynopsis">

|                      |                             |
|----------------------|-----------------------------|
| ` `**`udt_set`**` (` | in `udt_inst ` any ,        |
|                      | in `member_name ` varchar , |
|                      | in `new_value ` any `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_udt_set" class="refsect1">

## Description

This copies the instance udt_inst, sets new_value to the member with a
name equal to the value of member_name (if any) and returns the modified
instance copy. This is a functional equivalent of a member mutator.

</div>

<div id="params_udt_set" class="refsect1">

## Parameters

<div id="id116104" class="refsect2">

### udt_inst

A user defined type instance

</div>

<div id="id116107" class="refsect2">

### member_name

The name of the requested member

</div>

<div id="id116110" class="refsect2">

### new_value

The new value to be set

</div>

</div>

<div id="ret_udt_set" class="refsect1">

## Return Types

A modified copy of udt_inst with the_value set for member_name.

</div>

<div id="examples_udt_set" class="refsect1">

## Examples

<div id="ex_udt_set" class="example">

**Example 24.429. Setting user defined type member values**

<div class="example-contents">

This sample code block shows a user defined type member's value being
set.

``` screen
....
declare inst SER_UDT;

inst := new SER_UDT ();
inst := udt_set (inst, 'A', 30);
return inst.A;
....
```

</div>

</div>

  

</div>

<div id="seealso_udt_set" class="refsect1">

## See Also

<a href="fn_udt_get.html" class="link" title="udt_get"><code
class="function">udt_get() </code></a>

<a href="fn_udt_defines_field.html" class="link"
title="udt_defines_field"><code
class="function">udt_defines_field() </code></a>

<a href="fn_udt_instance_of.html" class="link"
title="udt_instance_of"><code
class="function">udt_instance_of() </code></a>

<a href="fn_udt_implements_method.html" class="link"
title="udt_implements_method"><code
class="function">udt_implements_method() </code></a>

</div>

</div>
