<div id="queryingftcols" class="section">

<div class="titlepage">

<div>

<div>

## 20.3. Querying Free Text Indexes

</div>

</div>

</div>

<div id="containspredicate" class="section">

<div class="titlepage">

<div>

<div>

### 20.3.1. CONTAINS predicate

</div>

</div>

</div>

Returns TRUE if a free text indexed column matches a text expression.

Syntax

``` programlisting
contains_pred:
    contains (column, expr, opt_or_value ....)

opt_or_value:
      DESCENDING
      | START_ID ',' scalar_exp
      | END_ID ',' scalar_exp
      | SCORE_LIMIT ',' scalar_exp
      | RANGES ',' variable
      | OFFBAND column

variable: IDENTIFIER
```

The <span class="emphasis">*column*</span> must refer to a column for
which there exists a free text index. The
<span class="emphasis">*expr*</span> must be a narrow or wide string
expression whose syntax matches the rules in 'Text Query Syntax'. The
<span class="emphasis">*START_ID*</span> is the first allowed document
ID to be selected by the expression in its traversal order, e.g. least
or equal for ascending and greatest or equal for descending.
<span class="emphasis">*END_ID*</span> is the last allowed ID in the
traversal order. For descending order the START_ID must be \>= END_ID
for hits to be able to exist. For ascending order the START_ID must be
\<= END_ID for hits to be able to exist.

<span class="emphasis">*DESCENDING*</span> specifies that the search
will produce the hit with the greatest ID first, as defined by integer
or composite collation. RANGES specifies that the query variable
following the RANGES keyword will be bound to the word position ranges
of the hits of the expression inside the document. The variable is in
scope inside the enclosing SELECT statement.

<span class="emphasis">*SCORE_LIMIT*</span> specifies a minimum score
that hits must have or exceed to be considered matches of the predicate.

<span class="emphasis">*OFFBAND*</span> specifies that the following
column will be retrieved from the free text index instead of the actual
table. For this to be possible the column must have been declared as
offband with the CLUSTERED WITH option of the
<a href="creatingtxtidxs.html#createtxtidxstmt" class="link"
title="20.2.1. The CREATE TEXT INDEX statement">CREATE TEXT INDEX</a>
statement.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_contains.html" class="link" title="contains"><code
class="function">contains()</code></a></p>
<p>The <a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">XCONTAINS Predicate</a> .</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
