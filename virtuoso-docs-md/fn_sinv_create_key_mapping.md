<div id="fn_sinv_create_key_mapping" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sinv_create_key_mapping — Creates a key mapping function & table.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sinv_create_key_mapping" class="funcsynopsis">

|                                      |                                  |
|--------------------------------------|----------------------------------|
| ` `**`sinv_create_key_mapping`**` (` | in `map_name ` varchar ,         |
|                                      | in `part_defs ` any ,            |
|                                      | in `do_drops ` integer := 1 `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sinv_create_key_mapping" class="refsect1">

## Description

Creates a key mapping function & table (as described in the doc section
<a href="sqlinverse.html" class="link"
title="9.29. SQL Inverse Functions">SQL Inverse Functions</a> )

</div>

<div id="params_sinv_create_key_mapping" class="refsect1">

## Parameters

<div id="id109905" class="refsect2">

### map_name

(string) the name of the mapping. This becomes the name of the forward
function (from parts to single int value) and participates in the name
of the lookup table (like MAP\_ \<map_name\>)

</div>

<div id="id109908" class="refsect2">

### part_defs

contains an array of name/type pairs describing the parts of the
mapping. The types are used in the MAP table as column types and the
type names are used in naming the referenced functions (one for each
part) like : \<map_name\>\_ \<part_name\>

</div>

<div id="id109911" class="refsect2">

### do_drops

integer (0, 1, 2 : default value 1)

this controls how the function will go about dropping the already
existing objects:

|                                                                                    |
|------------------------------------------------------------------------------------|
| 0 - don't issue any DROP TABLE/PROCEDURE/INVERSE calls, just the CREATE statements |
| 1 - do the DROPs before issuing the actual CREATE statements                       |
| 2 - do \*only\* the DROPs without the CREATEs.                                     |

</div>

</div>

<div id="seealso_sinv_create_key_mapping" class="refsect1">

## See Also

<a href="fn_sinv_create_inverse.html" class="link"
title="sinv_create_inverse"><code
class="function">sinv_create_inverse </code></a> ,
<a href="fn_sinv_drop_inverse.html" class="link"
title="sinv_drop_inverse"><code
class="function">sinv_drop_inverse </code></a>

</div>

</div>
