<div id="fn_java_call_method" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

java_call_method

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_java_call_method" class="funcsynopsis">

|                               |                                |
|-------------------------------|--------------------------------|
| ` `**`java_call_method`**` (` | in `class_name ` varchar ,     |
|                               | in `instance_obj ` varchar ,   |
|                               | in `method_name ` varchar ,    |
|                               | in `method_ret_sig ` varchar , |
|                               | `arg1, ... ` `)`;              |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_java_call_method" class="refsect1">

## Description

Calls a class method using the supplied parameters (if any) and returns
the return value (if any). If instance_obj is supplied (not NULL) then
this function searches for a non-static method otherwise for static.

</div>

<div id="params_java_call_method" class="refsect1">

## Parameters

<div id="id94580" class="refsect2">

### class_name

The name of the Java class.

</div>

<div id="id94583" class="refsect2">

### instance_obj

the Java VM class instance reference value (for example returned by
java_new_object VSEI). Can be NULL.

</div>

<div id="id94586" class="refsect2">

### method_name

the name of the method to call

</div>

<div id="id94589" class="refsect2">

### metjod_ret_name

the JNI type signature of the method's return value (or V for void).

</div>

<div id="id94592" class="refsect2">

### arg1, ...

method parameters (as in java_new_object).

</div>

</div>

<div id="seealso_java_call_method" class="refsect1">

## See Also

<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach() </code></a>

<a href="fn_java_set_property.html" class="link"
title="java_set_property"><code
class="function">java_set_property() </code></a>

<a href="fn_java_get_property.html" class="link"
title="java_get_property"><code
class="function">java_get_property() </code></a>

<a href="fn_java_load_class.html" class="link"
title="java_load_class"><code
class="function">java_load_class() </code></a>

<a href="fn_java_new_object.html" class="link"
title="java_new_object"><code
class="function">java_new_object() </code></a>

<a href="fn_java_vm_detach.html" class="link"
title="java_vm_detach"><code
class="function">java_vm_detach() </code></a>

</div>

</div>
