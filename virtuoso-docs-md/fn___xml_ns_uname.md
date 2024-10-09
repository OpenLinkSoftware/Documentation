<div>

<div>

</div>

<div>

## Name

\_\_xml_ns_uname — Returns an UNAME that is IRI --- concatenation of the
expanded namespace IRI and the local part.

</div>

<div>

## Synopsis

<div>

|                             |                         |
|-----------------------------|-------------------------|
| ` `**`__xml_ns_uname`**` (` | in `str1 ` varchar ,    |
|                             | in `str2 ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns an UNAME that is IRI -- concatenation of the expanded namespace
IRI and the local part.

</div>

<div>

## Parameters

<div>

### str1

Namespace prefix.

</div>

<div>

### str2

Local part (varchar).

</div>

</div>

<div>

## Examples

<div>

**Example 24.296. Simple Example**

<div>

``` programlisting
SQL> SELECT __xml_ns_uname ('foaf', 'knows');
__xml_ns_uname
VARCHAR
_______________________________________________________________________________

http://xmlns.com/foaf/0.1/knows

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

`xml_ns_iristr() `

`xml_nsexpand_iristr() `

`xml_get_ns_prefix() `

`xml_get_ns_uri() `

</div>

</div>
