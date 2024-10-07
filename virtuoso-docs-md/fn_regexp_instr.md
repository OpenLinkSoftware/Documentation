<div id="fn_regexp_instr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

regexp_instr — Returns the first position of the occurrence of a
regular-expression pattern in a given string.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_regexp_instr" class="funcsynopsis">

|                                  |                                    |
|----------------------------------|------------------------------------|
| `integer `**`regexp_instr`**` (` | in `source_string ` varchar ,      |
|                                  | in `pattern ` varchar ,            |
|                                  | in `start_position ` integer ,     |
|                                  | in `occurrence ` integer ,         |
|                                  | in `return_option ` integer ,      |
|                                  | in `match_parameter ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_11" class="refsect1">

## Description

This function looks for a pattern and returns the first position of the
pattern. Optionally, you can indicate the *`start_position`* you want to
begin the search. The *`occurrence`* parameter defaults to 1 unless you
indicate that you are looking for a subsequent occurrence. The default
value of the *`return_option`* is 0, which returns the starting position
of the pattern; a value of 1 returns the starting position of the next
character following the match.

This function returns the starting position of a pattern, so it works
much like the familiar INSTR function. The main difference between the
two functions is that REGEXP_INSTR lets you specify a pattern instead of
a specific search string; thus providing greater versatility.

</div>

<div id="params_regexp_instr" class="refsect1">

## Parameters

<div id="id104394" class="refsect2">

### source_string

The string to search.

</div>

<div id="id104397" class="refsect2">

### pattern

The regular expression to match.

</div>

<div id="id104400" class="refsect2">

### start_position

The position to begin the search from.

</div>

<div id="id104403" class="refsect2">

### occurrence

Defaulting to 1, this parameter describes how many occurrences to look
for.

</div>

<div id="id104406" class="refsect2">

### return_option

Default is 0, which returns the starting position of the pattern; a
value of 1 returns the starting position of the next character following
the match.

</div>

<div id="id104409" class="refsect2">

### match_parameter

Match parameter value.

</div>

</div>

<div id="ret_regexp_instr" class="refsect1">

## Returns

This function returns the a substring matching the regular expression.

</div>

<div id="examples_05" class="refsect1">

## Examples

<div id="ex_regexp_instr" class="example">

**Example 24.311. Examples**

<div class="example-contents">

This example uses `REGEXP_INSTR()` to return the starting position of
the five-digit zip-code pattern within the string Joe Smith, 10045 Berry
Lane, San Joseph, CA 91234. If the regular expression is written as
:digit:?{5}, you will get the house number's starting position instead
of the zip code's, because 10045 is the first occurrence of five
consecutive digits. Therefore, you must anchor the expression to the end
of the line, as indicated with the \$ metacharacter, and the function
will display the starting position of the zip code regardless of the
number of digits for the house number.

``` programlisting
SELECT REGEXP_INSTR('Joe Smith, 10045 Berry Lane, San Joseph, CA 91234',
       '[[:digit:]]{5}\$')
       AS rx_instr;
  RX_INSTR
----------
        45
```

</div>

</div>

  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Compatibility:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Compatibility:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>The regular
expressions supported here follow version 7.9 of the Perl Compatible
Regular Expression (PCRE) syntax.</p>
<div class="orderedlist">
<ol type="1">
<li><p><a
href="https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions"
class="ulink" target="_top">Wikipedia</a></p></li>
<li><p><a href="http://pcre.org/" class="ulink"
target="_top">PCRE.org</a></p></li>
</ol>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="seealso_regexp_instr" class="refsect1">

## See Also

<a href="fn_regexp_match.html" class="link" title="regexp_match"><code
class="function">regexp_match() </code></a>

<a href="fn_regexp_like.html" class="link" title="regexp_like"><code
class="function">regexp_like() </code></a>

<a href="fn_regexp_parse.html" class="link" title="regexp_parse"><code
class="function">regexp_parse() </code></a>

<a href="fn_regexp_replace.html" class="link"
title="regexp_replace"><code
class="function">regexp_replace() </code></a>

<a href="fn_regexp_substr.html" class="link" title="regexp_substr"><code
class="function">regexp_substr() </code></a>

</div>

</div>
