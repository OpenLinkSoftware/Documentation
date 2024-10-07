<div id="fn_vector_or_null_agg" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.VECTOR_OR_NULL_AGG — Returns a vector of passed values.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vector_or_null_agg" class="funcsynopsis">

|                                              |                              |
|----------------------------------------------|------------------------------|
| `vector `**`DB.DBA.VECTOR_OR_NULL_AGG`**` (` | `value_expression ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vector_or_null_agg" class="refsect1">

## Description

`DB.DBA.VECTOR_OR_NULL_AGG ` returns a vector of passed values. Similar
to <a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG"><code
class="function">DB.DBA.VECTOR_AGG()</code></a> but returns NULL instead
of an empty vector if no arguments were actually passed.

The order of items in the vector repeats the order of passing individual
values to the aggregate.

</div>

<div id="params_vector_or_null_agg" class="refsect1">

## Parameters

<div id="id79707" class="refsect2">

### value_expression

Value of item for aggregation.

</div>

</div>

<div id="ret_vector_or_null_agg" class="refsect1">

## Return Types

Any. If no arguments were actually passed returns NULL instead of an
empty vector.

</div>

<div id="examples_vector_or_null_agg" class="refsect1">

## Examples

<div id="ex_vector_or_null_agg_1" class="example">

**Example 24.3. Simple Use**

<div class="example-contents">

As the order of items in the vector repeats the order of passing
individual values to the aggregate, it is possible to write, for
instance:

``` programlisting
-- Get an ordered vector of X-es
SELECT DB.DBA.VECTOR_OR_NULL_AGG (subquery.X)
FROM (SELECT X FROM ... ORDER BY X) as subquery
```

or

``` programlisting
SELECT DB.DBA.VECTOR_OR_NULL_AGG (subquery.Y)
FROM (SELECT Y FROM ... ORDER BY X) as subquery
```

and get vector of Y-s that are ordered by matching values of X-es.

</div>

</div>

  

</div>

<div id="seealso_vector_or_null_agg" class="refsect1">

## See Also

<a href="fn_xq_sequence_agg.html" class="link"
title="DB.DBA.XQ_SEQUENCE_AGG"><code
class="function">DB.DBA.XQ_SEQUENCE_AGG() </code></a>

<a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG"><code
class="function">DB.DBA.VECTOR_AGG() </code></a>

<a href="fn_vector_of_nonnulls_agg.html" class="link"
title="DB.DBA.VECTOR_OF_NONNULLS_AGG"><code
class="function">DB.DBA.VECTOR_OF_NONNULLS_AGG() </code></a>

<a href="fn_vector_of_nonnulls_or_null_agg.html" class="link"
title="DB.DBA.VECTOR_OF_NONNULLS_OR_NULL_AGG"><code
class="function">DB.DBA.VECTOR_OF_NONNULLS_OR_NULL_AGG() </code></a>

<a href="fn_vector_concat_agg.html" class="link"
title="DB.DBA.VECTOR_CONCAT_AGG"><code
class="function">DB.DBA.VECTOR_CONCAT_AGG() </code></a>

<a href="fn_bag_agg.html" class="link" title="DB.DBA.BAG_AGG"><code
class="function">DB.DBA.BAG_AGG() </code></a>

<a href="fn_bag_of_nonnulls_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_AGG"><code
class="function">DB.DBA.BAG_OF_NONNULLS_AGG() </code></a>

<a href="fn_bag_or_null_agg.html" class="link"
title="DB.DBA.BAG_OR_NULL_AGG"><code
class="function">DB.DBA.BAG_OR_NULL_AGG() </code></a>

<a href="fn_bag_of_nonnulls_or_null_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG"><code
class="function">DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG() </code></a>

<a href="fn_bag_concat_agg.html" class="link"
title="DB.DBA.BAG_CONCAT_AGG"><code
class="function">DB.DBA.BAG_CONCAT_AGG() </code></a>

<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">DB.DBA.GROUP_CONCAT() </code></a>

<a href="fn_group_concat_distinct.html" class="link"
title="DB.DBA.GROUP_CONCAT_DISTINCT"><code
class="function">DB.DBA.GROUP_CONCAT_DISTINCT() </code></a>

<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">DB.DBA.GROUP_DIGEST() </code></a>

<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">DB.DBA.SAMPLE() </code></a>

</div>

</div>
