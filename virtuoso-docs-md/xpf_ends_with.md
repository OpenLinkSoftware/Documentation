<div>

<div>

</div>

<div>

## Name

ends-with — Returns true if the first argument string ends with the
second argument string, and otherwise returns false.

</div>

<div>

## Synopsis

<div>

|                               |                       |
|-------------------------------|-----------------------|
| `boolean `**`ends-with`**` (` | `strg ` string ,      |
|                               | `suffix ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For two given strings, this function checks if the first string ends
with characters of second string. If any argument is not a string, it is
converted to string using rules from string() XPATH function. Thus if
the second argument has no string value, the function returns true,
because it will be converted to an empty string first.

Unlike start-with() XPATH function, this function is not described in
XPATH 1.0 standard. To write portable XPATH expression, use substring().

</div>

<div>

## Parameters

<div>

### strg

String whose first characters must be compared

</div>

<div>

### prefix

String whose characters must be compared with first characters of
*`strg `*

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.584. **

<div>

``` screen
ends-with('OpenLink Virtuoso', 'Virtuoso')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_contains.html" class="link" title="contains">contains()</a>
<a href="xpf_starts_with.html" class="link"
title="starts-with">starts-with()</a>

</div>

</div>
