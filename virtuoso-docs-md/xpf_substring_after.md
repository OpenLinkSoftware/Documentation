<div>

<div>

</div>

<div>

## Name

substring-after — Returns the substring of the first argument string
that follows the first occurrence of the second argument string in the
first argument string.

</div>

<div>

## Synopsis

<div>

|                                    |                         |
|------------------------------------|-------------------------|
| `string `**`substring-after`**` (` | `source_strg ` string , |
|                                    | `sub_strg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

If the *`source_strg`* does not contain *`sub_strg`* , the function
returns the empty string. Otherwise, it finds the first occurrence of
*`sub_strg`* and returns the pert of *`source_strg`* that follows the
occurrence. If any argument is not a string, it is converted to string
using rules for string() XPATH function.

</div>

<div>

## Parameters

<div>

### source_strg

String where the search is performed

</div>

<div>

### sub_strg

String to search

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Examples

<div>

**Example 24.624. **

<div>

Extract time and timezone ("23:59:59 GMT" substring) from timestamp

``` screen
substring-after('1999-12-31 23:59:59 GMT',' ')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_substring.html" class="link"
title="substring">substring()</a>
<a href="xpf_substring_after.html" class="link"
title="substring-after">substring-after()</a>

</div>

</div>
