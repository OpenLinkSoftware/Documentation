<div>

<div>

</div>

<div>

## Name

name — Returns the expanded name of the argument.

</div>

<div>

## Synopsis

<div>

|                         |                      |
|-------------------------|----------------------|
| `string `**`name`**` (` | `node_obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For given node, it returns extended name of the node, i.e. the name of
given attribute or element with namespace prefix replaced with namespace
URI string. If the argument is node-set, first node of the node-set will
be considered. Empty string is returned if the argument is an empty
node-set, a node without name or if the argument is not a node.

If the argument is omitted, context node is used instead as if it is a
node-set of one element.

</div>

<div>

## Parameters

<div>

### node_obj

Node whose name is to be returned.

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Examples

<div>

**Example 24.603. **

<div>

Find all elements whose namespace URIs or local names contain "html"
substring

``` screen
//*[contains(name(),'html')]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_local_name.html" class="link"
title="local-name">local-name()</a>
<a href="xpf_namespace_uri.html" class="link"
title="namespace-uri">namespace_uri()</a>

</div>

</div>
