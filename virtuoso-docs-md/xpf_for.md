<div>

<div>

</div>

<div>

## Name

for — Repeats some calculation for every item of a given sequence

</div>

<div>

## Synopsis

<div>

|                     |                          |
|---------------------|--------------------------|
| `any `**`for`**` (` | `varname ` string ,      |
|                     | `source_set ` sequence , |
|                     | `mapping_expn ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function creates a temporary local variable, whose name is specified
by *`varname`* argument. Then, for every item of *`source_set`* sequence
it calculates the value of *`mapping_expn`* expression having set the
created variable to that "current" item. It returns the "flattened"
sequence of values returned by *`mapping_expn`* in the same order as
they are calculated. "Flattened" means that if *`mapping_expn`* returns
an sequence, items of this sequence will be added into the end of
resulting sequence, one by one, instead of adding one item of type
"sequence".

The temporary variable is destroyed on return.

This function is used in the implementation of "FOR" control operator in
XQUERY, so you will probably use that operator in XQUERY expressions,
not the function. This function may be useful in XPATH expressions and
in XSLT stylesheets. It is not a part of library of standard XQUERY 1.0
functions.

</div>

<div>

## Parameters

<div>

### varname

Name of temporary variable

</div>

<div>

### source_set

Sequence of items; every item will cause one call of *`mapping_expn `*

</div>

<div>

### mapping_expn

An expression which should be calculated for items of *`source_set `* .

</div>

</div>

<div>

## Return Types

Sequence

</div>

<div>

## Examples

<div>

**Example 24.588. **

<div>

These two expressions are equivalent, but first may be used in any XPATH
while second is written in XQUERY syntax

``` screen
for('itm', /bid/item, 0.20 * $itm/price)
FOR $itm IN /bid/item RETURN 0.20 * $bid_item/price
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_let.html" class="link" title="let">let()</a>

<a href="xpf_some.html" class="link" title="some">some()</a>

<a href="xpf_every.html" class="link" title="every">every()</a>

</div>

</div>
