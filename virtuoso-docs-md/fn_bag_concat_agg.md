<div>

<div>

</div>

<div>

## Name

DB.DBA.BAG_CONCAT_AGG — Expects SQL vectors as arguments and the result
is a concatenation of all passed vectors.

</div>

<div>

## Synopsis

<div>

|                                          |                    |
|------------------------------------------|--------------------|
| `vector `**`DB.DBA.BAG_CONCAT_AGG`**` (` | `_items ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`DB.DBA.BAG_CONCAT_AGG ` expects SQL vectors as arguments and the result
is a concatenation of all passed vectors.

</div>

<div>

## Parameters

<div>

### \_items

SQL vectors.

</div>

</div>

<div>

## Return Types

Any

</div>

<div>

## Examples

<div>

**Example 24.10. Simple Use**

<div>

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
