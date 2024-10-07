<div id="fn___xml_ns_uname" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_xml_ns_uname — Returns an UNAME that is IRI --- concatenation of the
expanded namespace IRI and the local part.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___xml_ns_uname" class="funcsynopsis">

|                             |                         |
|-----------------------------|-------------------------|
| ` `**`__xml_ns_uname`**` (` | in `str1 ` varchar ,    |
|                             | in `str2 ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___xml_ns_uname" class="refsect1">

## Description

Returns an UNAME that is IRI -- concatenation of the expanded namespace
IRI and the local part.

</div>

<div id="params___xml_ns_uname" class="refsect1">

## Parameters

<div id="id103324" class="refsect2">

### str1

Namespace prefix.

</div>

<div id="id103327" class="refsect2">

### str2

Local part (varchar).

</div>

</div>

<div id="examples__xml_ns_uname" class="refsect1">

## Examples

<div id="ex_xml_ns_uname_1" class="example">

**Example 24.296. Simple Example**

<div class="example-contents">

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

<div id="seealso__xml_ns_uname" class="refsect1">

## See Also

`xml_ns_iristr() `

`xml_nsexpand_iristr() `

`xml_get_ns_prefix() `

`xml_get_ns_uri() `

</div>

</div>
