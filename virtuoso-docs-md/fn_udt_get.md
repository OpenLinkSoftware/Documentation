<div>

<div>

</div>

<div>

## Name

udt_get — Retrieves a copy of the requested member from a user defined
type instance

</div>

<div>

## Synopsis

<div>

|                         |                                |
|-------------------------|--------------------------------|
| `any `**`udt_get`**` (` | in `udt_inst ` any ,           |
|                         | in `member_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns a copy of the member named member_name, if any,
for type instance udt_inst. It is the functional equivalent of member
observer.

</div>

<div>

## Parameters

<div>

### udt_inst

a user defined type instance.

</div>

<div>

### member_name

the name of the requested member.

</div>

</div>

<div>

## Return Types

This function returns a copy of the requested member, if any.

</div>

<div>

## Examples

<div>

**Example 24.426. Observing members**

<div>

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

<div>

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
