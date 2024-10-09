<div>

<div>

</div>

<div>

## Name

contains — Returns true if the first argument string contains the second
argument string, and otherwise returns false.

</div>

<div>

## Synopsis

<div>

|                              |                       |
|------------------------------|-----------------------|
| `boolean `**`contains`**` (` | `haystack ` string ,  |
|                              | `needle ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

For two given strings, this function checks if the first string contains
the second string. If any argument is not a string, it is converted to
string using rules from string() XPATH function. Thus if the second
argument has no string value, the function returns true, because it will
be converted to an empty string first.

</div>

<div>

## Parameters

<div>

### haystack

String where the search is performed

</div>

<div>

### needle

String to search

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.572. **

<div>

``` screen
contains ('OpenLink Virtuoso', 'Link')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_starts_with.html" class="link"
title="starts-with">starts-with()</a>
<a href="xpf_ends_with.html" class="link"
title="ends-with">ends-with()</a>

</div>

</div>
