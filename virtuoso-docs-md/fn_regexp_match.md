<div id="fn_regexp_match" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

regexp_match — returns a substring matching the regular expression to
the supplied string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_regexp_match" class="funcsynopsis">

|                                  |                                   |
|----------------------------------|-----------------------------------|
| `varchar `**`regexp_match`**` (` | in `pattern ` any ,               |
|                                  | inout `str ` any ,                |
|                                  | in `change_the_str ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_regexp_match" class="refsect1">

## Description

The regexp_match function returns a copy of substring of string *`str`*
which matches the regular expression pattern.

Previous behavior of this function would cut the first characters of
*`str`* until the end of regular expression matched substring. In this
way *`str`* could be passed to this function again to find the next
occurrence of substring that matches the regular expression. By default
this behavior is not adopted by this function, but can be enabled for
pre 3.2 compatibility by supplying the optional third parameter.

If either the *`pattern`* or *`str`* parameter contain wide characters
this function will operate in wide mode, first converting any narrow
characters to wide and returning a wide character response. Otherwise
this function operates in narrow mode by default.

</div>

<div id="params_regexp_match" class="refsect1">

## Parameters

<div id="id99946" class="refsect2">

### pattern

The regular expression to match.

</div>

<div id="id99949" class="refsect2">

### str

The string to be searched. In compatibility mode (change_the_str =1)
this string in modified, removing the matched substring.

</div>

<div id="id99952" class="refsect2">

### change_the_str

This new parameter allows this function to operate in pre 3.2
compatibility mode which modified the original string. By default this
parameter is set to "0" so that the original string is never altered.

</div>

</div>

<div id="ret_regexp_match" class="refsect1">

## Returns

This function returns the a substring matching the regular expression.

</div>

<div id="examples_regexp_like" class="refsect1">

## Examples

<div id="ex_regexp_match" class="example">

**Example 24.251. Examples**

<div class="example-contents">

``` programlisting
CREATE PROCEDURE all_tokens(IN pattern VARCHAR, IN str VARCHAR)
{
    DECLARE wrd VARCHAR;
    DECLARE ans VARCHAR;
    DECLARE str_i VARCHAR;

    ans:='';
    str_i := str;
    wrd := regexp_match(pattern,str_i);
    WHILE (wrd IS NOT NULL)
    {
        ans := concat(ans,',',wrd);
        wrd := regexp_match(pattern, str_i, 1);
    };
    RETURN ans;
};
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

<div id="seealso_regexp_match" class="refsect1">

## See Also

<a href="fn_regexp_parse.html" class="link" title="regexp_parse"><code
class="function">regexp_parse() </code></a>

<a href="fn_regexp_like.html" class="link" title="regexp_like"><code
class="function">regexp_like() </code></a>

<a href="fn_regexp_instr.html" class="link" title="regexp_instr"><code
class="function">regexp_instr() </code></a>

<a href="fn_regexp_replace.html" class="link"
title="regexp_replace"><code
class="function">regexp_replace() </code></a>

<a href="fn_regexp_substr.html" class="link" title="regexp_substr"><code
class="function">regexp_substr() </code></a>

</div>

</div>
