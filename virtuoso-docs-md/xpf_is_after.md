<div id="xpf_is_after" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

is_after — Returns true if the given entity is after the second given
entity in document order, otherwise returns false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_is_after" class="funcsynopsis">

|                              |                     |
|------------------------------|---------------------|
| `boolean `**`is_after`**` (` | `ent1 ` entity ,    |
|                              | `ent2 ` entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_is_after" class="refsect1">

## Description

The function ensures that both *`ent1`* and *`ent2`* are XML entities
and the returns true if *`ent1`* and *`ent2`* are both in the same XML
document and *`ent1`* is strictly after *`ent2`* in document order. It
returns false if one of them is not an entity but an empty node-set or
if their documents differ or or if they're equal or if one of them is an
ancestor of other or if *`ent1`* is simply before *`ent2`* in document
order.

</div>

<div id="xpf_params_is_after" class="refsect1">

## Parameters

<div id="id127748" class="refsect2">

### ent1

An XML entity or an node-set whose first node is compared.

</div>

<div id="id127751" class="refsect2">

### ent2

An XML entity or an node-set whose first node is compared.

</div>

</div>

<div id="xpf_ret_is_after" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_errors_is_after" class="refsect1">

## Errors

<div id="id127759" class="table">

**Table 24.145. Errors signalled by is_after()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                     | Description                                                                                             |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFB0 </span> | <span class="errortext">First argument of XPATH function is-before() or is-after() must be XML entity </span>  | The value that is neither an XML entity nor an empty node-set may not be compared using document order. |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFB1 </span> | <span class="errortext">Second argument of XPATH function is-before() or is-after() must be XML entity </span> | The value that is neither an XML entity nor an empty node-set may not be compared using document order. |

</div>

</div>

  

</div>

<div id="xpf_examples_is_after" class="refsect1">

## Examples

<div id="xpf_ex_is_after" class="example">

**Example 24.594. **

<div class="example-contents">

Find all chapters that have title after table of content

``` screen
/book/chapter[is-after(toc,title)]
```

</div>

</div>

  

</div>

<div id="xpf_seealso_is_after" class="refsect1">

## See Also

<a href="xpf_is_before.html" class="link"
title="is_before">is_before()</a>

</div>

</div>
