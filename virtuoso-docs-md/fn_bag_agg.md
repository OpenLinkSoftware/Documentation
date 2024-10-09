<div>

<div>

</div>

<div>

## Name

DB.DBA.BAG_AGG — Returns a vector of passed values.

</div>

<div>

## Synopsis

<div>

|                                   |                              |
|-----------------------------------|------------------------------|
| `vector `**`DB.DBA.BAG_AGG`**` (` | `value_expression ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`DB.DBA.BAG_AGG() ` returns a vector of passed values.

This is similar to <a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG">DB.DBA.VECTOR_AGG()</a> and returns a vector
of passed values but the order of items in the vector is not predefined
and may vary from run to run.

A query with `DB.DBA.BAG_AGG()` may work faster than a similar query
with <a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG">DB.DBA.VECTOR_AGG()</a> because
`DB.DBA.BAG_AGG()` gives more freedom to the SQL optimizer. If the order
is not important for your application, consider using of
`DB.DBA.BAG_AGG()` .

</div>

<div>

## Parameters

<div>

### value_expression

Value of item for aggregation.

</div>

</div>

<div>

## Return Types

Any

</div>

<div>

## Examples

<div>

**Example 24.6. Simple Use**

<div>

``` programlisting
SELECT DB.DBA.BAG_AGG (subquery.X)
FROM (SELECT X FROM ... ORDER BY X) as subquery
```

</div>

</div>

  

</div>

<div>

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

<a href="fn_bag_of_nonnulls_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_AGG">DB.DBA.BAG_OF_NONNULLS_AGG()</a>

<a href="fn_bag_or_null_agg.html" class="link"
title="DB.DBA.BAG_OR_NULL_AGG">DB.DBA.BAG_OR_NULL_AGG()</a>

<a href="fn_bag_of_nonnulls_or_null_agg.html" class="link"
title="DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG">DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG()</a>

<a href="fn_bag_concat_agg.html" class="link"
title="DB.DBA.BAG_CONCAT_AGG">DB.DBA.BAG_CONCAT_AGG()</a>

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
