<div id="fn_sinv_create_inverse" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sinv_create_inverse — Creates inverse mapping for the mentioned
functions.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sinv_create_inverse" class="funcsynopsis">

|                                  |                                 |
|----------------------------------|---------------------------------|
| ` `**`sinv_create_inverse`**` (` | in `_SINVM_NAME_IN ` varchar ,  |
|                                  | in `_SINV_INVERSE ` any ,       |
|                                  | in `_SINVM_FLAGS ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sinv_create_inverse" class="refsect1">

## Description

Creates inverse mapping for the mentioned functions (as described in the
doc section <a href="sqlinverse.html" class="link"
title="9.29. SQL Inverse Functions">SQL Inverse Functions</a> )

</div>

<div id="params_sinv_create_inverse" class="refsect1">

## Parameters

<div id="id109950" class="refsect2">

### \_SINVM_NAME_IN

the name of the forward function

</div>

<div id="id109953" class="refsect2">

### \_SINV_INVERSE

an array of the names of the inverse functions (for each part).

</div>

<div id="id109956" class="refsect2">

### \_SINVM_FLAGS

bit mask with:

\[bit 0 - 1 if x \> y \<-\> f(x) \> f (y)) This is true of unit
conversions in general but not true of hash functions or arbitrary id
mappings. If the bit is set the function call may be optimized away if
both operands of a comparison are calls to this function. If this is not
set, the function calls may only be removed in the case of equality.

</div>

</div>

<div id="seealso_sinv_create_inverse" class="refsect1">

## See Also

<a href="fn_sinv_create_key_mapping.html" class="link"
title="sinv_create_key_mapping"><code
class="function">sinv_create_key_mapping </code></a> ,
<a href="fn_sinv_drop_inverse.html" class="link"
title="sinv_drop_inverse"><code
class="function">sinv_drop_inverse </code></a>

</div>

</div>
