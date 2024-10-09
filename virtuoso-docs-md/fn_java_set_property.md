<div>

<div>

</div>

<div>

## Name

java_set_property — Sets a Java class property

</div>

<div>

## Synopsis

<div>

|                                |                                    |
|--------------------------------|------------------------------------|
| ` `**`java_set_property`**` (` | in `class_name ` varchar ,         |
|                                | in `instance_obj ` any ,           |
|                                | in `field_name ` varchar ,         |
|                                | in `field_ret_type_sig ` varchar , |
|                                | in `field_new_value ` any `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

Assigns a new value to either a Java class instance property referenced
by instance_obj, or if instance_obj is not supplied (NULL) then sets a
static Java class property.

</div>

<div>

## Parameters

<div>

### class_name

the name of the java class to set property for.

</div>

<div>

### instance_obj

the Java VM class instance reference value (for example returned by
java_new_object VSEI). Can be NULL.

</div>

<div>

### field_name

the name of the field in the java class.

</div>

<div>

### field_ret_type_sig

the JNI type signature of the field.

</div>

<div>

### field_new_value

the value to be set.

</div>

</div>

<div>

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
