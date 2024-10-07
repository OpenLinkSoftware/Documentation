<div id="fn_xquery_eval" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xquery_eval — Applies an XQUERY expression to a context node and returns
result(s).

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xquery_eval" class="funcsynopsis">

|                          |                                   |
|--------------------------|-----------------------------------|
| ` `**`xquery_eval`**` (` | in `xquery_expression ` varchar , |
|                          | in `xml_tree ` XML Entity ,       |
|                          | in `index ` integer ,             |
|                          | in `named_params ` vector `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_79" class="refsect1">

## Description

The xquery_eval function returns the result of applying the xquery
expression to the context node. By default only the first result is
returned, but supplying a third argument allows you to specify an index
for the value, the default assumes a value of 1 here. A value of 0
returns an array of 0 or more elements, one for each value calculated by
the xquery expression.

When an entity is returned in a result set to a client the client will
see an nvarchar value containing the serialization of the entity,
complete with markup. When the entity is passed as a SQL value it
remains an entity referencing the node of a parsed XML tree, permitting
navigation inside the tree.

The expression can be passed parameters by specifying a fourth argument
to `xquery_eval()` . This will be a vector of name/value pairs. The
values can be referenced from inside XPath expression by using their
names with '\$' prefix. You may use any Virtuoso data type. The names in
the parameter vector should appear without the '\$' sign. If any of the
parameter values is NULL the parameter will be ignored because NULL has
no XPath counterpart. If the same name appears more than once in the
vector, the last name/value pair is used and all preceding pairs with
this name are silently ignored. Obviously, names should be strings that
are valid XQuery variable names.

</div>

<div id="params_42" class="refsect1">

## Parameters

<div id="id124541" class="refsect2">

### xquery_expression

A valid XQuery expression. In almost all applications this is a string.
There is a tricky extension that is used by BPEL-like applications:
*`xpath_expression`* can be an XML entity whost string-value is a valid
XQuery expression. An example of such an entity is "select" or "test"
attribute in XSLT stylesheet. This trick lets XQuery processor to
resolve namespace prefixes by looking at namespace declarations at the
header of the stylesheet.

</div>

<div id="id124545" class="refsect2">

### xml_tree

An XML entity such as that returned from the `xtree_doc() ` function.

</div>

<div id="id124549" class="refsect2">

### index

Result index. This parameter is optional. If omitted a value of 1 is
assumed, meaning only the first result is returned. If a value of 0 is
supplied then an array of 0 or more results is returned containing one
element per result. (Note that results can be in turn sequences of
atomic values).

</div>

<div id="id124552" class="refsect2">

### named_params

A vector of keyword/value parameters to be passed to the XQuery
processor.

</div>

</div>

<div id="ret_24" class="refsect1">

## Return Types

This function will return the first or index selected result of applying
the xpath expression to the *`xml_tree`* input. If an index value of 0
is supplied then the output is an array.

</div>

<div id="examples_27" class="refsect1">

## Examples

<div id="ex_xquery_eval" class="example">

**Example 24.532. Finding the Authors of Document Titles**

<div class="example-contents">

``` programlisting
select xt_file, xquery_eval ('<authors>//author</authors>', t) from xml_text
    where xpath_contains (xt_text, '//chapter/title[. = 'Introduction']', t);
```

This will select all titles that are descendants of chapter and have a
string value of 'Introduction'. This will next evaluate //author in the
context of each, retrieving the author entities in the document of the
title and construct an element whose name is "authors" and list of
children contains all retrieved entities.

</div>

</div>

  

</div>

<div id="seealso_49" class="refsect1">

## See Also

<a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval() </code></a>

<a href="queryingxmldata.html#xpathcontainssqlpred" class="link"
title="15.4.1. XPATH_CONTAINS SQL Predicate">xpath_contains SQL
predicate</a>

<a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">xcontains SQL predicate</a>

<a href="xpf_processxquery.html" class="link"
title="processXQuery"><code class="function">processXQuery() </code></a>

</div>

</div>
