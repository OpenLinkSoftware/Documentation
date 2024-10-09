<div>

<div>

</div>

<div>

## Name

xpath_eval — Applies an XPATH expression to a context node and returns
result(s).

</div>

<div>

## Synopsis

<div>

|                         |                                  |
|-------------------------|----------------------------------|
| ` `**`xpath_eval`**` (` | in `xpath_expression ` varchar , |
|                         | in `xml_tree ` XML Entity ,      |
|                         | in `index ` integer ,            |
|                         | in `named_params ` vector `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the result of applying the XPath expression to the
context node. By default only the first result is returned, but
supplying a third argument allows you to specify an index for the value;
the default assumes a value of 1 here. A value of 0 returns an array of
0 or more elements, one for each value selected by the XPath expression.

When this function returns an entity in a result set, the client will
see an nvarchar value containing the serialization of the entity,
complete with markup. When the entity is passed as an SQL value it
remains an entity referencing the node of a parsed XML tree, permitting
navigation inside the tree.

The expression can be passed parameters by specifying a fourth argument
to `xpath_eval()` . This will be a vector of name/value pairs. The
values can be referenced from inside XPath expression by using their
names with '\$' prefix. You may use any Virtuoso data type. The names in
the parameter vector should appear without the '\$' sign. If any of the
parameter values is NULL the parameter will be ignored because NULL has
no XPath counterpart. If the same name appears more than once in the
vector, the last name/value pair is used and all preceding pairs with
this name are silently ignored. Obviously, names should be strings that
are valid XPath variable names.

</div>

<div>

## Parameters

<div>

### xpath_expression

A valid XPATH expression. In almost all application this is a string.
There is a tricky extension that is used by BPEL-like applications:
*`xpath_expression`* can be an XML entity whost string-value is a valid
XPATH expression. An example of such an entity is "select" or "test"
attribute in XSLT stylesheet. This trick lets XPATH processor to resolve
namespace prefixes by looking at namespace declarations at the header of
the stylesheet.

</div>

<div>

### xml_tree

An XML entity such as that returned from the `xtree_doc() ` function.

</div>

<div>

### index

Result index. This parameter is optional. If omitted a value of 1 is
assumed, meaning only the first result is returned. If a value of 0 is
supplied then an array of 0 or more elements is returned containing one
element per result.

</div>

<div>

### named_params

A vector of keyword/value parameters to be passed to the XPath
processor.

</div>

</div>

<div>

## Return Types

This function will return the first or *`index`* selected result of
applying the XPath expression to the *`xml_tree`* input. If an *`index`*
value of 0 is supplied then the output is an array.

</div>

<div>

## Errors

<div>

**Table 24.134. Errors signalled by xpath_eval**

<div>

| SQL State                             | Error Code                            | Error Text                                                                                                                    | Description                                                                                                                                                                         |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP370 </span> | <span class="errorcode">XI009 </span> | <span class="errortext">Argument 2 of xpath_eval must be an entity, not a value of type \[type name\] (\[type code\]) </span> | The *`xml_tree `* parameter should always be an entity. In some cases the XPath expression does not use context entity, but it should be provided anyway (e.g. some fake document). |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.527. Finding the Authors of Document Titles**

<div>

``` programlisting
select xt_file, xpath_eval ('//author', t) from xml_text
    where xpath_contains (xt_text, '//chapter/title[. = 'Introduction']', t);
```

This will select all titles that are descendants of chapter and have a
string value of 'Introduction'. This will next evaluate *`//author`* in
the context of each, retrieving the author entities in the document of
the title.

</div>

</div>

  

<div>

**Example 24.528. xpath_eval and Repeating Nodes.**

<div>

This example shows how the xpath_eval can be used to retrieve multiple
node answers to queries. First to set the scene consider the following
statements that create a table with XML inside.

``` programlisting
CREATE TABLE t_articles (
    article_id int NOT NULL,
    article_title varchar(255) NOT NULL,
    article_xml long varchar
    );

insert into t_articles (article_id, article_title) values (1, 'a');
insert into t_articles (article_id, article_title) values (2, 'b');

UPDATE t_articles SET article_xml = '
<beatles id = "b1">
<beatle instrument = "guitar" alive = "no">john lennon</beatle>
<beatle instrument = "guitar" alive = "no">george harrison</beatle>
</beatles>'
WHERE article_id = 1;

UPDATE t_articles SET article_xml = '
<beatles id = "b2">
<beatle instrument = "bass" alive = "yes">paul mccartney</beatle>
<beatle instrument = "drums" alive = "yes">ringo starr</beatle>
</beatles>'
WHERE article_id = 2;
```

Now we make a query that will return a vector of results, each vector
element corresponding to a node-set of the result.

``` programlisting
SELECT xpath_eval('//beatle/@instrument', xml_tree_doc (article_xml), 0)
    AS beatle_instrument FROM t_articles WHERE article_id = 2;
```

The repeating nodes are returned as part of a vector, the third argument
to xpath_eval is set to 0, which means that it is to return all nodes.

Otherwise, we can select the first node-set by supplying 1 as the third
parameter to xpath_eval:

``` programlisting
SELECT xpath_eval('//beatle/@instrument', xml_tree_doc (article_xml), 1)
    AS beatle_instrument FROM t_articles WHERE article_id = 2;
```

</div>

</div>

  

<div>

**Example 24.529. Passing a named parameter to the XPath**

<div>

``` programlisting
SQL> select xpath_eval(
  '//phone[../name like $$n]',
  xtree_doc ('<phonebook>
      <dept><name>Installation Service</name><phone>555-1111</phone></dept>
      <dept><name>Tech Support</name><phone>555-1112</phone></dept>
    </phonebook>'),
  1,
  vector('n', 'Tech%') );
callret
VARCHAR
_______________________________________________________________________________

<phone>555-1112</phone>
```

Like in SQL queries, XPath parameters are used to avoid printing literal
values into the text of the query. The listing above demonstrates how to
find the phone of the first department whose name is like the specified
pattern.

Note that if the text of the XPath expression is entered as a string in
ISQL, dollar signs in front of parameter names should be doubled, as in
this sample. ISQL uses the same syntax (\$name) for macro expansion, and
double dollar sign is replaced by ISQL with single dollar sign
character.

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval() </code></a>

<a href="queryingxmldata.html#xpathcontainssqlpred" class="link"
title="15.4.1. XPATH_CONTAINS SQL Predicate">xpath_contains SQL
predicate</a>

<a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">xcontains SQL Predicate</a>

</div>

</div>
