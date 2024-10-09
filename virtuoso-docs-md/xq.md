<div>

<div>

<div>

<div>

## 15.8. XQuery 1.0 Support

</div>

</div>

</div>

The Virtuoso Server provides support for the
<a href="http://www.w3.org/TR/xquery/" class="ulink"
target="_top">XQuery 1.0 XML Query Language</a> specification. This
specification is currently in the working draft stage at the W3C XML
Query Working Group working in collaboration with the W3C XSL Working
Group. Both the syntax and semantics of XQuery will probably vary from
version to version.

In addition to the XQuery 1.0 standard, which describes the language,
the <a href="http://www.w3.org/TR/xquery-operators/" class="ulink"
target="_top">XQuery 1.0 and XPath 2.0 Functions and Operators Version
1.0</a> specification describes a set of built-in functions. As with all
W3C in-progress efforts, there is a list of open issues detailing
problems and unresolved areas; where these affect Virtuoso's
implementation, they are noted below.

This chapter is not an XQuery textbook and does not replace
XQuery-related specifications of W3C. Only Virtuoso-specific extensions
and differences are described here.

The most important deviation from the standard is that Virtuoso does not
provide full type information about data values. As a consequence,
"typeswitch" and automatic type conversions are not implemented.

<div>

<div>

<div>

<div>

### 15.8.1. Types of XQuery Expressions

</div>

</div>

</div>

The current draft of XQuery lists 10 groups of XQuery expressions:

<div>

- Primary expressions, including literals, variable references and
  function calls.

- Path expressions, including all XPATH 1.0 expressions and a "pointer
  operator".

- Sequence expressions.

- Arithmetic, comparison and logical operators.

- Element constructors, which allow you to create new element nodes with
  specified names, lists of attributes and lists of children.

- FLWR (FOR-LET-WHERE-RETURN) expressions, which allow you to create
  variables for intermediate results and to transform sequences of items
  on a per-item basis.

- Ordered and unordered expressions to force some sorting of
  intermediate results or to prevent the XQuery processor from making
  redundant sorting.

- Control expressions, such as IF.

- Quantified expressions: SOME and EVERY.

- Expressions that test or modify data types.

</div>

Not all groups of expressions are implemented. In some groups, not all
kinds of clauses are implemented.

In addition to the standard, Virtuoso supports special cases of FLWR
expressions to deal with XML views:

<div>

- <a href="xq.html#xq_supported_xmlview" class="link"
  title="FOR Clause Expressions With xmlview() Function">FOR Clause
  expressions with xmlview() function.</a>

</div>

<div>

<div>

<div>

<div>

#### Primary Expressions

</div>

</div>

</div>

XQuery processor uses 32-bit integers on 32-bit platforms and 64-bit
integers on 64-bit platforms. Similarly, the scale and precision of
floating-point operations may vary from platform to platform.

Note that string literals are handled differently in XPath 1.0 and
XQuery. "Ben "amp; Jerry"apos;s" denotes the string "Ben " Jerry's" in
XQuery and the string "Ben "amp; Jerry"apos;s" in XPath.

</div>

<div>

<div>

<div>

<div>

#### Path Expressions

</div>

</div>

</div>

Any XPath 1.0 expression is a valid XQuery 1.0 path expression, which
the Virtuoso XQuery processor supports. When invoked from the XQuery
context, the XPath Processor works in accordance with XSLT rules. There
are two major differences between standalone and XQuery/XSLT path
expressions. First, the meaning of non-qualified name used as NameTest
criterion, as described below. Second, the data type used for attributes
varies. In XPath or XQuery mode, if a value is calculated by an
*`attribute::`* axis, it is of type *`attribute entity`* ; in standalone
XPath, the string value of the attribute is used instead.

As specified in the XQuery 1.0 standard, a node-set returned by an XPath
expression may be used as a sequence of items, where every node of that
node-set becomes an item of the sequence. The opposite is not true,
however. Not every sequence may be converted into a node-set, even if it
is a sequence of nodes. If XPath starts from a function which returns a
sequence, an error message "Context node is not an entity" is returned.
Fortunately, a variable of type

``` programlisting
sequence
```

may be used as a node-set if all items of the sequence are nodes.

Obsolete drafts of W3C specification contains description of "pointer
operator". Virtuoso continues to support this operator to provide
backward compatibility. XQuery processor needs DTD data associated with
the XML document in question to distinguish ID attributes from other
sorts of attributes and to bookmark elements that have ID locations. For
more details, see the description of
<a href="xpf_id.html" class="link" title="id"><code
class="function">id()</code></a> XPATH function. This function uses same
DTD data for same purposes, so for any given document, either both
`id()` and "pointer operator" are applicable or both does not work.

Sometimes the "Context node is not an entity" error is signalled if the
beginning of the XPath expression is surrounded by parenthesis, even if
the expression works fine without these parenthesis. This happens
because "(...)" is an "append" operator in XQuery, not just a way to
group subexpressions. "append" converts a node-set into a sequence even
when it is called with a single argument - that is, without commas
inside "(...)". This sequence cannot be used as input for the rest of
the XPath expression.

As an syntax extension, special notation of QNames is added and can be
used, e.g., in NameTest. An expanded name can be surrounded by
delimiters (! and !), like (!http://www.example.com:MyTag!) and this
syntax allows names that contain otherwise prohibited characters. This
syntax is also useful when the text of the query is generated by
software.

Note that the NameTest that consists of an unqualified name has
different meanings in Virtuoso XPath and in XQuery. In XPath, NameTest
"sample-tag" means "any element whose local-name is equal to
sample-tag". In XQuery, the same test means "any element without
namespace-uri whose local-name is equal to sample-tag".

</div>

<div>

<div>

<div>

<div>

#### Sequence Expressions

</div>

</div>

</div>

XQuery sequences are supported not only in XQuery but can also be
handled in XPath and XSLT. When the XQuery processor is invoked from SQL
and a sequence is returned to the caller, the sequence is automatically
converted into a vector of its elements.

Virtuoso supports all sequence operations listed in current W3C paper
plus deprecated operations BEFORE and AFTER.

The *`sequence concatenation`* operator is available in XPath and XSLT
as the <a href="xpf_append.html" class="link" title="append"><code
class="function">append()</code></a> function. In addition, the
<a href="xpf_tuple.html" class="link" title="tuple"><code
class="function">tuple()</code></a> function is available to get the
first items of every given argument sequence and return the sequence of
these items.

XQuery operators UNION, INTERSECT, EXCEPT are available in XPath and
XSLT as functions
<a href="xpf_union.html" class="link" title="union"><code
class="function">union()</code></a> ,
<a href="xpf_intersect.html" class="link" title="intersect"><code
class="function">intersect()</code></a> and
<a href="xpf_except.html" class="link" title="except"><code
class="function">except()</code></a> .

</div>

<div>

<div>

<div>

<div>

#### Arithmetic, Comparison and Logical operations

</div>

</div>

</div>

Virtuoso shares the implementation of basic arithmetic and comparison
operations between XPath, XQuery, XSLT, SQL and Virtuoso/PL processors,
so type casting, scale and precision of calculated values are identical
across the system. All operators are available in XQuery, in addition,
\<\< and \>\> operators are available in XPath and XSLT as
<a href="xpf_is_before.html" class="link" title="is_before"><code
class="function">is_before()</code></a> and
<a href="xpf_is_after.html" class="link" title="is_after"><code
class="function">is_after()</code></a> built-in functions.

</div>

<div>

<div>

<div>

<div>

#### Element Constructors

</div>

</div>

</div>

Virtuoso XQuery supports all XQuery 1.0 direct constructors. Previous
versions of W3C draft contained the syntax for placing calculated
content into the opening tag of direct element constructor, such as

``` screen
<{concat("calculated-", "element-name")} {concat("calculated-", "attribute-name")}={concat("calculated-", "attribute-value")}>...</>
```

. Thus name of element or attribute, or a value of an attribute can be
calculated dynamically. This syntax is still supported. The
<a href="xpf_create_element.html" class="link"
title="create-element"><code
class="function">create-element()</code></a> XPath function is
implemented to make this functionality available in XPath. Additionally,
a special function <a href="xpf_create_attribute.html" class="link"
title="create-attribute"><code
class="function">create-attribute()</code></a> may be used to create a
new dynamic attribute entity with value and name calculated, this works
similarly to xsl:attribute XSLT instruction.

Similarly, <a href="xpf_create_comment.html" class="link"
title="create-comment"><code
class="function">create-comment()</code></a> ,
<a href="xpf_create_element.html" class="link"
title="create-element"><code
class="function">create-element()</code></a> and
<a href="xpf_create_pi.html" class="link" title="create-pi"><code
class="function">create-pi()</code></a> mimics other XQuery direct
constructors in XPath and XSLT.

The XQuery specification states that when sequence of atomic values is
converted into content of an element constructor, whitespace character
is inserted between adjacent values.

Unlike previous versions of Virtuoso, current XQuery syntax allows you
to use "pure XML notation" inside element constructors. Thus there is no
strict need to write 'constant' expression

``` screen
<emp empid="12345"><name>John Smith</name><job>Bubble sorter</job></emp>
```

as it is dynamically calculated text, like

``` screen
<emp empid="12345"><name>{'John Smith'}</name><job>{'Bubble sorter'}</job></emp>
```

It is still may be useful to write 'constant' expression in the old way.
This artificial restriction simplifies finding syntax errors, because
there are syntactically wrong expressions that are still correct "pure
XML notation." Alternatively, CDATA sections also may be used to make it
obvious that the string is a constant, not an expression with forgotten
braces around it:

``` screen
<emp empid="12345"><name><![CDATA[John Smith]]></name><job><![CDATA[Bubble sorter]]></job></emp>
```

The current version of Virtuoso does not support the new XQuery syntax
for dynamic constructors.

</div>

<div>

<div>

<div>

<div>

#### FLWR Expressions

</div>

</div>

</div>

FLWR expressions are fully supported by Virtuoso XQuery. Moreover,
<a href="xpf_for.html" class="link" title="for"><code
class="function">for() </code></a> and
<a href="xpf_let.html" class="link" title="let"><code
class="function">let() </code></a> XPath functions are implemented to
make this functionality available in XPath and XSLT. In addition,
<a href="xpf_assign.html" class="link" title="assign"><code
class="function">assign() </code></a> and
<a href="xpf_progn.html" class="link" title="progn"><code
class="function">progn() </code></a> functions are available to deal
with extension functions, especially when extension functions are called
for their side effects.

A special
<a href="xpf_xmlview.html" class="link" title="xmlview">xmlview()</a>
function allows very efficient access to SQL data from XML views.

Previous XQuery specifications used "sort by" instead of "order by". The
difference is that "sort by" was applicable to the final results of the
FLWR statement made by RETURN clause whereas "order by" reorders input
data for RETURN. Thus, "order by" can sort outputs using data that do
not appear in the final result. E.g., an expression can collect items,
"order" them by category and title but output only title and price. This
was much harder in previous versions of XQuery because it was necessary
to prepare an intermediate result that contained title and price and
category, then do "sort" by category and title then use one more FLWR
expression to form a result that is free from redundant data about
category.

Nevertheless, Virtuoso supports both "sort by" and "order by", to keep
backward compatibility. Moreover, "sort by" operator can be freely used
with no relation to any FLWR subexpression. Typical use of such a
simplified notation is

``` screen
<hit-list>{//track[@rating] sort by (@rating descending)}</hit-list>
```

instead of portable

``` screen
<hit-list>{for $t in //track[@rating] order by $t/@rating descending return $t}</hit-list>
```

</div>

<div>

<div>

<div>

<div>

#### Ordered and Unordered Expressions

</div>

</div>

</div>

The current version of Virtuoso does not use ordered/unordered hints.
Everything is calculated ordered. This will change in the future but it
is not advisable to place "unordered" hints for future use because
there's no way to validate these hints. It is better to place
appropriate comments but not hints.

</div>

<div>

<div>

<div>

<div>

#### Control Expressions

</div>

</div>

</div>

The <a href="xpf_if.html" class="link" title="if"><code
class="function">if()</code></a> special function mimics the XQuery
operator for use in XPath and XSLT. Functions
<a href="xpf_and.html" class="link" title="and"><code
class="function">and() </code></a> and
<a href="xpf_or.html" class="link" title="or"><code
class="function">or() </code></a> are also control expressions because
they calculate arguments in strict left-to-right order and may omit the
calculation of some results.

</div>

<div>

<div>

<div>

<div>

#### Quantified Expressions

</div>

</div>

</div>

Both the *`SOME`* and *`EVERY`* operators are implemented. The
<a href="xpf_some.html" class="link" title="some"><code
class="function">some()</code></a> and
<a href="xpf_every.html" class="link" title="every"><code
class="function">every()</code></a> XPath functions are implemented to
make this functionality available in XPath and XSLT.

</div>

<div>

<div>

<div>

<div>

#### Expressions That Test or Modify Data types

</div>

</div>

</div>

The operators *`IS`* , *`CASTABLE`* , *`CAST`* , *`TREAT`* ,
*`TYPESWITCH`* and *`VALIDATE`* are not implemented.

</div>

<div>

<div>

<div>

<div>

#### FOR Clause Expressions With xmlview() Function

</div>

</div>

</div>

XML views can be queried using FOR Clause from FLWR expressions. The
<a href="xpf_xmlview.html" class="link" title="xmlview"><code
class="function">xmlview()</code></a> function allows XML views to be
accessed as if they were XML documents. XPath expressions beginning with
the `xmlview()` function will be translated into SQL statements to avoid
redundant data access and to avoid creating a whole XML tree.

</div>

</div>

</div>
