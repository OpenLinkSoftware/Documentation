<div id="xcontainspredicate" class="section">

<div class="titlepage">

<div>

<div>

### 15.4.6. XCONTAINS predicate

</div>

</div>

</div>

This predicate is used in a SQL statement, it returns "true" if a free
text indexed column with XML content matches an XPATH expression.
Optionally produces the matching node set as a result set.

Syntax

``` programlisting
xcontains_pred:
    xcontains (column, expr [, result_var [, opt_or_value ...]])

opt_or_value:
      DESCENDING
      | START_ID ',' scalar_exp
      | END_ID ',' scalar_exp
      | SCORE_LIMIT ',' scalar_exp
      | OFFBAND column

result_var:
      IDENTIFIER
      | NULL
```

The <span class="emphasis">*column*</span> must refer to a column for
which there exists a free text index.

The <span class="emphasis">*expr*</span> must be a narrow or wide string
expression whose syntax matches the rules in 'XPATH Query Syntax'.

The <span class="emphasis">*result_var*</span> variable is a query
variable which, if present, will be successively bound to each element
of the node set selected by the XPATH expression. if the value is not a
node set and is true, the variable will be once bound to this value. The
scope of the variable is the containing select and its value is a scalar
or an XML entity. The <span class="emphasis">*result_var*</span> can be
not an identifier but a NULL keyword to explicitly indicate that no
query variable is required.

The <span class="emphasis">*START_ID*</span> is the first allowed
document ID to be selected by the expression in its traversal order,
e.g. least or equal for ascending and greatest or equal for descending.

<span class="emphasis">*END_ID*</span> is the last allowed id in the
traversal order. For descending order the START_ID must be \>= END_ID
for hits to be able to exist. For ascending order the START_ID must be
\<= END_ID for hits to be able to exist.

<span class="emphasis">*DESCENDING*</span> specifies that the search
will produce the hit with the greatest ID first, as defined by integer
or composite collation. This has nothing to do with a possible ORDER BY
of the enclosing statement. Even if there is an ORDER BY in the
enclosing statement the DESCENDING keyword of xcontains has an effect in
the interpretation of the STRT_ID and END_ID xcontains options.

<span class="emphasis">*RANGES*</span> specifies that the query variable
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

If the select statement containing the xcontains predicate does not
specify an exact match of the primary key of the table having the
xcontains predicate, then the contains predicate will be the 'driving'
condition, meaning that rows come in ascending or descending order of
the free text document ID. If there is a full equality match of the
primary key of the table, this will be the driving predicate and
xcontains will only be used to check if the text expression matches the
single row identified by the full match of the primary key.

The xcontains predicate may not appear outside of a select statement and
may only reference a column for which a free text index has been
declared. The first argument must be a column for which there is such an
index. The text expression may be variable and computed, although it
must be constant during the evaluation of the select statement
containing it.

The xcontains predicate must be a part of the top level AND of the WHERE
clause of the containing select. It may not for example be a term of an
OR predicate in the select but can be AND'ed with an OR expression.

<div id="id46202" class="example">

**Example 15.13. Selecting Title Elements Called 'Key'**

<div class="example-contents">

``` programlisting
select xt_file from xml_text2 where
 xcontains (xt_text, '//title = "Key"');
```

The query retrieves the *`xt_file`* for rows whose *`xt_text`* is an XML
document containing 'Key' as the text value of a title element.

If not all values in *`xt_text`* are valid XMLs then '\_\_quiet' option
can be useful to disable error signalling. It is unusual to get an
incorrect XML stored in a column that has free text XML index because
both on insert and on update the text is parsed by an free text indexing
routine, but the error is possible if e.g. a non-standalone document is
stored and an important external entity was available at indexing time
but disappeared later. Thus a modified example might be better for a
column with non-standalone documents;

``` programlisting
select xt_file from xml_text2 where
 xcontains (xt_text, '[__quiet] //title = "Key"');
```

#### Selecting Title Element that Contains a Specified Text

``` programlisting
select n from xml_text2 where
 xcontains(xt_text,
 '//title[. = "AS Declaration - Column Aliasing"]',0,n);
```

The query retrieves each title element from each row of *`xml_text2`*
where the *`xt_text`* contains title elements with the text value "AS
Declaration - Column Aliasing."

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                          |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                     |
|                              | The equality test is case- and whitespace-sensitive, as normal in XPath. The free text index is used for the search but the final test is done according to XPath rules. |

</div>

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                  |
|:--------------------------:|:-----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                        |
|                            | The <a href="queryingftcols.html#containspredicate" class="link" 
                              title="20.3.1. CONTAINS predicate">CONTAINS</a> Predicate.        |

</div>

</div>
