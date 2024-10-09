<div>

<div>

</div>

<div>

## Name

count — Returns the number of values in the sequence.

</div>

<div>

## Synopsis

<div>

|                           |                 |
|---------------------------|-----------------|
| `integer `**`count`**` (` | `seq ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns 1 if the argument is a single value or a count of elements in
the given sequence of values.

This function must be called with an argument, it do nothing with
context. To count nodes in context node-set, use last().

</div>

<div>

## Parameters

<div>

### seq

Sequence of values to be counted.

</div>

</div>

<div>

## Return Types

Integer

</div>

<div>

## Errors

This function never returns any errors

</div>

<div>

## Examples

<div>

**Example 24.573. **

<div>

``` screen
count(//*)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_empty.html" class="link" title="empty">empty()</a>
<a href="xpf_last.html" class="link" title="last">last()</a>

</div>

</div>
