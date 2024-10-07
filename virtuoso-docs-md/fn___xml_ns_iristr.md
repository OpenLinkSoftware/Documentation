<div id="fn___xml_ns_iristr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_xml_ns_iristr — Returns an varchar with box flag set to BF_IRI.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___xml_ns_iristr" class="funcsynopsis">

|                              |                         |
|------------------------------|-------------------------|
| ` `**`__xml_ns_iristr`**` (` | in `str1 ` varchar ,    |
|                              | in `str2 ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___xml_ns_iristr" class="refsect1">

## Description

This function is similar to the `xml_ns_uname ` function, and it returns
an varchar with box flag set to BF_IRI.

</div>

<div id="params___xml_ns_iristr" class="refsect1">

## Parameters

<div id="id103367" class="refsect2">

### str1

Namespace prefix

</div>

<div id="id103370" class="refsect2">

### str2

Local part (varchar)

</div>

</div>

<div id="examples__xml_ns_iristr" class="refsect1">

## Examples

<div id="ex_xml_ns_iristr_1" class="example">

**Example 24.297. Simple Example**

<div class="example-contents">

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

<div id="seealso__xml_ns_iristr" class="refsect1">

## See Also

`xml_ns_uname `

`xml_nsexpand_iristr `

`xml_get_ns_prefix `

`xml_get_ns_uri `

</div>

</div>
