<div id="fn_xml_set_ns_decl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_set_ns_decl — Registers the XML NS prefix as persistent or keeps it
in properties of client connection depending on the persistance bits
input value.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_set_ns_decl" class="funcsynopsis">

|                              |                         |
|------------------------------|-------------------------|
| ` `**`xml_set_ns_decl`**` (` | in `prefix ` varchar ,  |
|                              | in `iri ` varchar ,     |
|                              | in `bits ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_73" class="refsect1">

## Description

Registers the XML NS prefix as persistent or keeps it in properties of
client connection depending on the persistance bits input value.

</div>

<div id="params_37" class="refsect1">

## Parameters

<div id="id123792" class="refsect2">

### prefix

namespace prefix

</div>

<div id="id123795" class="refsect2">

### iri

namespace IRI

</div>

<div id="id123798" class="refsect2">

### bits

persistance bits: bit 1 - keeps NS decl in properties of client
connection i.e stores the assignment in connection parameters so only
the current connection will see the namespace prefix declaration; bit
2 - makes NS decl persistent, i.e. stores the declaration in global
in-memory hashtable as well as in a system table, loaded at server
startup time, visible from all connections

</div>

</div>

<div id="examples_25" class="refsect1">

## Examples

<div id="ex_xml_set_ns_north" class="example">

**Example 24.523. Northwind**

<div class="example-contents">

``` programlisting
DB.DBA.XML_SET_NS_DECL ('northwind', 'http://demo.openlinksw.com/schemas/northwind#', 2);
```

</div>

</div>

  

</div>

<div id="seealso_46" class="refsect1">

## See Also

xml_remove_ns_by_prefix xml_remove_ns_by_prefix;

</div>

</div>
