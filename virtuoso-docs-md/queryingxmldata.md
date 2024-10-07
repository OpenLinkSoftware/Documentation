<div id="queryingxmldata" class="section">

<div class="titlepage">

<div>

<div>

## 15.4. Querying Stored XML Data

</div>

</div>

</div>

<div id="xpathcontainssqlpred" class="section">

<div class="titlepage">

<div>

<div>

### 15.4.1. XPATH_CONTAINS SQL Predicate

</div>

</div>

</div>

XPath expressions can be used in SQL statements to decompose and match
XML data stored in columns. The *`xpath_contains`* SQL predicate can be
used either to test for an XML value matching a path expression or to
extract one or more entities from the XML value. These values can then
be used later in the query as contexts for other XPath expressions.

``` programlisting
xpath_contains (xml_column, xp_expression[, query_variable]);
```

The first argument, *`xml_column`* is the name of the column on which to
perform the XPath search. The second argument, *`xp_expression`* , takes
an XPath expression.

The third argument is an optional query variable that gets bound to each
result entity value of the xpath expression. If this variable is omitted
the xpath_contains predicate will qualify the query by returning true
for matches. In this case the result will only return one row per match.
If the variable is present, the result set could contain multiple rows
per result set row of the base table, one row for each match.

Consider the example:

``` programlisting
select xt_file, t from xml_text
  where xpath_contains (xt_text, '//chapter/title[position () = 1]', t);
```

This SQL statement will select the first title child of any chapter
entities in the XML documents in the xt_text column of the table
*`xml_text`* . There can be several matching entities per row of
xml_text. The result set will contain a row for each matching entity.

In XPath terms the path expression of *`xpath_contains`* is evaluated
with the context node set to the root node of the XML tree represented
by the value of the column that is the first argument of xpath_contains.
This node is the only element of the context node set.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                              |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                        |
|                              | The 't' variable in the above example gets bound to XML entities, not to their string values or other representations. One can thus use these values as context nodes for other expressions. |

</div>

The XPATH expression can have a list of options in the beginning. The
list of options is surrounded by square brackets. Options in the list
are delimited by spaces. The most popular option is *`__quiet`* that
allows to process a set of rows if not all stored documents are valid
XMLs; if an error is signalled by the XML parser when it prepares a
content document for the XPATH in question and the XPATH contains
*`__quiet`* then the error is suppressed and the row is silently ignored
as if XPATH found nothing. One can configure the DTD validator of the
parser by placing its <a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">configuration
parameters</a> in the list of XPATH options.

The following example is almost identical to the previous one but it
works even if not all values of *`xt_text`* are valid XMLs, and the
resulting values of the 't' variable are standalone entities even if
source documents in xt_text contain external generic entities.

``` programlisting
select xt_file, t from xml_text
  where xpath_contains (xt_text, '[__quiet BuildStandalone=ENABLE]//chapter/title[position () = 1]', t);
```

</div>

</div>
