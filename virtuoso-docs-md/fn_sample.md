<div id="fn_sample" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.SAMPLE — returns an arbitrary value from the multiset passed to
it.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sample" class="funcsynopsis">

|                            |                          |
|----------------------------|--------------------------|
| ` `**`DB.DBA.SAMPLE`**` (` | in `token ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sample" class="refsect1">

## Description

DB.DBA.SAMPLE is aggregate function that returns an arbitrary value from
the multiset passed to it.

Note: Using the "sql:" prefix is mandatory for this aggregate.

</div>

<div id="params_sample" class="refsect1">

## Parameters

<div id="id102653" class="refsect2">

### strg

An item from multiset.

</div>

</div>

<div id="ret_sample" class="refsect1">

## Return Types

any

</div>

<div id="examples_sample" class="refsect1">

## Examples

<div id="ex_sample" class="example">

**Example 24.286. **

<div class="example-contents">

``` programlisting
SQL>SPARQL
SELECT  (sql:SAMPLE(?nick)), (sql:SAMPLE(?interest))
WHERE
  {
    ?p a foaf:Person .
    ?p foaf:nick ?nick.
    ?p foaf:interest ?interest.
  }

callret-0   callret-1
VARCHAR       VARCHAR
________________________________________________
dr. Jones     http://purl.org/rss/1.0/

No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_sample" class="refsect1">

## See Also

<a href="fn_group_concat_distinct.html" class="link"
title="DB.DBA.GROUP_CONCAT_DISTINCT"><code
class="function">DB.DBA.GROUP_CONCAT_DISTINCT() </code></a>

<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">DB.DBA.GROUP_CONCAT() </code></a>

<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">DB.DBA.GROUP_DIGEST() </code></a>

<a href="samplegroupconcatdigest.html" class="link"
title="1.5.59. What is the difference between the functions SAMPLE, GROUP_CONCAT and GROUP_DIGEST?">Differences
between DB.DBA.SAMPLE, DB.DBA.GROUP_CONCAT and DB.DBA.GROUP_DIGEST
functions usage.</a>

</div>

</div>
