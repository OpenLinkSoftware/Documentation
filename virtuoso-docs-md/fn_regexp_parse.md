<div id="fn_regexp_parse" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

regexp_parse — returns substrings that match the regular expression in
supplied string after an offset

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_regexp_parse" class="funcsynopsis">

|                                       |                              |
|---------------------------------------|------------------------------|
| `index_vector `**`regexp_parse`**` (` | in `pattern ` string ,       |
|                                       | in `target_string ` string , |
|                                       | in `offset ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_regexp_parse" class="refsect1">

## Description

It applies regular expression to target_str with offset. This function
returns a vector containing 2 elements for first match of the pattern
and if there a sub expressions : 2 elements for each of subexpression
match. The first (even numbered) element of each pair is the start index
and the second (odd numbered) is the end index of the match. The
regexp_parse function is more efficient than regexp_match and
regexp_substr, because it doesn't allocate strings.

``` programlisting
      SQL> select regexp_parse('(2[34]).*(2[35])','22232225222323', 0);
      callret
      VARCHAR
      _______________________________________________________________________________

      lvector(2,14,2,4,12,14)

      1 Rows. -- 10 msec.
```

Where: 2-14 is a range matched by whole expression, 2-4 is a range where
'(2\[34\])' is matched , and 12-14 is a range where '(2\[35\])'
subexpression matched.

<div id="ex_regexp_parse" class="example">

**Example 24.252. Examples**

<div class="example-contents">

``` programlisting
CREATE PROCEDURE all_tokens2 (IN pattern VARCHAR,IN str VARCHAR, IN offs INTEGER)
{

    DECLARE vec ANY;
    DECLARE i INTEGER;
    DECLARE out_str VARCHAR;

    vec:=regexp_parse(pattern,str,offs);
    IF ((vec IS NOT NULL) AND (length(vec)>1))
    {
        out_str:='';
        i:=0;
        WHILE ( (length(vec)/2) > i )
        {
            out_str:=concat(out_str,'/',
                subseq(str,aref(vec,(i)*2),
                aref(vec,(i)*2+1)));
            i:=i+1;
        };
        RETURN concat(out_str,test_parsing(pattern,str,aref(vec,1)+1));
    }
    return NULL;
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

<div id="seealso_regexp_parse" class="refsect1">

## See Also

<a href="fn_regexp_match.html" class="link" title="regexp_match"><code
class="function">regexp_match() </code></a>

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
