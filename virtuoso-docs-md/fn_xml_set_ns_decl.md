<div>

<div>

</div>

<div>

## Name

xml_set_ns_decl — Registers the XML NS prefix as persistent or keeps it
in properties of client connection depending on the persistance bits
input value.

</div>

<div>

## Synopsis

<div>

|                              |                         |
|------------------------------|-------------------------|
| ` `**`xml_set_ns_decl`**` (` | in `prefix ` varchar ,  |
|                              | in `iri ` varchar ,     |
|                              | in `bits ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Registers the XML NS prefix as persistent or keeps it in properties of
client connection depending on the persistance bits input value.

</div>

<div>

## Parameters

<div>

### prefix

namespace prefix

</div>

<div>

### iri

namespace IRI

</div>

<div>

### bits

persistance bits: bit 1 - keeps NS decl in properties of client
connection i.e stores the assignment in connection parameters so only
the current connection will see the namespace prefix declaration; bit
2 - makes NS decl persistent, i.e. stores the declaration in global
in-memory hashtable as well as in a system table, loaded at server
startup time, visible from all connections

</div>

</div>

<div>

## Examples

<div>

**Example 24.523. Northwind**

<div>

``` programlisting
DB.DBA.XML_SET_NS_DECL ('northwind', 'http://demo.openlinksw.com/schemas/northwind#', 2);
```

</div>

</div>

  

</div>

<div>

## See Also

xml_remove_ns_by_prefix xml_remove_ns_by_prefix;

</div>

</div>
