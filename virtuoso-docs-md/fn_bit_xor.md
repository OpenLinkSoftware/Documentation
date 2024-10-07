<div id="fn_bit_xor" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

bit_xor — Returns bitwise XOR (exclusive "or") of two 32-bit integers.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bit_xor" class="funcsynopsis">

|                      |                       |
|----------------------|-----------------------|
| ` `**`bit_xor`**` (` | in `n1 ` integer ,    |
|                      | in `n2 ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bit_xor" class="refsect1">

## Description

The function returns bitwise XOR (exclusive "or") of two given integers.

On 64-bit platforms, both arguments are intentionally truncated to 32
bits, to provide compartibility.

</div>

<div id="ret_bit_xor" class="refsect1">

## Return Types

Integer.

</div>

<div id="examples_bit_xor" class="refsect1">

## Examples

<div id="ex_bit_xor" class="example">

**Example 24.27. Bitwise-XOR**

<div class="example-contents">

``` screen
select bit_xor (18, 6);
20

select bit_xor (-18, -6);
20

select bit_xor (-18, 6);
-24
```

</div>

</div>

  

</div>

<div id="seealso_bit_xor" class="refsect1">

## See Also

<a href="fn_bit_and.html" class="link" title="bit_and"><code
class="function">bit_and() </code></a>

<a href="fn_bit_or.html" class="link" title="bit_or"><code
class="function">bit_or() </code></a>

<a href="fn_bit_not.html" class="link" title="bit_not"><code
class="function">bit_not() </code></a>

<a href="fn_bit_shift.html" class="link" title="bit_shift"><code
class="function">bit_shift() </code></a>

</div>

</div>
