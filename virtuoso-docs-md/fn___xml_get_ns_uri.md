<div id="fn___xml_get_ns_uri" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_xml_get_ns_uri — Returns URI by given namespace prefix.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___xml_get_ns_uri" class="funcsynopsis">

|                               |                       |
|-------------------------------|-----------------------|
| ` `**`__xml_get_ns_uri`**` (` | in `str ` varchar ,   |
|                               | out `flags ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___xml_get_ns_uri" class="refsect1">

## Description

If str is a globally known namespace prefix, its URI is returned, else
null. Flags is a bit mask where 1 means to look in the connection, 2 in
the global set of known prefixes.

</div>

<div id="params___xml_get_ns_uri" class="refsect1">

## Parameters

<div id="id103290" class="refsect2">

### str

namespace prefix

</div>

<div id="id103293" class="refsect2">

### flags

A bit mask where 1 means to look in the connection, 2 in the global set
of known prefixes.

</div>

</div>

<div id="seealso__xml_get_ns_uri" class="refsect1">

## See Also

`xml_get_ns_prefix() ` `xml_ns_uname() ` `xml_ns_iristr() `
`xml_nsexpand_iristr() `

</div>

</div>
