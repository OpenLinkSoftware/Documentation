<div>

<div>

</div>

<div>

## Name

normalize-space — Returns the argument string with whitespace
normalized.

</div>

<div>

## Synopsis

<div>

|                                    |                     |
|------------------------------------|---------------------|
| `string `**`normalize-space`**` (` | `strg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the argument string with whitespace normalized by
stripping leading and trailing whitespace and replacing sequences of
whitespace characters by a single space. Whitespace characters are the
same as those allowed by the S production in XML, i.e. space (#x20),
carriage returns (#xD), line feeds (#xA), and tabs (#x9). If the
argument is omitted, it defaults to the context node converted to a
string, in other words the string-value of the context node.

</div>

<div>

## Parameters

<div>

### strg

A string to be normalized

</div>

</div>

<div>

## Return Types

</div>

<div>

## Examples

<div>

**Example 24.605. **

<div>

``` screen
normalize-space('    too     many   spaces    ')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_translate.html" class="link"
title="translate">translate()</a>
<a href="xpf_replace.html" class="link" title="replace">replace()</a>

</div>

</div>
