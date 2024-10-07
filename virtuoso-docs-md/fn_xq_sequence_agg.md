<div id="fn_xq_sequence_agg" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.XQ_SEQUENCE_AGG — Creates an XQuery sequence object that consists
of all values passed the the aggregate.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xq_sequence_agg" class="funcsynopsis">

|                                           |                              |
|-------------------------------------------|------------------------------|
| `vector `**`DB.DBA.XQ_SEQUENCE_AGG`**` (` | `value_expression ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xq_sequence_agg" class="refsect1">

## Description

`DB.DBA.XQ_SEQUENCE_AGG ` creates an XQuery sequence object that
consists of all values passed the aggregate.

</div>

<div id="params_xq_sequence_agg" class="refsect1">

## Parameters

<div id="id79470" class="refsect2">

### value_expression

Values are "flatten" before being added to the sequence. It means that
--- NULLs are not added at all.

If an XQuery sequence object is passed to the aggregate then all items
of sequence are appended to the end of the accumulated result, one after
other. Thus the aggregate of a sequence ('A', 'B'), a string 'C' and a
sequence ('D', 'E', 'F') is a sequence ('A', 'B', 'C', 'D', 'E', 'F'),
not something like (('A', 'B'), 'C', ('D', 'E', 'F')).

If an SQL vector is passed to the aggregate then every item of the
vector is appended to result separately, and if an item is in turn a
nested vector or a nested XQuery sequence then every sub-item is
appended separately, in a recursive manner. So SQL vectors are
"flattened" recursively.

If the argument of DB.DBA.XQ_SEQUENCE_AGG () is a narrow string or a
wide string it is converted to UTF-8 before being added to the sequence.
If an SQL vector contains a narrow or wide string then it is also
converted to UTF-8. However if a narrow string is an item of an XQuery
sequence then it is treated as UTF-8 and not subject to encoding.

</div>

</div>

<div id="ret_xq_sequence_agg" class="refsect1">

## Return Types

Any

</div>

<div id="seealso_xq_sequence_agg" class="refsect1">

## See Also

<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval() </code></a>

<a href="fn_vector_agg.html" class="link"
title="DB.DBA.VECTOR_AGG"><code
class="function">DB.DBA.VECTOR_AGG() </code></a>

<a href="fn_vector_of_nonnulls_agg.html" class="link"
title="DB.DBA.VECTOR_OF_NONNULLS_AGG"><code
class="function">DB.DBA.VECTOR_OF_NONNULLS_AGG() </code></a>

<a href="fn_vector_or_null_agg.html" class="link"
title="DB.DBA.VECTOR_OR_NULL_AGG"><code
class="function">DB.DBA.VECTOR_OR_NULL_AGG() </code></a>

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
