<div>

<div>

</div>

<div>

## Name

jvm_ref_import — Creates XML description of Java class

</div>

<div>

## Synopsis

<div>

|                                    |                        |
|------------------------------------|------------------------|
| `varchar `**`jvm_ref_import`**` (` | in `files ` any ,      |
|                                    | in `classes ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will returns an XML description of the selected classes
from the source files.

The XML produced by the JVM_REF_IMPORT can be supplied to the predefined
XSL style sheet `__javavm_type` to produce the CREATE TYPE statements:

``` programlisting
select xslt ('__javavm_type', xml_tree_doc (JVM_REF_IMPORT (files, classes)));
```

This can also be achieve directly using a single call to:

``` programlisting
IMPORT_JAR (in files any, in classes any)
```

</div>

<div>

## Parameters

<div>

### files

Null, string or vector of strings. This can contain one or many Java
.class files, .zip or .jar files to pick classes from. Null means only
the classes specified in the classes argument regardless of their
physical location.

</div>

<div>

### classes

Wildcard string or a vector of strings specifying which classes to
describe in the resulting XML.

</div>

</div>

<div>

## Return Types

A varchar of XML that describes the selected Java classes.

</div>

<div>

## Examples

<div>

**Example 24.200. Simple Use**

<div>

``` screen
JVM_REF_IMPORT (NULL, vector ('java.lang.Object', 'java.lang.System'));
```

This will return an XML describing the Java classes java.lang.Object and
java.lang.System. Because the java.lang.System class is a subclass of
java.lang.Object the XML description for java.lang.System will contain a
reference to java.lang.Object and only the methods/members defined in
java.lang.System (because the methods/members of java.lang.Object will
be inherited).

``` screen
JVM_REF_IMPORT (NULL, 'java.lang.System');
```

As opposed to the above example this will create an XML description only
for the java.lang.System class, but will also add the inherited
methods/members (from java.lang.Object) as if they were methods/members
of the java.lang.System class.

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_import_jar.html" class="link" title="import_jar"><code
class="function">import_jar() </code></a>

</div>

</div>
