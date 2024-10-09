<div>

<div>

</div>

<div>

## Name

udt_set

</div>

<div>

## Synopsis

<div>

|                      |                             |
|----------------------|-----------------------------|
| ` `**`udt_set`**` (` | in `udt_inst ` any ,        |
|                      | in `member_name ` varchar , |
|                      | in `new_value ` any `)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

This copies the instance udt_inst, sets new_value to the member with a
name equal to the value of member_name (if any) and returns the modified
instance copy. This is a functional equivalent of a member mutator.

</div>

<div>

## Parameters

<div>

### udt_inst

A user defined type instance

</div>

<div>

### member_name

The name of the requested member

</div>

<div>

### new_value

The new value to be set

</div>

</div>

<div>

## Return Types

A modified copy of udt_inst with the_value set for member_name.

</div>

<div>

## Examples

<div>

**Example 24.429. Setting user defined type member values**

<div>

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

<div>

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
