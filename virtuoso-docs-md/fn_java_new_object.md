<div>

<div>

</div>

<div>

## Name

java_new_object — Creates and instance of a Java class.

</div>

<div>

## Synopsis

<div>

|                                 |                            |
|---------------------------------|----------------------------|
| `any `**`java_new_object`**` (` | in `class_name ` varchar , |
|                                 | in `arg1 ` any ,           |
|                                 | `... ` `)`;                |

<div>

 

</div>

</div>

</div>

<div>

## Description

Creates an instance of a java class, makes a global reference in the
Java VM and returns it to Virtuoso as a PL object reference value.

</div>

<div>

## Parameters

<div>

### class_name

the name of the java class to be instantiated. (eg: java.util.Date)

</div>

<div>

### arg1, ....

the arguments to the constructor called.

</div>

</div>

<div>

## Return Types

Virtuoso object reference value.

</div>

<div>

## Examples

<div>

**Example 24.198. Creating new Java class instances**

<div>

creates a new java.util.Date class instance and initializes it with the
current time from Virtuoso.

``` programlisting
cal := java_new_object ('java.util.Date', vector ('L', msec_time()));
```

creates a new java.util.Date class instance and initializes it with the
current time from java VM.

``` programlisting
cal := java_new_object ('java.util.Date');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_java_call_method.html" class="link"
title="java_call_method"><code
class="function">java_call_method() </code></a>

<a href="fn_java_set_property.html" class="link"
title="java_set_property"><code
class="function">java_set_property() </code></a>

<a href="fn_java_get_property.html" class="link"
title="java_get_property"><code
class="function">java_get_property() </code></a>

<a href="fn_java_load_class.html" class="link"
title="java_load_class"><code
class="function">java_load_class() </code></a>

<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach() </code></a>

<a href="fn_java_vm_detach.html" class="link"
title="java_vm_detach"><code
class="function">java_vm_detach() </code></a>

</div>

</div>
