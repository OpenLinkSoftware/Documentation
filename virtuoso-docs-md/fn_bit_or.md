<div>

<div>

</div>

<div>

## Name

bit_or — Returns bitwise OR of two 32-bit integers.

</div>

<div>

## Synopsis

<div>

|                     |                       |
|---------------------|-----------------------|
| ` `**`bit_or`**` (` | in `n1 ` integer ,    |
|                     | in `n2 ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns bitwise OR of two given integers.

On 64-bit platforms, both arguments are intentionally truncated to 32
bits to maintain compatibility.

</div>

<div>

## Return Types

Integer.

</div>

<div>

## Examples

<div>

**Example 24.24. Using bitwise-OR**

<div>

``` screen
select bit_or (18, 6);
22

select bit_or (-18, -6);
-2
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_bit_and.html" class="link" title="bit_and"><code
class="function">bit_and() </code></a>

<a href="fn_bit_not.html" class="link" title="bit_not"><code
class="function">bit_not() </code></a>

<a href="fn_bit_shift.html" class="link" title="bit_shift"><code
class="function">bit_shift() </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor() </code></a>

</div>

</div>
