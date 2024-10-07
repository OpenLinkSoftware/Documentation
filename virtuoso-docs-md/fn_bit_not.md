<div id="fn_bit_not" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

bit_not — Returns bitwise NOT of a 32-bit integer.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bit_not" class="funcsynopsis">

|                      |                       |
|----------------------|-----------------------|
| ` `**`bit_not`**` (` | in `n1 ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bit_not" class="refsect1">

## Description

The function returns bitwise NOT of a given integer.

On 64-bit platforms the argument is intentionally truncated to 32 bits
to maintain compatibility.

</div>

<div id="ret_bit_not" class="refsect1">

## Return Types

Integer.

</div>

<div id="examples_bit_not" class="refsect1">

## Examples

<div id="ex_bit_not" class="example">

**Example 24.25. Using bitwise-NOT**

<div class="example-contents">

``` screen
select bit_not (18);
-19

select bit_not (-18);
-17
```

</div>

</div>

  

</div>

<div id="seealso_bit_not" class="refsect1">

## See Also

<a href="fn_bit_and.html" class="link" title="bit_and"><code
class="function">bit_and() </code></a>

<a href="fn_bit_or.html" class="link" title="bit_or"><code
class="function">bit_or() </code></a>

<a href="fn_bit_shift.html" class="link" title="bit_shift"><code
class="function">bit_shift() </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor() </code></a>

</div>

</div>
