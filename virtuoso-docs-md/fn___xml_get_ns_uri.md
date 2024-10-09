<div>

<div>

</div>

<div>

## Name

\_\_xml_get_ns_uri — Returns URI by given namespace prefix.

</div>

<div>

## Synopsis

<div>

|                               |                       |
|-------------------------------|-----------------------|
| ` `**`__xml_get_ns_uri`**` (` | in `str ` varchar ,   |
|                               | out `flags ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If str is a globally known namespace prefix, its URI is returned, else
null. Flags is a bit mask where 1 means to look in the connection, 2 in
the global set of known prefixes.

</div>

<div>

## Parameters

<div>

### str

namespace prefix

</div>

<div>

### flags

A bit mask where 1 means to look in the connection, 2 in the global set
of known prefixes.

</div>

</div>

<div>

## See Also

`xml_get_ns_prefix() ` `xml_ns_uname() ` `xml_ns_iristr() `
`xml_nsexpand_iristr() `

</div>

</div>
