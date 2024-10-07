<div id="fn_jvm_ref_import" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

jvm_ref_import — Creates XML description of Java class

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_jvm_ref_import" class="funcsynopsis">

|                                    |                        |
|------------------------------------|------------------------|
| `varchar `**`jvm_ref_import`**` (` | in `files ` any ,      |
|                                    | in `classes ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_jvm_ref_import" class="refsect1">

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

<div id="params_jvm_ref_import" class="refsect1">

## Parameters

<div id="id94987" class="refsect2">

### files

Null, string or vector of strings. This can contain one or many Java
.class files, .zip or .jar files to pick classes from. Null means only
the classes specified in the classes argument regardless of their
physical location.

</div>

<div id="id94990" class="refsect2">

### classes

Wildcard string or a vector of strings specifying which classes to
describe in the resulting XML.

</div>

</div>

<div id="ret_jvm_ref_import" class="refsect1">

## Return Types

A varchar of XML that describes the selected Java classes.

</div>

<div id="examples_jvm_ref_import" class="refsect1">

## Examples

<div id="ex_jvm_ref_import" class="example">

**Example 24.200. Simple Use**

<div class="example-contents">

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

<div id="seealso_jvm_ref_import" class="refsect1">

## See Also

<a href="fn_import_jar.html" class="link" title="import_jar"><code
class="function">import_jar() </code></a>

</div>

</div>
