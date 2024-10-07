<div id="fn_java_get_property" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

java_get_property — Gets a property value from a Java class instance.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_java_get_property" class="funcsynopsis">

|                                |                                       |
|--------------------------------|---------------------------------------|
| ` `**`java_get_property`**` (` | in `class_name ` varchar ,            |
|                                | in `instance_obj ` varchar ,          |
|                                | in `field_name ` varchar ,            |
|                                | in `field_ret_type_sig ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_java_get_property" class="refsect1">

## Description

Gets a property value from a Java class instance referenced by
instance_obj. If instance_obj is not supplied, ie NULL, then it is
returned as a static Java class property value.

</div>

<div id="params_java_get_property" class="refsect1">

## Parameters

<div id="id94702" class="refsect2">

### class_name

the name of the java class to get the property from

</div>

<div id="id94705" class="refsect2">

### instance_obj

the Java VM class instance reference value (for example returned by
java_new_object VSEI). Can be NULL.

</div>

<div id="id94708" class="refsect2">

### field_name

the name of the field in the java class

</div>

<div id="id94711" class="refsect2">

### field_ret_type_sig

the JNI type signature of the field.

</div>

</div>

<div id="examples_java_get_property" class="refsect1">

## Examples

<div id="ex_java_get_property1" class="example">

**Example 24.195. static value - Java's PI value returned as DOUBLE
PRECISION**

<div class="example-contents">

``` screen
java_get_property ('java.lang.Math', NULL, 'PI', 'D');
```

</div>

</div>

  

<div id="ex_java_get_property2" class="example">

**Example 24.196. default time zone name in tz_name**

<div class="example-contents">

``` screen
tz := java_call_method ('java.util.TimeZone', NULL, 'getDefault', 'Ljava/util/TimeZone;');
tz_name := java_get_property ('java.util.TimeZone', tz, 'getDisplayName', 'Ljava/lang/String;');
```

</div>

</div>

  

</div>

<div id="seealso_java_get_property" class="refsect1">

## See Also

<a href="fn_java_call_method.html" class="link"
title="java_call_method"><code
class="function">java_call_method() </code></a>

<a href="fn_java_set_property.html" class="link"
title="java_set_property"><code
class="function">java_set_property() </code></a>

<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach() </code></a>

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
