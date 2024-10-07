<div id="fn_java_load_class" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

java_load_class — Declares a Java class to a Java VM

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_java_load_class" class="funcsynopsis">

|                              |                                        |
|------------------------------|----------------------------------------|
| ` `**`java_load_class`**` (` | in `java_class_name ` varchar ,        |
|                              | in `java_class_bytecode ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_java_load_class" class="refsect1">

## Description

Defines a java class into the running Java VM. This is useful for
loading .class/.jar/.zip files from a BLOB column or from the Virtuoso
WebDAV repository.

</div>

<div id="params_java_load_class" class="refsect1">

## Parameters

<div id="id94763" class="refsect2">

### java_class_name

the name under which the class is to be defined

</div>

<div id="id94766" class="refsect2">

### java_class_bytecode

the contents of the .class file.

</div>

</div>

<div id="examples_java_load_class" class="refsect1">

## Examples

<div id="ex_java_load_class" class="example">

**Example 24.197. Loading a Java Class**

<div class="example-contents">

Some sample Java code:

``` programlisting
java_server.java:

  public class java_server {
    public static int property;
  }
```

Compiling it makes a java_server.class. Loading it in Virtuoso is as
follows:

``` programlisting
  java_load_class ('java_server', file_to_string ('java_server.class'));
```

</div>

</div>

  

</div>

<div id="seealso_java_load_class" class="refsect1">

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

<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach() </code></a>

<a href="fn_java_new_object.html" class="link"
title="java_new_object"><code
class="function">java_new_object() </code></a>

<a href="fn_java_vm_detach.html" class="link"
title="java_vm_detach"><code
class="function">java_vm_detach() </code></a>

</div>

</div>
