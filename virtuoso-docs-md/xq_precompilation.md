<div id="xq_precompilation" class="section">

<div class="titlepage">

<div>

<div>

### 15.8.3. Pre-compilation of XPath and XQuery Expressions

</div>

</div>

</div>

Virtuoso compiles XPath and XQuery expressions as early as it is
possible. E.g. if the first argument of
<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval()</code></a> is a string constant then the
SQL compiler will invoke the XQuery compiler to avoid on-demand
compilation(s) of this text.

This feature significantly enhances performance of XQuery expressions
embedded in SQL. For a simple search on XML document of average size the
compilation time can be three times greater than execution time. In
addition, the use of
<a href="xpf__sql__column.html" class="link" title="sql:column"><code
class="function">sql:column()</code></a> special XQuery function is
possible only when pre-compilation can be done by SQL compiler.

Pre-compilation is impossible if the text of the expression is not a
constant. The typical case is passing an XQuery expression as parameter
to a function. In this case the expression is compiled during the call
of xquery_eval() and stored for future use. If the same string is passed
again to the same invocation of xquery_eval() then a stored compiled
expression is used.

Only partial pre-compilation is possible if XQuery expression refers to
not-yet defined extension functions or to external resources. Partial
pre-compilation gives little gain in speed, but it allows the use of
<a href="xpf__sql__column.html" class="link" title="sql:column"><code
class="function">sql:column()</code></a>

The most important fact about pre-compilation is that passing parameters
into XQuery statement is much more efficient than printing then into the
text of the query. This is similar to SQL queries.

<div id="ex_xq_precompilation" class="example">

**Example 15.22. Good and Poor Coding Practices**

<div class="example-contents">

<span class="emphasis">*GOOD* </span> The expression is compiled once
when SQL query is compiled:

``` programlisting
select xquery_eval('count(//abstract)', SOURCE_XML) from LIB..ARTICLES;
```

<span class="emphasis">*GOOD* </span> The expression is compiled once
when SQL query is compiled:

``` programlisting
select xquery_eval('count(//article[@id=$main_id]/abstract)', SOURCE_XML, 1, vector('main_id', MAIN_ID))
  from LIB..ARTICLES;
```

<span class="emphasis">*POOR*</span> The expression is compiled once per
data row. In addition, a hard-to-find error will occur if a value of
MAIN_ID may contain double quote or a backslash character.

``` programlisting
select xquery_eval(sprintf('count(//article[@id="%s"]/abstract)', MAIN_ID), SOURCE_XML)
  from LIB..ARTICLES;
```

<span class="emphasis">*GOOD*</span> The XQuery expression is compiled
once per execution of the SQL query. The SQL compiler pays special
attention to queries that import external resources, because the content
and availability of these resources may differ from call to call. In
addition, importing an external resource is usually not possible during
SQL compilation due to deadlock danger, so the compilation is postponed
until run time, but this is not too bad anyway. Even in this
sophisticated case, XQuery can contain calls of
<a href="xpf__sql__column.html" class="link" title="sql:column"><code
class="function">sql:column()</code></a> .

``` programlisting
select xquery_eval('
    namespace tools="http://www.example.com/lib/tools/"
    import define "http://www.example.com/lib/tools/common.xqr"
    tools:extract-keywords(//abstract)',
  SOURCE_XML)
from LIB..ARTICLES;
```

<span class="emphasis">*GOOD* </span> Two XQuery expressions are
compiled during SQL compilation.

``` programlisting
select
  case
    when SOURCE_IS_DOCBOOK then xquery_eval ('//formalpara[title="See Also"]/para', SOURCE_XML)
    else xquery_eval ('//p[@style="seealso"]', SOURCE_XML)
  end
from LIB..ARTICLES;
```

<span class="emphasis">*POOR*</span> Virtuoso can not pre-compile
XQquery expressions. Moreover, only one precompiled expression is cached
per occurrence of xquery_eval() in the SQL statement so it is possible
that an XQuery compiler will start once per data row.

``` programlisting
select
  xquery_eval (
    case
      when SOURCE_IS_DOCBOOK then '//formalpara[title="See Also"]/para'
      else '//p[@style="seealso"]'
    end,
  SOURCE_XML)
from LIB..ARTICLES;
```

</div>

</div>

  

</div>
