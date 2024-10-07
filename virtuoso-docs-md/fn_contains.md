<div id="fn_contains" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

contains — A text contains predicate

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_contains" class="funcsynopsis">

|                              |                           |     |
|------------------------------|---------------------------|-----|
| `boolean `**`contains`**` (` | `column ` varchar ,       |     |
|                              | `expression ` varchar ,   |     |
|                              | `opt_or_value ` integer , |     |
|                              | ...`)`;                   |     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_contains" class="refsect1">

## Description

This is a SQL predicate that specifies a condition on a column on which
a free text index exists. The expression is a
<span class="type">string</span> matching the grammar of a text search
expression. This is computed for each evaluation of the contains
predicate and does not have to be a constant. For example a parameter or
variable of a containing score (e.g. procedure) is accepted.

The *`score_limit`* is optional. If specified, it should be a numeric
expression determining the minimum score required to produce a hit.

A virtual column named 'SCORE' is available in queries involving a
`contains` predicate. This can for example be returned in a result set
or used for sorting. Note that the name is in upper case and is case
sensitive in all case modes.

</div>

<div id="params_contains" class="refsect1">

## Parameters

<div id="id82970" class="refsect2">

### *`column `*

The table column whose contents are free text indexed

</div>

<div id="id82974" class="refsect2">

### *`expression `*

A <span class="type">string </span> matching the grammar of a text
search expression.

</div>

<div id="id82979" class="refsect2">

### *`opt_or_value `*

May be one or more of the following:

<div class="variablelist">

<span class="term">DESCENDING </span>  
specifies that the search will produce the hit with the greatest id
first, as defined by <span class="type">integer</span> or
<span class="type">composite</span> collation.

<span class="term">START_ID ',' *`scalar_exp`* </span>  
the first allowed document id to be selected by the expression in its
traversal order, e.g. least or equal for ascending and greatest or equal
for descending.

<span class="term">END_ID ',' *`scalar_exp`* </span>  
the last allowed id in the traversal order. For descending order the
*`START_ID`* must be \>= *`END_ID`* for hits to be able to exist. For
ascending order the *`START_ID`* must be \<= *`END_ID`* for hits to be
able to exist.

<span class="term">SCORE_LIMIT ',' *`scalar_exp`* </span>  
Minimum score that hits must have or exceed to be considered matches of
the predicate.

<span class="term">RANGES ',' *`scalar_exp`* </span>  
specifies that the query variable following the *`RANGES`* keyword will
be bound to the word position ranges of the hits of the expression
inside the document. The variable is in scope inside the enclosing
<span class="emphasis">*SELECT* </span> statement.

<span class="term">OFFBAND ',' *`column `* </span>  
Specifies that the following column will be retrieved from the free text
index instead of the actual table. For this to be possible the column
must have been declared as offband with the
<span class="emphasis">*CLUSTERED WITH*</span> option of the
<span class="emphasis">*CREATE TEXT INDEX*</span> statement.

</div>

</div>

</div>

<div id="ret_contains" class="refsect1">

## Return Types

The contains is a predicate, therefore returning a
<span class="type">boolean</span> .

</div>

<div id="examples_contains" class="refsect1">

## Examples

<div id="ex_contains" class="example">

**Example 24.55. Querying Free Text Indexed Columns using contains()**

<div class="example-contents">

<div class="itemizedlist">

- Return the number of documents with one or more occurrences of
  "virtual" immediately followed by "database".

  ``` programlisting
  select count (*) from docs
  where contains (text, '"virtual database"')
        
  ```

- Specify documents with performance and either 'tuning' or
  optimization' in any respective positions.

  ``` programlisting
  'performance and (tuning or optimization)'
        
  ```

- Match documents with the word graphics more than 100 words away from
  'user' or 'interface'.

  ``` programlisting
  'graphics and not (graphics near user near interface)'
        
  ```

- Match documents with SQL followed by a word beginning with 'interfac'.

  ``` programlisting
  '"sql interfac*"'
        
  ```

- Match documents with words beginning with 'dragon' and not containing
  the phrase 'once upon a time'.

  ``` programlisting
  '"dragon*" and not "once upon a time"'
        
  ```

</div>

</div>

</div>

  

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

</div>

<div id="seealso_contains" class="refsect1">

## See Also

`xpath_contains() `

<a href="webdavadmin.html#freetext" class="link" title="Free Text">The
Free Text Index Chapter.</a>

<a href="fttfuncs.html" class="link"
title="20.10. Free Text Functions">Other Free Text Functions.</a>

<a href="txttrig.html" class="link" title="20.4. Text Triggers">Free
Text Triggers.</a>

</div>

</div>
