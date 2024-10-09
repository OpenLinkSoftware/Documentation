<div>

<div>

</div>

<div>

## Name

local-name — Returns the local part of the expanded name of the
argument.

</div>

<div>

## Synopsis

<div>

|                               |                      |
|-------------------------------|----------------------|
| `string `**`local-name`**` (` | `node_obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For given node, it returns local part of the node, i.e. the name of
given attribute or element with namespace prefix removed. If the
argument is node-set, first node of the node-set will be considered.
Empty string is returned if the argument is an empty node-set, a node
without name or if the argument is not a node.

If the argument is omitted, context node is used instead as if it is a
node-set of one element.

</div>

<div>

## Parameters

<div>

### node_obj

Node whose name is to be returned

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Examples

<div>

**Example 24.600. **

<div>

Find all elements whose names start with "ref..." prefix

``` screen
//*[starts-with(local-name(),'ref')]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_name.html" class="link" title="name">name()</a>
<a href="xpf_namespace_uri.html" class="link"
title="namespace-uri">namespace-uri()</a>

</div>

</div>
