<div>

<div>

</div>

<div>

## Name

tuple — Selects the first item of every argument sequence and returns
the sequence of the selected items

</div>

<div>

## Synopsis

<div>

|                            |                       |
|----------------------------|-----------------------|
| `sequence `**`tuple`**` (` | `seq1 ` sequence ,    |
|                            | `seq2 ` sequence ,    |
|                            | `... ` ,              |
|                            | `seqN ` sequence `)`; |

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
result. If the value of an argument is an empry sequence, the empty
string is added into the result.

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

**Example 24.635. **

<div>

``` screen
tuple(/title, /abstract, /intro)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_append.html" class="link" title="append">append</a>
<a href="xpf_list.html" class="link" title="list">list</a>

</div>

</div>
