<div id="xpf_substring" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

substring — Returns the substring of the first argument starting at the
position specified in the second argument with length specified in the
third argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_substring" class="funcsynopsis">

|                              |                        |
|------------------------------|------------------------|
| `string `**`substring`**` (` | `strg ` string ,       |
|                              | `start ` integer ,     |
|                              | `length ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_substring" class="refsect1">

## Description

The substring() XPATH function returns the substring of the *`strg`*
starting at the position specified in *`start`* argument with length
specified in *`length`* argument. If *`length`* is not specified, it
returns the substring starting at the position specified in the
*`start`* argument and continuing to the end of the string.

XPATH 1.0 defines that "each character in the string... is considered to
have a numeric position: the position of the first character is 1, the
position of the second character is 2 and so on. This differs from Java
and ECMAScript, in which the String.substring method treats the position
of the first character as 0." The returned substring contains those
characters for which the position of the character is greater than or
equal to *`start`* and, if *`length`* is specified, less than the sum of
*`start`* and *`length`* .

If *`start`* and/or *`length`* are not integers, they are converted to
integers following rules for round() XPATH function, before doing any
other processing. So they will be rounded first, and the sum of rounded
values will be used as "end position"

If *`start`* is greater than or equal to the length of string, the empty
string is returned. If *`length`* is specified and the sum of *`start`*
is less than or equal to 1, the empty string is returned, too.
Otherwise, the result string will contains some characters even if
*`start`* is less than 1.

If *`length`* *`start`* is greater than or equal to the length of
string, the empty string is returned.

</div>

<div id="xpf_params_substring" class="refsect1">

## Parameters

<div id="id129226" class="refsect2">

### strg

Source string. If the argument is not a string, it is converted to
string first.

</div>

<div id="id129229" class="refsect2">

### start

Position of first character of the substring in the source string.

</div>

<div id="id129232" class="refsect2">

### length

Number of characters in the substring, if specified.

</div>

</div>

<div id="xpf_ret_substring" class="refsect1">

## Return Types

String

</div>

<div id="xpf_examples_substring" class="refsect1">

## Examples

<div id="xpf_ex_substring" class="example">

**Example 24.623. **

<div class="example-contents">

The following expressions are all true:

``` screen
substring("12345", 2, 3) = "234"
substring("12345", 2) = "2345"
substring("12345", 1.5, 2.6) = "234"
substring("12345", 0, 3) = "12"
substring("12345", -2, 5) = "12"
substring("12345", -2) = "12345"
```

</div>

</div>

  

</div>

<div id="xpf_seealso_substring" class="refsect1">

## See Also

<a href="xpf_substring_before.html" class="link"
title="substring-before">substring-before()</a>
<a href="xpf_substring_after.html" class="link"
title="substring-after">substring-after()</a>

</div>

</div>
