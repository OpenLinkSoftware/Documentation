<div>

<div>

</div>

<div>

## Name

namespace-uri — Returns the namespace URI of the extended name of the
given node

</div>

<div>

## Synopsis

<div>

|                                  |                      |
|----------------------------------|----------------------|
| `string `**`namespace-uri`**` (` | `node_obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If given argument is a node, the function returns the URI string of the
namespace specified in the name of node. If the argument is node-set,
first node of the node-set will be considered. Empty string is returned
if the argument is an empty node-set, a node without name or if the
argument is not a node.

If the argument is omitted, context node is used instead as if it is a
node-set of one element.

</div>

<div>

## Parameters

<div>

### node_obj

Node whose namespace URI is to be returned.

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Examples

<div>

**Example 24.604. **

<div>

Find all elements whose namespace URIs contain "html" substring

``` screen
//*[contains(namespace-uri(),'html')]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_local_name.html" class="link"
title="local-name">local-name()</a>
<a href="xpf_name.html" class="link" title="name">name()</a>

</div>

</div>
