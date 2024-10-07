<div id="xpf_last" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

last — Returns the context size from expression evaluation context.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_last" class="funcsynopsis">

|                         |          |     |
|-------------------------|----------|-----|
| `number `**`last`**` (` | `void)`; |     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_last" class="refsect1">

## Description

Context size is the number of nodes in the node-set where the context
node comes from. For the most popular case, when last() is used inside a
predicate, and the predicate relates to some axis of the path, last() is
the number of elements found by that axis at once; in other words, the
number of elements to be tested by predicate.

</div>

<div id="xpf_ret_last" class="refsect1">

## Return Types

Positive integer.

</div>

<div id="xpf_examples_last" class="refsect1">

## Examples

<div id="xpf_ex_last" class="example">

**Example 24.597. Call of last() inside a predicate**

<div class="example-contents">

Find all waybills with more than one \<address\> child inside the
\<waybill\> element.

``` screen
//waybill/address[last()>1]
```

</div>

</div>

  

</div>

<div id="xpf_seealso_last" class="refsect1">

## See Also

<a href="xpf_position.html" class="link" title="position">position()</a>
<a href="xpf_count.html" class="link" title="count">count()</a>

</div>

</div>
