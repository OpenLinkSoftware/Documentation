<div>

<div>

</div>

<div>

## Name

strcasestr — case-insensitive substring search

</div>

<div>

## Synopsis

<div>

|                         |                       |
|-------------------------|-----------------------|
| ` `**`strcasestr`**` (` | in `str ` string ,    |
|                         | in `sub ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`strcasestr ` performs a case-insensitive substring search, returning a
zero-based index pointing to beginning of first occurrence of *`sub`* or
NULL if not found.

</div>

<div>

## Parameters

<div>

### str

String to search from.

</div>

<div>

### sub

Substring to search for.

</div>

</div>

<div>

## Return Types

An <span class="type">integer </span> zero-based index to first
occurrence of *`sub`* .

</div>

<div>

## Examples

<div>

**Example 24.405. Sample example**

<div>

``` screen
strstr('AbracadabrA','abrA')
    -> 7 (Found from the eighth character onwards)
strcasestr('AbracadabrA','abrA')
    -> 0 (Found from the beginning of string)
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_strstr.html" class="link" title="strstr"><code
class="function">strstr </code></a> .

</div>

</div>
