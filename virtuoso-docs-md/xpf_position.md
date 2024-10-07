<div id="xpf_position" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

position — Returns the context position from expression evaluation
context.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_position" class="funcsynopsis">

|                             |          |     |
|-----------------------------|----------|-----|
| `number `**`position`**` (` | `void)`; |     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_position" class="refsect1">

## Description

Context position is the number of nodes in the node-set where the
context node comes from. For the most popular case, when position() is
used inside a predicate, and the predicate relates to some axis of the
path, position() is the number of calls of the predicate, including the
"current" call which is in progress when the function is called. Thus,
context position cannot be greater than context size.

</div>

<div id="xpf_ret_last_01" class="refsect1">

## Return Types

Positive integer.

</div>

<div id="xpf_examples_last_01" class="refsect1">

## Examples

<div id="xpf_ex_last_01" class="example">

**Example 24.609. Explicit call of position() inside a predicate**

<div class="example-contents">

For every waybill, find the last \<address\> child inside the
\<waybill\> element.

``` screen
//waybill/address[position() = last()]
```

</div>

</div>

  

<div id="xpf_ex_last_02" class="example">

**Example 24.610. Implicit call of position() inside a predicate**

<div class="example-contents">

For every article, find up to three first paragraphs of the first
section.

``` screen
//article/section[1]/paragraph[position()<=3]
```

</div>

</div>

  

</div>

<div id="xpf_seealso_last_01" class="refsect1">

## See Also

<a href="xpf_last.html" class="link" title="last">last()</a>
<a href="xpf_count.html" class="link" title="count">count()</a>

</div>

</div>
