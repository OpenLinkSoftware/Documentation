<div id="fn_bit_and" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

bit_and — Returns bitwise AND of two 32-bit integers.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bit_and" class="funcsynopsis">

|                      |                       |
|----------------------|-----------------------|
| ` `**`bit_and`**` (` | in `n1 ` integer ,    |
|                      | in `n2 ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bit_and" class="refsect1">

## Description

The function returns bitwise AND of two given integers.

On 64-bit platforms, both arguments are intentionally truncated to 32
bits to maintain compatibility.

</div>

<div id="ret_bit_and" class="refsect1">

## Return Types

Integer.

</div>

<div id="examples_bit_and" class="refsect1">

## Examples

<div id="ex_bit_and" class="example">

**Example 24.23. Using bitwise-AND**

<div class="example-contents">

``` screen
select bit_and (18, 6);
2

select bit_and (-18, -6);
-22
```

</div>

</div>

  

</div>

<div id="seealso_bit_and" class="refsect1">

## See Also

<a href="fn_bit_not.html" class="link" title="bit_not"><code
class="function">bit_not() </code></a>

<a href="fn_bit_or.html" class="link" title="bit_or"><code
class="function">bit_or() </code></a>

<a href="fn_bit_shift.html" class="link" title="bit_shift"><code
class="function">bit_shift() </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor() </code></a>

</div>

</div>
