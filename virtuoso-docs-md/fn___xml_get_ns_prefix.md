<div id="fn___xml_get_ns_prefix" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_xml_get_ns_prefix — Returns prefix by given URI.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___xml_get_ns_prefix" class="funcsynopsis">

|                                  |                       |
|----------------------------------|-----------------------|
| ` `**`__xml_get_ns_prefix`**` (` | in `str ` varchar ,   |
|                                  | out `flags ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___xml_get_ns_prefix" class="refsect1">

## Description

If str is a globally known namespace URI, its prefix is returned, else
null. Flags is a bit mask where 1 means to look in the connection, 2 in
the global set of known prefixes.

</div>

<div id="params___xml_get_ns_prefix" class="refsect1">

## Parameters

<div id="id103256" class="refsect2">

### str

uri

</div>

<div id="id103259" class="refsect2">

### flags

bitmask of flags that permit some sorts of syntax errors in resource,
use 0.

</div>

</div>

<div id="seealso__xml_get_ns_prefix" class="refsect1">

## See Also

`xml_get_ns_uri ` `xml_ns_uname ` `xml_ns_iristr `
`xml_nsexpand_iristr `

</div>

</div>
