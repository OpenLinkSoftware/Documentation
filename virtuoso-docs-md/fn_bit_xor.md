<div>

<div>

</div>

<div>

## Name

bit_xor — Returns bitwise XOR (exclusive "or") of two 32-bit integers.

</div>

<div>

## Synopsis

<div>

|                      |                       |
|----------------------|-----------------------|
| ` `**`bit_xor`**` (` | in `n1 ` integer ,    |
|                      | in `n2 ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns bitwise XOR (exclusive "or") of two given integers.

On 64-bit platforms, both arguments are intentionally truncated to 32
bits, to provide compartibility.

</div>

<div>

## Return Types

Integer.

</div>

<div>

## Examples

<div>

**Example 24.27. Bitwise-XOR**

<div>

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

<div>

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
