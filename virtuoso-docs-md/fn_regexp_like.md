<div id="fn_regexp_like" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

regexp_like — Allows a like comparison using regular-expression.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_regexp_like" class="funcsynopsis">

|                                 |                                    |
|---------------------------------|------------------------------------|
| `integer `**`regexp_like`**` (` | in `source_string ` any ,          |
|                                 | in `pattern ` any ,                |
|                                 | in `match_parameter ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_regexp_like" class="refsect1">

## Description

The source_string supports character datatypes (CHAR, VARCHAR2, CLOB,
NCHAR, NVARCHAR2, and NCLOB but not LONG). The pattern parameter is
another name for the regular expression. match_parameter allows optional
parameters such as handling the newline character, retaining multiline
formatting, and providing control over case-sensitivity.

</div>

<div id="params_regexp_like" class="refsect1">

## Parameters

<div id="id104472" class="refsect2">

### source_string

Source string

</div>

<div id="id104475" class="refsect2">

### pattern

The regular expression to match. The following special classes are
supported:

|                                                                                                           |
|-----------------------------------------------------------------------------------------------------------|
| \[:alpha:\] Alphabetic characters                                                                         |
| \[:lower:\] Lowercase alphabetic characters                                                               |
| \[:upper:\] Uppercase alphabetic characters                                                               |
| \[:digit:\] Numeric digits                                                                                |
| \[:alnum:\] Alphanumeric characters                                                                       |
| \[:space:\] Space characters (nonprinting), such as carriage return, newline, vertical tab, and form feed |
| \[:punct:\] Punctuation characters                                                                        |
| \[:cntrl:\] Control characters (nonprinting)                                                              |
| \[:print:\] Printable characters                                                                          |

</div>

<div id="id104488" class="refsect2">

### match_parameter

This is null by default.

</div>

</div>

<div id="examples_regexp_like_01" class="refsect1">

## Examples

<div id="ex_regexp_like" class="example">

**Example 24.312. Simple Use**

<div class="example-contents">

The following SQL query's WHERE clause shows the REGEXP_LIKE operator,
which searches the ZIP column for a pattern that satisfies the regular
expression \[^\[:digit:\]\]. It will retrieve those rows in the ZIPCODE
table for which the ZIP column values contain any character that is not
a numeric digit.

``` programlisting
SELECT postalcode FROM demo.demo.customers
 WHERE REGEXP_LIKE(postalcode, '[^[:digit:]]')

PostalCode
==========
 WA1 1DP
 S-958 22
 T2F 8M4
 EC2 5NT
 05432-043
.
.
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

<div id="seealso_regexp_like" class="refsect1">

## See Also

<a href="fn_regexp_match.html" class="link" title="regexp_match"><code
class="function">regexp_match() </code></a>

<a href="fn_regexp_parse.html" class="link" title="regexp_parse"><code
class="function">regexp_parse() </code></a>

<a href="fn_regexp_instr.html" class="link" title="regexp_instr"><code
class="function">regexp_instr() </code></a>

<a href="fn_regexp_replace.html" class="link"
title="regexp_replace"><code
class="function">regexp_replace() </code></a>

<a href="fn_regexp_substr.html" class="link" title="regexp_substr"><code
class="function">regexp_substr() </code></a>

</div>

</div>
