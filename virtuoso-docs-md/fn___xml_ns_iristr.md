<div>

<div>

</div>

<div>

## Name

\_\_xml_ns_iristr — Returns an varchar with box flag set to BF_IRI.

</div>

<div>

## Synopsis

<div>

|                              |                         |
|------------------------------|-------------------------|
| ` `**`__xml_ns_iristr`**` (` | in `str1 ` varchar ,    |
|                              | in `str2 ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is similar to the `xml_ns_uname ` function, and it returns
an varchar with box flag set to BF_IRI.

</div>

<div>

## Parameters

<div>

### str1

Namespace prefix

</div>

<div>

### str2

Local part (varchar)

</div>

</div>

<div>

## Examples

<div>

**Example 24.297. Simple Example**

<div>

Base64-encode a string

``` programlisting
SQL> SELECT __xml_ns_iristr ('foaf', 'knows');
__xml_ns_iristr
VARCHAR
_______________________________________________________________________________

http://xmlns.com/foaf/0.1/knows

1 Rows. -- 1 msec.  
```

</div>

</div>

  

</div>

<div>

## See Also

`xml_ns_uname `

`xml_nsexpand_iristr `

`xml_get_ns_prefix `

`xml_get_ns_uri `

</div>

</div>
