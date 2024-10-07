<div id="xpf_namespace_uri" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

namespace-uri — Returns the namespace URI of the extended name of the
given node

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_namespace_uri" class="funcsynopsis">

|                                  |                      |
|----------------------------------|----------------------|
| `string `**`namespace-uri`**` (` | `node_obj ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_namespace_uri" class="refsect1">

## Description

If given argument is a node, the function returns the URI string of the
namespace specified in the name of node. If the argument is node-set,
first node of the node-set will be considered. Empty string is returned
if the argument is an empty node-set, a node without name or if the
argument is not a node.

If the argument is omitted, context node is used instead as if it is a
node-set of one element.

</div>

<div id="xpf_params_namespace_uri" class="refsect1">

## Parameters

<div id="id128294" class="refsect2">

### node_obj

Node whose namespace URI is to be returned.

</div>

</div>

<div id="xpf_ret_namespace_uri" class="refsect1">

## Return Types

String

</div>

<div id="xpf_examples_namespace_uri" class="refsect1">

## Examples

<div id="xpf_ex_namespace_uri" class="example">

**Example 24.604. **

<div class="example-contents">

Find all elements whose namespace URIs contain "html" substring

``` screen
//*[contains(namespace-uri(),'html')]
```

</div>

</div>

  

</div>

<div id="xpf_seealso_namespace_uri" class="refsect1">

## See Also

<a href="xpf_local_name.html" class="link"
title="local-name">local-name()</a>
<a href="xpf_name.html" class="link" title="name">name()</a>

</div>

</div>
