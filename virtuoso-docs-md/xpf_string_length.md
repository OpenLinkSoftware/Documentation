<div>

<div>

</div>

<div>

## Name

string-length — Returns the number of characters in the string.

</div>

<div>

## Synopsis

<div>

|                                   |                     |
|-----------------------------------|---------------------|
| `integer `**`string-length`**` (` | `strg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The string-length() XPATH function returns the number of characters in
the string. If the argument is omitted, it defaults to the context node
converted to a string, in other words the string-value of the context
node.

</div>

<div>

## Parameters

<div>

### strg

The string whose length must be measured.

</div>

</div>

<div>

## Return Types

Integer

</div>

<div>

## Examples

<div>

**Example 24.622. **

<div>

The following expressions returns 5.

``` screen
string-length('ABCDE')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">xpf_string()</a>

</div>

</div>
