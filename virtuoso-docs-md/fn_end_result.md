<div>

<div>

</div>

<div>

## Name

end_result — End the current result set.

</div>

<div>

## Synopsis

<div>

|                         |      |
|-------------------------|------|
| ` `**`end_result`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `result_names() ` predefines variables to be used in a result set to
follow. The variables must be previously declared, from which the column
data types are ascertained. This assigns the meta data but does not send
any results. The `result()` function sends its parameters as a single
row of results. These parameters should be compatible with those in the
previous `result_names()` . The `end_result()` function can be used to
separate multiple result sets. The `result_names()` can then be used to
alter the result set structure.

The `result_names()` call can be omitted if the application already
knows what columns and their types are to be returned.

</div>

<div>

## See Also

<a href="fn_result.html" class="link" title="result"><code
class="function">result() </code></a>

<a href="fn_result_names.html" class="link" title="result_names"><code
class="function">result_names() </code></a>

</div>

</div>
