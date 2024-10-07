<div id="fn_bag_concat_agg" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.BAG_CONCAT_AGG — Expects SQL vectors as arguments and the result
is a concatenation of all passed vectors.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_bag_concat_agg" class="funcsynopsis">

|                                          |                    |
|------------------------------------------|--------------------|
| `vector `**`DB.DBA.BAG_CONCAT_AGG`**` (` | `_items ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_bag_concat_agg" class="refsect1">

## Description

`DB.DBA.BAG_CONCAT_AGG ` expects SQL vectors as arguments and the result
is a concatenation of all passed vectors.

</div>

<div id="params_bag_concat_agg" class="refsect1">

## Parameters

<div id="id80203" class="refsect2">

### \_items

SQL vectors.

</div>

</div>

<div id="ret_bag_concat_agg" class="refsect1">

## Return Types

Any

</div>

<div id="examples_bag_concat_agg" class="refsect1">

## Examples

<div id="ex_bag_concat_agg_1" class="example">

**Example 24.10. Simple Use**

<div class="example-contents">

The most typical usage is the composing of get-keyword style vector, for
ex:

``` programlisting
  SELECT DB.DBA.BAG_CONCAT_AGG (vector (U_NAME, U_ID))
    FROM DB.DBA.SYS_USERS
ORDER BY U_NAME;
```

which returns a vector of passed values. The order of items in the
vector repeats the order of passing argument vectors to the aggregate.

``` programlisting
 (dba, 0, dav, 2, administrators, 3, nobody, 5, nogroup, 6, __rdf_repl, 7, SPARQL_SELECT, 100, SPARQL_SPONGE, 101, ... )
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div id="seealso_bag_concat_agg" class="refsect1">

## See Also

<a href="fn_xq_sequence_agg.html" class="link"
title="DB.DBA.XQ_SEQUENCE_AGG">DB.DBA.XQ_SEQUENCE_AGG()</a>

<a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG">DB.DBA.VECTOR_AGG()</a>

<a href="fn_vector_of_nonnulls_agg.html" class="link"
title="DB.DBA.VECTOR_OF_NONNULLS_AGG">DB.DBA.VECTOR_OF_NONNULLS_AGG()</a>

<a href="fn_vector_or_null_agg.html" class="link"
title="DB.DBA.VECTOR_OR_NULL_AGG">DB.DBA.VECTOR_OR_NULL_AGG()</a>

<a href="fn_vector_of_nonnulls_or_null_agg.html" class="link"
title="DB.DBA.VECTOR_OF_NONNULLS_OR_NULL_AGG">DB.DBA.VECTOR_OF_NONNULLS_OR_NULL_AGG()</a>

<a href="fn_vector_concat_agg.html" class="link"
title="DB.DBA.VECTOR_CONCAT_AGG">DB.DBA.VECTOR_CONCAT_AGG()</a>

<a href="fn_bag_agg.html" class="link"
title="DB.DBA.BAG_AGG">DB.DBA.BAG_AGG()</a>

<a href="fn_bag_of_nonnulls_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_AGG">DB.DBA.BAG_OF_NONNULLS_AGG()</a>

<a href="fn_bag_or_null_agg.html" class="link"
title="DB.DBA.BAG_OR_NULL_AGG">DB.DBA.BAG_OR_NULL_AGG()</a>

<a href="fn_bag_of_nonnulls_or_null_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG">DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG()</a>

<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT">DB.DBA.GROUP_CONCAT()</a>

<a href="fn_group_concat_distinct.html" class="link"
title="DB.DBA.GROUP_CONCAT_DISTINCT">DB.DBA.GROUP_CONCAT_DISTINCT()</a>

<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST">DB.DBA.GROUP_DIGEST()</a>

<a href="fn_sample.html" class="link"
title="DB.DBA.SAMPLE">DB.DBA.SAMPLE()</a>

</div>

</div>
