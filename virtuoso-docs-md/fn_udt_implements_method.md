<div>

<div>

</div>

<div>

## Name

udt_implements_method — provides a handle to the first method with
specific name in a user defined type.

</div>

<div>

## Synopsis

<div>

|                                       |                                |
|---------------------------------------|--------------------------------|
| `any `**`udt_implements_method`**` (` | in `udt ` any ,                |
|                                       | in `method_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This returns a non-zero value (true) if the udt has an instance method
with a name equal to the value of method_name. For methods with the same
name, but with different signatures this function will return the handle
of the first method in order of definition. If a method is not found, 0
will be returned. The return value can be used to call the method using
the indirect call statement. In which case an instance should be passed
as a first argument to the indirect call statement.

</div>

<div>

## Parameters

<div>

### udt

Type name as varchar or a type instance.

</div>

<div>

### method_name

The requested method name as a varchar.

</div>

</div>

<div>

## Return Types

An integer will be returned. If the named method is not contained within
the user defined type 0 (false) will be returned. Otherwise an integer
representing the handle to first definition of a contained method with
that name will be returned.

</div>

<div>

## Examples

<div>

**Example 24.427. Finding methods within a UDT**

<div>

This example demonstrates how one might go about utilizing the handle of
a method if found within a user defined type.

``` screen
....
declare mtd any;
declare inst SER_UDT;

inst := new SER_UDT ();
mtd := udt_implements_method (inst, 'NEGATE');

if (mtd <> 0)
  return call (mtd) (inst);
else
  signal ('42000', 'No method NEGATE');
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

<a href="fn_udt_set.html" class="link" title="udt_set"><code
class="function">udt_set() </code></a>

</div>

</div>
