<div id="fn_bit_shift" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

bit_shift — Returns the result of bitwise shift operation over two
32-bit integers.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bit_shift" class="funcsynopsis">

|                        |                             |
|------------------------|-----------------------------|
| ` `**`bit_shift`**` (` | in `value ` integer ,       |
|                        | in `distance ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bit_shift" class="refsect1">

## Description

The function returns bitwise shift of two given integers. Depending on
the arguments, the shift may be left or right. For right-shift, leftmost
bits of the result are filled by the value of the 31-st bit.

On 64-bit platforms, both arguments are intentionally truncated to 32
bits and the shift is restricted to 32 bits to maintain compatibility.

</div>

<div id="params_bit_shift" class="refsect1">

## Parameters

<div id="id81284" class="refsect2">

### value

The value to be shifted.

</div>

<div id="id81287" class="refsect2">

### distance

The sign of the parameter specifies the direction of the shift: positive
values indicate shift to the left, negative values indicate shift to the
right. The absolute value of the parameter specifies the number of bits
to shift. The value of zero means that the result is equal to the value
of the first argument.

</div>

</div>

<div id="ret_bit_shift" class="refsect1">

## Return Types

Integer.

</div>

<div id="examples_bit_shift" class="refsect1">

## Examples

<div id="ex_bit_shift" class="example">

**Example 24.26. Bitwise-shifting**

<div class="example-contents">

``` screen
select bit_shift (18, 6);
1152

select bit_shift (-18, 6);
-1152

select bit_shift (1152, -6);
18

select bit_shift (-1152, -6);
-18
```

</div>

</div>

  

</div>

<div id="seealso_bit_shift" class="refsect1">

## See Also

<a href="fn_bit_and.html" class="link" title="bit_and"><code
class="function">bit_and </code></a>

<a href="fn_bit_or.html" class="link" title="bit_or"><code
class="function">bit_or </code></a>

<a href="fn_bit_not.html" class="link" title="bit_not"><code
class="function">bit_not </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor </code></a>

</div>

</div>
