<div id="xpf_for" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

for — Repeats some calculation for every item of a given sequence

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_for" class="funcsynopsis">

|                     |                          |
|---------------------|--------------------------|
| `any `**`for`**` (` | `varname ` string ,      |
|                     | `source_set ` sequence , |
|                     | `mapping_expn ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_for" class="refsect1">

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

<div id="xpf_params_for" class="refsect1">

## Parameters

<div id="id127378" class="refsect2">

### varname

Name of temporary variable

</div>

<div id="id127381" class="refsect2">

### source_set

Sequence of items; every item will cause one call of *`mapping_expn `*

</div>

<div id="id127385" class="refsect2">

### mapping_expn

An expression which should be calculated for items of *`source_set `* .

</div>

</div>

<div id="xpf_ret_for" class="refsect1">

## Return Types

Sequence

</div>

<div id="xpf_examples_for" class="refsect1">

## Examples

<div id="xpf_ex_for" class="example">

**Example 24.588. **

<div class="example-contents">

These two expressions are equivalent, but first may be used in any XPATH
while second is written in XQUERY syntax

``` screen
for('itm', /bid/item, 0.20 * $itm/price)
FOR $itm IN /bid/item RETURN 0.20 * $bid_item/price
```

</div>

</div>

  

</div>

<div id="xpf_seealso_for" class="refsect1">

## See Also

<a href="xpf_let.html" class="link" title="let">let()</a>

<a href="xpf_some.html" class="link" title="some">some()</a>

<a href="xpf_every.html" class="link" title="every">every()</a>

</div>

</div>
