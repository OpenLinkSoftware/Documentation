<div id="xpf_local_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

local-name — Returns the local part of the expanded name of the
argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_local_name" class="funcsynopsis">

|                               |                      |
|-------------------------------|----------------------|
| `string `**`local-name`**` (` | `node_obj ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_local_name" class="refsect1">

## Description

For given node, it returns local part of the node, i.e. the name of
given attribute or element with namespace prefix removed. If the
argument is node-set, first node of the node-set will be considered.
Empty string is returned if the argument is an empty node-set, a node
without name or if the argument is not a node.

If the argument is omitted, context node is used instead as if it is a
node-set of one element.

</div>

<div id="xpf_params_local_name" class="refsect1">

## Parameters

<div id="id128096" class="refsect2">

### node_obj

Node whose name is to be returned

</div>

</div>

<div id="xpf_ret_local_name" class="refsect1">

## Return Types

String

</div>

<div id="xpf_examples_local_name" class="refsect1">

## Examples

<div id="xpf_ex_local_name" class="example">

**Example 24.600. **

<div class="example-contents">

Find all elements whose names start with "ref..." prefix

``` screen
//*[starts-with(local-name(),'ref')]
```

</div>

</div>

  

</div>

<div id="xpf_seealso_local_name" class="refsect1">

## See Also

<a href="xpf_name.html" class="link" title="name">name()</a>
<a href="xpf_namespace_uri.html" class="link"
title="namespace-uri">namespace-uri()</a>

</div>

</div>
