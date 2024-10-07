<div id="fn_regexp_replace" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

regexp_replace — Replaces occurrence(s) of the matching pattern in the
source_string with a specified replace_string.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_regexp_replace" class="funcsynopsis">

|                                    |                                    |
|------------------------------------|------------------------------------|
| `varchar `**`regexp_replace`**` (` | in `source_string ` any ,          |
|                                    | in `pattern ` any ,                |
|                                    | in `replace_string ` varchar ,     |
|                                    | in `position ` integer ,           |
|                                    | in `occurrence ` any ,             |
|                                    | in `match_parameter ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_10" class="refsect1">

## Description

This function replaces occurrence(s) of the matching *`pattern`* in the
*`source_string`* with a specified *`replace_string`* , allowing complex
search-and-replace operations. The traditional REPLACE SQL function
substitutes one string with another. Assume your data has extraneous
spaces in the text and you would like to replace them with a single
space. With the REPLACE function, you would need to list exactly how
many spaces you want to replace. However, the number of extra spaces may
not be the same everywhere in the text.

</div>

<div id="params_regexp_replace" class="refsect1">

## Parameters

<div id="id104307" class="refsect2">

### source_string

Source string.

</div>

<div id="id104310" class="refsect2">

### pattern

The regular expression to match.

</div>

<div id="id104313" class="refsect2">

### replace_string

By default an empty string, ''.

</div>

<div id="id104316" class="refsect2">

### position

By default this is set to 1.

</div>

<div id="id104319" class="refsect2">

### occurrence

By default this is set to 0. If you specify occurrence as DB NULL value
it will replace all the occurrences of the pattern in the string.

</div>

<div id="id104322" class="refsect2">

### match_parameter

By default this is set to null.

</div>

</div>

<div id="ret_regexp_replace" class="refsect1">

## Returns

This function returns the a substring matching the regular expression.

</div>

<div id="examples_regexp_replace" class="refsect1">

## Examples

<div id="ex_regexp_replace" class="example">

**Example 24.310. **

<div class="example-contents">

This example has three spaces between Joe and Smith. The REPLACE
function's parameter specifies that two spaces should be replaced with
one space. In this case, the result leaves an extra space where there
were three spaces in the original string between Joe and Smith.

``` programlisting
SELECT
  REPLACE('Joe  Smith', '  ', ' ') AS REPLACE_NORMAL,
  REGEXP_REPLACE('Joe        Smith', '( ){2,}', ' ') AS REGEXP_REPLACE;

REPLACE_NORMAL              REPLACE_REGEXP
VARCHAR                     VARCHAR
______________________________________________

Joe Smith                   Joe Smith
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

<div id="seealso_regexp_replace" class="refsect1">

## See Also

<a href="fn_regexp_match.html" class="link" title="regexp_match"><code
class="function">regexp_match() </code></a>

<a href="fn_regexp_like.html" class="link" title="regexp_like"><code
class="function">regexp_like() </code></a>

<a href="fn_regexp_instr.html" class="link" title="regexp_instr"><code
class="function">regexp_instr() </code></a>

<a href="fn_regexp_parse.html" class="link" title="regexp_parse"><code
class="function">regexp_parse() </code></a>

<a href="fn_regexp_substr.html" class="link" title="regexp_substr"><code
class="function">regexp_substr() </code></a>

</div>

</div>