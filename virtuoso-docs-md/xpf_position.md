<div>

<div>

</div>

<div>

## Name

position — Returns the context position from expression evaluation
context.

</div>

<div>

## Synopsis

<div>

|                             |          |     |
|-----------------------------|----------|-----|
| `number `**`position`**` (` | `void)`; |     |

<div>

 

</div>

</div>

</div>

<div>

## Description

Context position is the number of nodes in the node-set where the
context node comes from. For the most popular case, when position() is
used inside a predicate, and the predicate relates to some axis of the
path, position() is the number of calls of the predicate, including the
"current" call which is in progress when the function is called. Thus,
context position cannot be greater than context size.

</div>

<div>

## Return Types

Positive integer.

</div>

<div>

## Examples

<div>

**Example 24.609. Explicit call of position() inside a predicate**

<div>

For every waybill, find the last \<address\> child inside the
\<waybill\> element.

``` screen
//waybill/address[position() = last()]
```

</div>

</div>

  

<div>

**Example 24.610. Implicit call of position() inside a predicate**

<div>

For every article, find up to three first paragraphs of the first
section.

``` screen
//article/section[1]/paragraph[position()<=3]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_last.html" class="link" title="last">last()</a>
<a href="xpf_count.html" class="link" title="count">count()</a>

</div>

</div>
