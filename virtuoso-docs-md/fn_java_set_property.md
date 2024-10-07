<div id="fn_java_set_property" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

java_set_property — Sets a Java class property

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_java_set_property" class="funcsynopsis">

|                                |                                    |
|--------------------------------|------------------------------------|
| ` `**`java_set_property`**` (` | in `class_name ` varchar ,         |
|                                | in `instance_obj ` any ,           |
|                                | in `field_name ` varchar ,         |
|                                | in `field_ret_type_sig ` varchar , |
|                                | in `field_new_value ` any `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_java_set_property" class="refsect1">

## Description

Assigns a new value to either a Java class instance property referenced
by instance_obj, or if instance_obj is not supplied (NULL) then sets a
static Java class property.

</div>

<div id="params_java_set_property" class="refsect1">

## Parameters

<div id="id94642" class="refsect2">

### class_name

the name of the java class to set property for.

</div>

<div id="id94645" class="refsect2">

### instance_obj

the Java VM class instance reference value (for example returned by
java_new_object VSEI). Can be NULL.

</div>

<div id="id94648" class="refsect2">

### field_name

the name of the field in the java class.

</div>

<div id="id94651" class="refsect2">

### field_ret_type_sig

the JNI type signature of the field.

</div>

<div id="id94654" class="refsect2">

### field_new_value

the value to be set.

</div>

</div>

<div id="seealso_java_set_property" class="refsect1">

## See Also

<a href="fn_java_call_method.html" class="link"
title="java_call_method"><code
class="function">java_call_method() </code></a>

<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach() </code></a>

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
