<div>

<div>

</div>

<div>

## Name

java_vm_attach

</div>

<div>

## Synopsis

<div>

|                             |                           |
|-----------------------------|---------------------------|
| ` `**`java_vm_attach`**` (` | in `classpath ` varchar , |
|                             | in `vm_options ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Ensures that the current working thread is attached to the Java VM. It
operates as follows:

<div>

- if the Java VM is not created it creates it.

- if the java VM is running, but the current working thread is not
  attached as a Java VM thread it attaches it.

- if none of the above it returns.

</div>

The `java_vm_attach()` function is called implicitly in each of the
other VSEs, and also when allocating, copying or deleting a Virtuoso/PL
reference to a Java VM object values.

If the Java VM is already initialized and the classpath is supplied it
will throw a SQL error. If the Java VM is not initialized, but it is
required to execute a statement the server will implicitly call
`java_vm_attach (NULL);` . The Virtuoso Java VM integration binary works
with JDK 1.2 and later.

</div>

<div>

## Parameters

<div>

### classpath

The classpath string to be supplied to the Java VM. If classpath is NULL
the server OS environment variable CLASSPATH will be used instead.

</div>

<div>

### vm_options

A vector of name/value pairs for the Java VM initialization parameters.
The format and values of the parameters is described in the JNI
Enhancements Introduced in version 1.2 of the JavaTM 2 SDK document -
the description of JNI_CreateJavaVM Invocation API function.

</div>

</div>

<div>

## Examples

<div>

**Example 24.199. Initializing the Java VM**

<div>

This example initializes the Java VM by supplying a classpath of:
`CLASSPATH=/usr/local/virtuoso/classes:/usr/local/jakarta-tomcat-3.3.1/lib/tomcat.jar`
and sets the `tomcat.home` Java system property to
`/usr/local/jakarta-tomcat-3.3.1` It is the equivalent of executing
JDK/JRE 1.2 unix java tool using:
`java -cp /usr/local/virtuoso/classes:/usr/local/jakarta-tomcat-3.3.1/lib/tomcat.jar -Dtomcat.home=/usr/local/jakarta-tomcat-3.3.1`

``` screen
java_vm_attach ('/usr/local/virtuoso/classes:/usr/local/jakarta-tomcat-3.3.1/lib/tomcat.jar', 
  vector ('-Dtomcat.home=/usr/local/jakarta-tomcat-3.3.1, 0);
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

<a href="fn_java_new_object.html" class="link"
title="java_new_object"><code
class="function">java_new_object() </code></a>

<a href="fn_java_vm_detach.html" class="link"
title="java_vm_detach"><code
class="function">java_vm_detach() </code></a>

</div>

</div>
