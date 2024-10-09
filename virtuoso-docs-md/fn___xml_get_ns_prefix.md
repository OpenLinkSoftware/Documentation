<div>

<div>

</div>

<div>

## Name

\_\_xml_get_ns_prefix — Returns prefix by given URI.

</div>

<div>

## Synopsis

<div>

|                                  |                       |
|----------------------------------|-----------------------|
| ` `**`__xml_get_ns_prefix`**` (` | in `str ` varchar ,   |
|                                  | out `flags ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If str is a globally known namespace URI, its prefix is returned, else
null. Flags is a bit mask where 1 means to look in the connection, 2 in
the global set of known prefixes.

</div>

<div>

## Parameters

<div>

### str

uri

</div>

<div>

### flags

bitmask of flags that permit some sorts of syntax errors in resource,
use 0.

</div>

</div>

<div>

## See Also

`xml_get_ns_uri ` `xml_ns_uname ` `xml_ns_iristr `
`xml_nsexpand_iristr `

</div>

</div>
