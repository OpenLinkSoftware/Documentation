<div>

<div>

</div>

<div>

## Name

replace — Searches for an substring and replace its occurrences with
other substring.

</div>

<div>

## Synopsis

<div>

|                            |                             |
|----------------------------|-----------------------------|
| `string `**`replace`**` (` | `txt ` string ,             |
|                            | `search_strg ` string ,     |
|                            | `replace_strg ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function searches for all occurrences of a *`search_strg`* in
*`txt`* and replaces every occurrence with *`replace_strg`* . An error
is signalled if *`search_strg`* is empty.

</div>

<div>

## Parameters

<div>

### txt

Text to process.

</div>

<div>

### search_strg

Substring to search for *`txt `* .

</div>

<div>

### replace_strg

Substring to replace *`search_strg `* in *`txt `* .

</div>

</div>

<div>

## Return Types

String.

</div>

<div>

## Errors

<div>

**Table 24.149. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                    | Description                                                                                                                        |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF08 </span> | <span class="errortext">Empty string passed as argument 2 to XPATH function replace() </span> | It is impossible to search for an empty substring.                                                                                 |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF14 </span> | <span class="errortext">The result of XPATH function replace() is too long </span>            | If the function replaces short substring with longer one, the result is longer than the original string and may exceed 10Mb limit. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.615. **

<div>

Replace all occurrences of 'http://www.example.com/' with '/webrobot/'

``` screen
replace(
  '<A HREF="http://www.example.com/index.html">Home</A>',
  'http://www.example.com/', '/webrobot/' )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_translate.html" class="link"
title="translate">translate</a>

</div>

</div>
