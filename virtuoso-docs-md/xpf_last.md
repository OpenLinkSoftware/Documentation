<div>

<div>

</div>

<div>

## Name

last — Returns the context size from expression evaluation context.

</div>

<div>

## Synopsis

<div>

|                         |          |     |
|-------------------------|----------|-----|
| `number `**`last`**` (` | `void)`; |     |

<div>

 

</div>

</div>

</div>

<div>

## Description

Context size is the number of nodes in the node-set where the context
node comes from. For the most popular case, when last() is used inside a
predicate, and the predicate relates to some axis of the path, last() is
the number of elements found by that axis at once; in other words, the
number of elements to be tested by predicate.

</div>

<div>

## Return Types

Positive integer.

</div>

<div>

## Examples

<div>

**Example 24.597. Call of last() inside a predicate**

<div>

Find all waybills with more than one \<address\> child inside the
\<waybill\> element.

``` screen
//waybill/address[last()>1]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_position.html" class="link" title="position">position()</a>
<a href="xpf_count.html" class="link" title="count">count()</a>

</div>

</div>
