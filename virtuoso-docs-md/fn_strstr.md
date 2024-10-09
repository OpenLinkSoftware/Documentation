<div>

<div>

</div>

<div>

## Name

strstr — substring search

</div>

<div>

## Synopsis

<div>

|                     |                       |
|---------------------|-----------------------|
| ` `**`strstr`**` (` | in `str ` string ,    |
|                     | in `sub ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`strstr ` performs a substring search, returning a zero-based index
pointing to beginning of first occurrence of *`sub`* or NULL if not
found.

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

**Example 24.412. Sample example**

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

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

</div>

</div>
