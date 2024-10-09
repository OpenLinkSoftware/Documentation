<div>

<div>

</div>

<div>

## Name

bit_not — Returns bitwise NOT of a 32-bit integer.

</div>

<div>

## Synopsis

<div>

|                      |                       |
|----------------------|-----------------------|
| ` `**`bit_not`**` (` | in `n1 ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns bitwise NOT of a given integer.

On 64-bit platforms the argument is intentionally truncated to 32 bits
to maintain compatibility.

</div>

<div>

## Return Types

Integer.

</div>

<div>

## Examples

<div>

**Example 24.25. Using bitwise-NOT**

<div>

``` screen
select bit_not (18);
-19

select bit_not (-18);
-17
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

<a href="fn_bit_shift.html" class="link" title="bit_shift"><code
class="function">bit_shift() </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor() </code></a>

</div>

</div>
