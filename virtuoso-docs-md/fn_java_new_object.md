<div id="fn_java_new_object" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

java_new_object — Creates and instance of a Java class.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_java_new_object" class="funcsynopsis">

|                                 |                            |
|---------------------------------|----------------------------|
| `any `**`java_new_object`**` (` | in `class_name ` varchar , |
|                                 | in `arg1 ` any ,           |
|                                 | `... ` `)`;                |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_java_new_object" class="refsect1">

## Description

Creates an instance of a java class, makes a global reference in the
Java VM and returns it to Virtuoso as a PL object reference value.

</div>

<div id="params_java_new_object" class="refsect1">

## Parameters

<div id="id94820" class="refsect2">

### class_name

the name of the java class to be instantiated. (eg: java.util.Date)

</div>

<div id="id94823" class="refsect2">

### arg1, ....

the arguments to the constructor called.

</div>

</div>

<div id="ret_java_new_object" class="refsect1">

## Return Types

Virtuoso object reference value.

</div>

<div id="examples_java_new_object" class="refsect1">

## Examples

<div id="ex_java_new_object" class="example">

**Example 24.198. Creating new Java class instances**

<div class="example-contents">

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

<div id="seealso_java_new_object" class="refsect1">

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
