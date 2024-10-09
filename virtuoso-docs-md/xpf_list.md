<div>

<div>

</div>

<div>

## Name

list — Selects the first item of every argument sequence and returns the
sequence of the selected items

</div>

<div>

## Synopsis

<div>

|                           |                       |
|---------------------------|-----------------------|
| `sequence `**`list`**` (` | `seq1 ` sequence ,    |
|                           | `seq2 ` sequence ,    |
|                           | `... ` ,              |
|                           | `seqN ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates all given arguments from left to right, and
creates a sequence which contains the first item of the first calculated
sequence, then the first item of the second calculated sequence and so
on. If the value of an argument is not a sequence, but a scalar, the
scalar is treated as one-element sequence so it is added into the
result. If the value of an argument is an empry sequence, nothing is
added into the result (unlike function
<a href="xpf_tuple.html" class="link" title="tuple">tuple()</a> that
adds an empty string in this case).

This function is not a part of XPATH 1.0 or XQUERY 1.0 libraries of
standard functions.

</div>

<div>

## Parameters

<div>

### SeqI

The sequence of items, first of its items will be used as I-tn item of
the resulting sequence

</div>

</div>

<div>

## Return Types

Sequence

</div>

<div>

## Examples

<div>

**Example 24.599. **

<div>

Compose a sequence of the first title in the document, then the first
abstract, then the first introduction

``` screen
list(/title, /abstract, /intro)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_append.html" class="link" title="append">append()</a>
<a href="xpf_tuple.html" class="link" title="tuple">tuple()</a>

</div>

</div>
