<div>

<div>

</div>

<div>

## Name

regexp_substr — returns a single captured substring from matched
substring

</div>

<div>

## Synopsis

<div>

|                                              |                                     |
|----------------------------------------------|-------------------------------------|
| `(varchar|nvarchar) `**`regexp_substr`**` (` | in `pattern ` (varchar\|nvarchar) , |
|                                              | in `str ` (varchar\|nvarchar) ,     |
|                                              | in `offset ` integer `)`;           |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### pattern

the regexp pattern string

</div>

<div>

### str

the data into which 1 (the first) or 0 matching substrings will be
searched for

</div>

<div>

### offset

the number of regexp subexpression who's match to return : 0 for the
whole matching substring, 1 for the substring matching the first regexp
subexpression and so on

</div>

</div>

<div>

## Description

This function will return the whole string value of the first substring
in "str" that matches the regexp in "pattern" or a sub part of the first
match. The regexp syntax allows subexpressions to be marked in the
regular expression (using the braces syntax). An example of such type of
expression will be: '(2\[34\]).\*(2\[35\])' which means a regular
expression having two subexpressions: '2\[34\]' and '2\[35\]'.

</div>

<div>

## Examples

<div>

**Example 24.253. Simple example**

<div>

Let's apply the above regexp to the following source string:
22232225222323

``` screen
SQL> select regexp_substr('(2[34]).*(2[35])','22242226222527', 0);
callret
VARCHAR
_______________________________________________________________________________

2422262225

1 Rows. -- 0 msec.
      
```

This returns the whole matched string from the expression.

``` screen
SQL> select regexp_substr('(2[34]).*(2[35])','22242226222527', 1);
callret
VARCHAR
_______________________________________________________________________________

24

1 Rows. -- 0 msec.
      
```

This returns what has been matched for the first ('2\[34\]') regexp
subexpression out of the whole matched substring (see above) : basically
denoted as \1 in perl

``` screen
SQL> select regexp_substr('(2[34]).*(2[35])','22242226222527', 2);
callret
VARCHAR
_______________________________________________________________________________

25

1 Rows. -- 10 msec.
      
```

This returns what has been matched for the second ('2\[35\]') regexp
subexpression out of the whole matched substring. This is \2 in perl.
Note that the text '22' (that corresponds to '.\*' part of the regexp)
is not returned by the above call because it is not contained in the
second pair of braces.

</div>

</div>

  

<div>

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
<div>
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

<div>

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

<a href="fn_regexp_instr.html" class="link" title="regexp_instr"><code
class="function">regexp_instr() </code></a>

</div>

</div>
