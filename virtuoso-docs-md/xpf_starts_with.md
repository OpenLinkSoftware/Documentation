<div>

<div>

</div>

<div>

## Name

starts-with — Returns true if the first argument string starts with the
second argument string, and otherwise returns false.

</div>

<div>

## Synopsis

<div>

|                                 |                       |
|---------------------------------|-----------------------|
| `boolean `**`starts-with`**` (` | `strg ` string ,      |
|                                 | `prefix ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For two given strings, this function checks if the first string starts
with characters of second string. If any argument is not a string, it is
converted to string using rules for string() XPATH function. Thus if the
second argument has no string value, the function returns true, because
it will be converted to an empty string first.

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

**Example 24.620. **

<div>

``` screen
starts-with('OpenLink Virtuoso', 'OpenLink')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_contains.html" class="link" title="contains">contains()</a>
<a href="xpf_ends_with.html" class="link"
title="ends-with">ends-with()</a>

</div>

</div>
