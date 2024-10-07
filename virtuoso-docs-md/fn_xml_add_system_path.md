<div id="fn_xml_add_system_path" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_add_system_path — Adds path to the internal list of system paths.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_add_system_path" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| ` `**`xml_add_system_path`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_67" class="refsect1">

## Description

When validating XML parser tries to resolve system entities it searches
in
<a href="fn_http_root.html" class="link" title="http_root">http_root</a>
directory. If it fails parser iterates internal list of system paths and
tries to find required files there. The function adds new path in this
list. List of system paths contains one directory item by default -
"file://system/".

NOTE: List of system paths is not persistent. It means that you must add
desired path each time when server starts. An ideal place for this
operation in "autoexec.isql" file.

</div>

</div>
