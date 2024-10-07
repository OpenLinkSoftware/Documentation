<div id="textexprsyntax" class="section">

<div class="titlepage">

<div>

<div>

### 20.3.3. Text Expression Syntax

</div>

</div>

</div>

``` programlisting
expr ::= proximity_expr
    expr AND expr
    | expr OR expr
    | expr AND NOT  expr
    | '(' expr ')'

word_expr ::=
      word
    | '"' phrase '"'

proximity_expr ::=
      word_expr
    | proximity_expr NEAR word_expr

word ::=
    <word char>*

phrase ::=
      word
    | phrase <whitespace> word

word_char ::=  alphanumeric characters, '*',  ISO Latin accented characters.
```

A word is a sequence of word characters. A phrase is a sequence of words
separated by white spaces and enclosed in double quotes. If a word
contains a wildcard character it must be quoted with double quotes.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>An expression may not
consist of all negative terms, e.g. (not a) and (not b) is not a valid
expression but 'c and not a and not b' is a valid expression.</p>
<p>Note that the NEAR connective may not be used between AND'ed or OR'ed
terms. It can be used to combine words or phrases.</p></td>
</tr>
</tbody>
</table>

</div>

<div id="ex_qryfti" class="example">

**Example 20.4. Querying Free Text Indexed Columns**

<div class="example-contents">

``` programlisting
select count (*) from docs
where contains (text, '"virtual database"')
```

returns the count of documents with one or more occurrences of "virtual"
immediately followed by "database".

``` programlisting
'performance and (tuning or optimization)'
```

specifies documents with performance and either 'tuning' or
optimization' in any respective positions.

``` programlisting
'graphics and not (graphics near user near interface)'
```

matches documents with the word graphics more than 100 words away from
'user' or 'interface'.

``` programlisting
'"sql interfac*"'
```

matches documents with SQL followed by a word beginning with 'interfac'.

``` programlisting
'"dragon*" and not "once upon a time"'
```

matches documents with words beginning with 'dragon' and not containing
the phrase 'once upon a time'.

</div>

</div>

  

</div>
