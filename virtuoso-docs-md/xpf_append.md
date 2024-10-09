<div>

<div>

</div>

<div>

## Name

append — Creates an sequence of all items from given sequences.

</div>

<div>

## Synopsis

<div>

|                             |                       |
|-----------------------------|-----------------------|
| `sequence `**`append`**` (` | `seq1 ` sequence ,    |
|                             | `seq2 ` sequence ,    |
|                             | `... ` ,              |
|                             | `seqN ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates all given arguments from left to right, and
creates a sequence which contains all items of the first calculated
sequence, then all items of the second calculated sequence and so on,
preserving the order of items from every sequence. The result is
identical to the result of XQUERY "comma operator".

This function is not a part of XPATH 1.0 or XQUERY 1.0 libraries of
standard functions.

</div>

<div>

## Parameters

<div>

### SeqI

The sequence of items to be placed into the resulting sequence

</div>

</div>

<div>

## Return Types

Sequence

</div>

<div>

## Examples

<div>

**Example 24.563. **

<div>

``` screen
append(/abstract, /chapter, /appendix/section)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_tuple.html" class="link" title="tuple">tuple</a>

</div>

</div>
