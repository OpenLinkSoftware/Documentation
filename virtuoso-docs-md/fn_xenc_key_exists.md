<div id="fn_xenc_key_exists" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_exists — Check if named encryption key is in the user's
repository

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_exists" class="funcsynopsis">

|                                 |                         |
|---------------------------------|-------------------------|
| `int `**`xenc_key_exists`**` (` | in `name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_exists" class="refsect1">

## Description

The function checks if key with given name exists in the user's keys.

</div>

<div id="params_xenc_key_exists" class="refsect1">

## Parameters

<div id="id120629" class="refsect2">

### name

The name of the key

</div>

</div>

<div id="ret_xenc_key_exists" class="refsect1">

## Return Types

The function returns integer 1 - true or 0 - false (zero) if key exists
or not

</div>

<div id="examples_xenc_key_exists" class="refsect1">

## Examples

<div id="ex_xenc_key_exists" class="example">

**Example 24.473. Simple Use**

<div class="example-contents">

``` screen
SQL> select xenc_key_exists ('MyKey');
VARCHAR
_______________________________________________________________________________

0

1 Rows. -- 1 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xenc_key_exists" class="refsect1">

## See Also

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove() </code></a>

</div>

</div>
