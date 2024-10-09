<div>

<div>

</div>

<div>

## Name

xenc_key_exists — Check if named encryption key is in the user's
repository

</div>

<div>

## Synopsis

<div>

|                                 |                         |
|---------------------------------|-------------------------|
| `int `**`xenc_key_exists`**` (` | in `name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function checks if key with given name exists in the user's keys.

</div>

<div>

## Parameters

<div>

### name

The name of the key

</div>

</div>

<div>

## Return Types

The function returns integer 1 - true or 0 - false (zero) if key exists
or not

</div>

<div>

## Examples

<div>

**Example 24.473. Simple Use**

<div>

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

<div>

## See Also

<a href="fn_xenc_key_remove.html" class="link"
title="xenc_key_remove"><code
class="function">xenc_key_remove() </code></a>

</div>

</div>
