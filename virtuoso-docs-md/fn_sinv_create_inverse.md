<div>

<div>

</div>

<div>

## Name

sinv_create_inverse — Creates inverse mapping for the mentioned
functions.

</div>

<div>

## Synopsis

<div>

|                                  |                                 |
|----------------------------------|---------------------------------|
| ` `**`sinv_create_inverse`**` (` | in `_SINVM_NAME_IN ` varchar ,  |
|                                  | in `_SINV_INVERSE ` any ,       |
|                                  | in `_SINVM_FLAGS ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Creates inverse mapping for the mentioned functions (as described in the
doc section <a href="sqlinverse.html" class="link"
title="9.29. SQL Inverse Functions">SQL Inverse Functions</a> )

</div>

<div>

## Parameters

<div>

### \_SINVM_NAME_IN

the name of the forward function

</div>

<div>

### \_SINV_INVERSE

an array of the names of the inverse functions (for each part).

</div>

<div>

### \_SINVM_FLAGS

bit mask with:

\[bit 0 - 1 if x \> y \<-\> f(x) \> f (y)) This is true of unit
conversions in general but not true of hash functions or arbitrary id
mappings. If the bit is set the function call may be optimized away if
both operands of a comparison are calls to this function. If this is not
set, the function calls may only be removed in the case of equality.

</div>

</div>

<div>

## See Also

<a href="fn_sinv_create_key_mapping.html" class="link"
title="sinv_create_key_mapping"><code
class="function">sinv_create_key_mapping </code></a> ,
<a href="fn_sinv_drop_inverse.html" class="link"
title="sinv_drop_inverse"><code
class="function">sinv_drop_inverse </code></a>

</div>

</div>
