<div>

<div>

</div>

<div>

## Name

unimport_jar — Drops SQL wrapper types of selected Java classes

</div>

<div>

## Synopsis

<div>

|                               |                        |
|-------------------------------|------------------------|
| `void `**`unimport_jar`**` (` | in `files ` any ,      |
|                               | in `classes ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calls the `jvm_ref_import() ` function to produce the XML,
then transforms it to a set of DROP TYPE statements and executes them.

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

## Examples

<div>

**Example 24.431. Simple Use**

<div>

``` screen
SQL> import_jar (null, vector ('java.lang.System'));

Done. -- 126 msec.
SQL> select java_lang_System::getProperty('java.vm.name');
callret
NVARCHAR
_______________________________________________________________________________

Java HotSpot(TM) Client VM
SQL> unimport_jar (null, vector ('java.lang.System'));

Done. -- 54 msec.
SQL> select java_lang_System::getProperty('java.vm.name');

*** Error 37000: [Virtuoso Driver][Virtuoso Server]UD041: No user defined type DB.DBA.java_lang_System
at line 8 of Top-Level:
select java_lang_System::getProperty('java.vm.name')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_import_jar.html" class="link" title="import_jar"><code
class="function">import_jar() </code></a>

<a href="fn_jvm_ref_import.html" class="link"
title="jvm_ref_import"><code
class="function">jvm_ref_import() </code></a>

</div>

</div>
